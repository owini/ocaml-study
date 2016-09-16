open! Import
open! Int_replace_polymorphic_compare

module List = Caml.ListLabels

type 'a t = Incl of 'a | Excl of 'a | Unbounded [@@deriving sexp]

type interval_comparison =
  | Below_lower_bound
  | In_range
  | Above_upper_bound
[@@deriving sexp, compare, hash]

let map t ~f =
  match t with
  | Incl incl -> Incl (f incl)
  | Excl excl -> Excl (f excl)
  | Unbounded -> Unbounded

let is_lower_bound t ~of_:a ~compare =
  match t with
  | Incl incl -> compare incl a <= 0
  | Excl excl -> compare excl a <  0
  | Unbounded -> true

let is_upper_bound t ~of_:a ~compare =
  match t with
  | Incl incl -> compare a incl <= 0
  | Excl excl -> compare a excl <  0
  | Unbounded -> true

let check_interval_exn ~lower ~upper ~compare =
  match lower with
  | Unbounded -> ()
  | (Incl lower | Excl lower) ->
    match upper with
    | Unbounded -> ()
    | (Incl upper | Excl upper) ->
      if compare lower upper > 0 then
        failwith "Maybe_bound.compare_to_interval_exn: lower bound > upper bound"

let compare_to_interval_exn ~lower ~upper a ~compare =
  check_interval_exn ~lower ~upper ~compare;
  if not (is_lower_bound lower ~of_:a ~compare) then Below_lower_bound else
  if not (is_upper_bound upper ~of_:a ~compare) then Above_upper_bound else
    In_range

let interval_contains_exn ~lower ~upper a ~compare =
  match compare_to_interval_exn ~lower ~upper a ~compare with
  | In_range            -> true
  | Below_lower_bound
  | Above_upper_bound -> false
