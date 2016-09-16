Caml1999N018����            *option.mli����  &�  C  �  �������&Import��*option.mliA@F�A@L@@��A@@�A@L@@��A@@�A@L@���A�    �!t��CNV�CNW@����!a��CNS�CNU@@B@@@A�����&option��"CN]�#CNc@���!a��)CNZ�*CN\@@@��,CNZ�-CNc@@@��/CNN�0CN D@@��2CNN�3CN D@�����������-ocaml.warning�������#-32@@@@���Р)t_of_sexp>��@��@������'Sexplib$Sexp!tC@C@��FE@E@��@������U@U@����ZY���UT@@\@\@T@@@>>���Р)sexp_of_tb��@��@��a`@������'Sexplib$Sexp!ti@i@i@��@����xw���sr@@z@�������@�@�@x@@@bb���Р+hash_fold_t���@��@�����$Hash%state�@�@��@����@�����
�@�@�@�@��@������@�@��@�����������@@�@����� �@�@�@�@�@@@�����Р'compare���@��@����@��@����@����#int�@�@�@�@��@�����ʠ����@@�@��@�����Ӡ����@@�@�����@�@�@�@�@@@��@�@�@������������)Container"S1���E F N��E F Z@���E F N��E F Z@@��    �!t��E F h�E F i@����!a��E F e�E F g@@B@@@A�����!t��E F p�E F q@���!a��E F m�E F o@@@��E F m�E F q@@@��!E F `�"E F q@@��$E F N�%E F q@@��'E F F�(E F q@@��*E F F�+E F q@�����������%Equal"S1��:F r z�;F r �@��=F r z�>F r �@@��    �!t��EF r ��FF r �@����!a��MF r ��NF r �@@B@@@A�����!t��VF r ��WF r �@���!a��]F r ��^F r �@@@��`F r ��aF r �@@@��cF r ��dF r �@@��fF r z�gF r �@@��iF r r�jF r �@@��lF r r�mF r �@�����������)Invariant"S1��|G � ��}G � �@��G � ���G � �@@��    �!t���G � ���G � �@����!a���G � ���G � �@@B@@@A�����!t���G � ���G � �@���!a���G � ���G � �@@@���G � ���G � �@@@���G � ���G � �@@���G � ���G � �@@���G � ���G � �@@���G � ���G � �@�����������%Monad!S���K;C��K;J@���K;C��K;J@@��    �!t���K;X��K;Y@����!a���K;U��K;W@@B@@@A�����!t���K;`��K;a@���!a���K;]��K;_@@@���K;]��K;a@@@���K;P��K;a@@���K;C��K;a@@���K;;��K;a@���)ocaml.doc��&_none_A@ �A�������	j Options form a monad, where [return x =  Some x],
    [(None >>= f) = None], and [(Some x >>= f) = f x]. @���I � �� J:@@@��I � ��J:@@@��K;;�K;a@���Р'is_none��N���N��@��@����!t��N���N��@���!a��N��� N��@@@��"N���#N��@@����$bool��*N���+N��@@��-N���.N��@@��0N���1N��@@@���)ocaml.docC�������	( [is_none t] returns true iff t = None. @��?Mcc�@Mc�@@@��BMcc�CMc�@@@��EN���FN��@��HN���IN��@���Р'is_some��QQ���RQ��@��@����!t��[Q���\Q��@���!a��bQ���cQ��@@@��eQ���fQ��@@����$bool��mQ���nQ��@@��pQ���qQ��@@��sQ���tQ��@@@���)ocaml.doc��������	* [is_some t] returns true iff t = Some x. @���P����P��@@@���P����P��@@@���Q����Q��@���Q����Q��@���Р)value_map���TRV��TR_@��@����!t���TRe��TRf@���!a���TRb��TRd@@@���TRb��TRf@@���'default��!b���TRr��TRt@@���!f��@��!a���TR{��TR}@@��!b���TR���TR�@@���TR{��TR�@@��!b���TR���TR�@@���TRx��TR�@@���TRj��TR�@@���TRb��TR�@@@���)ocaml.doc鐠�����	S [value_map ~default ~f] is the same as [function Some x -> f x | None -> default] @���S����S�Q@@@���S����S�Q@@@���TRR��TR�@���TRR��TR�@���Р$map2���W����W��@��@����!t��W���W��@���!a��W���	W��@@@��W���W��@@��@����!t��W���W��@���!b��W���W��@@@��W��� W��@@���!f��@��!a��+W���,W��@@��@��!b��3W���4W��@@��!c��9W���:W��@@��<W���=W��@@��?W���@W��@@����!t��GW��HW�@���!c��NW��OW�@@@��QW��RW�@@��TW���UW�@@��WW���XW�@@��ZW���[W�@@@���)ocaml.docm�������	@ [map2 o f] map 'a option and 'b option to a 'c option using ~f @��iV���jV��@@@��lV���mV��@@@��oW���pW�@��rW���sW�@���Р$call��{Z=A�|Z=E@��@��!a���Z=H��Z=J@@���!f����!t���Z=]��Z=^@���@��!a���Z=Q��Z=S@@����$unit���Z=W��Z=[@@���Z=W��Z=[@@���Z=Q��Z=[@@@���Z=P��Z=^@@����$unit���Z=b��Z=f@@���Z=b��Z=f@@���Z=N��Z=f@@���Z=H��Z=f@@@���)ocaml.doc͐������	. [call x f] run optional function on argument @���Y		��Y	<@@@���Y		��Y	<@@@���Z==��Z=f@���Z==��Z=f@���Р%value���_����_��@��@����!t���_����_��@���!a���_����_��@@@���_����_��@@���'default��!a���_����_��@@��!a���_��� _��@@��_���_��@@��_���_��@@@���)ocaml.doc�������	G [value None ~default] = [default]
    [value (Some x) ~default] = [x]
@��\hh�^��@@@��\hh�^��@@@��_���_��@��_���_��@���Р)value_exn��&d���'d��@���$here�����5Source_code_position0!t��4e���5e��@@��7e���8e��@@���%error�����%Error!t��Ef���Ff��@@��Hf���If��@@���'message����&string��Tg���Ug��@@��Wg���Xg��@@��@����!t��ah���bh��@���!a��hh���ih��@@@��kh���lh��@@��!a��qi��ri�@@��th���ui�@@��wg���xi�@@��zf���{i�@@��}e���~i�@@@���)ocaml.doc��������	� [value_exn (Some x)] = [x].  [value_exn None] raises an error whose contents contain
    the supplied [~here], [~error], and [message], or a default message if none are
    supplied. @���a����c��@@@���a����c��@@@���d����i�@���d����i�@���Р$some���k
��k@��@��!a���k��k@@����!t���k��k@���!a���k��k@@@���k��k@@���k��k@@@@���k��k@���k��k@���Р$both���m!��m%@��@����!t���m+��m,@���!a���m(��m*@@@���m(��m,@@��@����!t���m3��m4@���!b���m0��m2@@@���m0��m4@@����!t���mB��mC@������!a��m9�m;@@���!b��m>�m@@@@��m9�m@@@@��m8�mC@@��m0�mC@@��m(�mC@@@@��m�mC@��m�mC@���Р*first_some��&oEI�'oES@��@����!t��0oEY�1oEZ@���!a��7oEV�8oEX@@@��:oEV�;oEZ@@��@����!t��DoEa�EoEb@���!a��KoE^�LoE`@@@��NoE^�OoEb@@����!t��VoEi�WoEj@���!a��]oEf�^oEh@@@��`oEf�aoEj@@��coE^�doEj@@��foEV�goEj@@@@��ioEE�joEj@��loEE�moEj@���Р'some_if��uqlp�vqlw@��@����$bool��qlz��ql~@@���qlz��ql~@@��@��!a���ql���ql�@@����!t���ql���ql�@���!a���ql���ql�@@@���ql���ql�@@���ql���ql�@@���qlz��ql�@@@@���qll��ql�@���qll��ql�@���Р%merge���w����w��@��@����!t���w����w��@���!a���w����w��@@@���w����w��@@��@����!t���w����w��@���!a���w����w��@@@���w����w��@@���!f��@��!a���w����w��@@��@��!a���w����w��@@��!a���w����w��@@���w����w��@@���w����w��@@����!t��w���w��@���!a��w���	w��@@@��w���w��@@��w���w��@@��w���w��@@��w���w��@@@���)ocaml.doc'�������
   [merge a b ~f] merges together the values from [a] and [b] using [f].  If both [a] and
    [b] are [None], returns [None].  If only one is [Some], returns that one, and if both
    are [Some], returns [Some] of the result of applying [f] to the contents of [a] and
    [b]. @��#s���$v��@@@��&s���'v��@@@��)w���*w��@��,w���-w��@���Р&filter��5y���6y��@��@����!t��?y���@y��@���!a��Fy���Gy��@@@��Iy���Jy��@@���!f��@��!a��Uy���Vy��@@����$bool��]y���^y�@@��`y���ay�@@��cy���dy�@@����!t��ky�	�ly�
@���!a��ry��sy�@@@��uy��vy�
@@��xy���yy�
@@��{y���|y�
@@@@��~y���y�
@���y����y�
@���Р(try_with���}����}��@��@��@����$unit���}����}��@@���}����}��@@��!a���}����}��@@���}����}��@@����!t���}����}��@���!a���}����}��@@@���}����}��@@���}����}��@@@���)ocaml.docʐ������	� [try_with f] returns [Some x] if [f] returns [x] and [None] if [f] raises an
    exception.  See [Result.try_with] if you'd like to know which exception. @���{��|]�@@@���{��|]�@@@���}����}��@���}����}��@���Р(validate���������@���$none�����(Validate%check���������@�����$unit���������@@���������@@@���������@@���$some�����(Validate%check�����@���!a��
���@@@�����@@�����(Validate%check�����*@�����!t�� ��!�@���!a��'��(�@@@��*��+�@@@��-��.�*@@��0���1�*@@��3���4�*@@@@��6���7�*@��9���:�*@@