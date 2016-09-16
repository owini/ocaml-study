Caml1999M019����            ,blit_intf.ml����  _�     @.  >i�����*ocaml.text��&_none_A@ �A�������	\ Standard type for [blit] functions, and reusable code for validating [blit]
    arguments. @��,blit_intf.mlA@@�B P a@@@��A@@�B P a@@��A@@�B P a@������&Import��D c i�D c o@@��D c c�D c o@@��D c c�D c o@���A�    �$blit��!J���"J��@����#src��)J���*J��@@B����#dst��1J���2J��@@B@@@A����#src��#src��<K���=K��@@���'src_pos����#int��HL���IL��@@��KL���LL��@@���#dst��#dst��UM���VM��@@���'dst_pos����#int��aN���bN� @@��dN���eN� @@���#len����#int��pO�qO@@��sO�tO@@����$unit��{P�|P@@��~P�P@@���O��P@@���N����P@@���M����P@@���L����P@@���K����P@@���)ocaml.doc��������
  ! If [blit : (src, dst) blit], then [blit ~src ~src_pos ~len ~dst ~dst_pos] blits [len]
    values from [src] starting at position [src_pos] to [dst] at position [dst_pos].
    Furthermore, [blit] raises if [src_pos], [len], and [dst_pos] don't specify valid
    slices of [src] and [dst]. @���F q q��Iv�@@@���F q q��Iv�@@@���J����P@@���J����P@���A�    �%blito���VTf��VTk@����#src���VTZ��VT^@@B����#dst���VT`��VTd@@B@@@A����#src��#src���Wl|��Wl�@@���'src_pos����#int���X����X��@@���X����X��@���)ocaml.doc될�����0 default is [0] @���X����X��@@@���X����X��@@@���'src_len����#int���Y����Y��@@���Y����Y��@���)ocaml.doc�������	# default is [length src - src_pos] @��	Y���
Y��@@@��Y���Y��@@@���#dst��#dst��Z���Z��@@���'dst_pos����#int��"[��#[�@@��%[��&[�@���)ocaml.doc7�������0 default is [0] @��4[��5[�)@@@��7[��8[�)@@@��@����$unit��A\*/�B\*3@@��D\*/�E\*3@@����$unit��L]49�M]4=@@��O]49�P]4=@@��R\*/�S]4=@@��U[��V]4=@@��XZ���Y]4=@@��[Y���\]4=@@��^X���_]4=@@��aWlq�b]4=@@���)ocaml.docs�������
  . [blito] is like [blit], except that the [src_pos], [src_len], and [dst_pos] are
    optional (hence the "o" in "blito").  Also, we use [src_len] rather than [len] as a
    reminder that if [src_len] isn't supplied, then the default is to take the slice
    running from [src_pos] to the end of [src]. @��pR  �qU!S@@@��sR  �tU!S@@@��vVTT�w]4=@@��yVTT�z]4=@���A�    �#sub���c*��c-@����#src���c��c"@@B����#dst���c$��c(@@B@@@A���@��#src���c0��c4@@���#pos����#int���c<��c?@@���c<��c?@@���#len����#int���cG��cJ@@���cG��cJ@@��#dst���cN��cR@@���cC��cR@@���c8��cR@@���c0��cR@@���)ocaml.docې������	� If [sub : (src, dst) sub], then [sub ~src ~pos ~len] returns a sequence of type [dst]
    containing [len] characters of [src] starting at [pos].

    [subo] is like [sub], except [pos] and [len] are optional. @���_??��b�@@@���_??��b�@@@���c��cR@@���c��cR@���A�    �$subo���dSe��dSi@����#src���dSY��dS]@@B����#dst���dS_��dSc@@B@@@A����#pos����#int��ejv�	ejy@@��ejv�ejy@���)ocaml.doc�������0 default is [0] @��ej{�ej�@@@��ej{�ej�@@@���#len����#int��)f���*f��@@��,f���-f��@���)ocaml.doc>�������? default is [length src - pos] @��;f���<f��@@@��>f���?f��@@@��@��#src��Fg���Gg��@@��#dst��Lh���Mh��@@��Og���Ph��@@��Rf���Sh��@@��Uejo�Vh��@@@��XdSS�Yh��@@��[dSS�\h��@�����!S��dj���ej��@������A�    �!t��qk���rk��@@@@A@@��tk���uk��@@��wk���xk��@���Р$blit���l����l�@����$blit���l���l�@�����!t���l���l�@@���l���l�@@�����!t���l���l�@@���l���l�@@@���l���l�@@@@���l����l�@���l����l�@���Р%blito���m��m$@����%blito���m4��m9@�����!t���m.��m/@@���m.��m/@@�����!t���m1��m2@@���m1��m2@@@���m-��m9@@@@���m��m9@���m��m9@���Р+unsafe_blit���n:@��n:K@����$blit���n:U��n:Y@�����!t���n:O��n:P@@���n:O��n:P@@�����!t��n:R�n:S@@��n:R�n:S@@@��n:N�n:Y@@@@��
n:<�n:Y@��n:<�n:Y@���Р#sub��oZ`�oZc@����#sub��oZu�oZx@�����!t��'oZo�(oZp@@��*oZo�+oZp@@�����!t��3oZr�4oZs@@��6oZr�7oZs@@@��9oZn�:oZx@@@@��<oZ\�=oZx@��?oZ\�@oZx@���Р$subo��Hpy�Ipy�@����$subo��Ppy��Qpy�@�����!t��Ypy��Zpy�@@��\py��]py�@@�����!t��epy��fpy�@@��hpy��ipy�@@@��kpy��lpy�@@@@��npy{�opy�@��qpy{�rpy�@@��tj���uq��@@@��wj���xq��@��zj���{q��@�����"S1���s����s��@������A�    �!t���t����t��@����!a���t����t��@@B@@@A@@���t����t��@@���t����t��@���Р$blit���u����u��@����$blit���u����u��@�����!t���u����u��@���!a���u����u��@@@���u����u��@@�����!t���u����u��@���!a���u����u��@@@���u����u��@@@���u����u��@@@@���u����u��@���u����u��@���Р%blito���v����v��@����%blito���v���v�@�����!t���v����v��@���!a���v��� v��@@@��v���v��@@�����!t��v��v�@���!a��v� �v�@@@��v� �v�@@@��v���v�@@@@��v���v�@��v���v�@���Р+unsafe_blit��'w�(w@����$blit��/w-�0w1@�����!t��8w$�9w%@���!a��?w!�@w#@@@��Bw!�Cw%@@�����!t��Kw*�Lw+@���!a��Rw'�Sw)@@@��Uw'�Vw+@@@��Xw �Yw1@@@@��[w�\w1@��^w�_w1@���Р#sub��gx28�hx2;@����#sub��ox2S�px2V@�����!t��xx2J�yx2K@���!a��x2G��x2I@@@���x2G��x2K@@�����!t���x2P��x2Q@���!a���x2M��x2O@@@���x2M��x2Q@@@���x2F��x2V@@@@���x24��x2V@���x24��x2V@���Р$subo���yW]��yWa@����$subo���yWx��yW|@�����!t���yWo��yWp@���!a���yWl��yWn@@@���yWl��yWp@@�����!t���yWu��yWv@���!a���yWr��yWt@@@���yWr��yWv@@@���yWk��yW|@@@@���yWY��yW|@���yWY��yW|@@���s����z}�@@@���s����z}�@���s����z}�@�����*S_distinct���|����|��@������A�    �#src���}����}��@@@@A@@�� }���}��@@��}���}��@���A�    �#dst��~���~��@@@@A@@��~���~��@@��~���~��@���Р$blit�������@����$blit��$���%��@�����#src��-���.��@@��0���1��@@�����#dst��9���:��@@��<���=��@@@��?���@��@@@@��B���C��@��E���F��@���Р%blito��N @���O @��@����%blito��V @���W @��@�����#src��_ @���` @��@@��b @���c @��@@�����#dst��k @���l @��@@��n @���o @��@@@��q @���r @��@@@@��t @���u @��@��w @���x @��@���Р+unsafe_blit��� A��� A�@����$blit��� A��� A�!@�����#src��� A��� A�@@��� A��� A�@@�����#dst��� A��� A�@@��� A��� A�@@@��� A��� A�!@@@@��� A� �� A�!@��� A� �� A�!@���Р#sub��� B"(�� B"+@����#sub��� B"A�� B"D@�����#src��� B"7�� B":@@��� B"7�� B":@@�����#dst��� B"<�� B"?@@��� B"<�� B"?@@@��� B"6�� B"D@@@@��� B"$�� B"D@��� B"$�� B"D@���Р$subo��� CEK�� CEO@����$subo��� CEd�� CEh@�����#src��� CEZ�� CE]@@��� CEZ�� CE]@@�����#dst�� CE_� CEb@@�� CE_� CEb@@@�� CEY� CEh@@@@��
 CEG� CEh@�� CEG� CEh@@��|��� Dil@@@��|��� Dil@��|��� Dil@�����*ocaml.text*�������	� Users of modules matching the blit signatures [S], [S1], and [S1_distinct] only need
    to understand the code above.  The code below is only for those that need to implement
    modules that match those signatures. @��' Fnn�( H	"	M@@@��* Fnn�+ H	"	M@@��- Fnn�. H	"	M@�����#Elt��6 J	O	[�7 J	O	^@������A�    �!t��C K	e	l�D K	e	m@@@@A@@��F K	e	g�G K	e	m@@��I K	e	g�J K	e	m@���Р%equal��R L	n	t�S L	n	y@��@����!t��\ L	n	|�] L	n	}@@��_ L	n	|�` L	n	}@@��@����!t��i L	n	��j L	n	�@@��l L	n	��m L	n	�@@����$bool��t L	n	��u L	n	�@@��w L	n	��x L	n	�@@��z L	n	��{ L	n	�@@��} L	n	|�~ L	n	�@@@@��� L	n	p�� L	n	�@��� L	n	p�� L	n	�@���Р'of_bool��� P
#
)�� P
#
0@��@����$bool��� P
#
3�� P
#
7@@��� P
#
3�� P
#
7@@����!t��� P
#
;�� P
#
<@@��� P
#
;�� P
#
<@@��� P
#
3�� P
#
<@@@���)ocaml.doc��������	� [of_bool] is used to generate two distinct values of type [t], used in unit tests.
      It is required that [of_bool false <> of_bool true]. @��� N	�	��� O	�
"@@@��� N	�	��� O	�
"@@@��� P
#
%�� P
#
<@��� P
#
%�� P
#
<@@��� J	O	a�� Q
=
@@@@��� J	O	O�� Q
=
@@��� J	O	O�� Q
=
@@�����$Elt1��� S
B
N�� S
B
R@������A�    �!t��� T
Y
c�� T
Y
d@����!a��� T
Y
`�� T
Y
b@@B@@@A@@��� T
Y
[�� T
Y
d@@��� T
Y
[�� T
Y
d@���Р%equal��� U
e
k�� U
e
p@��@����!t��� U
e
x�  U
e
y@�����$bool�� U
e
s�	 U
e
w@@�� U
e
s� U
e
w@@@�� U
e
s� U
e
y@@��@����!t�� U
e
�� U
e
�@�����$bool��! U
e
}�" U
e
�@@��$ U
e
}�% U
e
�@@@��' U
e
}�( U
e
�@@����$bool��/ U
e
��0 U
e
�@@��2 U
e
��3 U
e
�@@��5 U
e
}�6 U
e
�@@��8 U
e
s�9 U
e
�@@@@��; U
e
g�< U
e
�@��> U
e
g�? U
e
�@���Р'of_bool��G V
�
��H V
�
�@��@����$bool��Q V
�
��R V
�
�@@��T V
�
��U V
�
�@@����!t��\ V
�
��] V
�
�@�����$bool��e V
�
��f V
�
�@@��h V
�
��i V
�
�@@@��k V
�
��l V
�
�@@��n V
�
��o V
�
�@@@@��q V
�
��r V
�
�@��t V
�
��u V
�
�@@��w S
B
U�x W
�
�@@@��z S
B
B�{ W
�
�@��} S
B
B�~ W
�
�@�����(Sequence��� Y
�
��� Y
�
�@������A�    �#elt��� Z
�
��� Z
�
�@@@@A@@��� Z
�
��� Z
�
�@@��� Z
�
��� Z
�
�@���A�    �!t��� [
�
��� [
�
�@@@@A@@��� [
�
��� [
�
�@@��� [
�
��� [
�
�@�����������-ocaml.warning�������#-32@@@@���Р)sexp_of_t#��@����*)@)@������'Sexplib$Sexp!t2@2@2@@@//@,@,@,���Р&create��� ]
�
��� ]
�@���#len����#int��� ]
��� ]
�@@��� ]
��� ]
�@@����!t��� ]
��� ]
�@@��� ]
��� ]
�@@��� ]
��� ]
�@@@@��� ]
�
��� ]
�@��� ]
�
��� ]
�@���Р&length�� ^� ^@��@����!t�� ^ � ^!@@�� ^ � ^!@@����#int�� ^%� ^(@@�� ^%�  ^(@@��" ^ �# ^(@@@@��% ^�& ^(@��( ^�) ^(@���Р#get��1 _)/�2 _)2@��@����!t��; _)5�< _)6@@��> _)5�? _)6@@��@����#int��H _):�I _)=@@��K _):�L _)=@@����#elt��S _)A�T _)D@@��V _)A�W _)D@@��Y _):�Z _)D@@��\ _)5�] _)D@@@@��_ _)+�` _)D@��b _)+�c _)D@���Р#set��k `EK�l `EN@��@����!t��u `EQ�v `ER@@��x `EQ�y `ER@@��@����#int��� `EV�� `EY@@��� `EV�� `EY@@��@����#elt��� `E]�� `E`@@��� `E]�� `E`@@����$unit��� `Ed�� `Eh@@��� `Ed�� `Eh@@��� `E]�� `Eh@@��� `EV�� `Eh@@��� `EQ�� `Eh@@@@��� `EG�� `Eh@��� `EG�� `Eh@@��� Y
�
��� ail@@@��� Y
�
��� ail@��� Y
�
��� ail@���A�    �$poly��� cnv�� cnz@����!a��� cns�� cnu@@B@@@A���!a��� cn}�� cn@@@��� cnn�� cn@@��� cnn�� cn@�����)Sequence1��� e���� e��@������A�    �!t��� f���� f��@����!a��� f���� f��@@B@@@A@@��� f���� f��@@��� f���� f��@�����������O�������N@@@@���Р)sexp_of_t)��@��@��('@������MLK-@-@-@��@����<;���76@@>@������\[ZD@D@D@<@@@99@6@6@6���Р+create_like��	4 j&,�	5 j&7@���#len����#int��	@ j&>�	A j&A@@��	C j&>�	D j&A@@��@����!t��	M j&H�	N j&I@���!a��	T j&E�	U j&G@@@��	W j&E�	X j&I@@����!t��	_ j&P�	` j&Q@���!a��	f j&M�	g j&O@@@��	i j&M�	j j&Q@@��	l j&E�	m j&Q@@��	o j&:�	p j&Q@@@���)ocaml.doc	��������	_ [Make1*] guarantees to only call [create_like ~len t] with [len > 0] if [length t >
      0]. @��	~ h���	 i%@@@��	� h���	� i%@@@��	� j&(�	� j&Q@��	� j&(�	� j&Q@���Р&length��	� kRX�	� kR^@��@����!t��	� kRc�	� kRd@��@��	� kRa�	� kRb@@@��	� kRa�	� kRd@@����#int��	� kRh�	� kRk@@��	� kRh�	� kRk@@��	� kRa�	� kRk@@@@��	� kRT�	� kRk@��	� kRT�	� kRk@���A�    �!z��	� o�	� o@����!a��	� o�	� o@@B@@@A@���)ocaml.doc	ڐ������	� [create_bool], [get], and [set] are just used for unit tests.  [z] is needed for
      [Flat_tuple_array], [elt] is needed for [Option_array]. @��	� mmo�	� n�@@@��	� mmo�	� n�@@@��	� o�	� o@@��	� o�	� o@���A�    �#elt��	� p�	� p@����!a��	� p�	� p@@B@@@A@@��	� p�	� p@@��	� p�	� p@���Р+create_bool��
 q%�
 q0@���#len����#int��
 q7�
 q:@@��
 q7�
 q:@@����!t��
 qE�
 qF@�����!z��
! qC�
" qD@�����$bool��
* q>�
+ qB@@��
- q>�
. qB@@@��
0 q>�
1 qD@@@��
3 q>�
4 qF@@��
6 q3�
7 qF@@@@��
9 q!�
: qF@��
< q!�
= qF@���Р#get��
E rGM�
F rGP@��@����!t��
O rGX�
P rGY@�����!z��
X rGV�
Y rGW@���!a��
_ rGS�
` rGU@@@��
b rGS�
c rGW@@@��
e rGS�
f rGY@@��@����#int��
o rG]�
p rG`@@��
r rG]�
s rG`@@����#elt��
z rGg�
{ rGj@���!a��
� rGd�
� rGf@@@��
� rGd�
� rGj@@��
� rG]�
� rGj@@��
� rGS�
� rGj@@@@��
� rGI�
� rGj@��
� rGI�
� rGj@���Р#set��
� skq�
� skt@��@����!t��
� sk|�
� sk}@�����!z��
� skz�
� sk{@���!a��
� skw�
� sky@@@��
� skw�
� sk{@@@��
� skw�
� sk}@@��@����#int��
� sk��
� sk�@@��
� sk��
� sk�@@��@����#elt��
� sk��
� sk�@���!a��
� sk��
� sk�@@@��
� sk��
� sk�@@����$unit��
� sk��
� sk�@@��
� sk��
� sk�@@��
� sk��
� sk�@@��
� sk��
� sk�@@��
� skw�
� sk�@@@@��
� skm�
� sk�@��
� skm�
� sk�@���Р+unsafe_blit��
� u���
� u��@����$blit�� u��� u��@�����!t�� u��� u��@���!a�� u��� u��@@@�� u��� u��@@�����!t��! u���" u��@���!a��( u���) u��@@@��+ u���, u��@@@��. u���/ u��@@@@��1 u���2 u��@��4 u���5 u��@@��7 e���8 v��@@@��: e���; v��@��= e���> v��@�����$Blit��F x���G x��@������@�    �$blit��S z���T z��@����#src��[ z���\ z��@@B����#dst��c z���d z��@@B@@@A�����$blit��l z��m z�@���#src��s z���t z�@@���#dst��z z��{ z�	@@@��} z���~ z�@@@��� z���� z�@@��� z���� z�@���@�    �%blito��� {+�� {0@����#src��� {�� {#@@B����#dst��� {%�� {)@@B@@@A�����%blito��� {@�� {E@���#src��� {4�� {8@@���#dst��� {:�� {>@@@��� {3�� {E@@@��� {�� {E@@��� {�� {E@���@�    �#sub��� |Fa�� |Fd@����#src��� |FU�� |FY@@B����#dst��� |F[�� |F_@@B@@@A�����#sub��� |Fv�� |Fy@���#src��� |Fj�� |Fn@@���#dst��� |Fp�� |Ft@@@��� |Fi�� |Fy@@@��� |FH�� |Fy@@��� |FH�� |Fy@���@�    �$subo�� }z�� }z�@����#src��	 }z��
 }z�@@B����#dst�� }z�� }z�@@B@@@A�����$subo�� }z�� }z�@���#src��! }z��" }z�@@���#dst��( }z��) }z�@@@��+ }z��, }z�@@@��. }z|�/ }z�@@��1 }z|�2 }z�@�����!S��: ���; ��@�����!S��C ���D ��@��F ���G ��@@@��I ���J ��@��L ���M ��@�����"S1��U ����V ���@�����"S1��^ ����_ ���@��a ����b ���@@@��d ����e ���@��g ����h ���@�����*S_distinct��p ����q ��@�����*S_distinct��y ���z ��@��| ���} ��@@@�� ����� ��@��� ����� ��@�����*ocaml.text��������
  � There are various [Make*] functors that turn an [unsafe_blit] function into a [blit]
      function.  The functors differ in whether the sequence type is monomorphic or
      polymorphic, and whether the src and dst types are distinct or are the same.

      The blit functions make sure the slices are valid and then call [unsafe_blit].  They
      guarantee at a call [unsafe_blit ~src ~src_pos ~dst ~dst_pos ~len] that:

      {[
        len > 0
        && src_pos >= 0
        && src_pos + len <= get_src_len src
        && dst_pos >= 0
        && dst_pos + len <= get_dst_len dst
      ]}

      The [Make*] functors also automatically create unit tests.
  @��� ��� ���@@@��� ��� ���@@��� ��� ���@�����$Make��� ��� �@���#Elt��� ��� �@�����#Elt��� ��� �!@��� ��� �!@@���(Sequence��� �#*�� �#2@�������������(Sequence��� �9J�� �9R@��� �9J�� �9R@@��    �#elt��� �9]�� �9`@@@@A������#Elt!t��� �9d�� �9i@@��� �9d�� �9i@@@��� �9X�� �9i@@��� �9J�� �9i@@��� �9B�� �9i@@��� �9B�� �9i@���Р+unsafe_blit��� �jw�� �j�@����$blit�� �j�� �j�@�����!t�� �j�� �j�@@�� �j�� �j�@@�����!t�� �j�� �j�@@�� �j�� �j�@@@�� �j�� �j�@@@@��! �js�" �j�@��$ �js�% �j�@@��' �#5�( ���@@������!S��1 ����2 ���@��4 ����5 ���@@��    �!t��< ����= ���@@@@A������(Sequence!t��G ����H ���@@��J ����K ���@@@��M ����N ���@@��P ����Q ���@@��S �#)�T ���@@��V ��W ���@@���)ocaml.doch�������	I [Make] is for blitting between two values of the same monomorphic type. @��e ����f ��@@@��h ����i ��@@@��k ��l ���@��n ��o ���@�����-Make_distinct��w � �x �-@���#Elt��~ �.5� �.8@�����#Elt��� �.;�� �.>@��� �.;�� �.>@@���#Src��� �@G�� �@J@�������(Sequence��� �@M�� �@U@��� �@M�� �@U@@��    �#elt��� �@`�� �@c@@@@A������#Elt!t��� �@g�� �@l@@��� �@g�� �@l@@@��� �@[�� �@l@@��� �@M�� �@l@@���#Dst��� �nu�� �nx@�������������(Sequence��� ���� ��@��� ���� ��@@��    �#elt��� ���� ��@@@@A������#Elt!t��� ���� ��@@��� ���� ��@@@��� ���� ��@@��� ���� ��@@��� ���� ��@@��� ���� ��@���Р+unsafe_blit�� ���� ���@����$blit��	 ����
 ���@������#Src!t�� ���� ���@@�� ���� ���@@�����!t��  ����! ���@@��# ����$ ���@@@��& ����' ���@@@@��) ����* ���@��, ����- ���@@��/ �n{�0 ���@@��������*S_distinct��; ����< ���@��> ����? ���@@��    �#src��F ���G ��@@@@A������#Src!t��Q ���R ��@@��T ���U ��@@@��W ���X ��@@��Z ����[ ��@@��    �#dst��b �%�c �(@@@@A������#Dst!t��m �,�n �1@@��p �,�q �1@@@��s � �t �1@@��v ����w �1@@��y �nt�z �1@@��| �@F�} �1@@�� �.4�� �1@@���)ocaml.doc��������	O [Make_distinct] is for blitting between values of distinct monomorphic types. @��� ����� ��@@@��� ����� ��@@@��� ��� �1@��� ��� �1@�����%Make1��� ����� ���@���(Sequence��� ����� ���@�������)Sequence1��� ����� ���@��� ����� ���@@��    �#elt��� ����� ���@����!a��� ����� ���@@B@@@A�����$poly��� ����� ���@���!a��� ����� ���@@@��� ����� ���@@@��� ����� ���@@��� ����� ���@@������"S1��� ����� ���@��� ����� ���@@��    �!t��� ����� ���@����!a��� ����� ���@@B@@@A������(Sequence!t�� ���� ���@���!a�� ���� ���@@@�� ���� ���@@@�� ���� ���@@�� ���� ���@@�� ���� ���@@���)ocaml.doc+�������	J [Make1] is for blitting between two values of the same polymorphic type. @��( �35�) �3�@@@��+ �35�, �3�@@@��. ����/ ���@��1 ����2 ���@�����-Make1_generic��: ����; ���@���#Elt��A ����B ���@�����$Elt1��J ����K ���@��M ����N ���@@���(Sequence��T ����U ���@�������)Sequence1��_ ����` ���@��b ����c ���@@��    �#elt��j ����k ���@����!a��r ����s ���@@B@@@A������#Elt!t��} ����~ ���@���!a��� ����� ���@@@��� ����� ���@@@��� ����� ���@@��� ����� ���@@������"S1��� �� �� ��@��� �� �� ��@@��    �!t��� ���� ��@����!a��� ���� ��@@B@@@A������(Sequence!t��� ���� ��"@���!a��� ���� ��@@@��� ���� ��"@@@��� ���� ��"@@��� �� �� ��"@@��� ����� ��"@@��� ����� ��"@@���)ocaml.docݐ������	� [Make1_generic] is for blitting between two values of the same container type that's
      not fully polymorphic (in the sense of Container.Generic). @��� ����� �R�@@@��� ����� �R�@@@��� ����� ��"@��� ����� ��"@@��� x���� �$'@@@��� x���� �$'@��� x���� �$'@@