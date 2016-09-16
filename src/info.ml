(* This module is trying to minimize dependencies on modules in Core, so as to allow
   [Info], [Error], and [Or_error] to be used in is many places places as possible.
   Please avoid adding new dependencies. *)

open! Import

module List = Base_list

module Message = struct
  type t =
    | Could_not_construct of Sexp.t
    | String              of string
    | Exn                 of exn
    | Sexp                of Sexp.t
    | Tag_sexp            of string * Sexp.t * Source_code_position0.t option
    | Tag_t               of string * t
    | Tag_arg             of string * Sexp.t * t
    | Of_list             of int option * t list
    | With_backtrace      of t * string (* backtrace *)
  [@@deriving sexp_of]

  let rec to_strings_hum t ac =
    (* We use [Sexp.to_string_mach], despite the fact that we are implementing
       [to_strings_hum], because we want the info to fit on a single line, and once we've
       had to resort to sexps, the message is going to start not looking so pretty
       anyway. *)
    match t with
    | Could_not_construct sexp ->
      "could not construct info: " :: Sexp.to_string_mach sexp :: ac
    | String string -> string :: ac
    | Exn exn -> Sexp.to_string_mach (Exn.sexp_of_t exn) :: ac
    | Sexp sexp -> Sexp.to_string_mach sexp :: ac
    | Tag_sexp (tag, sexp, _) -> tag :: ": " :: Sexp.to_string_mach sexp :: ac
    | Tag_t (tag, t) -> tag :: ": " :: to_strings_hum t ac
    | Tag_arg (tag, sexp, t) ->
      tag :: ": " :: Sexp.to_string_mach sexp :: ": " :: to_strings_hum t ac
    | With_backtrace (t, backtrace) ->
      to_strings_hum t ("\nBacktrace:\n" :: backtrace :: ac)
    | Of_list (trunc_after, ts) ->
      let ts =
        match trunc_after with
        | None -> ts
        | Some max ->
          let n = List.length ts in
          if n <= max then
            ts
          else
            List.take ts max @ [ String (Printf.sprintf "and %d more info" (n - max)) ]
      in
      List.fold (List.rev ts) ~init:ac ~f:(fun ac t ->
        to_strings_hum t (if List.is_empty ac then ac else ("; " :: ac)))
  ;;

  let to_string_hum_deprecated t = String.concat "" (to_strings_hum t [])

  let rec to_sexps_hum t ac =
    match t with
    | Could_not_construct _ as t -> sexp_of_t t :: ac
    | String string -> Atom string :: ac
    | Exn exn -> Exn.sexp_of_t exn :: ac
    | Sexp sexp -> sexp :: ac
    | Tag_sexp (tag, sexp, here) ->
      List ( Atom tag
             :: sexp
             :: (match here with
               | None -> []
               | Some here -> [ Source_code_position0.sexp_of_t here ]))
      :: ac
    | Tag_t (tag, t) -> List (Atom tag :: to_sexps_hum t []) :: ac
    | Tag_arg (tag, sexp, t) -> List (Atom tag :: sexp :: to_sexps_hum t []) :: ac
    | With_backtrace (t, backtrace) ->
      Sexp.List [ to_sexp_hum t; Sexp.Atom backtrace ] :: ac
    | Of_list (_, ts) ->
      List.fold (List.rev ts) ~init:ac ~f:(fun ac t -> to_sexps_hum t ac)
  and to_sexp_hum t =
    match to_sexps_hum t [] with
    | [sexp] -> sexp
    | sexps -> Sexp.List sexps
  ;;

  (* We use [protect] to guard against exceptions raised by user-supplied functons, so
     that failure to produce one part of an info doesn't interfere with other parts. *)
  let protect f =
    try f () with exn -> Could_not_construct (Exn.sexp_of_t exn)
  ;;

  let of_info info = protect (fun () -> Lazy.force info)
  let to_info t = lazy t
end

open Message

type t = Message.t Lazy.t

let invariant _ = ()

let to_message = Message.of_info
let of_message = Message.to_info

(* It is OK to use [Message.to_sexp_hum], which is not stable, because [t_of_sexp] below
   can handle any sexp. *)
let sexp_of_t t = Message.to_sexp_hum (to_message t)

let t_of_sexp sexp = lazy (Message.Sexp sexp)

let compare t1 t2 =
  [%compare: Sexp.t] (t1 |> [%sexp_of: t]) (t2 |> [%sexp_of: t])
;;

let hash_fold_t state t = [%hash_fold: Sexp.t] state (t |> [%sexp_of: t])
let hash = [%hash: t]

let to_string_hum t =
  match to_message t with
  | String s -> s
  | message -> Sexp.to_string_hum (Message.to_sexp_hum message)
;;

let to_string_hum_deprecated t = Message.to_string_hum_deprecated (to_message t)

let to_string_mach t = Sexp.to_string_mach (sexp_of_t t)

let of_lazy l = lazy (protect (fun () -> String (Lazy.force l)))

let of_string message = Lazy.from_val (String message)

let createf format = Printf.ksprintf of_string format

let%test _ = to_string_hum (of_string "a\nb") = "a\nb"

let of_thunk f = lazy (protect (fun () -> String (f ())))

let create ?here ?strict tag x sexp_of_x =
  match strict with
  | None    -> lazy (protect (fun () -> Tag_sexp (tag, sexp_of_x x, here)))
  | Some () -> of_message (             Tag_sexp (tag, sexp_of_x x, here))
;;

let create_s sexp = Lazy.from_val (Sexp sexp)

let tag t ~tag = lazy (Tag_t (tag, to_message t))

let tag_arg t tag x sexp_of_x =
  lazy (protect (fun () -> Tag_arg (tag, sexp_of_x x, to_message t)))
;;

let of_list ?trunc_after ts =
  lazy (Of_list (trunc_after, List.map ts ~f:to_message))
;;

exception Exn of t

let () =
  (* We install a custom exn-converter rather than use
     [exception Exn of t [@@deriving sexp]] to eliminate the extra wrapping of
     "(Exn ...)". *)
  Sexplib.Conv.Exn_converter.add [%extension_constructor Exn]
    (function
    | Exn t -> sexp_of_t t
    | _ ->
      (* Reaching this branch indicates a bug in sexplib. *)
      assert false)
;;

let to_exn t =
  if not (Lazy.is_val t)
  then Exn t
  else
    match Lazy.force t with
    | Message.Exn exn -> exn
    | _ -> Exn t
;;

let of_exn ?backtrace exn =
  let backtrace =
    match backtrace with
    | None -> None
    | Some `Get -> Some (Printexc.get_backtrace ())
    | Some (`This s) -> Some s
  in
  match exn, backtrace with
  | Exn t, None           -> t
  | Exn t, Some backtrace -> lazy (With_backtrace (to_message t, backtrace))
  | _    , None           -> Lazy.from_val (Message.Exn exn)
  | _    , Some backtrace -> lazy (With_backtrace (Sexp (Exn.sexp_of_t exn), backtrace))
;;

let pp ppf t = Format.pp_print_string ppf (to_string_hum t)
let () = Pretty_printer.register "Base.Info.pp"

module Internal_repr = Message

