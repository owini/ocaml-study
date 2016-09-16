Caml1999N018����            /with_return.mli����  	   Y  �  t�����*ocaml.text��&_none_A@ �A�������	s This is [include]'d and documented in {! module: Common}.  It is defined here to avoid
    circular dependencies. @��/with_return.mliK���L)@@@��K���L)@@��K���L)@������&Import��N+1�N+7@@��N++�N+7@@��N++�N+7@���A�    �&return��!P9B�"P9H@����!a��)P9?�*P9A@@A@@��Р&return��1P9U�2P9[@@���!b@��@��!a��=P9b�>P9d@@��!b��CP9h�DP9j@@��FP9b�GP9j@@��IP9^�JP9j@@��LP9U�MP9j@@@@@@��OP99�PP9l@@��RP99�SP9l@���Р+with_return��[Rnr�\Rn}@��@��@����&return��gRn��hRn�@���!a��nRn��oRn�@@@��qRn��rRn�@@��!a��wRn��xRn�@@��zRn��{Rn�@@��!a���Rn���Rn�@@���Rn���Rn�@@@@���Rnn��Rn�@���Rnn��Rn�@���Р2with_return_option���V��V@��@��@����&return���V$��V*@���!a���V!��V#@@@���V!��V*@@����$unit���V.��V2@@���V.��V2@@���V!��V2@@����&option���V:��V@@���!a���V7��V9@@@���V7��V@@@���V ��V@@@@���)ocaml.docݐ������	_ Note that [with_return_option] allocates ~5 words more than equivalent [with_return]
    call @���T����U�@@@���T����U�@@@���V��V@@���V��V@@���Р'prepend���]����]��@��@����&return���]����]��@���!a���]����]��@@@�� ]���]��@@���!f��@��!b��]���]��@@��!a��]���]��@@��]���]��@@����&return��]��]�@���!b��$]���%]�@@@��']���(]�@@��*]���+]�@@��-]���.]�@@@���)ocaml.doc?�������
  � [prepend a ~f] returns a value [x] such that each call to [x.return] first applies [f]
    before applying [a.return].  The call to [f] is "prepended" to the call to the
    original [a.return].  A possible use case is to hand [x] over to an other function
    which returns ['b] a subtype of ['a], or to capture a common transformation [f]
    applied to returned values at several call sites. @��<XBB�=\��@@@��?XBB�@\��@@@��B]���C]�@��E]���F]�@@