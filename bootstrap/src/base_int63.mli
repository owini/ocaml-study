Caml1999N018����            .base_int63.mli����  B    	  ������*ocaml.text��&_none_A@ �A�������
  � 63-bit integers.

    The size of Int63 is always 63 bits.  On a 64-bit platform it is just an int
    (63-bits), and on a 32-bit platform it is an int64 wrapped to respect the
    semantic of 63bit integers.

    Because Int63 has different representations on 32-bit and 64-bit platforms,
    marshalling Int63 will not work between 32-bit and 64-bit platforms.
    unmarshal will segfault.
@��.base_int63.mliA@@�J��@@@��A@@�J��@@��A@@�J��@������&Import��L���L��@@��L���L��@@��L���L��@�����������(Int_intf!S��'R���(R��@��*R���+R��@@����!t��2R���3R��@    ���7R���8R��@@@@A������2Base_int63_backend!t��BR���CR��@@��ER���FR��@@@��HR���IR��@@��KR���LR��@@��NR���OR��@���)ocaml.doc`�������
  & In 64bit architectures, we expose [type t = private int] so that the compiler can
    omit caml_modify when dealing with record fields holding [Int63.t].
    Code should not explicitly make use of the [private], e.g. via [(i :> int)], since
    such code will not compile on 32-bit platforms. @��]N���^Q��@@@��`N���aQ��@@@��cR���dR��@�����,Overflow_exn��lUX_�mUXk@�����Р!+��wVrx�xVr}@��@����!t���Vr���Vr�@@���Vr���Vr�@@��@����!t���Vr���Vr�@@���Vr���Vr�@@����!t���Vr���Vr�@@���Vr���Vr�@@���Vr���Vr�@@���Vr���Vr�@@@@���Vrt��Vr�@���Vrt��Vr�@���Р!-���W����W��@��@����!t���W����W��@@���W����W��@@��@����!t���W����W��@@���W����W��@@����!t���W����W��@@���W����W��@@���W����W��@@���W����W��@@@@���W����W��@���W����W��@���Р#abs���X����X��@��@����!t���X����X��@@���X����X��@@����!t�� X���X��@@��X���X��@@��X���X��@@@@��	X���
X��@��X���X��@���Р#neg��Y���Y��@��@����!t��Y��� Y��@@��"Y���#Y��@@����!t��*Y���+Y��@@��-Y���.Y��@@��0Y���1Y��@@@@��3Y���4Y��@��6Y���7Y��@@��9UXn�:Z��@@���)ocaml.docK�������	Q Unlike the usual operations, these never overflow, preferring instead to raise. @��HT�ITW@@@��KT�LTW@@@��NUXX�OZ��@��QUXX�RZ��@���Р&of_int��Z\���[\��@��@����#int��d\���e\��@@��g\���h\��@@����!t��o\���p\��@@��r\���s\��@@��u\���v\��@@@@��x\���y\��@��{\���|\��@���Р&to_int���]����]��@��@����!t���]����]��@@���]����]��@@����&option���]����]�@�����#int���]����]��@@���]����]��@@@���]����]�@@���]����]�@@@@���]����]�@���]����]�@���Р&random���c����c��@���%state������+Base_random%State!t���c����c��@@���c����c��@@��@����!t���c����c��@@���c����c��@@����!t���c����c��@@���c����c��@@���c����c��@@���c����c��@@@���)ocaml.doc��������	� [random ~state bound] returns a random integer between 0 (inclusive) and [bound]
    (exclusive).  [bound] must be greater than 0.

    The default [~state] is [Random.State.default]. @���_��b��@@@���_��b��@@@�� c���c��@��c���c��@@