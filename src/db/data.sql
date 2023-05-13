PGDMP     :    :                {            postgres    15.2    15.2 ,    7           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            8           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            9           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            :           1262    5    postgres    DATABASE        CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE postgres;
                postgres    false            ;           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3386                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            <           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    5            �            1259    16581 	   challenge    TABLE     �  CREATE TABLE public.challenge (
    id bigint NOT NULL,
    abstracts character varying(40000) NOT NULL,
    all_text character varying(40000) NOT NULL,
    amount_of_interviews bigint NOT NULL,
    code character varying(40000) NOT NULL,
    interview_quotes character varying(40000) NOT NULL,
    main_idea character varying(40000),
    specific boolean NOT NULL,
    tags character varying(40000) NOT NULL,
    theme character varying(255) NOT NULL,
    theme_persistent character varying(255)
);
    DROP TABLE public.challenge;
       public         heap    postgres    false    5            �            1259    16785    challenge_feedback    TABLE     !  CREATE TABLE public.challenge_feedback (
    id bigint NOT NULL,
    username character varying(255) NOT NULL,
    challenge_id bigint NOT NULL,
    known boolean,
    known_comment character varying(40000),
    will_mitigate boolean,
    will_mitigate_comment character varying(40000)
);
 &   DROP TABLE public.challenge_feedback;
       public         heap    postgres    false    5            �            1259    16588    challenge_tag    TABLE     ^   CREATE TABLE public.challenge_tag (
    challenge bigint NOT NULL,
    tag bigint NOT NULL
);
 !   DROP TABLE public.challenge_tag;
       public         heap    postgres    false    5            �            1259    16593    link    TABLE     `   CREATE TABLE public.link (
    challenge bigint NOT NULL,
    recommendation bigint NOT NULL
);
    DROP TABLE public.link;
       public         heap    postgres    false    5            �            1259    16605    recommendation    TABLE     �  CREATE TABLE public.recommendation (
    id bigint NOT NULL,
    abstracts character varying(40000) NOT NULL,
    all_text character varying(40000) NOT NULL,
    amount_of_interviews bigint NOT NULL,
    code character varying(40000) NOT NULL,
    interview_quotes character varying(40000) NOT NULL,
    main_idea character varying(40000),
    specific boolean NOT NULL,
    tags character varying(40000) NOT NULL,
    theme character varying(255) NOT NULL
);
 "   DROP TABLE public.recommendation;
       public         heap    postgres    false    5            �            1259    16764    recommendation_feedback    TABLE     n  CREATE TABLE public.recommendation_feedback (
    id bigint NOT NULL,
    username character varying(255) NOT NULL,
    recommendation_id bigint NOT NULL,
    known boolean,
    known_comment character varying(40000),
    will_use boolean,
    will_use_comment character varying(40000),
    used_already boolean,
    used_already_comment character varying(40000)
);
 +   DROP TABLE public.recommendation_feedback;
       public         heap    postgres    false    5            �            1259    16619    recommendation_tag    TABLE     h   CREATE TABLE public.recommendation_tag (
    recommendation bigint NOT NULL,
    tag bigint NOT NULL
);
 &   DROP TABLE public.recommendation_tag;
       public         heap    postgres    false    5            �            1259    16793    seq_challenge_feedback    SEQUENCE        CREATE SEQUENCE public.seq_challenge_feedback
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.seq_challenge_feedback;
       public          postgres    false    5            �            1259    16449    seq_recommendation_feedback    SEQUENCE     �   CREATE SEQUENCE public.seq_recommendation_feedback
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.seq_recommendation_feedback;
       public          postgres    false    5            �            1259    16533    tag    TABLE     c   CREATE TABLE public.tag (
    id bigint NOT NULL,
    descricao character varying(255) NOT NULL
);
    DROP TABLE public.tag;
       public         heap    postgres    false    5            -          0    16581 	   challenge 
   TABLE DATA           �   COPY public.challenge (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme, theme_persistent) FROM stdin;
    public          postgres    false    217   I8       3          0    16785    challenge_feedback 
   TABLE DATA           �   COPY public.challenge_feedback (id, username, challenge_id, known, known_comment, will_mitigate, will_mitigate_comment) FROM stdin;
    public          postgres    false    223   D�       .          0    16588    challenge_tag 
   TABLE DATA           7   COPY public.challenge_tag (challenge, tag) FROM stdin;
    public          postgres    false    218   ��       /          0    16593    link 
   TABLE DATA           9   COPY public.link (challenge, recommendation) FROM stdin;
    public          postgres    false    219   t�       0          0    16605    recommendation 
   TABLE DATA           �   COPY public.recommendation (id, abstracts, all_text, amount_of_interviews, code, interview_quotes, main_idea, specific, tags, theme) FROM stdin;
    public          postgres    false    220   ��       2          0    16764    recommendation_feedback 
   TABLE DATA           �   COPY public.recommendation_feedback (id, username, recommendation_id, known, known_comment, will_use, will_use_comment, used_already, used_already_comment) FROM stdin;
    public          postgres    false    222   �      1          0    16619    recommendation_tag 
   TABLE DATA           A   COPY public.recommendation_tag (recommendation, tag) FROM stdin;
    public          postgres    false    221   U�      ,          0    16533    tag 
   TABLE DATA           ,   COPY public.tag (id, descricao) FROM stdin;
    public          postgres    false    216   K�      =           0    0    seq_challenge_feedback    SEQUENCE SET     E   SELECT pg_catalog.setval('public.seq_challenge_feedback', 21, true);
          public          postgres    false    224            >           0    0    seq_recommendation_feedback    SEQUENCE SET     J   SELECT pg_catalog.setval('public.seq_recommendation_feedback', 41, true);
          public          postgres    false    215            �           2606    16792 *   challenge_feedback challenge_feedback_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.challenge_feedback
    ADD CONSTRAINT challenge_feedback_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.challenge_feedback DROP CONSTRAINT challenge_feedback_pkey;
       public            postgres    false    223            �           2606    16587    challenge challenge_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.challenge
    ADD CONSTRAINT challenge_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.challenge DROP CONSTRAINT challenge_pkey;
       public            postgres    false    217            �           2606    16592     challenge_tag challenge_tag_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.challenge_tag
    ADD CONSTRAINT challenge_tag_pkey PRIMARY KEY (challenge, tag);
 J   ALTER TABLE ONLY public.challenge_tag DROP CONSTRAINT challenge_tag_pkey;
       public            postgres    false    218    218            �           2606    16597    link link_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.link
    ADD CONSTRAINT link_pkey PRIMARY KEY (challenge, recommendation);
 8   ALTER TABLE ONLY public.link DROP CONSTRAINT link_pkey;
       public            postgres    false    219    219            �           2606    16771 4   recommendation_feedback recommendation_feedback_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.recommendation_feedback
    ADD CONSTRAINT recommendation_feedback_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.recommendation_feedback DROP CONSTRAINT recommendation_feedback_pkey;
       public            postgres    false    222            �           2606    16611 "   recommendation recommendation_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.recommendation
    ADD CONSTRAINT recommendation_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.recommendation DROP CONSTRAINT recommendation_pkey;
       public            postgres    false    220            �           2606    16623 *   recommendation_tag recommendation_tag_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.recommendation_tag
    ADD CONSTRAINT recommendation_tag_pkey PRIMARY KEY (recommendation, tag);
 T   ALTER TABLE ONLY public.recommendation_tag DROP CONSTRAINT recommendation_tag_pkey;
       public            postgres    false    221    221            �           2606    16537    tag tag_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.tag DROP CONSTRAINT tag_pkey;
       public            postgres    false    216            �           2606    16539     tag uk_58u775g08wj3bi8lpkjoorlfj 
   CONSTRAINT     `   ALTER TABLE ONLY public.tag
    ADD CONSTRAINT uk_58u775g08wj3bi8lpkjoorlfj UNIQUE (descricao);
 J   ALTER TABLE ONLY public.tag DROP CONSTRAINT uk_58u775g08wj3bi8lpkjoorlfj;
       public            postgres    false    216            �           2606    16794 1   challenge_feedback fk_challengefeedback_challenge    FK CONSTRAINT     �   ALTER TABLE ONLY public.challenge_feedback
    ADD CONSTRAINT fk_challengefeedback_challenge FOREIGN KEY (challenge_id) REFERENCES public.challenge(id);
 [   ALTER TABLE ONLY public.challenge_feedback DROP CONSTRAINT fk_challengefeedback_challenge;
       public          postgres    false    217    223    3208            �           2606    16624 '   challenge_tag fk_challengetag_challenge    FK CONSTRAINT     �   ALTER TABLE ONLY public.challenge_tag
    ADD CONSTRAINT fk_challengetag_challenge FOREIGN KEY (challenge) REFERENCES public.challenge(id);
 Q   ALTER TABLE ONLY public.challenge_tag DROP CONSTRAINT fk_challengetag_challenge;
       public          postgres    false    3208    217    218            �           2606    16629 !   challenge_tag fk_challengetag_tag    FK CONSTRAINT     z   ALTER TABLE ONLY public.challenge_tag
    ADD CONSTRAINT fk_challengetag_tag FOREIGN KEY (tag) REFERENCES public.tag(id);
 K   ALTER TABLE ONLY public.challenge_tag DROP CONSTRAINT fk_challengetag_tag;
       public          postgres    false    218    3204    216            �           2606    16634    link fk_link_challenge    FK CONSTRAINT     {   ALTER TABLE ONLY public.link
    ADD CONSTRAINT fk_link_challenge FOREIGN KEY (challenge) REFERENCES public.challenge(id);
 @   ALTER TABLE ONLY public.link DROP CONSTRAINT fk_link_challenge;
       public          postgres    false    3208    219    217            �           2606    16639    link fk_link_recommendation    FK CONSTRAINT     �   ALTER TABLE ONLY public.link
    ADD CONSTRAINT fk_link_recommendation FOREIGN KEY (recommendation) REFERENCES public.recommendation(id);
 E   ALTER TABLE ONLY public.link DROP CONSTRAINT fk_link_recommendation;
       public          postgres    false    219    3214    220            �           2606    16777 @   recommendation_feedback fk_recommendationfeedback_recommendation    FK CONSTRAINT     �   ALTER TABLE ONLY public.recommendation_feedback
    ADD CONSTRAINT fk_recommendationfeedback_recommendation FOREIGN KEY (recommendation_id) REFERENCES public.recommendation(id);
 j   ALTER TABLE ONLY public.recommendation_feedback DROP CONSTRAINT fk_recommendationfeedback_recommendation;
       public          postgres    false    220    3214    222            �           2606    16654 6   recommendation_tag fk_recommendationtag_recommendation    FK CONSTRAINT     �   ALTER TABLE ONLY public.recommendation_tag
    ADD CONSTRAINT fk_recommendationtag_recommendation FOREIGN KEY (recommendation) REFERENCES public.recommendation(id);
 `   ALTER TABLE ONLY public.recommendation_tag DROP CONSTRAINT fk_recommendationtag_recommendation;
       public          postgres    false    221    220    3214            �           2606    16659 +   recommendation_tag fk_recommendationtag_tag    FK CONSTRAINT     �   ALTER TABLE ONLY public.recommendation_tag
    ADD CONSTRAINT fk_recommendationtag_tag FOREIGN KEY (tag) REFERENCES public.tag(id);
 U   ALTER TABLE ONLY public.recommendation_tag DROP CONSTRAINT fk_recommendationtag_tag;
       public          postgres    false    216    221    3204            -      x���ےǱ6z��}G;�6u�q��(�/RThH���+�0hO��À�����~��(�����P�0$��ARG�eq�u�����×�ݟ|��U�W�lYWm�W]���Օk��ʾq7Owm�ͯ]Vt٪X��e_vYWg�����s�rSTWٮ̫��٦h�g=��{i7u_��υ�>���un5͚�j�}���e�ڵս.��7�u�m�=j�ݸ&�>W�Y6�Ͳgh���Ҁ�l���v�qٺ^�����6��|���{�*���9Ϻ&/�I�[���,_��Ւ�Q7WyU��wE]�����o��U�<s7u���}�`(�v�����}K�Znܪ/�;��qm;�?y���ҁ$���8A=���k�;]�ƕ4��ټ
��y��Gw�k�>������?2�׷���}Z�8�@�����흫��&�VE��ۮ9d{"G���z��]�r�+_�}g���g}UЂ�Ew��v6���Z却Q���]�e�˛���~�wL��r���������_���Qv��=�>;�ʹU4�hx�h���e��ok�<�-ݮKW4_�+�=����
����~�~t4��&"��e�U�/݊�m�h��O�Xz��W�rn7y��Jw���^�,j\Ւ@*��,�ޭ3iH�pKC̻�&S7Y�î����qq��$�C݋@$YtU�<����ٵ1��:��5��Q9��v$7��<[`�e����z��sz����V��&�ƒv�cG�^I�#��p鵼2uy��Z�eY�1�B9��N�:���Tx�hu5͸����[�`k�����Q<����\�>'�w���� ��w�?iG�!�$<�*�e�+����q�_u��l�u�;\�T|�FĢ�@3u�G�:ЖD�R�0H�X5Ȱf�&��-���1@�mH�ҙ@
 ���_��-��$��	���;��a�@�mt]�BΫm�51Sw�/m�fE��&b��i��&/{R�x��_�diw󴻡r&m�N73�c��]�/ک�)v|t���ABCcV#�˯��ǔ����o��? #����,����gpX�#R�r��Ar��7��/�\^>��|���g�0�'b��_�U�=�9��%�y���g���U=SN�,�Q�L�ĥp�8��.:t�߽��
"*c�l���h�����=]H;���_���<��pϗ�WP��땹��M�kܙ���|뎦HKU*��4�'u�e;W��T�kRG�L3��tt�b�4." ���l[7:���G��}�Ae��1�t�ӈb4��,��VP��b�]A���m��[Dm��k�M#��ȭ��}~�;qUWE>=�s�W�i�o
��]6(�-���6+�)/7��@g,mG�K�������y�I5�_�Q�1Y�
Z�yI��'��:�����7�a������Y����ߟ~w��ç�>|�ݳK)�}1���dc��	�ΰb}���v˦�l�l����/�L`��!��j6y ������U�mM˹*�*`^���5���q��+�V9����&���ơ+�Y�	C�1ɮ���_e����b�`M�W�^�+��%
�PW���%��@K喛��O�bADAd��Y�I�.iז�֥�s��&���Nv߬?�\�q��[����h�
mf���,�%���;/�l������i���^�Ÿ��g6���]�/��kl�����dm�[����$}���N��ٗ��F�*%벾�G{�'��^E���K�;Z`b�W'ϣo�~���o�e?^>z��;�����"��ܲ y`L�V��b����qU�:�M�=}O,Ǵ#����֘����qg'I�oZNH����h�n���~#��y븟=}���g���ۧ����|�~<���E��O�EK�/�MV�f�IA|�s-+&�f���FlEdY�I�Sw�Nt-��jV��]�d��J<b"@�2E媖OI�at��%[Gj�jƗ{�􂴿(��v�9���*�:���WWl�ĵ~�)��lI���1'�������Ւ!vFږ���9/�X�W���`
Fթ����a�Z�h_�g�܍��˼ulk�UypaT�f_��u���,���5���<W>�j�!E����	����A�.��6	�ν�e[ᐮwܲvGǱ+���C(��~e���Ԥ�
Em�����?�R��;�b=��ي�Z�e9��9���g'[�I_Ky���� ���9?�F��e.����M=�4�,0G;n�qC�6�[8J�ɹu�6��&Op�����*�tyO�N�w꭭;&�*6)R�Fv��{��2�9�;Ɏn���9����3�������?�\z�t�$�*_Ȍe�����a�������!�Z]S���mQ[����A<A�Q]��Z,�]G�͇��?���������e\�^C��!�ȢQ�kh�o�-� m�7��h�2����W+��^����;�~t���1h]�6ˢe���R�|G2j���bb"m��|��-	��SC<{NE�����UE����	��-���/�rz�lۚ����p�u������K����!rd.�̳MA��Yn�����ḓ���]G�&�9�ȝ�>�|��,�y%�<%p?�-�8�=����5�\-�d�u���p>�j���sf�,J�={J�k��ۻ��zqS�}Kt���:-ix��x���s�pOf�^�+���"z�A� I��i��;o(S��i\^�aJ�&2t}E�Jy�j어�}X�%͚�S��^w���w�=/���&��A���u����#0c+s|M��s;5hG!!D��Z���6J3��*aA#C[��Bִ�\#v�����n���!���v�!e�s�n�[�G=���1���SE��.�wM��ad�_�1����������#Gn�wi���nW�1�+|kb"4/�*��!O"7
D~����=�F�z�9? "6J��YR�S�vS��p،�[��4�j�~��o]ꖀ3Q9yI����o�-�]<�>0���P���lV�<g���>{�*�)Y�������7G^,?��"�A�"��'�ϧ���Y�w����+-���~���yC|n���7�������!��9��AP-������ ���D����[S����ib�ߴ�"_�v����S�HΖ�4>��W=U#�d҈-�Q࠵�7�W�{"�qj�}y�N��z����h��ܺ�R�S�v+S��\s�A����mOdS���*n���WӋ���w��Hpb_���.�.�Y~Ú�,���q9ԽءWOI4+��é�BL�_�ݚ�6�+��F�8�߳E�6�B�۠T���E �5,f��weIm�n��ޖ�v�b�_��H�{�>S:#�hj���f�,Ғ���.���^{��β��{cpʙۂ#?�?��g�~(�� ��!a�G����Ka�;%���rW*Ѿ�D/�P��[�.\�0ܹ,��
�z� і߅ψ��nWM��d!/����m=�]tb6��$I�o�!���5�g�6]���)-���Y�ım'��0-��!se?>�k!�RTU}�#���eRUD� ���ƴH�Z�5�K^����V��)�ۭ�aFW���st	����I�Fʳ>�va�Ԗ��v骼)�J��t�"7���SZ�.�vX6�bG�5,v/��DR �\�P		����Z���ލ�2C���#�&啹�2��R��}\�0~|���Y-R�lL�;�xd��$�މ�[O�Ϧr��O�`��HtÝ͢6�%�&��q5���)�0r>�m�� �k!�e7�9.ë�ߺ�jW�3����88,vG����_z_�3�'�+K�{I��X<K�.��䖽g�d��<n'b ~}�/��'N��rI�(��w�f�
��/܅
$x�h��凶d�'�t�[�K:�0��4'�?=�<�vՁ�e.Vm���3]��\�:z�#"r��l��k��a��븩�<I
!8�/�r�X!xxca[��m%]�F^���d�G�Ņ��֘�S�$�:�]��e;;X��)�K���/!�w�7�g.�ҙ43�v�I��*�N�΀�    �v�X�$�,e�hl�cxod�mb�I�A�����n������������pd�{���k
���M��<2K��$A��1�o�-)~m^�:���	���ΐ8A�F#��D�����x���cTN�`����]�9Q->!�A�^S�'͟)�XY������N@�%4�5�F���/�ג͡&�O���}0�z�v~����������������/����>v��[�l�OSD�d�+��Ծ�i�mg�5d�bD�a��0��H�K�x��\��#N�)�$]eSl[W"q0�E��j17��C����H���ig���]�tʹ}2�C�� a��|&-w����}k\�Mޜ�'3���1V����#/����.�m99��4��u��Z��󊕊(�Ad��:����qS��T���"�T�����;�fv��S�X��z��?P�9�t�We�O����Q3S�I��*�qjl23ݤ��
�|>3Uê�V���9M;��i�!] W.�`�fWK��<$:��%�=��K�1��I'4�ٿ����1`d}�H��f�|\�;d��~�})N�/�E��$X>m�!/7�:�ޚJ2w���|��@^�&�u�'_V�?U��~��Duf0q �N`���=��G��wYT�3@�U����C���U_O^�j/W�?�<D�k(](��G��5�o���4��ĩ��J죤R��O2�$��`*�Y�X�bW
l��5��L�ݍ���Н�k��_G�����.v4�aW���I��Z��r���^,k���`1�r������\'e+`�<)D���.o`i)^�Ec�f� ����kF����t�4r�����['���0�L`�0gڜ|�V<r�Dc9G��N�(YL�������S{hJ�vt�vt'�ėb��=�.̶���y��6�pjY�cDe���uyMG,..4+�b�!,�F�C�aQ%���X#�t�X�,R����)�\K�|+9��̮P�*��\8P}�l��:dpH$隶�$��͕��Zӣ�˅	 �&�oF��E}���#KKþI	��좨R���C�5-�*�l�#m	5���d�!QX���G��-���Z�����X=	t1��V�	���2Q��������Q��بi��D(\��%B�P��8N���n"Z���1er>���a�&���p�/��n�Ӷys�D������g���e�eL8�2���ͯ���UToY��`2\����o����\�y¿�.�SQсb]���;�l7y1o���]ݶ�J���D��ƘLZDF����}�SƝ���i��mNr'�G��kҟ�f��$����;i27�u��o[!�WwV�v����0'|�P PnjF�ee<��[:8��[,�oc�:�'k9�0�zq��G��щ��F{U+</޺p�?BD�и�n�Qr�E�9$Bi��f�:򯀇B�� �(�$
�t8la�r��D��ɟc�+��c����m�2?�9����;�2��cb�@g�v�e��8j���x�bz�n��|�y9i�3�h��?���q��0D����E(���:����:����:���5urG�G/�C�T��d�0�����fZ9�{���H�����2Q'	�KKl���zQ�|�U��#�?*�si��l����78�c���,����[@Z��JF��<��߁�"Ay��[��U�i[I �ɾ�)��t�^O�# 'ڡTZX�bs�uf��rŧ���M��5D���ʻ<�ܨ��Lu��`�����2��d�����#w�hY�k�jC��6=��l�MV����Pb�EQ������OM
�4�N�{��˸�~���}K�A2�{�W�C���\Tt��F�վ5��zy��9�G�4\(��i���S�,CS���:�M܃�,C�XN���U�ԧ���*�!��s�!'�ɑ1�WTZ{�s�y���ʤN@*�I�����:g��m�I�m�9ڄ$}�5TA�ޒ�B�& ��V�V���d[q�D|VZmď䂉��5��RqE�8?��"i�MM��Voڋ�R�-��j�J��k:��y;\HH��e��~��%�K�W*q�7t�+�e=]���/�*$U�Z�i|�3�^�c��~S{lZ�#�lx��)C�-8�ѿ��� 3�c'o����i͇��]�Җ+Կc���LX�����2#k�[�L�Bm��w��sG=�<���ٷ/דWe�S����? ���J�9��,�:X��hQ!��39��۞�`�/
X��C}��;'�H��Rf��]�DA1�J�S���h� šzAOʂ��8X�u�P���T���e���C;БӃ9�y�t�D��'�=�j 5�2ϣ��	ا�Io���{/�d=y��;U����ߋ��_�/XGi<4�'����l`�g���~M�#�)$(_���G���e��cx�'���t/�ɡ]�k�d��E��̠��߱"��s�:��}���S�T�]�?�s���"�^���=��9\\ܒV��B[�1_m͐�	��3�����
$Ϭ�E�bFbK{|gHӯB����ڽ�vYO^k�N����O"��
cm�B!ku3����\V����ɹ4uʩ�=js�s�������C�wѽb�ٻ�jv�
���܏���U�J����>XÜgv�������������0�9؍�=	B��ov�Bu��ׅ��h�e��-?�8���~h��\�϶� �ػ9�ĳ����75��	XJ�ܢ�������oѹ��ƥ�PP�d��)���2h�Fܱ��
�Nq�"'�+l��MΑ �òtQg��.�]�lŒ���{6����0��� �=j��|��=��[���iG�t�M󍝓�#�lpDu���,���dٿ��=M�Y�&����4���q���#�;�'wC���������>� 
1s�*�Z����4<�슝�8��Շ]Mv������A�^���uqF?��ٟ�#	�)����n��}2�<;���e����-.:��]s7z�X����Dp�m�.Њ�}�6�y�H�e���S�6"o/!aj�tF��F�ہ���"э�{���b�}�MA[V�z��Am��K<��KޜK��V�&o�MN]X>��M(	���i�}U"��X�M�)P6H�ov��5�h�;��+�L7�+`�����)�$�sg���i�o\�[� L���@�|Q��-�SF*������2�4�Γ�0|�R��wI���SȩD(�`<�[H�D>�<V�^��{�F�!E���!�AD����TuKs�������y������}���?���/>�<��^�4 E��C����'
z�%��J�C�ηEY䍈�1a5��-�"����I�vB*�N~�r.��L�\g&�R"|�J�B����2��rI-q�I�\@��'��ed�E2�Ѫ��ٿ��,�>�bP83������`����h�BƷkEN��ѳe���@�j$	d�5MX�zjl�����aF�#�c����ɛp�IQ������~���6��S-�)(g�mԄº&��U�=���4��7�c�{1uUq�q.�p�6���(Ș�	[�:���C�TB	ؿ�&6�dyùg�G��f;��
�X]@\b���aE��5�6���j���1����Y�[��`=^�"�*7{X����~x�/Q��&/�\��*[�ҥ�4C��m*)�NΉ.����+T�s�G��]�9�H���Z���z`�bŜ�
��#�L	I��P�.�
N]1P4ɮ)%#u�\��F�H�Y�+.�K_��P�!�����P�R��1`ʎ����L( ͐�9��y������~Y��f���&k''�h[�m������=X!�&��`'巅�>c@n�_6z�`,Tq.�G�/W���)3α/�IBAO	��#u���L����}��(T�G��/�X��T.���v��HqZ�(��C2���<��x����я=�� 2A�zǛ9���>Ҕ�;�(aF	3J�w'aޟ��Mn1/Wu>�    r���}k�~Tk�b����}���#�3���6�����6��Ѧol�8�W��i�����g�RR�[{��P���W ��y��?N�� C
����̉
(�B"����[����n��k��C���+:�r �p�� J.fb4�͇�A���]
݇H(9�`��n.�SX�,��|�r1�����}���3y1O��}�w�-&0��(C�tE���59j=���)B�g�LE�� �N,�˲�W�EB�v�,�3V�"����{oO;�9j%{�~3��.�{����+tn�K'U�0��]"��(	��U-t�#{'�Da�?�p�BH�fH�����$@����+"��'E��F��s��T�����?�&�u�&`��/4lxF�����s�~
��6V�T5���ݧ�0���q�h�������4��=�>.����< �Haf��=T��$�J�4]Q:d���+�Y�%V	R�V�VW<ЄuL	nw7<`<��+Ɔ��_l(�&��"Q����/��J{��_���1����[�e��E;��{�5M��u*�JP�q��>w�"�J�+�3o��!���6��w���M�2�(]���.9BH���×>U�L�z�$#�����U�"���@�ps�����ՒW$o�/�@@Q��u�/O�0?�g�/��W�w &Ok̣�D�<�����[��(XE�#W���]��q1��4��ׄ��ۼ��f��Y�B!<&N�� ��u�{�{Z�j����	�b��K|Y��|�F�+�Q���-qnGL 7�<ʷ��d��5-�Rw�ҭ;$D(e.T�c����o���zU\���$eK�.���x%gD�r�bȴ�Y�%�rGhK�;�xZb��l"{<�G���^�UG�%�%�&|�7�����?D���J��s+�T�p���:�@�X���8mG�dr+mˋ���o2YCj��U��z~ж������Rp��?�����"�d�;���-9B6�>��~$��Ԅ//���i�z/"JR�峨�VQ���������L���B��=�)[	�Tޟ&�I$BE�Ae}�~�U1%b�i��u-e�;���G�W�����p���BJ���Q�28��.E4|P	2�k�LyO�ϕ���8#u�҃�*آ8�9b�g��!,``�p0�E����7��V(���ʇ٩�ve{��<*6�5ی-|a7�A��n�5+�V�k�-Zuo�.ׄ��Ԏ��Uqp0C�~m:FZ�:P���a�W������̴�3�10�^H�vߘ�R<+o0l�u��L��j,ұ%��Uy�nG ��S�w$E. ]�z�/���$`��%��\�9���\�T��C����B�8�ϔm���*k�gJ��v�#p�5�X��S%(֬���X�x�o2�M�-�dN���`�ZNNW|m�y�Jb��E�Q�/����c�<�6����ǫ�x��R�Uj�J�W��*5^�ƫ��_�N8�nW���Zj���������O8��Sx��1��������k*׹$�hm�C���]�i��'ry_��m� �w{��%��3U���yv�?{)��O����ۢ���1��"B�=ǐ$qb�Q�2h�
̡o�
ųܵ��:}a�E�����������n������6��1�G���On\l!1CA�#K�i��l���ԧ�������?�2ջ������P���>����i(�����B�~W\F�ǄO/���p!�%�Z$m��W�(�����P5�1�Ð�[E�����^�( �_�I^�rh���� 5�C��!q��&T��U?x�y~q*��|�E]����+��%=�`�iW�2�~:oj3ך�а���,�[)�
�j��c�}h���C,U�>�N�+$�u�hQ�]/}�IZ~W���u�(���9BW	P@#�$���m����ʉ_r�;�-6I�y�˦��_��c4%�I,9)�6rD������* 	:4Kw���n6�,,�>䍽Vrg+�9	��/�����j-R�'.��W"��z��Ğ� ���y�	*���D{������x��,U�;�kos�ʥg*\�۔=�h]�
�nLC5�>s� E<�m�7����&bmj��z�O�F95��-��a�
���S��ˏ'��S��*���U� �R,�\+��n{/U�lq�1�T0L{�H]k���m�8��V�۹H�6`��のjm�S��5�f������TO�W}�h	����HP;@ ��*�`|�>�re���+ʛ�t��t55�a�K�=���٪�b`�)5´�+��9?�=.��w���8�i��O�/ں�;ԗbO,,V\�$�'8~G��Hu�'���y���"��r�@��/h���݌���;�-�䵖�.|?5�W3S7�2��,�0��z�릀�~+|��]��@�(Q)���n��D�.�4S�W�[�bD��zp�M�q���C�r���~zP������viYF����}�o�w�sp��Ĕ@uʦpZ��;�P�ΏM��n#%L��쮨\ǂݮ������Q'ʪ�x��:D���^�a�Ү�vY��T޿o�	(���O�[����D|/؋�e8�V����p�X��8�pJ�)�������;�wss] UEҁ��k���� �%�Ɠ�ӗ�l0�q����
�h��Kde{%�&,���8Ȫ1u/���-���ϣ�eё�/��	4�A�.��_ûV�����BUC+q�/�e��5��.��W���
������I�����}��H֥�`��>v����ؑ�NHl/+�Ң�R����u �S_7�3c�3o.�j>}�XWq�G�=d^�s�S�pq���������1���Ď�V��}v���M����JB�_���yS�E�ɋ/�jW�K�Xs�P���kw ^L�!OQ8���C�:�ă�͖��Y �<��x%J�D�֋D�ޝ��M>��G�i<��Sm<��S��jov݁��	�A���
�ȨZ䫅o�L�%ZV�KM�
�O���#�k�4�\j�/5*8hM��Q�i�� j�=�כ�p�@��u�
��3�#p簠w��A�9�������z�h�,~�b���{�-Pm$Rn�zᝄk�f�8�������d����q$����җ�u�������F�E�0i�B�4��G��o�uZv� �n��	
��C���ܪN�U��yB�)���ϾS��\ÏQ>>�?�<��P��*�Ӈ�N�-����� W�������7�������rF�|<���[=����;XG6�qg�;�C�ٓ��3&��U�� d�P��� S%�O�-����\8�;�.�Opz�^t��L4��ej��m��n�~����J��;G�) t�3��ߙ���q����j�A*_eߙ�����T��~gVmaG)� �w���ʟe�&��\d{�`bh�\$��,9�}���B���>���?r��w�t#�Q�ϣ�U+���(I�K��N�C��P��#�tӬ	Y��u�J���p9��ߑ�5˸$�+~�S��A���p��+��P>K��B���K���G��z��%D��O]�ؘ��n���L*��*��ۙN�R*q|x���/!\�� �pm���������d0bf�4�-t=��Qܕx;�#��`פ'��Oa塈d�2�����/꽽O+SX�}�����0��u�8�!Z��~��74vi��Ð��� ��N�!l�N �%����xﰕ��)�C�H�	�Z�\���Z��ؾ�UҦ`�.����E3eF�4���^�Q+������YJ�$/Ji%��MZ�B�j�q?^���"1��Ai9h�ql�uf�pץCo:tI��!�����%���|�Ա����\�ϭN�	��e�
��j��Q|��rT�+2'��C's���dBm>$����"�W�F!�^��{?��`���D��ǟŔJ0hL�_h��N\,��G�|�DX�%�ɯ5!!��6���t�h'�$"l�Jn�
�t �P����	*�����<��    Qh<	5��S��[C3�|��$r}�%*φ��U� �{>�iRӦFw�����2�Q��#��MNXs���*�l4�Fm�U\��%��&�Q3d� gtT�ע%�x�\�����ހ�R�:�*P�H�	_�Ԁ��"��d(��/�m_�ƈ����+�I+����J�%���
J����� -$GBWic���{��$_�g1���T�%�	�l�4qv�)
x��^#�9���k�ӎ.Mȅ[���Ռ.-��DE�����-�*��(��9�-�S�Z�e+�Pa�V'"!���!N\)�goD=� zb��i���1�����FF]}�~��â�z_�Kd����W�ɧ��B'����#��+E`�s]�L�1���Le�(S?�:y��y�Τ�	��?���"WZ@0M$P����A��v�m,�-_�\whʡR�F�}D����p��o}"eA��4�2�< ����uF�����14���ݾ΄��Z(��*e�^�,@bmzww
t��
�&#Q�moGU�d��}�2)����W���d`'g�!�qV�*�t�3���\M�'�M�H�0[�\�7"Ɗh�ǚ%�V>]��'��"�bH�,����N�k��'0V|�5^����^�m�rQUMj	�=|P��0��(�c���Lq�J;�*Pz��)��g9}�ӔS�\��Z�)�A{f�'�V5���Fg�!�e�^�I�e�R��C'��c����Hg��4��a�Rsk�z�%�~�J3�-��K���?JV�qZ�W�$!q���2{�`��A9  #k$�y�o)lk!U���/Ƒ7>����b��$]2A�eI>/6�ρ��d&(p<�p(�)e�*����Xw�ޚ��zW,[�Ű(�!)��|�N	���!e���u^ȿ�d[q<
<a��>��p:r����d�����P�wj��9�lO����X~~�ݳ�K\q���8Ps����~�J�EV�����H�ԄB1�+��A���ɘpN�ޞr���ٺʪ��d�{I���^�4c��C"������օ(I9k��Y�e�M���OER�q��F=l��n�òg'W7�����j�[;2�O>���v^��"�����Qht t���=���=���=��qr㤛�?O�?8���	��mM�g��r(�%Ō�D���'/sI�З*�ӏ7(�9�P��ӭ��I�I��v�O������o�À�_k���.���gUӠq[N�W�������whvNo���%M����Űk��7EY��n*�?@�I7}��;"�tB���W����pbِ�ĥ�|��@�Hhl�[v�>��2_�ߜ?t�]���⨴�P��)�-HNvcx�!�-L���*�'�)Ԧ��x����b�ؑ2/�@�9��s��ƙp� ��@X�C)�|��2�̔�b�UCX0�ςz��vr	�:Xq�i��8ll�<��|e�uh��zpuUu�Q ��,�!��!kt�';`@��A��g����tj|�����bؚ�?��(jDP����B�j-Y�w����p�_c)��T��;�%��<��_;�S�#E��SHC��-�C�S��$��*�#:��eӐ�S-|Cӯ�[~�f��1��s���i��X�I���Na�Uȅ�� b1襢������e<z?�܆#ɐI���OE�\Cf��R���_*`m�q?z�/�ʘx�UuXa/*"�<�UC�M�����u� ���ː�R��X=;��2)��	I}��I˽���<!*[x��2F-~Sq!T�%�6z��n����N���Ƅ \ �!NQ�3 L�i�)X�>WX�7�0�wT|F���V|�hYlUl��>}bA�a\�#>��e�����0jd�F6jd�F6jd�F�&��=~֓W>�N��>��V]���_�1yj���Ec�`[���K�����w�C跎���(a�.�cI���X��8eh���f7\��'�K�pP�"<�l
�Q�'�C���ڽOR:�U�5��s�H?�TZ� �b�]9�����7=�%""��iIU<=�G��Ҕ�i�,�g"�_e�bl����ad�Cb�����si�j~f����n��$u��N�� =��$��hEO��Ů�ر������i��"{R�'{�Nң�L��gRvTV��P������Sm �r(�I�pSW����wY�O�i�W���+���v�2�J��.Nqa
q}����.Th*�{�H��BξwM8�~�ړj\<�@hF�P�%���r�*9X���v�M����X��;^��<��i�.hZ�K�h���U}�(ҠԔf��JX4�5�2VU��`�6z�c%x>g:��Sgw.�����Ӿh��@`"R��E�[��~qҥ��C�}<��V��j+-�<��<�'�Xte���ҹ�疂v����v��&ݻ�և�bT��>^?�k��q4_�K?W��xYs��=H́��xo�#������r��(u�x
s��|���ɭ+�0��Q������u�� ��z���/��-Jt�x�����8�d�g���|�ںo�Nj�G��]�*o��.���f����^K����6� Q��<K��U%�RG��H]��n\4�t�
�3���8��l�Ŗ�$l�������U�h�z_�u����Y�ͯxf�	�5|��(ۚd���Hj=H~E�$��ktFbqk�5��(�\�rn�B�E�������B�W1�n�Q��<�'�x�۲g�RR�=Z|�Sw)uf=�.%���Yd�p�p��!�N��M��$^k/�<S����*� 
p;'� ��+8�ج�1;����cټ������VL�FaW�H39���{NW&��� �Y��6���M�n"�d�AF�CY[�2��]����w�~�R����av�����_�/��"�U+^��?	3�;������h~K�l�8�J���ϷݨI��7�,�F9�Aʩ챎Uh9X��q��:�H�+�5��}+�,e�(�,�ܾ�&��+*᧓G\�H�^)���຅GmS �["�wMq�0z)B�@�x�����slB�*������lz�c�x ?�� U�M�/ F$7��<.���v�[W���)!ac�KIE.%	�p�����0���|�W~u�>k@Y�%<~�X��he���]ߐ(�Bqm�U�_w,j��}wO�eS#�Ƣ�䚮����ը舕%�'^~b�ě3.-K�VQBN�*j���q��F�����$I�X� _!։ 	�虊K�=���Ǧ�H_(ߑ���%F��5{FS�$c%��KZ	�+xb9K��a	�*0��	dYM�!�������_eWlJ�󙁊�`�z8ui� ������]]k��*pRV7���Q"*��}�4̇Ɩ�1¤��?�ݧa^�	E�gٟQ�����������_Q����;�DUDV�N���&�Q@G��8s��P|R��8���x�8��]���:�|fW>}�%k	�1������Pm����AlQ��.ʺ�]me;�C�آ;���m����!����'�՗��H��Y��[�X&j�ٽ�48�m�1˦Xś>|�ς�B��,q�I �4K�i������e���Ļ9%�a����<���8�W�fSY�x�L<���h<����yM^*&�^t^P��
�q =-"#M�M�!�!�N�"^�j�ѐ�t�umVRkD]�9�>���.�|�g���RgAZ/��`
'4�_�#2M��a�`��5o>b�)�׉p{)Q	���#�7W-�ч�ǿdH��S�8|������U�`�*�1�\�,��*mO���s	��w3_!z�D��L���
��}�.�����R����e���$v;g�C�:��lE�m�˻�]��#d��S/��:���.p� �"B�������>CK����{)=�%ԙ�\�Mm������]����<�(���X�/օ�e��	*8���������2��"WA�y(�}�4?�{| ��.^��¯����&�FT=8��ϓ7g�=5�"�k�o4ٔ�9~:oT,~�'���ehf�_��"o5��    !��q�̞�j���bE�S����FI����ndn�E��tƇA̍"�x��1A��^~Eш��1v��0Rq<��Q�r�Ö��W�(�nr�2�6�sNx�	�����Cf8��m�|}$��8D��t=)��tJm<�
��ޣV�QE�>�p�8�����2o^�͝T߳šd�v�.�f�D��#Sf�:�0��`2,Ù��ÍQ-��6\���4t�r>�N���i}�8�QR��AzǦ����8��SU��6�8��/�T���a��e�)vR҉�T�vsQP��gr�7�"�)k�>�i����[d"��%����tz.'�Ky�7��w�غG������F.�;.���b�V�+,�i�'�
���]�B!�Q�y"�y����5E�[�fދz�f?!�0nY�y��n[�H&�C.����P9}<�tF12�U� �=*N�d�͖i/�Ђ�*	��5M�������RyA�PtEs*2��:��;5��-���	Z�4�<�Lk��҆��[��Z�֫�4:A9 %,��׬�:�JŲ�s)۰�ۃrn�`�9S'�h�VT8�7[�� I"n�#p�N+�J�-j`�ِ�WZ^f���K v)���F�yƌ�B�O�Qů�"�H�fr�eFbZ׻�׾A�� }�k�h�j��l����T%'��oR�I�����;��������;��g���BKv(�TK3F91ʉ\NL~�V!����rRm���x�QԨs�m_�K�X�E9W$N3��PM3MQB9mp�.L��DQ�M�v\j6��.��ݺ��ceTY8+��7�H, X����c��׹8C��+��x��ȇ���'^g����Ҙw�����'칓:�?�:eO[�EpV�!��������SƧo�^��ijM~�R�Q��ս�o]��3���̿.��٪���\`����0Sh�0����v�iV��t���Y��2wv�k��[2*��2�����}/M��!�ǽ�;l�ao��&���tB�.'�<�>���CGŭ���1�*:w5��B{�<l�.�:����s��czi ���(�"�B�:�vKvsl�6����@��_��$,F���Ymg��I�1�G%�%�@q��'@�"-IP��g��܊g�\m*�U-�|U;U͍�J�
�NP��w��ZH��#M����͂�a�n"���o��Y�ln_�H�sH�#s|���F����*w��6�%%�BH���rY�oi����a&ᰜϔ��Xl�nV��B&M��4i���N�,�;g<�S���qd~������9�͛k�s��7��~g�����;��J�����z�1�A` ��`*��Q���,�[y�ͮ�e�B�K�J"S+E`"I�.	�4D��H�G�9ҙ>V��V�?���Q�>����dUb֎8P5oK� �#oS��y�����?>I��ʰR%���,����¼�1i�<S�JS�*HΑ�&�[���Xc��^�}�US&��W��*(M��h�(���2�wx��ԂS���i�1�\}����u0��;*�ۢ,.�P�'54B��X��t�?bW����,�-��-k��hЩ��0�)��j��8|a/��P��?�k6����x�Wz6����)�A�b��R��{	0-!B�,f�!&؟"�ϲ�M�qPxk?Ɂ/�>ޓr]�O���3��e�2�d/��%�E��3h`y;�}]"	��
1sZ���h���b��Xj>�+����zxe{AW���yO� `�F֜b�Pb�=�<E,�,R�*��Ӈy<Ņo[��:���2Uoy7N��<X .WK��\�:t[�n��8���8����q8yUy��m��ӧ�|���_�}���_���NI�
�P���6��"Mi�Q�7Ė /�RG���8B���M�y;��<N�Z����=�6Lv�Y[��V��Y����Z��t	���݂�Xk{�(N�Z�,-�{+��b��p���+i<�1Ͻ��%ˬ�帟�������S|�im��:z�����@�},#�"��k�➅G�Ĝ�N6k}=�.��>�M�|��Ĵ�7�ʞ8q���|�U�S�D���\ 7i��%���"!����݌OI�4�1GKsuf??�Z���>$�����DD�����1�]u��i}Hݦ	�{V,M�-%>T���8���17�G�Z˺�`���,�������!�@�N�<�U��|�!�%�4�3+^��{C1�hG\��;6�r~��ξ�%z��_�'����s�z[���|��W���H}����H�١4M�{R��C��Cl�7K_mrɕ�C��ڇ �r�(���fH��!��&��)FY��YA11ⴒI�.A1���6�A3=!i���=DlɅG$�_�;UT?�K�i*�b��zׅ/ZjCN\�c�L��wt�0��B�w�_�:��$��wt�k�}x�ԣɧ��Á�,���X)屘���v<n��v<ne���j=�'��2z�ԝ��6���盠�?�s�JO?9�F�Y�~�b��'-1Cv�^ ��X���BY��Jʢ�~a�󴺛��0����c�s���Zi��ZK�n���O�� ������� �V�=�P���_)Q8*ԙ��X�@~_)�;�z����v�;AZ4�ز�-��H�����Oa���SAU�`'�NCA-jrݗD��(�K8�����!�:�w���YK�`*���rS.)�j@.���G\������y���!1O*�7����h\c@�T���Z,r���_�DF)��K�����r�r[n)QL���WRJ"D���=�Z`UT�����[8!�4�!��蛌u����ZB��w {���4_BS� �RW�����l��-�)����2�V2 Ͼ{���I��i0ʸQƍ2��ȸ�k�𷨼}>H��˰%�D%V�n?�(ˈ��f�@4��C��uf���Xu�ai?B5��軈S|��h�\B7fF"Ul6J#�9p7�xq����ލOf�?��*)K\��5�I*<_hj�-.��Ġw�BS�8l�ʷ44A�O �GEg���sm� ���˅�;���6���m_�%	��M}��N`{����%y���o d�O�K�	��cG9ejEר�X����_��F̈�Z���6Ns)�V<Y#ΑVE����k ��:�(�T���F�R`u���Z�zU��G�3h�/R�L��!�"}�"�)�F�<�܈\�j�nu�#Bx�2�^�m����~":Kdl[[�\n��̠�v�G<���*a���/�m��X#|���?�T��-(���`�F�㌎9�J��B'*Yt��F%��`��hxv�QI9�v�,�ޏ]���a�H1QF�rzR�#O�x�Q����B^���t�`\��Vf>�c�2�0�X�������(�x���� ��'��^�&1������+�Cb<$�Cb<$^ᐘ��(��'w//�}��٣�\<�����>}���������.�~˨/I��$��y4w����|o���-��_H)��^|�xu�4Kk��/�	���/5��M�N;�7Ч�b։V��W�7�0�B�hz.*�AL^S�52nU ��Z$����Q�
ɷw"p� g��kXsN})�t9�p�0\K$}91�J�<Y<��"�#�~!�(��H�G��;pu�P��5����{�bc���M-a���_kS������+w�5�, �)���ٿڈnD��I���S��%ß>������e[�?H"����4*��V3�K���+��η��p,����:)>��T4JL+���!�on��L�<v���iq�r�G���1���	�B�����MG�O��-���.:E�Q�b��(v&o��Hz��w����g�8�Db�h�g��J.0HW�E�-�sn��!B�A�Q�Ea &	����C<���);;��g̼�X��<�_����ViSE�~y}�0sL��Z���$R���C$C���ru<0Ї����MǓy?��'6���aqM�	.�NM�wfW	�    �-�YW��#u��HS�rP�����M�a.�mH��~�����ø����܊�6N�B�O|JQʠ��u�3�¬�:��Vf�^s�� j-��+��J�r���Z�Pp��K��@W�X2&�:�`*B�n�V5�WB|�*��R�O����0�{������%�9�f�PlFCk�$5�ZW+}�k��ĩ,��A��W�-_�;4�NA�2���PT˲���EM�ϔ���/���]N� ��C��Nb�>$�d�߰}hS[��]�~���/Ŀ�8�1�h{�DJ��E��:I��������D�U�J�A�'�ن-|Y�x�%BX-�Ϯ.��P� ��g�>Nd�5�|��P]���i�n��-�_b�C"��*�ѫ�X�8�;��y�w+h�Eȡm��,4��^q����~�!��R���6�w���}m)��p� ���n5&'���'lRZ
YфI�kx������|�VE� ��[��^Μ�ؽ��x̑�0v�ʀ�"���¦��C�5�Z�r�=Z#�4 7ˀӱ��e��4��Lω%�� d!��S�|��Z,l(Y��A+)�]�N����	'ӌ#�ۼX��m���=��`���$��x��
��b~m���*��*ns�"]:N��dݲ�2c��H��eQL��dd�8G@�_����T�Uc�������K�4���F�,�������
@<l��B KŦ|�f�Q��C�%v�"��D��$Äw�~�s��\k��r���eP����əG�f�mF�f�mF�淪ۜ;ΞE�n����./���G�=���y�?��@@Q�p{��2�؈_��Ur2��_"J@~�΁��pvӗ �Q�7�{!�eE���\/�����5	��(���9T���H�M!�'p-q|G�,t<.:�К$�ݾ��i��
���R�� ��-a����^�g�gy[��P�9�<���F�����"5B��#-k��[�ߒ�!3Ч�	�Z��,��(������985x�"�%��>j����g��_�ͦ~Fs��܋O5��E�?��,WɆ�|,(�����ኔ6h��>;�(0�5���/qv�ɏ����W�q�ɝ���c��?L�=��I�M��ȫ%���G�\!����Ѳ��`5���w�*��,��uM�I��IH��Nkt�?9���{U��-D��M]��V7-7i�֩��*U��d
�/�)Nv��s��q���co����ߝb�U�(#P؁�+(yV5_����y�Vf�sOl��i�ZyԢ��`�/�V��oSр�n�zU���(3���%_%  �j�Nr��t����T�+��8�I��@Y06���+f�92H���>��,�47����e�a xr�
2���� ;]y�e��u~+[g����<z��H�D�)�>�wQY�.�|�3�<J0�$G���1,�~�QW���p�������w���CÈ�ry�	�?�����,aS�+b�#�j$�"�����􀊡է�R���ť���l�9,f��TT(l2Z�����74v�K0u]Z��uwՐ�lM����H�ӈᛒ�#�#[b~�n��g���<k
k�qg�x.�R<���u�v�\B~ZK0�1�u~A�k.I�t�gb����"�x�Av5i��[�t�1�,`�8(j�h,��ja%�Z�(D�m�>�R'��R{Y^�5���H#�T42</�*�>b���C�ů�����W��}�Y[���
�J�`�Nm���(k����?�(U�|�ht��R�YB"�?�M�Sn�����G�p�"�7nB
.�u#ǂ�����jN"��D�YH.$��[\�~̣���ԥ��a�mMA�Z��[�z���Zʉ3"N�Wj�	P*H�܈��F�[Z-���i�'��لM��3��lĤ����#%/�`0��)J�/apD�!G����iuo�hrW�ĤM���L��h�A�UA�)Yl�/á� .�`Պ�6Z��T� �OM�h�|�nTd��K7M���%���i\��i>��K!�uYKu�(�-�2䵙eϷ5��K��a6%��B�c�z�s
�QG�J��!����Ė��	��tH��z{�});h� H!)I�_
��2.��e\a�e���02h�Y�Xl�{trnn�����D��Q�؏�����%ǵ6s��0��_�P�j�@U�<�{X���8��!�X,hevu�y��g'�:T��Ɖ:�a���-A2΃Q]"ҝ�#oD��j1�<��뺼n5�T�SA��<k�	[1h��]��������Cen��ͣ3Q+��L���Fz��d�WaI2JC�uG
�k ���1`��J�3N�M�1|�o�W�F���k����">5�.U�p+��qQ��2�o|�a�ߞC�˔l��/��7p�:>�c�̜�� 1h���
C���X$	����u��Q0� ���A$�吪 ��KK(���W�1�4%��l���aH7R*n�X�|�x�ZF��eTC�L��m*���̪x9�*���r�j�!� rT�s�˲��A?8@�I�VZ))E�n�d�s�X��R�x���K� �C(�
��H�2��Z�d�f�Z{YG0�B�����a��'ӊaz��pW�m��.t�o��$ű��J���*�E���@�����í��A���Uu���lC�#	󄘧
������z���/������j0D]T��*9G��y���d���\(U���J��cb�H#y��P�Yw��r�v�^�����*�V��J�+���[�P]�b��i�7���%r�(��`�J� ���LKѐ���טy2]���!	�@��6?a�(���G&ʁ�ڇ���kl*\�z �tb���Y	ЙR�E��GTU+���-C܈P��.��D+.��ؕzK)�Y��{�U�H�*�}D�8��x.�Y~PA�Z����p嫟��$�#t�b��u��a�i�Kmy|���F�]��=6���U0Z����,{*("{}�XQ.Bh������+��@[���p5-)�b�T)7q�`Xڎƨ�xR�<R�Z���J�������SK�n�}��^��M>Y�1�������ާa�\���2X�X���ɯ
E��d�.벤;C�q��ڢz�޲p�z�R/W�P
�H�BK�}�tRah�r�����L�Ҹ+�x�
%-���r�X��-�����ʜa�eֆR���Bs��\|�S��B{����#N�\w Ԝ��W`�1s(M&��|1�`Oao�6˘v�ҎV��J;ZiG+�h�����v�ҎV��J;ZiG+�h�������Ҟ���&��z�amN��~�$}ӑ�.�xo��2h��G�����'���d����,�@��+]FRQbaɹ�+�ۛJ���/DW��my!�$;ڪ�h7<d���m����5�=�{3�=������]L-Y����Zy�]��n�ի��gR�^6Rch_��7���ע�������]�٠R
��~+W��+�|ѱ�L::�0�V��!�ِ��ؠ�
�\�$@�I����#�t�b0|��U�]����+�&���Td�������< �7:ĭ�zĬ��X6�L�'�C�g�+��:�)��R���"��3:-�0B4I ��>�㲣rR�5�j}L~�ʯ����ja*������!�W�H��/�D+��NTq^.��x%4�eu� O���lq ��%.X�+������Y�j�(��`鞖�X^{c�%��<`��;	��C�$W�V�����7c�\�p:?dn���EB����AX&a��`��r&��i��d���3?Ͳ��@�|ŶaF)��\��ta<�
�}��u06Q_}S667.�f��Dڪn���I�v���G*<&o�A�B�:�ŗ��`|����.���0�<B�)s�{�@^����`��h(�K�AKi8���]�u������^���󚑛͌��3܌�ܗ�������#M���e�4w3tfe�o��V5�S?]�S�*�MN�h'T��;�h2�(�*������\�=6+q�"'�F���LLӄU��9< �   �ϊ�� "� �%�+�=�Qz����us�q���L�Ù��=0r�;��וO;��X����A5�T ��ͩ��/ +�U�C��m��<*!��YS
����'�6�+��ֹ�?�}��D|�i�3_�MkI0UZF�Uw�TG8�|ڈ�0F)�[q����Tg*� u��yꇕ��4xb����E�̺�L�H�iM���n��;��ΐ����
��\K��L;��G��-���O�CU�PK�My7�j"�[�d;��!yÈ�tQ���V�2�Z�%�����0kcVkĵ��������4��	&�u��>H�w�� ��'������:{����g�.����8��4�#�~��轁<�0�'C����$1�8���v�9-���h��h}A/�C�b�Q�Y�-Wvᵬ���p��)����Pt��܎v���؊��M�-�U� N5�K�4.Nmqc��61�U��_��KPP��0L�$���W�n/1Ng�B�?b�+�� Y`�S%��H$�8��m4�jI����Ĥl
�o�_"�J�n ��a�m�w������D��K&������!Y��s�}.$e�@jf9��
"%A�\�=ܤ���EWO$��o<��o<��'��.�<�}MA���@�����Ns\x�n+a��՝��<��*�0�3z�^?�� �^2��a<Ӏ����A�҅��WQ�m��?�i�=7�E��
 ��ԩ��(H�i{ĞZ9�+o�}/$}�^�㡿"���k^���
�nr���7��'ǟ���&��s*��ɠ�rK�A�Y�9��ӄ�.�A�1�B�G��d�`Z���>����Aaҵ�1u���
@�S¾io�Ü�F���lhfX�.V��ء�����Z��&��-�?�u�r����8[.� ����P..w���[�Ĉ>*��<R�uI/�����9�CP���m7_���%О��$�����{Mn�GE��Ki��0M�ܣ[E��$	V��)΢���Ak�M�bT�E�ܮ�0�o{����3�e��'P�XD&R9)�����ٸ�ۮ�J���]��j���-d�W9I�,:R�
VʅL8��P��H�<mEsp_4\���)��'�����/L��KF���Bܩ�����;���9�]p�G�7u��W���WSAg>pLo����J��/���!��]LG�?�_���:��Gx�D��Vnt���uyQ���j�~�^�W9�;\����iL�{(�"MJx�$
2YO�#Ds�e�����:�>S(8|d�<3?�y�� ޲{�K��×������v2��F�v8O�vj��k�NP��(l�r��;U�2�����Q��\a���i����'s�@�H�G������-9 zr�l���e%�(�G	��J��;�9�P��Թ|F����\<�����>}�������羲�0��褅9B�z�X�Y�{(%y�v��p<���U���5d����Q��]�$Tqas��]s�$��L���/%9˾#>�G�;��ՇR+���gŊ��bu�4W48�0ZR�ͺq��� �$X}�^���<A���g������-��'{��.;��l�n��Ѯ��p�ѩUD̪��W�I�=P�GG˼����s���a�W�%�|[��ֆ^b�՚�	QBgYU���r)H^Ӳ�|H�%=Q�_�s��C�>��C��\������Ws?ݱ�\SPj۱��
OL�Y���faZ{m'	QZ�e�ӝ�R�M� �r_eѱs�;�B��	ch6#�+��-�;$��Խ���|1�.ɹ�&�,N��Ľ����DY:,`b�_u���`��'���]-y�ۢ�(��Eտ8B�U��q5or���&rX�n�-����H�1k+^\� ड़}�j��O(N��d<�@�Av��S1\��bE��<&��X �pGO����U� Zsx���
��'���U�ߎ��D���ٞ�B�����[Uz��K�W�:D����K�h@>��Y�L�
�C���~�A/�,��^D������4f1�I�Q4vt�Um�����T�u^4�A����K�j���-���t?s,�ֻ����F��Ɠ�WtҟBnk[�����iL�y��<�gX�CTK�WP;�y�P�7a�Q��Q��Q����s
�u���z��ŗ�c>�|���u6�K��MaN&U�fj�{Y*�UZ��g��ɋ�SH�p/$2�hL� p�����6�O�������[��!���L��8t6y�Ƚ��"9FH|@ӵl�4CU9�[ˈ]�)Ai�E�q`(�$61��O[uؠ�a�ㄥX;G"�,��B� m�!"��9�. _e�g�K�Ŕ��0���P�) ���g��[���x/,liG����b�A;��m��[tz"ieDf���$���)�g"�\f��=�ϩ}��>Z��9����#��,�d���uaaFR̗�Jv+V��
ҽ��i��
9t�hQ������ �'�:] Q$N����uBY�i1�(��P��S�>�O}��|^̂����(�%�M��+�"RK�v�}�499S�W)
%&*�}]S,�&|:=�8�Z�.k�?���7�C���XYC���s��mz�M�>g���e��婃��8 �5�S-h�z���!/1̜��7�e�+�%���TQɑ)�&�r��M�'�w8`�}�͟����z�����k<��4�!7e�Ƚ$��k�)E�:�7u�f[���x	4��a�L8�!�����1)�6K-�U��Y/�����x���x��_��:y�'�m�y���?��`+%��ܹi���U��H��Z ���I��A�%�I�����P��oK�젴}������ġ�>�YE�+�č �[ݍ�=$!R���
A�����i�w��x Ͽ�[z1�2A��_��t� �D�/'�>�W$}�)�,��DY�S_���s����EU薋�l��\/�~ �P���3	�28r����e	�t��S�hQ�����n��N�X�O_QĆ�Xƭ�B������r�v��oym��<0��C�?�2&���lk,$C�g�VtOqQ�E�ţ՞���KM���f[���l�(��TB�$)���C٦SxW����>��t�T_Mw�FqM���jՔN�$;D�;���|���u�� e�$y���^���3�g��q(���M��9ɰ�x����I�7yK[迯��_���k�_��_�?�E�1      3   j   x�U��	�0��s:����v	'�EĞA�?bԤ���!A�c��m?a
�g�V��^P�|/Nħ^�nC(x]^(܃��d=��+�Q��Ob�',�����y0��8�E�      .   �  x�=VI%)\�?L?E�K��CUo"M�����v0?w/��E��O��_`�<��;�������ѣ���Pq�(�r�������҄��7��`����ŋ��N5�_;���vOs<-���H��8���$� ���~�[��E:�4�D�!�L�'z����ĳK�b7�\��4P�bd@�.A�s$��|�~;��Y"]�JD�1�`P�L�uJ�oy���!��e��l�v;�-"���V��8�MJ硆� mN��?6"�HX��L�L)K&�R�P	�|� K� �XTԳ�� ��q�����j'����	[��	��B�"M�%\&�|їD%��s�q� �����L�*]��We��Pq�>�m�	�|y%�+P�R@\���3,; B�o.>^��~����K8�H��$�������������������.����3	���C�(-!�'�D���m�JK�8�ԥ<5������P)׵|����%��O'�j ͒��RYr�c�Cc!&1�H�m�9�,��J`I�"��iٗ3�J��(,R-�Lt�/hs����^$�����i��M:gH׺����Ñ[+�B�>"�d$��m[3��#}u�-<�V�$���H<�D�t�F����&}$D�66B-�8'�1�����D�˩T I��#���y"TA��J	IM�>�iHw�tW,u�r�)�l�ـ�S�nDB�,��r[�L�M|gPBU��R�g�0�	o�s����x�t<t��B��w�Œ'&fx���s)�K��wG�ql�-*ҕCQn-��$d�?��D�I��)�����;t��&E����dغ`�Ǻ�v<;T�$$���ϗ��W 	}
$@Ā��PR��l_�}���7�6j�BV8�P᝜"�(�Sz����giY�&�!G��� ��w�
%>"���M�K��.LW��[����|���v�h5.	i���;=�Yx:��'ְ��[�[��r��G��k�Bz>옹&q�q'�*�pC�sP�xW�q�oMʃJ��J{M���S����T�X"����n����_�s5>J�Dږ8!2��!:>eS�"������I?��ϯA��H��|~�͟wqkC>\ ��g�<�KTE�/��#��V���$����G(�����Gn�����������      /     x�5��� D��br	zI�ud�h�3 �`�3�;�1XEW����
6��	�(V��<�g���7a@#�AWC���x�iM56"�Q�O��5�-��N��w�w��=�E�)��N	�Қ�k��h���s8�a�m�g���X`M��{5�w�-����~}��ikY��^Kb�X�d�B=��O�:ئ�SGO=u��)�	����pZRǒ�&�Y���� ��ے��9ֲ�h�'O,��� F�=(d�|V�j<e��!�X�g�u�	���l���q@>��g���\��?-��E�Z������cRl�'ay�Cï�s{��w{��T Z:=&���V��h��g��YnϽy�Kz���ԚD+��G�&���L L-Z�hyd+�H��@��)��K�d�|�X�m	�Oe*{��W
K��[.����7�ڢ��R�:`(_
�%�(��c�nJ�������ZJ����(q@��۳Gz�
��V��]�6���<��G�(h���q���Q#�4ϻ����
�5=kb�<�d�{���Ю�lb��a�/Wծ�����e	g�>��bc)�<���4)��|=�p��87�}�p���]T��^p�ښ{�8V��
�Q���G*3P�̖�h�Uf�r���I��S	/�$��o|O5N�G�B�B�p.��/��l��
dt�A��Z�F'X�Ѹ�阔Z��]Q �>�l#�����pU�m��>]wE��'bJz�"V�P���$��	�y�L8�&���Z�^a���^�>7�Q�eN���j}D�.?*����W��9���3{:�D��n+A�t�Q�t�.Խ,l�
���A�q{Z#�~��6�+�C�<��3}�0Ѹ�g�\�z�])�>[�dtt�<���v�P��Y�;L�"U�}|�@X��z���!�FN�O:��%�&���������������	�}sp0!�t��q�D�Q3	MP*҄�4!�O�rN��@`�-��rE�����kL��dم�c
����ɶJ^��BO_�t���p�pUe�s
��xk�cP墺@���5*�ʏ���I��C�H�~JU?� ���1�v(����T��Ih9�Hu�vk�2�X�n��"٪l�r���M���m:�Y�(*{��ri/���=}z���爐�C�+�x�*�^�@e�0�~���`���E�������*�=���10@}�t�=mi�(W�.PF?���J�ӱJo�&�6A$Tv��!�{�K�I�����A��C�tn��'�]}��kR�]*�5������� ��      0      x��}i��F��g̯���F�\]���,۽c�n���Ά$�M�A������|�*�P�ՇZ2#�P�@YYYYy<��q�kU��U��e]���iڴ�ԕms/m��h��Y�i[�eU~6��I�WeV�/ty�x}���]���M�w8�_ڸ:wMZ�ҙ�ڮ�S#c�Nݹ+���Ҭ�����Y��<k�=W�m��%u>�jz!o��]�V�n�f��M�0�EE}Sˮm1npݴn��%��մ�t��+t ٬u5EoNܔ��4���3��(��X&]��n�l�Vu�H��{M����EV�1�A:�iL�x�mur4Wƴi��:-��6��A�k1�ƕ���v�^�ڦ�Fo����5>J[7���������IWt�}]ٸk��+W�t�4V�*o�oŁ���]��%��aO_������?�~�����'D�f�/Z�t�5��iR�M>%���h2E��P'�KM��1�̳zQ��K�
��_��-����[.+��:����u�z��sb��ěYKm�WŹ���^f5��R^�d�nޢE��z�9Q3,T4Wy�ϥa�G:��Ղv� ���ْ��A���{���`6��-�6YQ�l�&Vv4@�t�V�=E4��3�u�5����<�t]f�|"�!f�az닚��F�v�h���Qhb7�ҿ&s���#a��;�l�����ˁ�n��>��h��X>��>�hMˮ�Z�֝�`0����T�5ͧ"���S,���z�X��#/���N� &>W�����^zvr��U銾�3�ɕ�y]��� �Q����>��K�Y�����әG�ԣ0��F�M�-�"?w�z����v�]/�	����=�"��#���s�v�R���{3��b
ai�y�[>J�E��Ns	������kZ�t�G���UQ��G��v�5[�fY�Vm�ښv8�w3�$'Qv�D�`Bͨ�S]+S]�^o��U� {�<�VK�r ��8#�P}vIf�9f�����џ8[@��'Ds����ɼ�3�R�!�^��}%�Ȉ�8hH������`Z�:?������e����T�$��8>�W�2�<+�::�4�0������S�i݉ű`tX
ڽ'�I��]%���_:އV�'??9y��ѳ�ߎ^����럏�����={����勿=�"�gՑ*U��a�"[�2 �Z�>P,��u��C"!]��I��\��-�$yQv97��F��
S*�Z(�6/�6oyD\���<�s��֤�H���f^�:��(� AR�I�*�S�����y�ߦ2u����7Lo�jiO.����*��ڵǜq��fX�X4�怔֟�2���5�c|�|)�Pl5zO��۠]S��<'i�ؚJ�B��	j6���I(��09����?��]4,���}ܕtiZ���;^�҅�T&6���j!s����$�s������'���E<&��B:�,����[Y�,�;}�g�������z���9�O`�n��I�����v죯����޾�Z�����4�.�v��6�a�.�A
�rR-�4P#L$,A�Ȥ���nB��4�b��X	�}h�=�].f������c7�L^�T��j��B"�U)���a;���`���v�vo&6�A�A���.����nٳyy��Y�F���0Č����i,�b�6����;���Ǭ��5:�.�>Q���� �)�������&ib.�)N�tM�J�ߤ��k18�~��
[�a��	�Y�n&�jpW�HH�=S꼭j�'����,4�9�v9l��p��@΂i�|C�T����*O�YEb͈K`��.��=S�f&S®^��@�IЄw��5��`K��ݝ�S�c��\G��� ��Zx����m�u�y���!���E^NGO�X�|�v�.�:�����+���?5%�����c�f�K��d?���*7�t��;˷7#�����7�_|�m���`�Q�=��ޝ�~yU�����!�c����j`��_�/��a���RO�@�qVd���F͋6����*h��G�^�6��l�U�����^�O.#��YN�%��iN<��۬#�i���|HB�g*CvO����|Û'պj3R��y5�n�wZ4�hi�bI�3�Ԓ������g�Kْd)��,�c�W)���2���g��(-�S��x���!�������ר�j�x?*�_/����T���������Y�����N�/˳�̛� =�D�+�>�]Ӻec3�G�2Gڸ%m
>X����K?��/�	!+Iݟ������{�-N�������/H�0��������������8����_��y�'�;��No'82%�k"H�)e�����	.��$�%�MrU��"������iV㪬BfVE�⛽?����r+�v>0Dt���W9i�<]�������ΧY��3�5)[�ò�CkRM�Ƒ|������� </W�sJ�{���3zM�SVE~`�9	5�KN%�oٍ�|��d� �Ѯ	�퓲�I	&�� �0X�)��ɶʶ:375=�!Nd��C:?qL�㖩^��f�t�V��k8t���i�1`u{Z��4���j![M�����+�{g����T���
��`����V�/2H.�{��$d���R��.���{�-�|�dY�Pˢ��%nʯf w��/�S�j�O�x�H+Xf�/�Smz*��îx�]�F��RE|��$o�䞲4��l2��xf�7��w��|�t9�B�����y��ӛ�g��q@ͫ]ܻ��������%@�ϠG{u�m��A��E���p���
%��#����wĿQ���[�lˎ��"g6�guΌ�����K7��*�#3��f�q�z��U}e��B��=,�#�a(�Buo�AC��Gd6�ۘZ?�d�;{o���{��jG��5�['�mrJ?��2����_'���tȚ��C�����.8
HV�Y���u����=)��Xe���1zu�N���oa�U��=�kh�k��m�M�����������ǋ�(*���s�7G?�������5���9L���S%�-�v�R�S�R2zhX$?c��LQ�7�Oan�3��J��Ǐ��p#�X�̍:[����Z��HF�[`�pV�8��*�2�q\b>g=��|wUD�؛�i�a�c�پ����g�сWN�as*�t�'�S�L̬��+ϳ�$~���a�^�I����u�h�ĝ����/��ɞmr�%�m����]��}_������� ���OI��&������t�=Xv�a�Q̃C�{���<e=�;b彚6�#]a�*�-�N,�^�BC��a�-�ege�B2M��"���("k�>a�%��{��8�pbk#�5��M&�6�.�Q:+����_�s�m�M��]|
�p3�9K�kz����d�l�*�f��96#D�%��;c�g)6�ﳗ����b�A�>	]yJcub2?b���B�o�ԇnA�<�����X�R�g6�������|�wj�_s�4��&P�g��]�9�DEA =��x���K �]z�L�Q�6�h$�w_	9�;�y��x�hW��w�ĕ�s8���+�;m�����D���OUu��Gӵ�B���4�rR�D��F�pw
����,W�D��F[�J]�9����#� �~�9NV��sz��T��� O+Q��f%IR��,��V���؝ܲG��6���{��wI����ޝ6r����np3N�ǌ��=�Y�4ޔ/��_(�3����_�B�(!�L/`g����/�}��^�m�Q��v�ݳ_^�:����O��:9�ۃ��'�$O�z����_��{�Q���Oc��X�]	� �N�q�HC�i?�P�µ���]^�!�߰�:&���iy��ޕ�Ʉ�#T��~��Y$X�R�`M��Ơ2�e��ߤw��������ςm���7G�7r��26�����AdX�'��tk�t�>)����>n�	�?;>~����߾����(]��� ��cC���X����g��C��$��i�Cc#�ǅ���#�O��g���{"X�d�5�O���\Mw��l �١�!�.�6?�1�Ԇ    N�w:��,�M�mtM���Ǚ儎�_��E��Sժ�^k��2�X8�`�Fсx��)�\�����/�?�k��8-v `��4���*�v5�
�V�9x1{�XxK�o^�>������U�.&Ѩ��'��5�a��A�M�
�o���f������V@�Ѿ�������@�N^��+�d1�^�f$;l��&�M~'ϧ6�s�|�����14���ݼ�x�/$.���(B�w��8�S�%����h��E1�
�ӂO��t@��
��1� Iw�'����AO�)G�41�:�l,+��#~S^�e��$�Z�;�u2@~圻}3�e)���F�	�ף�Q�]��XęT�yѹ�v�y�(�uxΝ%-�ӟH������^=��	��<x�Xs��arbc�Kd�J�0�Ek絢zԐq��?F��e�"���@�e�tlԩ��0R���l�4_H�]��!~��\Y��t+\E�T6�����U�<�H
��M�`>6I�"݃U�;%��ƖY����"��k�����������*��k���AE޶t�0��%Ӈ,���N��0Y�>���K����Kcc�\�@I�JL�:!�� �#��sx�խJ�H}���0�q�sS켤������Y6@V�x}�~H"p��z �7
r�N�t2Wl����<�W��\�����%m;�'[͟���a[���Z��B=��5aH�)<7^��rmk�[�#�q� �X56��9�ϒ���ӿ�c��P�:-�U��yUL]=���h��=��-]#�.�M�(jX���?H�����y�e�D��S��Wɷ������n���<JlaZa����%�(U@���*�+��v�F���j����
"��!�DhZd�ͺ,ݲ{��7U �J ǆ���DS�h���p��E���Ԟ����Y��U��������]�A�g%�6mn�%=�͢���d��w���*_n���m��Z����Bl���6�4l	��>�	�y<ɖ,+�8�g�����6%-*�J0A���8�k���Z���x`ق&�\2��42Lnx؃�	yǎN,j��.oc[$��vt�Q�RNb����8j���~�����gǰ�~�2|_:�A�+2lĎ3�>�ty�A�%�vF�@��7��Sh:��k4ā/�3}~d�����_>�>� ��l����#mF~I_�}�������I�w�I�u�K3�i���XE�
���B�8�R����S���v��*6|K��a}��B���cJo|�iԠ���I������]xI�
�8�	*�C��mB�wq	n��9tk���$l�S;�}S�Ns�k2�i�[I+�b�~d��"���4z-��n7"��J��$�x��vnQp�Lt-]0�v�ې�v���J�L#2�l#��H�^�,}seD͗�p����@�=#�(�}u�j�k��&��E�C�>�Wm�g�h�>[�8'-��
*�)�����^�]>|�ѡL�%�J�|��Tw��zִ����ͤZ��I��)� ��Y��R�=��gΊ����';�i>�Y�Ď-gh2_d�6�b�.���B��������Q<�C
���Pj��0ɫ6-����S�x�c��~�U|u^���?�V�P;��c���%����|k�l���Bǁt�'��)��d`&[|���Ɍ9��ul�~��\�A�N9�V�6,DҀ��H��3�i5fPYQ�c[�Bw-F2�5Lob�i�*��
��'�n�*�Z�F��#�){c���nf�g���/�؇��tY ��FI1���d�6�s&�c��B�T�BFBO[��9�e�	{�8�n����Kq�I�l#�;�n��~m��8l�E�+.�,�^�D�������|p]y��?�jk���|��72jv
3B�ٕ��K����rl�#��)�w�s/�`�7*旛�mu��݈[����~!к�%:ޜ��.lp:�g�Fs�x[3K�D��?N��h�Bw��z�� �5�/)��&mo��P�k���>L�M8l>���44�|,���*��#z7�8->�dM2>.��8q\��}��*]�?|*#A���6}{�ޏ)f�{�,��/!w�!�%��2ݪg����50q\��Q9�a��l�f�+-~�4ė��d>��x�"��Z���+�Ǆ���G�#i���7�lBis#E;��쏄4�e%�_���z��� ��fW\C�p�M���������_^������E�H�s� .���]�KU�S(;�9�A5�P���K���O���"���˔"L^8���� �@����%ZΠ��h{�Ipf���ʱ���΁4Ɉ]9�h��f���>���(�O'��DJ�\��3W�VCj��"���jÀ��߿e���WG�C�L��~A�k���1u�k�����HQF5JJ�6���"�D(�(ÊD^Nb���|�=�b$s�	��a��tZ%"��s����[�Vf�N��;�%r&h� iݬ�����S,�M`._�^)�z�^s���Qt�pK<��ڪi����i9�(�@<�vܙk��*�;����~�dg��a��㭜C_��w�7�#.��u�ȇ��Qn�;tΒ��cU���*����o��2�3�?�Jq���hZ-��	�S���tVd�۷�p� ��C�E�E$�0um��︅4�!���m�V";�YF��
��� :ʁ"M�감.��N�� �e�;��	�|���	/��0"��#�]�l��V&"���4b����ns̒�]�x��Eb!�tH���P.�
J�06(�TL#�j��a����ߨ�Vv����È��*��Ō��y���=���ZV&�I�������jFj=�u�G?Ӵ�sp1LN$�$J���Hx	ϫ%�*:U-(*-�h}es�+��D������$>Hv�4��-Q���ՙ�
����#����D/I�Yr��>{����/_`�;~v����<�"ap|M��dOR}i������D85�tp�A���7�7`�܋fز�V�5�Z4*�Ma4b�a�ޣ��7~��:l�)��Y6�c�����"\a�f�%���G�ڄXWj��-��ta?���o!3M҇��v"Y�G	�q������ҫ�F�X�6L�u<ʾ�_� ��ՃC-��:��8�e�Iq�.1��R#���¸B''јPʎD��E��6�$�w��x�"���08ϑW��ԜM��ђ��(TՀ�Y~����G�5�A��͇��Ok�5
1�g���5�����-��OE�ϴ�8���<����#��M֌z�����Z���:�u(*�#�]��xͧpLݏ��7�~mr-�߱k>�|��&�o[Q%���y����:C��jUJ�ry�������{�ꮔ`tN|��^�E�o���8%�V�m�N��R���%�/�l�3^���:��`������"�x��I�XP�q���M���|h�2	��7n�)��bY�aa�9���;j��k��ǰag�d���*���Ea�/O��HDb8q�^
�h���:��'�F�5��΅<|3���>�BZ�K��qq4��~ר�ǝ���^��A��ʇ�Wk!�.���ۈ�^oK��]�cU�T׮`g���q��j���8y���N�=���˟^��O�K�r-C�
���$ij+��k��4Öv���b����9ݘ%ē_���CW*<���y�����ҍ���2ܷO����9T��~����
�=ٲ��,
�U jTGkW�UQst6]������K�"ң�;Nt�w�c M��=��4Ŀ�]6�^�{�,yf:��_)����T�ydY�mrF��1}�c�J�1_�e�pߢqL�=��m�2�,���\D�6eԡF�����*��]�	:����d�'?�O�?x��K�R�ӼiŲ���Ǡ �b
5P�) R�(I@�����BD;��	���߸�(�ɧ�/Rk�dC�h�G�R$���
!�    ���}F�� D�єM��[���-|�qǻ�l���x����!p�$>��;�CH�m�Kۧ?�8~$ZC5,+�mb� �pT_w����jE}A��S��Bb��Y���ͣ���nIuO��cUO��w�5��M�a蛺�W��F�1�u@"�R2�#`l��D#�,q�>�뀛�Tg�.Exp�v�3���n���������Փ���΁�|�08�C�Ao����r�|`g���6M�ʻ���h�e�������Z��i�����O� ���H�HV�x�Mnn�.Q_'O���_6������8�k�آ���\�K�+�8�k\��aŗ�(wX'$7�K$��L9� ��!�fJ�J�\_+����Z���aaD|D1�3����9�9�1�T��X�2��W�ɼ��RvW��m�ّ�㌁��4E���S!��1�,��o�'`�@tj[��k���@1��56w�J�xl�]Q�Wf5��j�s4�	ui��ʜe���Azr�:�r��`�kK=`>�P��*�[h�D��,�S���KëP!�ت|U=��	���Ԉ)��ݹcP*��kO\�`�:�_4f��KZ��^T9g� ��/���m��E1r5U��5�Ƥ�D?��Lm�����v��f}��\�$�^����9�Ř�S	��
\�)A��2y�`�+<_��B ������{w�xK]��*	?j�[����{��HY.� ù��SE>@'��N��1�0�4�soD�^p�zUs�b���:�e����M�wZ^��u���~��լ����h[�oț����&g�F��!q�
I�Qe@����PQHw�U�;' �FzRl��nV��	Z�-j�F#K�cz鮯�M���<�(M{��(���:8}h����Ȱ��:]��][����q�c{�ssF���K���gf�>�_�JK�d�$\��Y���� ��s]�|,;Z�v��C2�f�`��@��N�<�#��|;!�٪ڱ����kt��͇$\�����s����UNa����G�x��g��W^�͍��lu��8��D���fنuR#�"�E%�Ov�����G����L�qZ9CV^	�D��*�.�%������ĺ'��ĺ9a��z�sirΒ����j~�J��{�����R$
�yV�!6
L�-Г=&U�a t�t�W��f�N(�g��ķ9���� 9m��������$۷��Iy$Q`3Of�3�h��?���$���Dz�4�ģMS��\Q�tX�%��7G8o������9Z�T�1kė�0e@y#��q,���/h��վ���/�����i`Q�(�x��v����mY%X��U��,}&uo1�5�Ea�J�zg޺�rb��sm��/H���?GE4$`��N�	FM��'�'�0�+1��)%C$���C�b2������ϸf�D�T�����l86�!֐>C��3�b%?g�nsI1���e�b=a||�Z
&f^�3z�ڤ��fӛG��(:���-0r�Z�ݴ�e����)V��vF�Q��)1Q�>�1�/�����&W6@;��F�x�6� 4�&*�6��@�Y٬�"��Q�qr�ϯ �����\�����oV�ayK��%B&?������c��W���e�����x�7�-ܑ�ԃ/�'�W�-��'� =���7Y�/N|��Z^@,���ޑh�Kk��2{΂.��9�p)�}��{>��@0x������8���0�̚�7��w�貂I��٬$���q0S�D���c�^��%aVO�����ԃp{}��u����惥S��b�ݖx��&���.fʭ$�w��"ڞ���P����\�Ln�Zf�F�y��6��E�,yv��)H��u6�ʌ;~Usv��؍�ĵ!:tc�i9y��׼!����`�xQUgi��J�?q��6��*(�_���1�.9�vb��(Q�樗^s�ܘw����Ҍ�&�Hɭ���L��7�� �a<=R���\y����U���p= �8�g���7���dY�D�'�9H�%�W�K� X<���Q"*��e� ��W��|�ͥ
��`-Ut8��4(����޵�,�#�O�u��bd	u��N���&����9MH���ׇ��Z���1��F}�c���p`~>q���t$s�.-~�N�Q���1���R��%���Z����1�ׁ�'�-1�&�Ɗ�!���W���
�xܶ<.�f$�U���
������Ѱ?j����U�Q�.��4�i������Ն	��K���!x�>*T����N��A�����.��i�V���]<��$ߵ,w�w�m�r�H�L\2&[,�M|��-���[����i2�*�k�Wv�ŉ��M��]>T�,O���#s�>Q��2CA`�4�5o��Κ�j(��a ��v���M��}�����8��UrdI���HT�E��tةJ_��A?��M�9k�Ba������w7F��n��ҵNR*"� �F�����m�8u�U;s�H5�%��-[����Kx�d~p�U~
�0t'@30�g���Y	J���a����4��n$D�4ha���/��
`ct[���>�u�`�&׽p[���C^ʟH�xDM��H5嬌aB����(b8G��Wy9���*<x�M�d��@��q��W��3�,}])FI�����V�D#"L�.�ZR�>���q�5�nLY�<�FN���N�y�ю�.���T)y�̒�%�6�~�<�O���w��ɻp��5�:v=�S�4}��i�J����Z8���uj-)>�-��&��M_
8|B��Y���l@>���o>C����w����\ʵTeDzN����������l>�ˍ���qj�[Y~�/j�^��)uK- �sg���_��(^?l"��8��nwy�{薨y`�}�p���&��Dƣ��^*` IÙ��$�"��Lf�q�*R�/��K'�������%~
fk�B=���^��m٦��yz�Ɍ��U��6����@������mBkLH�Gm$
��Pg�P�ΑI�S�3*O9�����s�G �D����E��W#{���C��7����C��a�.�zײif���mm�����|���p�H����ɰ�qn,v�
�u�O�J2�S��Gtݣ��ɮN���W�$"�D�I��QKh��	)�H�E��RO�DAo���3�ь(qA���^ؠ���.�Μ�wE*m3���Vc��[��~f)[�|�G;�uf��]dzřT������l���-|���@�W�~"H8j3�%*��G&��l-V%��'�s��%�iY@lr�H�7b
��P`�jDb5_��[���G#�d$�^��� �d�-���t�S��9��� ���W`���0�N�^��tv�ſn8O�u"6);i�\��Ր#\P��Y|/�E��������1�d���澰�7���ԝU@�� B`� CT�hР�����c[���C���/�+ ���0��/�l���H����8�5/_ɧ,%�7�pԂw�v�	s�@*ˋn�tg1���{c��H���Ѩ��?�%�R�:Q��i�7�a�2��e$NzӍ�3�����?���?p�G�mW�2���춣�_��|\�Y�ߝ�7b[o�A�r�1��o�5�ߤ��vJ�Ko�Aom@.��H��	~��Pߝm�>c�Rྐ�,����x/5d8�9��d���P?�����^ſZ)��,_
b��~���۔���6��n���'ǯ��ɖ�B�&]��U�E��~b$�o|�m�i�ʚ�(�3��	���J�~N����{��w�;M|�\i�[���~��� #�(I��@�Ջ��9BrΜ���m��g�� ٰ
\ ~�4�]�w�(B��]��]d|aG�|��dCc�d2����|�U�m���P�R��	���ϐ� =c�5c����M4F2�\;��|���@�b��wuZp���j^f5/�O��F�s{���<�
G"�4���pQ(��#���?�    �~7�#�N�3˂�����J���5�X\/A�]����`��#B���nt��F�6��In��}�lm6�ZО�~[tn��	g�⏾}��A�ޱ��ab��ޏ}pU��82���&�X�.�71�R�����hԫM)���5���]�I�Z�A}YI��4�*��U���
���1�J@$+�cwIm^vc��c~hy��@�a6F�[W���0���-B���
 ��>P%�Q������c�f9����Ն1�<�/����vB��"��Ȗ�{�Z�����͑K�p��Q�ۻV��kN	��:��^�jո̬���w��������9ݗ���<�Fj�G��U���i���VG3s��.� �`I�c�#��	9�\�"-Fl� aj�Պ��͡��9g�����ͤr�|r�Y_l��TC�t�d6(����SK+���;�1[�<��I!k�z�����}J�?��%7� ;6�c��9b��_���T��)����,A��h�n<>@����������{ƨTJ�ܭxuI�;��j?���Kt3�!�������]n�������@m��馡B���kI���;���F�sg�zKlD��}�#�~r���$>�c%r.û�'rfm1�eM$)�>i#���'5݆�b�`��O~��l���{8>PN�	�dؐ8e��~��A�$m����$��,삷pY*���+���(�R~]�M���63�%����^��X�����$���\�f�Y�^�c�=��?:��b\��1�jp�wŔd��� w����jZ�w7�V�M�� 	��D�6?�1,ˊp�q���c��
�g��x9#�nD��X�U�0�6~�Ch ������L{�1
0�u��@�n��>��B]�&�۴K����>E͏�ϑ���)s��H<�7H��]"R��S�a@
ҝ^����mr�k��G{����5Ӡ�ƿ0H�a�D3U\�v�^�T��_	�k��� ��Od ���E��q�Y��$��{\�}1�qmPqo��R�`TX͒����oe�WYhj�0�������M���^�����x[�di����Wk�z���W�����M��&?jH��%�Rǌ�^/�^�x�����[���������Y�B�-�X)R�e�
Q68��>RҸ�5�Ǵx�Z��9��:~u��5S�W�2�4̟��K�[k)���O�@ĦC�� �h�5sM:��G�>�/���)�����4Y>�����'�&%dEđ�k���k9���<�6�K���� m���Nd�Y�����k)�Fh`\�G�5>8M��*<�Wb8���@��#��P��sg����[��FcC��(�o��>wμgg�,'�c�D�~|"D'04w��=MЃF�R���{�s��*����|z\�JG��f}s�2�6~M;�.��,1�YUE��x(m�����,�ey�f���T*ёiР��PgЇ�Zi<'η�^�D	b�OQp�I\�Zc��=�h�~-����(����NhŲ�:�,����s?���:H��ĺY��i�:��j"k�V��s�:����3W�6�Ka)�QMeӥM~
��$S�&��5�-�H�o%TY�ʵ,�Xk�����J��~�HА�ͥ���T�q"fa�e�� ���7D�c� ���I6���T�e����J),K_XX<S��N��J<YL���d�?���*i�����ap�_6h�U���ӷ��!�X!* ��;�"p�Y������:0�����p�\��J_&�4���n����3�7	�♡�i����ޢ�|f�«h����0�5{t�O��Ъ�2�T^JF���2Ġp8_�RU��C�?��Ȁ�>��ML�~�:R{;��o�A������}��z�B�]	r
/CΰwՂ��;v��,�A�FT��+�ϛ�̫m�,#�k@}3-��)����
Y�3c&���{��xt�i�HZ78#Fw̥0G�yO*Qz}4���OXM'm~.Q���%3����PU����O���Ɋm�>t��!�'Ǣ��+��B3@���x���e���-�1���r[���DtQ��������y�o�������uӨqN=��ѥD�+��֏v?j��$�퍍Iۄ���H�at?r��<Pgf�޴7A�k\�6� d;>!�|��ѳ�ߎ^����럏�����={�������{�����-�j���ں�v�Ư�R�HS�s�c5W"$�a�I���G�U�y0���X͑#���))�X�di�w(��k#f�0������ή�����%<Xe&��ܒY��rQx���X���]"ut�(���;��]�����ċ|�t�5DQ�vN�5���߭M�xWZ�d��k̅�D���"ż�zF��)*o�9?��� G��H����RAR9�����gM���U)���s��]����	]z .�動����Jd�%6�-������ƃZQ�uE�s��!�[�-+�[��o��ʊl a�\	���a5��b11/fb�X@k�9}�#���@а\t��Y���`i�&�OG�g����Q4�}��))x�"��Q��t]��刚�{���N��?W�[���}mt��$����ݏ�6�R�Ir�s�x�(���@���NOS���2_�jo	 -^�K��+e�V�L�+�ǣ�w1逫�4��Z Hp�L}�xDF���6j���K\z�_��ѼU�Ϭ0�H����E<V�y�W�Ah7`ÈPoG�J�A�V�1ą���3���^Z�>��Xi��k�yv�c�GA��9��dI���ߧ��Y7͝O��y6��jf��/B���^ö��9����镁�Z���꜃�h�썭̠#l�Oj+6u���ٌ9'�.���Io�ے�������G�x1Z�DL�R�S�uR�MEa���������E���y]�����#��r�s^{�x�<RTWn%�4��$.��#���Y�@��=C��u�R�c�����!6 $UblW����3�ܵ)��C�8��V����G�;���}��̛����Ƴ1���8�9���6X���_ $�|��F,�{�|��2���!d��nj��d��b�p:-��a�Q������5�	շ��Bnh��1���_���(��^4�Ɵ��0����q�3�5{�EX��<�	Qp2�WƊq��vn��˪ț9��=��T�Ʉ �ʹ��<����0Ј|�+���j-X��8����s����%nˊ�\�BF����/���v��u�����J��8j�}���<N!�UZ:0ևd�k��juÜu��{�=���Oށ�5��y�&*ua�ļ��e�5Ȧ�/�%%�bc���^X�tV��ǙN�?�4�4;�N�+�\�p�D)/ϑ�c"��S�L�l'��+���Ʌ���&!�قF�1�}�k�51��j��h��m�p=RK�����9-�/�2��B�j�H!���R�?k�00�����qo$썟��{`���ĝٸ$�ޏ'.���$�5p�#��kX���V���?����̯�أ�$���E�@₡[X�g�Д���~��۟��K)!��N��\�g�y[7�ؘ�L�Am�y��3�Zc�쬵���5�!M'�B<X����`�3�NR}�]�y���0%�>浹V�%׸8����\}�x�K��L$HN=A�}˾�0t���`F�5�&ߓӼ`��\C!���l��c�6�L��HK�@��&ucn�}�逹�ZL1�U԰-����U���cw�9X��"o��Q�oI�	\�!�dW��ϐ��H`�� ���ԃ7��i�k�����̵ �@�@�t_�j�\��Z��@���Z.����ʼ��[Hθ���;�Y�d&®��Gv\��4�I����j�.���}���O�\�`9.vl�~_t��m4�O����>D�_C,�M�?I��ϒy��y`����?���N�[��m菢Tw	%d'H(|^	�E�w#�������
�߉��׌��u��."    ��^ZVg�,q��znaE`ۺ�g�NU��=��-j�If]��bgѵ��nt�i�w�uP��p���"*,�����nI&�<�8D<W�w�}k����7@�U���_�U���.��ɲ��씔Ӯ(���	WɎj(�z4`�G�a�W�����t ���������n�"��|�
��I�Tv3B�V#���q��0�Z�F#b���׼��g#	���XӴ�`�����D�X�gp�r玫lP��!�e��R�}g�g�H$VE~aQC�����5q{l@�@�w�ר��{�C!LA��X�s�-[9��q�ˬ���GV@$�{aZ���4���bFm}�����lC�����L.1���u�
�H�R`��yU�P���0�C�h.�Ѱ�u+ID�����`u�b{K6=����b��o�T�W�c���:�y�&h��7�=�HQg�����U}T��w���ujwl��&�7��Ǆ� ��U��s���t�JwI*}�|�|b�"e����D�pt�̩O��IS�R�׬4]���+�ĸ�	���׀�!�em^�Ѕ׌�q9E�;N��SW`Z)uƌo8{���p��1b�+N)�!��S��ӷ\LlY�M>FQ��w�!���.5q�Hvu.�%W�مw�/�o��jN�`\e�T��(�
�_��k�绗_>gY^��.�8�H�a�Ce;g��m'I��_.�*�����[h��\�b�;�l�A(�\�8��ʞ�p�P��8R)�%�ݙw�ϳ�#6/�4Ƭ8=��\)����0�&�a#L�#(EX�C �Q'R紊_u�e@�ĶW��q,W�c�#g.��^�4�fG�*�c��M�e+ܠ������h��,���nw��n^ƴ����E����w!'�4݂��"���PG�s�7��$�E�1��`��o���1��B��� �f�-؈�E�6�Vz���Ȅ[�Lj�0��Vwj���!���W}���.dׇ�H��d����F2���|�4R�u(P��C店͸4'�"� QH��b8'�i�c3���n�i�҂F�7jFC���q���t%A�]*��>�?��|;���Z���O�K��"4�x4�?8O ܽ��d�S:*Z=�i�K�h*M��K�0���Z1[����YU�VD�����s��ǱkW((W�v·f��m�BQ�����g�}���Cy}h�:c��:y�\�ӑK3��;XEv#����.`���|+/��������e #�n��]��"�"s���}�^�/蕨����ժ��sN���mN�5/'5_*"�B�����������m�v�E~�;��/<�%G�"pK��zY!�m�V�'�����xb�s�2�O�nDmZ1]�o�����2����nj�����	~�����ص�nec�7��Kv	,,]=��z��7�ؽ!� fM����B��A�@��,5�>I=�,W!8��}�����az��G�,����$��Q�~��z�w����Fg���y� ��I��z��vv~$o��.�p_?$s��cMZ�T]n\��h"͡�`�(a��� �9�����!;=i �֦��,�8��dm����=z�a�Pi�d��uf8��ZLGU	�̵MXK�m�X�e�f�(eږK������@{
���/�<������`����>�U�N6�j@ױ,�/%�:^���#�I"Z��z����h�T�i?5ѝ���I}7	n�l����"��#�e
c�����TC'ބ�㴞f������K���,�`;���$R���O+MՋ�SS6�\WGj���ʹ���#uS�1��X�h���t���v��Db�n ��/Ar9z8&aG���Z�~e�L?�UΌ]nf�����B؇�A6�l��~,��zID�Q������i(��7c68����ɟ3��7��A,|�b�p�~�s�M>�p����n�.�IU��mư��M���q{+�k��̴�
��^�$��ϝ���q����7V��">,�e7�)���蘭���ݵ�l&��ykwrN�l$�Z���Y���gR�**����[��1T<��ew\#IR�G�.h�܉#r�ё�����CU�=9�:�W�H��#�V���5����p�}��y5�\���y��/ ��#_�s�t2?%��xJ�\ⶌ6�I�Ɂ M�,g��+���Q�x}��~�U�B�-�$��i��qT��D�0���������Y�vLd��bX�5�3M���^����.@��V�e�"�>[��ѐ�8��]�&W\�w�W<�-�J���j�]�$	��Ŏ\���P�z2�G��5UC�(uִQ�L>n3�oȦX.�� �hEi_X�[���{�Ԃnr�*i?��?a��w:9@�(�U�ȕE���/E�����63�olG���x�]`H�p9.�R_}�0�
�8l�q\�R�Q�4�$��k_9�)���2�"�y�W�J�D�����ڝT��R�a���(����1d�u5w�)�"�iT+d-K��o��qv�Tp��wg��*WtM/�Z%5�s�>�FzA�`�>	mZF�TO�K�9�v��@v�y��z�IM7�i<�o�kY�����(�������*ݔ��r��Rs�l羔�;���!���N���I̒��%�}K��(O�)F��(ݏ��t��m�"���wod�L��M��sb�����23�@������/G?�|��ً�ߎ���~��_i��&pǰ�.:�䌳H3�v�S�N�5_d��D)����`�X��9WsL��Ɠ�+�����v6�����	=K�6�U$����1!��2�k��X���b�J�Z�cH���(W-e���J�Y�f�< ��u���������Q���+)�1�1ʼd����Ţ�ɤ[���u�	�K`D�jԪ��e��r�5�'Bd�Z)�D���M;���n@䪵ls(�^�hɝIqq�"w�z�S��<2tk�Q��%��̟�.���l���h���yDx;� 4���ԩ���=�B4i_4���A���0��rM� �jW�IX���Ù7�U5L��^�H�Ñ�4��݆{/�{�AH(���f]��ky8wӎ��C���c1��*Ɓe	�z��~<��w܏�}�$mr�����>z���������D�c�޺�_����}���jd:��"DW^RT!�o8|�@6����xӡ�ˍ&�.��>��ኖ�G�����:z��f*�:Ӑ���m?�J�t���įRD��Ք���W�o��_�f�nS³ܟ�l�XJ��c�T咫M~��S����5u3W6v�Y9��BEjN��u����ܛ�iÕ�vm��|��q+ݐ/�v�TK���:��1ю�a>;��eԦ�[`�lV�]˒��_������P�>/c>���@��Ť|:�ҿ|��'��.;���p��%����S�E9۞�a7v���˞�t~�3�G�W�_���`[Wjd?��i	�t\�ϙ�fE�X��݉8�����OL���崂m��J���m}�[��>U��@�\RkVYk�t�,(��g4b�St���5ҿ�)=�Z�\S�V�V��=	�g$ŵu�S��t� ����z{Uz�B��"�L-�Ҷ�n�t
M�3P�J�GFCQ�/�M�-Ou�SxD<$��^��Za����9��:B�>��q���RA�47�c���,Y�=2��$��M�+VA��"ƅ��b����t^�-�[����F�[�2n�2\J�Ѝ�������ا9b��8p��yS-_���^@�=r;O*�
�b��օ-�'�N�`q�@^=@@� Z��`�#M�9p٘Ȅe_�d�<�lT��V-a�d�j���]3Mw��ưV*IǙ�Y���V��d:�`&� *j���p���@�D�b�дn��%�D|'��&�������(s!uw&۵i+���c��$t��������؝7��d�,]�Ǒ�udbx_6�D ��&�m�|����I�<u�Q��?Ⰾ9�i�һ��p�N��	s8a���I�S`���Ef|�������q���U��U�����T�    ��1�����p�e|A�Ǆ� v��ۘE���ݙ�U���|��(
δ��E�r+�,� |+��"q��U"0�Q� `�V�X�̓����m�gę��o:B�S�	��b�}J
�� "��ԝgE��;vK��|���hԄ��\�y^$�Ϧ}�kW�{�os�U�P*����AX�W�j��ȯ��V���Ŵ�2_����1�3ߵY�9�K�)��9v�G
�dN���B�^W��y��H4㎾}_��y�����/�����&7>'�^"�B��(jiG���FG������7P�����8��t$�;��p�f�p�g(� oh+���e�J�FPof�*��[9g��5~!Ut�Ӳ:ꥪ3�
X;��g�����Pu�O����/�ˢ�6�٭.�������x&�Z���[�`�:N$^rJn9r;�`�ρ�Ҩe��;M?�J��E���fu��C�'�=6����k,��0��z�L���E����p[��k��y�U�E���Q{���)��Z2�V`��)W5у}ǜۡP���M8R��9�R:�!�O[d�Fr�U�~J�|��u@�Z��o,&6M�M^V�s9hs	ʪ��{&z�lGm���㨩ы���s�J��=�@��Z��P���9�v�ȂV$��Rԧ����(�s�V�����?Ώs���[`[]�2�����s�}p��H#��lJO�	 �gP���r���r��:Ԍ����&.[x��j��L���<�~pE@�!d�08���Z�d�O3��^ �h��&��XG���*笅�����Ōh�o�*WV;]��E��Z�7�ʫ6,xo��ڻuNc%�k�M�AW�+G�2�)�n@�?��G�G��)c�F����������8 �r�!�Bq,m)那@��%�K:��_l���2�CYE �k3�
<���sb��MQ8��*�b]������I߳�԰�b�)/~ C[n�0��I����[���ӬT�F:[.���:�����8���Uwi ���b%�ˇq,�� � |u����ʳ�
���Sz)/r�ť5�3��tg3G�g���ۛ��^t�V�5�6����H�3�`4o��r*e��F������`�aR����|���
�΀%��� k�F�lR��\�W�7��=`�f��7w�+���kw�CY����Ҡد	{�i%bk��A_Y�\�5WH�,�<�V�u�ɉ�ݥ��A��}���(��K\��G#�dت?st�5D%?C5�y�f�`k��#?`鉏]C����(�IC��9���)�\Ҳ��|�7Z6y��-f�6�G��tkt��4���6�$��5���1ڸ�b�6&�z�H�4�o~tA�̹�E�X�շ_����8�k�8}��=c�TX��7n,��{پ{���Wǿ=}���W'�{� y�X�Ic�S��zy�h� �%�-�S�����!�>�O�fX��o�6X%盘4�r�M
 �����DpG{l{�gH�G����B�b�p�/x9��}�E�P� �l�Ax�'���~��䲀c���� �F%�6J��b�!�t>�}/�p��q��y���lգ.�ᬠőѽM+,3_Ѝ�I���������+-"������&��m��\1{��P���iM���к������z����� �����<�A+���j�H��B.��J�)IU#���X�erL����P�����9k/`�~`��_����a�j�Z{pÉ&��4�{�jD��X��t�Ml
�.�](+�/�gg��˜��� ���H��Y�Vgi��/�Y&]�(�J���d#}%u5�����C\,g &N*M�48�`v�!�Pވי��4��h��A7��i���;���m�SB��f^����P?�$�̊_i�Z��uR}�w�Y��cR�b[�����^v�^�[�����{M�,>��N$+�B�WK�f�Iv���k!��֧r=�&��8T��lW���fd��\��Bq�t[�ߤ�n�5��=qȪ�?�12=["�U�3Wしi-�P���$8��4Z��\G���ue��s�( ^���t�7zt#2R���� ώ}�"�#q��:=䇃|�A�n�V!u����Ma�_Ց�٨�`#[3>bX�*��.`zCȔ���6����8��˸��]r��4�k���F��r#�䩮�4���r�\��As�84�d�	����{Fm�Z��2١^5l �;/�m��!�0>|� ��=Ǌ@�{&���%�
�n��6W,�(�DCu�?�?�
�i���bq;�jE$�>.�=H3j�b��IP��*�� U4���ЍΉp�v߆:N�O���J<��|�p�{;c{�h 8�œ��8���f̈́�=~~�j �b�����vy�+�b!^��{���0P++�2<(r�5�'��uC��Kx�<�fK}D���/"���&v2)]�Kb�/(X�k�ӱ+���4-00Z`�ݼ�u_*�N�Ӡ8�Ӑ����48�sǦ�>k<_����kk�:�|VW�ԙ�H?�ܸ��\��໑�XX���¼�i6��^l�Z�ǟKr��g�D����/e3Ԛ-xh�p�?C&)�5��u�9~�����H�x�J"�fE��o;�M)!EC��Hv�(P�o�`O��(��X�~p�c���R�L�R�8F&$麕>��Λ>B�ݞ߲��|���|�29yG���
�M������ϼӌ!1��s$7KbZ��M��C.�6w�r����͝q��ς��0���.�l�jE7��ab7��h�4$>:ZR� �uٜ ��M����êd����f5�
A��(�i�04�l�G.�����(p��=Gi[�<��^��Ol�DJi�1�"�Ң�����a������e�_�֏��j�/I�D��3�cɢ�&�*HD�y	\��ݤ{k&�\a��ঁ���@�G|աa�Q0��G��F��w�<H~|�y�����R[�M�Io��Kn�'_�!�N�G_&��Op"���e5�.C�D�[r��x�:C0����=����:��x}�-9�,d�>S/ž�4���Vd3�g�\B��>�ޒ����0��LY��ע�m6l���X�j���Kd�ǂ�i�H!d�U:ɾUM�ٍ�������F�[q���83�@�V��|�������(�l�Ee�
���ϺR'�W����Tܭ�Ժ|�3�.�����FL����P6��ׅWp*@�oX�-\V6�9b��V����FD/�^�����4��9�6��I�)�Ҝ��{�(�y^TM���s��	�^�`or��?���7���×e"q  ^6�Z���u�vKϢ�E5�9��$���2�>���4�$�k��f˭$}z��O��J��^ك��(��c=ttys����]w�mw�
>T`��P�H��D[�t�ՒgNo��
h7E�%(�*Ԫ�Vg��Λb���cǛ�ۋ��B�ٌ�p>�>�X�"�EhF��$��N����C�Qy��;q�$��%��m6;�?|���p��;w�%����tp͒t�j��C��y>�{!�Ă�!�����y9�O�Qc'��|��\��xݪW�c�3o� �jvi�@�Kz��@�Cum��!H_{f$+��d�!N<���#˟jL �/Eʴ�iz)�f͙�:R��$�L�����:��L}��r�-�_o��ɓ���_e����Շ��4\��{�XD��cT�^A9K���Β<H�'U���+/ �(�}ͼ}u�F��VXeS8n��X����4��iᣛU	�OQ'��ɑ���� 1~A3�p�(玎�i�Yť��sXH�jI>�L���\}7W9����߹�܊�5�i�L�55����B�:�095hk	����t�ae�LE<���qz��Q�'�F�.l7���/j-�j���"��l�3��Z�h�z���
�٩�!4�2 ���|��uj�
�T�9�_�;��¨+U��F��HeF�*�\��_I���+YXDͲ��~o�� �b��N���Kz����#zα�z��&pS�\hX��
7=��ϕ    �UP�!���E����'����]��	o;WrBv���~&l�DX-��P�~�.;�_�-y������M����s�-����[���Z\8�*[�ӎ����}��PP��F䎃�����(��i{H��+���cei����b`}al%k�UL' *�YT��'�o����?9f���:-��$���Dp�u5����Ꙧ�L2PM�C�5��mP����؇nc��~9���rZ�
�6��+f"����g�c�B�hoi��	�Q��Ӱ�#p�\k/]�@p8k>�&mEP�L�mJ�G���1�L`���#?�Q4�k�#�fe�Ζ�L>O��dZ�q�I&�)aa����<���S��ed.�#oR�>9>~v|��ً��=�2�gF�(^���ex�az���z���9�ׂ�L�'}} :�d��)�g���B�0���M �)�Yv�ws[��WA�R�ڈ$HF20�2pn	4�]p]�ޏ�I��G�Y7��y��y�D�=�iP��OP_�U�[��^>&�����[�q�@a��E�r�Cj��0�D|��ʊ.q: �^���Mօ�-�yd�Ĝ���<�6�g�S�0�6�]E�`�Z�J�uoװ��TN�h��i[$�����QU��"G@��p�(��jU�a�ѳ�u� b��J/t����m�u}Yd�~���$�μ?�hć�~�����u�%������q�����Fuuq/�/^���µ�+R�*\����z	��O�2�ąu�s��i�u�R�U���̠ߎ����S�M��#g�M9�Ya��B�z��f?-�BE�]��+X�Z������������i�H&I3���P�.�[��gךVR��,S��:�� ���5|��ȅCH֪7X\^�Z���Z���QתU�?�l
TQ�jk1UW��Օ�_��%b���#E*��;ǐ�H��%~C"S��P�!���μY#��	�(��'ݬ��p�I/HB���H���e��� ���![y6qY�ì��e��sEMJ�zcY�u��V�а)@���c��:�7���@����J+r#H4�a!(�5��f�`|偩MS��ѿ���;�����-dB5��NC�F Μk�;HU��55��f3jz��X;�
İ�΍ �$�c����ߖ�$����E�_o�Ig�iw��?zӴ/��A�"A��5����a������9ם�A1ͅ�Ƴ�.�W��(0L�e3�����w:�6��Y9zV�6��"T�2Pv��{�<���X?���X/��K+��b-V�%G�
�� �t���/��l)�D����5G�n��j9����/J'�~�]ݐ���!}����W	|�}�T3]�:�H��V:#�P���
>���0-D7��ҴC<�4r4�ڥa�\��G�[��˵HI,a{̓$�T)`�ٱ;�K�O����3�v�t%�v�J�h��,�ÝT�E"=*}�'��9�L�N8	�6/b��V6"2i�6as����;I��u�8�p�N�Rk����WH�T��Dã�ry�����oO3>�I�����˩khq��@��DŊI�=�dv.�P���g`<ݠ��ﵓ8Fw�s��%�͊
k]U�WR-&������� �_5	����W�)�:�����P��!@�FT���q���K�q�b��M������@űÔ?u��J���F�Gz�]�������΢l����y�1Yu�se���*��*��<����mr����N��ޝ��sID��
/�O|��*���PQ{!�ߒ#�nI�*H��x�s>\PX�jR�in�{߅͍^�w�	�*
�H�%�r�С��2c�	�%�?#v3���{V�6�	``>xDA���R�<ƛbl��^�����?�rL��+dx���+t@wc�i�ŵ(��Rc��u�9�9�a��X����'���*��YkS��HY8��vw��P[q2���<��D�n�aa��V4 �_�OOb��������4� �B�#�~�Ӛe?��=lL�NF2��x�C�\:H��<�*�T�a�C�Oy�xLJ`8��M� N֝��$� ������*��:�J�"L�f^A�S+�I��z"�G���4�MN
*�;�/u�A>����GM�v�|M��3>�D�y�Qǩ*`
w*���\�����{���^�=Ti����(�c �5�����C�
�R�rb2�C��CFXK��A7�G��ݛL�:��|����Ӑ�݂&�=�a�T.�Ve�d��e�?:ړLП�1!d�Ju�^9:��#�8�UB*0��@$�b%eH��9B� ������Xh���x1�o Qyx���/�f����:�&u7a8��N~����:yz��)�����>G��(R��&k���~��1���_���>�3�G:%��k���h(����6s��n3����6s��n3w�6��A�.i����q͟3 +׆���3b���@a$t�9Uk��q�i�!�n$��<4�Ѳ���+���LV����0~��'|N�
:k>qR�U7���w��#�ubA���F�s��`r�m91��=ڽK�P�Eձ�R���9/���nZK�#na� ��b���Eh��y��'��+sy��(��>����E:)�N]�}�I��9r����mr���0�Iۙ=H�Ax��):�Q?�%g"�q�@�Ae�ݔ���.�hK�i/�=d?��0g&�ٹ%#�䲂�4���v���O�!���!w�UaV��7�*3�F�0�癖g>�c�OXw�T�CG��T�5쀠���ޯ���s��XJ/����u3x'~��ta��E:�D�XZ�b������<����L�� �Z!�
������]�ipW��(-&B�Q0:c���� ""� "?��L.+6`��*N^��鷓gO|��?��o_}!#
w'�#�`&�;��g�i�Ф]�{q���b�������w[�٘Q8ln����VL�F��f;u&��0s�3]>��@m�_xSF�Ӿ�X|��^hm���6��r@�%ӻ^F[��3�������k�2����6������NA1�(rRD��^sK���-��f�΅å�sgV�^EGm�ߒM�?N]Kҹ	-wmr�v��6����2t��`sd�N���\3%�ԍ�g��^
/�
�C�j�g!�"� �`���LvY��Qj_K��������M�z� INL�� pR㤛��έB5��XVU���`���U�aȢ�>�#��yPI�jP���r�Cœ(��Q��^y�-/��/0�Q^�� �>R锼붃*t/6���:!�1E~�Z�_�)ڲ\i%o��ݓ����(����g���
��ě��U!e��~�Ǝv���/��jg<��כ&%��S���c�h#N����Ft��[�i��<���-5Rq-�҆h�EQ��4rZI����Z=���ឋ�t~�"�~H�u�r8�6�Ӻ�	��2����҇V��/�g���S�h��G5#	�.�?�t����:Ezd'�l���ظ���*Ӈ����#ޡ��gzJ�؍X
|yc��=�$�xM������l��׺ȯ�q)[_LXn�X���۠A�5W;��% � ����d��D4���N���ĩp\��i7���ռ�<TQ��~�	�m��8�J&�%O�'OvlCY��4��ł�����
�0�v��;ˆ�# ��}��
z�C�V�4��^N����}	w�;[��NS��� �=��w�?���K'��Ȼڌt��2�M塳0��Ab$�Ab;���Jf�W�F��Q���tA�{�ɲ�
�m���h��6h|��a���=3�����4��86:��>�LG����$������s�	����!z3~�Z[������7�Obo�	�5{�%u���0�D��1�@aZu��/��'6���^�>>��"�/�h«���.%/��y4,>��o�4�+��ɊR�+e�TVXZ�ģ��xC����	5��)�#�=<�Pn�F�`�-�����ا,�7��t20wE��=,�qn��'�    ��X4�� C��.�����@����k�ñt��m<d�d.{G���D��XM����7�u
9@�СG8��Aq�=~�6�� ���I�I1�Ý�8���c�|d;�����Co7A��0o~0�#��2�᎜.��BD��_�Wi̡�>A�c1;^��%�m�~,�R��x����Ҋ�<�p���A��z�����m&#�����'D�ct��j�������Q5:���~���}����N�O��}�'V��z�����Ƒ��I��e�X�Y���g�����|j����m�{�ˋ�����^H�ls!n*��<����8��/Cꬰ��uʚI�/�ތ�E�
7J�/ݘfGW؄6�����Y�Yӣ?��#�@o�*6D ���(���~�!�!^������z�z����^�^$��Q'�Go1�T��Z�Ŀ���G9���A��@������d9����|�Hq{�9��͍�߇���
+t;Hdg��imT�(6��w+4�~w4}�J1%͕r-Ҟ�Iʝlb}z�����?��������#��o��Ժf�ʬ�+5��dSݕ!F
�-���o�͖�8�,�g�W������ڪ
e$�e�����,� ��"P� S�Ӽ�_Η��sw 3���¬��Dl�\�~�.���N*�1�m�Xd��&������m��FcX�����p��.�A�4{S�*�R����/��s�<�h®�F� �����G�&O�}��/���Y� ����E�և�V�a�[H~�d�hj��M�*���N�`m�0^��)h���1��F�<��1�֋խm��3��1z��ܼ� �c3�x��"�`M����3��Ʈ��[�ZjIv&�ƞ�#`��������cP��>�_|��������|�������ϫuuQZ5��ĒQ�U-^�����κY�ʘ�R��������
 �s��*���w1�����~��<j^��T�LcV{�{��OyڼZ*BU�0���>���N��&iy0��h qF*���BM �s��&��<��ut�̆��H~��e�4|f�����\��l�rf
��AO�����z��5$������w��c}�Ƀ�b � 车sŋy��A���4�_)S\��%�x�^Vm;+dY�~��zjI��U���`�e�1���=�V#���v�³0`��.�]
k��nE��_��U�j*c[BM� 7�V�g��]았Q3.��0�� 3j�.%�(]:U+��$�nͱ�ϲ�P���fʴ�MU6��A�#-}V�iOmJ�����i��M�B����	|d':V���s�pZZ�1])�D:�:X �ӣ8��� ��n�^+�Y�f�ˆNr�X|(?�N{J�%-�TD��y����T�q�7a��Qo�� �M��e*�)^��&��+���s�+ƅy�´��6�̯%�wl�/�Y�8��lFdnY�*:�n9�(�����(��.�%{� ������^�̨`~3�{S�ͭ�ck�/L~��0�5c�i�:����Y��� :Ex��(��`�_��~�q��8aa�!�C'�ޔ$%�^I`$%u�a����0��P}Kأ�gFg��ۉ������$nͤW�s�7��ᓝ��F�jc��V���+���_*�����&�PA�T���Oɭ�x����sb&�ɑ�_m��V^��'�Ơ�3��`�ǯϊ_�����f�`r�_�"���t�a,�5����UZ`�{�S�����a
$`��7M!K���ڦ�\.ku�)c�b�HB5p��`<Q��M�x�d(��'�i�U`t�+:��4�w������I����[=�j��1n �&�P�fb����pb��sHun�5��X;V�!ie�]�m�ov!O�~�,䟤��<m��ؘ%O���s}4�օ�����3z� ff�o�E$�V����_��MZ�H)5��Zy���Z��B��Αk��+򁔴��n*���Z����グ�������[�����?=p���%��\F�?>.�q�6g���I?y�R{b��<�T��S<���C�d�X��d�~�Rr&���T�c�_X�,s\�pJ��c�����׺�����|AȲ��t������_���-�IGPn�U�Ÿ%�h8
#(��8�m!����u�#Μ��ny]*�XS�ĺ��>�����Vlw�3<<���+��uy�!{&�8?��}��Cq��Hm�����ɹ,V��i�1�*�r�h�Q^<%��"<��X�\Ku\
u�|Y�o�y?�y�*�����n�K*�%�/�{�ç%i��%)[�r֭��~dt�}��'����<(T��\)u�s�	Ƶ���QJ�w�V�Bw	�zц�O���2m�qĳ��ೈ������FM	[�2$�RIK�`�+�؂�X�X�Av�d�ƹ�"�d[N�xT�Ku��7a7ݼ�<-��kɬ��3��ΒÞ �!U�����j�^��ҧ([GO�y��ɬ�3�	��@�'����X�g���2X S�^���8���j�\֫�T	��X��ZiY�t��t�@�~8�,5;9m�~dR����vG��$]^֦&�owa�8��6�!ĉ��1�Gp�߶i��0&�Ίb��Vm/y��s޲�!������'f��!�M"���X�)B`��'���'�h���	���0�;Ѕ�;nd�F6nd��l��l���y}6�<��d�`�H��T�d�����lCV��Hc�&�ܕ��Į��KTJ�$"�a����w/�B�(_J�_V+�_9�Z�#^��n�à��V�AN��{�,c���Ҵ�*pl�`%KCE�5�s���0\\ ����mÃ�;�*O���s�p��-��,}����hp�h���aAy�楹�Êm�]�KJ;�Ԛ|(Q_+���Gó8N�p�wE�_F'�IկC��t���/i��<I�8Z���8����cXE,$��~��if��� ڊ���&�����s?��[9e�q|ζx���,�9��V*�l!a�T��rAA�'��Ի߮V�\�����JsU=��b�ߖC�W��t��X��vH;��
�v	� ��|Ȥ��Kإ�\��
�_a>Ի���� �bE�v�]��/�+"���gڰ�Q��ZQ� =�tL!�h�YI��L�,aŭ��W6%�;wj'C<[؉T���R�ҡ����������Y�~f:��Vu�U��Y�e���	��U��f�J�H1l�Z1;-aɌ�Jjz@Jb�v�:�ѫ\+#!�έ̤��䈓�C�r83�c��}�������XU^W�?���F2�(2r���9�m3��R@h��bD�uLAP��.��N(�ؑt��k9f��m���9
-�-�aʡ���2y��ȭ��k�әշ����� /v�0��)�2��v�c'��C�A�=����)9p�V��.ɔ�ha���&��P���E������&�ǛR3ŸU�[ի��-G��t?u&�S4O�W>�|
�2Ǭ�����7�q37�q3}Û�m������U�g�'�s`T-���+cS7��5���Y�hp��z@L��7sp wJV�`=^;���<��ë�s���F�ތ,���-l��񛳀2���P�����L�^u�8�ö^\)Q3:��Y�Ʀ8�t�o��kfż\�s��Y�<��xS�0]�HG�07�"�O^�(��ǟL�V�]	� �JE(�m�_�n<�uD�d|k.�zFxm4j�y��(������&Uc*���S��&*��I���l�
�����Z���u��@����=�$�6���A#��r�8�0³B�� ��d+Q�c#�"��~��m�3|(�Y�^aXAyu��J����3Qʦě���Z���^i�%f�˼��l8�����Җ��њ(7��=��E�nS���6�����p�������(���ߢ_Xւ
��6T��|�����J���h���ѶsI�VUOA���W��'
*�l�X�Ō�o�q"�X�z�?���N+Z&��l�U��q� ��p    +��YH٤4�N�R@�CE��P��ZT�[Z��ƱZ��^��=c����0�����f���2ʅdq����O�S3vc�d4sS��m�h�C�T�VOd���A�:�����?�<L^zNpzz�Y9R�i���mۮf�66꫺�j&	�ɞ�����7��)v���U�TO�=hI5�J�B�[��𽯏?�4�a�K��5�;�N���u�ؓ���ĸ#���Qt��(�/�������|��B�Mg�_�l|�r*Q��!�V�����'̆u�|_�%TlW�K�)�y9�h��S2�h���gL	*��\����^}fhe���Z�Z6���H�#Y��p�qi۔�G�Ǵ���Z*-u���Uےŧ�7P��}�>�m(�N�R=H�2�ow F�ސ1�D� �IjRT��o�������Uw������Xp�;)�"���3�aS'�����(�����u�}a3xB����]�Vz��n�,�i���D���jր����ܡa�Y�s��`��R�=���;���ř~~�͙�w�C���%��*�ˎM���Q�1w* �y�+��4��Q����}�<Fv�/��=�J?�@�8Q��Q�{���p�P�%����A0`��-ju#8-��u�n�`��������k	����f���O{}O
����,��i �aON���xwC�d�,|#9	L�F_�m/J�J����Nz���o�R	���V�o�lB�|)�'�h`�7����}�Ma��O&�f��Q%G���pl�/�\���J �e���g΢�J��U�$9�I�.��H��X�3�<$�p\@=Bz5V$~�i��8{��/�0��
��-���d���F���~oM����:����d8��*�?���HOVڻ�����Җ9�>͖��"E�#Q�Gl��ɖ�Za��D��9�~�4��P�#7��1��P�bd�lg����r:X(��x���������LJ~��d��;S\�{�u�e��-b<Xj2VbU��x�H�Z�8q��,�Ynpq,��#MCW�&N�Ʌm#/���7�&ۮ�]z;�a6㨩�AM]�#��p̠�8�����\A$�K��'f�;$Ҹ]��Ÿ]����ɑJ���7�����>�<ajr��c�M�\�[�j�4�T@�,�Yq�������&Ό�xj`r��j�ʂ�P�g}�K��#��A�
d+�ô�Z.I����HQ6��uWbtm)jTP�+�Z C³Bo�1��Z ֵ�@I�<��]�A�`��~C�eY9䪦䠾U��ҧ���}�b9-��悞�D�Ѫ& 
(�`����l �>�Xz�w��~qY�KW��|Ūf
'tl��D��"}���F8^�{.��bY�j���*N���g!�)�X���!���{��{�s���ߕ`��Xz��m�i�|-�C�a�a�7(�Q�<ª��I �}�D٨��E�%��ܢ��^��<����$U��.��}�ZN_-Q>ܯ���sK��RwO��n�����l��^�>�w�6	�u��S.�f���4�ӹ�&�*uu�r>,�-�u�$�xy|�$ҡ�_�aٮ��kwB.�)	6E	�bM�#�5��-2�%T�:d�A���{�j 4Qs?7�RJRy���i���R	��\�Z��(ú%���l���و ��ߓ)�ו�igj���-5p�/w=�P��z';sN�֛0��u[�nP�s4�բ��b�o���&�i�Nx+:^hy��IH����,�?�&򚺓ľ�-�.g�#3���,�!NL� Cg��%6��E?��Fa���q/��q/��q/|�{�k:P�f�umG����i�tW>�|>-׻��?�2��?\ȱ=Mܼ��([��
��/b/��.��@���
�yIR�5��Qm�8Ӻ�$ۚ[�������S.z�w4��K�.�0�Է�2}Ɇ�����j.����������ı�HK�$d_���s'�?�8���O	_6���HT ֹ��D��+7#pS�����.�MZ����d�K����>�F��P>�b���`8b.L�`L�fa�W� F��g+t���B�x9n��}m���O�T��W�Zh���� �&�%�Q�{h ×0D��r�4�0���&�����c4[sՍF�+R�Vq�{��-��x����5d䠪r��&�^����G���4Rqkǉ�m/�MMb#�ꊅ����)ڇ�]��3ݔY�_,�b�ҧrƳ���x����!�T�fT٣�U�K���Ki�4��藡}��'?�/����쮼
�#(�^J�-�K�v:��x�C��Ƚ��^/�F>Kjc��N����,��3]�H^?4�)����5(PV��$	����v����q���6n�I��	J4-.V�W�u4�pM����iB���wjyN��]�pBV�$���F6�?.w�e�oqX��|Oy�c��s��ʲ����J�T&r������ԑ�q�4�&WD�Hբ<oAH�_Z?P+�=վ�������ap3$<��:wD%"��2���6��eT:L�zd.M�ڻ��
�+^x�JB_�� �`1�y����8�W�w�G2K"��E��8S'����(�삉���X����ը�}��̥49�	�ʗɓ���8s��ۆ���M�E����ѵi��KO�>~9b��q�h���+�8��)�%ɚ�J�`���:��,d�tL�:u�ʘy��K��
J�|/2 ��:]�L�X���M�%/����ɲ��d�t|��&��z�k'������%l4a��=���
i���$�ve��
��"3�٠s3�;�YZt����OѸ{��׸{���kڽ&�)>���u�wt���Q@ȿ��J��չ���!	�d-t`�[D{(�HP�r����M�n�I
�f	b��SF(�y�/���8�hGS�=�rWDW���Ԇ6��M�ݶ+��V��:ܝ�f��[�]-{׺x.T{3<�	O)d��ٹ�s��>��pzV,4iС�^��	��A0�]J����Íg��N}�gvl��uw�VY�W��<�nhoA��7+�]�b#�|�0y��l���.[i����$@	�~g>�0b��l������sIJ��oBV����M�U^�̘���6?j�C��FIbM��i��A�n���BK߮�������0HS?�2�c����V���-9b釴\�*Nw�����pX����/�i{M�P���ra�0-y*��/��y����4��]��˲��\����.�FJ��)<p�F~�7����f��O׹	�=I:�ó��;�-������+Mi�X���d�2�ڜ=�&�7�GC~�-^}��}��x&ߛ%����*�v�n@�>�p��Yqn9�p\n��r�I�)���7!�ý��_'�� ���}�cZ�Ý��"�$a�Q0L�r-�m�X���-Ց�('��<�����7��������k������'�wl��\�x��~�oʯ�w]\���,g������\�p`c*3��ʑ�g[�*��֚y[x��&��,�y���ɓ����/~x��ç���'�����s\�Y3�zg��0X{��`{���.��i��>7������y|�
��OXX��JЁ'������Z �3-�ĵ���U�nL�-~U}��\ȋ�i��+��dZ�z�y�}�Ne��q����l�<B��W�c���8<	���{J��D?�3�-�,�.N&<0iړ�o���)^G�o���hd��s)�)�p��@����������|v�u'7�{ba��m�w�����y:	�ٗ��D}:yb�}ɫ�{PL@�6���k)�^.d�����q7 �� bX���ˬT���J>��b�Х֖�&	���b���t�f�jE̒Ի��D��5Yw��2�9�� G��6D7���a0~	{�l�k�B8�i��j&z�D���K1���>8�8�2�x��2ReXIj�uמz<�f>",{:�U#�	��v#�R��$�;�awII�w�E_�_!k�&h��>7A��VM<_�'dy�����]b9�ewU :^��Dؒ2܊�Au_��xlw�D�i�9�CR�u~/�    �]�
��h�i��s�,e�Z�H������P�$��=G���gI�{��%E\\�Y3ox��PSI
W���$������%�S���Zy�TzƱн���؝"�$�Kj<�:1d:�*�!�dd4�w����8�;L� ap%aÙ�{b�.�C7U�ZT�KPZ��^�CD��i�[2��N���BG����.��Fw]��H ~)����=|�>3����G�h䧒����H3g6��0�:��Z��S1��H~G�t�^�|�`%����D�X�Vv����j�h��9,���3���M�r\?պ38��
aA�ә��04sN�m*u�M��r��崭���U_-�YR��Ŧ���@L&WK���*���%V��31���]i�,�Q����aZI�A��{ls`��[�,-U'p6��Ĕ:�+N�fW�UfLq����47� H��hê�"h�y���nڠ,�]H4C��a�� �G��ea�=˼o�Yu��%�Fg8��]�{�O7f��ç oӈ�˒%����F��h48����
��u�a��%7����f6J;Ԝ�0q��É���{#4�./�
i.�jQ�%I�|
@[( ��"y���l�����b�G���L�2�vP|�������2.$���+>4KͰ���%���yf�9g���~�?nU�Ex5̪�Ǔ����IW�<ͣ�<ͣ�<ͣ�<Ϳ��<y&y�#�ȫ��'@28aȟ�'�ӳ��n�T�T��I�|�#��7�o�v�w���+��H�f��[%j_��½R��,�S��(L�T/%��Gж�m��q,�6w�3����	��RԢ;Ѵ� �y�S�I:�+1�A[�l��������\u܁(o�¶�D�%E��>(��*�$f���	1'��&cL�P�g��bHA�19��>���Zo�h�O��>�q�%g*��`=���}S0�O���h�Ϝ8RѬUab�|^Jl44dJmѺ�~�N�U�%f-�zSunK���Sl���
�j#9�q�B�#��-v����"��}Q��ບ��2���Պ� ��`5n�9�
�Y0�Y���<��E#�(٨�U,֮
�m��̧��D0�D�[ԫF���]��T}4͏^��B��i�gm)��E�o\xٲ�鞯�bԎ�v|�yzg�&���Q�G�?��Q��m���F�l���$��z���ї�"��W�L�,d�!��������>��s7���g�b��/�� ]i�2�H���L}^I����$Gz��z�?˰A���v��Cj^k�S�6F	CG�\�8�#�E��URj5�F�^�U)�+����0,Ck��QT�z���mL��pe=�4�\�W�R̒#�a�*��c#���[�Yh�nt��M�X�\^��>LVi���v�׬�_�$�q��z�2΁����[�1��ۆ+z��M������[HL��~<��e�����)?�ָ��T6Z!xr����j��e���:q���	YOe6U�5�e��(<�y[6��R�3S�E #z���Q(^~��z�g��9�J09P�l�[m^-U���D'Owj�=��ys��5��iՅ��_wG8"9X �6'�K,ʮvY����W���Uie����uK��B�)� \._UM�zD�_S}�u�T�:�'�:Y"[�ٽ���sA��I>�)+�
8�ϢGU�w��� `�Q,�6-ֵ�IT����ۿ�!����o�(�G�
��Vư)P_��jNJ A�U�@����-�RF�d���d9e����t\�vTU�s�"�!N�dR`Q��kxI��pg��>�:���?b�F���
����J����,ºR���8S�-��4���䠸sG���Uxl����g��vM_U{e'.�"U\Ȭ5Bb(��!�I:3�Q�KU����P���Ɉ�\��8o@0nG�ꪗsM��H�+g$`v�7��y˝~�秪�x�¸Ꝁ)3����;��M���]��^UKL�c&��;BQ��<{9�h~ԒCuE�6�V%������HwS._u�����o[�o�K>��z����^���%�������$).6��������TV��k�v&GE����ה�A��X��n���7�I��\-��~����9*�w\�+������83:�6�y�*x6l�,���1�vx`d�����3�=��3�=���L^N��S�k�lǨ5�u򤪮<��9��5s�	�&ӷ�7u'��b��2X�{֭�Իv�_3�;�،�I)1�je܏��Z�ך������>PS᭑��FD����-~�e�a���O�A��r��R�0�<e�Tc����PL�'}U����`qw}+L���lT�zߕ�h���߄�☖d⤃?�?Ȩ��ҁ�c��+�嶅p@��e�L �5T���\�l^_�?*a�gX��8��EM��)��J�&��%e�|�ē��!8��ɱH�l���C����o4������$}~�.���,���?�[6�@t�˘��X�^��2�y�V�Z�������c�x�|D�
�Ǹ<_by�Ⱍe�j���hI�=ƈob6D�v�sJ-�8&����2j�QӼM� L�7�h�����B+
�p`J����+F��J��ؕ�	&������p��af~���͕k�uSN,���rH�c���Ykԣ'���Q�����6ǩFX%%B�d��Z�����o�r�o�a��A?����L�o��7֣}]2]��$�Ƒ��͛yv&khd��]���&FF��;fBs��!��^���q������Z��u��܋��$χ�3]�=�-%w��H2~�-�0�Sm�L-�-Ӌ���������J��d�b]uV]�x�זIIwG�X�������*!{�E*�*�NI*=H�Y���NT�]��_I$=3}k�K�+�USa��9$. 3/�����[:������M�W-�K�	���к�!�D�UY.t��r9"E�RT��|���Kn�o�7��Z�ƫ��y ��&|褨��I5������8�S���(,���*�h�nX�)R�]V�nj�����,�U����J�X��N��(�ԝ��A����@�źk��L&�\Ʉݪg�cmsꚸHfZ�)ms&inW���2l�Ia�T�DHF���\��u���⸁�����q=K����8���upM#��ûef��a�n����ݢ
�HS�	�gu���}n���}��qPJta?yͺ�D�ǟN��cq���'J=I�e��13�< �+x������Dl��w�M�rI�i�+�e���=x����	��k������RD���T��D����T�g
q, *	DB����$�0��*����jI����
�<2�%�\�m�24�<CdWymS�nH�ܲ-�B&��ۄ;��l�[Y};O��SbM�]&C��L�C(���^�P��_��l�.�v�=��ܸ��7���}WB|esW_S	�3.�K[��{_�6���3D�Ţ��3��f:%3��C��$��T��Ke��7YM^A�Nl.�l�TD��{�u�m�p��I�å:��]�����3LdDe�S\�y�1L�-|�5�م�5X��-���rڝ�
i8�,�Y�+��a�ŗ��	�۬�}�i�H��6v��
+L�a9�a�+3��Sfj/�W��� &B�>)�9RH`��e��2�m�x���6��{K"� �@�$�k䭼�����B�����YQrj��h�
�7V���wr~o#�J�*ڑP{��j��)�+;ɥ�]5��.����8�f�'��n$���!K��{���?����k�ͲM��S��D�a�Ⱦu$������r�g��]L^���oJV���e"���R%���q<Y{�I�_<̚W�\Ն��r�P	����3r��q������)���̅��?��Pey�?H��+E��sf=���(�*{���_�@����}�ON��^���W��ɧ���[�fRE" ��1�K}!إ�)�%9M��C��_�踹<�;����-3L�    1����M��}�&�缊�%�CAk�
pyTU*�a���_��E�����U�OS���\��	�����ȉ���M�ȃ���+������$e;����euYo����je,�Ҧ���h~�7c���uO��s�YV��u]��R�J.�8�����La{zd�Fk��Y�RY�'%+��e�� %Y{��Y:q3�����,:gm�LZ�UP��Q6�LK���:�9l�C�����d�&��FK^�p��F�h��F�h����h���,f}�~��)?�_�����}�A	��bj��,�����F�4u��L�l��zU�*_Ԃf�nk�)�zum~��6M�+��8Y�ffkjl0���$F�ʠߚ%�^����+�R��y'i B��V5'�Fs#�4��@�F`f� 4��d�/O����y*X�!y�2[L{0`�˪��ge�F��㏇����{w�U$�4��Oޜ��d�L'S����"�- ����Y�ͻ��!������J�Q�0Lb��д�t^$����=1��|)ȵ'9D3^��Yb��E�^b��Al�w����H�2�d��`�Ul=���� �����9�a�~o� W��7?�$
gQ��.�$��Db�x�?��OZ���4���V�����q��<�0�ۀ-����>���)���>�p̨t�}���OK O��&+���1�*���e	p�u&]tx�t5�Д�����gjYv���iЪ�-�r���L�p�eJF�-�`��jߙNM��U�[�U�q��w�|�ڴ𤟼[z������y��*�=V�f�(0��XK�pI�DO�ȝ�v^���B��������B��XJ-+0�������:�?�o��K�enIz�Z׬��*�l�G�5�M5���:kD+��I�f�Im+�? 4�������G�z�����0�U�]���F��>+p�̓�$~����?��kI�\M�z�g/�v3�ѻ��H2��:>!c������B�-��5�&[c�n�5�F�$Н3�/���h8�*T,�Ig��~�v�npYuW�����uM+��Ӗؼ��q�'7g؜s0M�t�gZ��,Wh�[��JǄx�Ղ�6hd��F=X�A=�D<�-4Uθ-s�M>�H�\��*q�I4�zV���#ά�՚2ƥ�����-��6vg�����@��L16�?v}Y[
�=Zw�����p�#�P�v��_��3J���Z�����m���d]4�3�o�D��C���d����J�R@�'�ɻj]j��ZSۡb�2;�����dv����Q�����D�٘���b�R--R��=m�tL?�GGվ���`$CIt�0a���&H�6���'ź��3O�K�Nv�I�+�LW���0Q�)���֓�!�<�	����b���88	a�'(~�^�ש�t%*�k,u�^��Œ&f�BB�z5A%\R�eJ�+�ܠa\����[kC
�)�.��=վH�ܙ �v���м�J�M�H�d{8H�O% �k��58��}~I"Jޢ>�Y�>�F�*��äm�n��5��kw��D#��E���ֵQ3����t#�E�:�]Ũ|V�S�3�� f��80J}��T�g e�m��vAtC��p{�!,RT3b��ܳ�m#\Df#f
>DP�	��K��ވt`�2ICE�Zt�)��5j����{�c�No�"K%פ�`��[(�<�σb��X���M;���Nm���-"�M�p�ז��#"�
�%�st0��>�8Hc�:�����ǡ�)�n_�
��3 ��+�(Q���
��h�Oo^e'V�����-'��ڝ��ѓ.�N-��K�L�zt�_����������:_H�E�>eL��N��_@�Ǚ�83g���x��3�qf<��83y1㊵�H����>���/����w�����~|���|���'I�� ��T��V��],��C�������JʵC�i�r`�BhO��/ei�al����~нU�X�5/�T@�4�Q���4U��=�1%F�Q��ds�E��yZ��u9�	�%.f����, 7h#tn8��R��{�8P>0��_��.v2� �fVon�3p�o�����J�d����3�N{�-�/�E�����6��̞���&��'��m��+1�����I �M���i*`�)tnK�����=�WlL!�(e����;���mMH��Lr�[�؇�mUJ�KQ���r�hŬ�ԑL�� �b�#�D�ť�����ТW��-а��e��c�f�5���m�S ��zu����ް��HL�`>b���$m)�

@I�o��e� 1��9���8�$��QdL��?₱jd�y�r�ö��\U}ɩ���*�[Q ��! �jt���	Ԃ�G�����fD�hؿtu'3`#V�;-IX������`a��Jb����dʾ��c+Mn�|f��0�ʝ%�w�b1�'Ln��IL�
B{R��OӖNZ4��'�3Bbv��܎{׸w�{ןmN-6�'oM��q{���I���u��<�_��q���r	�7�B7ƙds����J�7~5,���qջe��>�C�A��r���6N7���1��S����S~�N;��wP% ��������Z��kx]��˘���@�����^��׋�k�nt/�o��������^��Hp�%�'!U�׫����:�m��[�A��R�,{K䅮��BcX���XA���QM�B�#��wM��}���՘�,v�,b|vU	���m	�R���rq�k�g����H�����sJe<p��vF\qj�%8.A,��)���&oW����>�`�3��UX�6�a&��jDLa��("�1�5���ʁ3���_����Մ�H̰���2d5� ­�u�X��(�#:F�e���BR*
b�V���̓5��*�qQ���_�hK���~^횪W���l���k��ӋZ�����K�j;�:b�v0x,��������٤��*��\\��7ʩ*���pLP�e���ՍLQqz�$�:�8�����2B2��4��8��Ҩ;�ğ��p�@�К-C��v�u<�g��[�]$�0���&��!ʝ�`%�g?�襱�(S��PhL�]�2a=�B{^r#P%ЇQ�T��b<���0����]^L�k>�e.�ײRj9,Mr�+�o��.9�h��z!A8�%)��i�N�����^s�)EY(V�;��r��nl�l�E7�Z8�c�����*�ѩ�����-Pna]����l���t-��L���4�n��
{\<�����/�u�I{y\TrJw�%�����aVNj��ݏUn	x�R�U���a�NAw�brk���%C��^�z]�UY��@#�k���&�Aѣ->4K�6'N0�+�pĄ-�}��C����������T� ݹ��V��Q�@t�5nX�5nXo|Ú�T�����лS+xq�Q�`ِg�&������6��Ւf��\-��j6��%l��Մۄ�Y�caA��!�0L[��{���4�J|�%
%Z
�^�Y�����z���P߆%������ЀFS�%����׿Q�I��8&��*l6$P��6��+��=>:�266��T�G�B��!��8�����𲑱�)�y�f�j��M�)���N�|u��Z��LY�?�
�rqɻ0�t'���Y:��t"t�x�b=�q '����]
����� cE�S��a�KyM݇B���Y�����m��u�K��g�.?�pa׈m��=�-������t`ԈЦְ�Q0bI��Z@@�U�ǔ�����~��0W�2�^L���V峖Rs���V?�e�P=e���Guw"sd�*5�XR�#��>/��q��Щ��v����~�G9Ә& ��rNT�Jt"�2<�l	�����Dja,�~g�#Z�Po6�4f?�Z�NY��[�ik�[��=,�E�1N�H��S��� b�#m�~;Z�)o)��ԧk� �xTthx��}reJ4�)q[��'��m�c���}��.d��"��J��=    ��F�#�#��gJ�[���3��X!�y6�ty��sMw�#�>�kì��Xg���{�����v�Q.�������`z:p�!�v,y��2�LP�K�&t6��'ɖ��5ܰB2�0Ok��8G�0�
���Q��k�_� :g�XL��`��+mv��?�ge��c�xH}M�%*�e���|�IlRU�t(t+@pH��,r��B���և��Ӹo�C��x���y�Mq��c�dȆeT����-�&��8�2�"���a����)�nL]s�s򪪡b�6ޫm�x��}��C��QGy��p���(M
��$�NI�@z��sT��߀o�1����ǻ$��
�Dq�W�}u�W�}�w�W'�x:XM�'M}����&?�X����n6����$��0
C8Uo7�l�l���+��{n�l-.�}zV�V%�w��y��B�[X�d����571P�n��l=�_�M嚤���F�if���J��g��$CJӋ���H���=ʢ��U��u��U�~�<,���n�Z�M6�3��VI	*;4d��Z�m�if�*l�v�Z>q4-rs˦��6�F��B(9UϮP�*�:�ϲ�M�d3�NB�Ί��ҙד{�p����>�f�@��c<G�u�7t��6�W*[s�3D���y��$��F���Y�|(�I�S��{|��gU�'ah�Yȩ2ʸR�t:������2�����w\�Ϲ~'/�@�v��,��6�O�uO�4R��.p_��(4m��}�#���g径r.�g��P�����n�����e=w��:,�V@�]��а+�_�Sg]��0�Љ��on.�<�t6y����%#	M,i��W0i�T-aS<�"�.���ވ��~��-Q׵�,��:�����Ѐ`��]��)�j�dҎ^�'l�2�\�aKN��b����N�!Hٮc<F?9 .k�Q�"���������Q����{�~�8艚�%���W�C�HL8��j,�K\rܩ3
��,����)����^\�5�n-Q�D�<Z�pk3;v|��+���Ѳ��Y�k�W���8}o�w�}�t�����Jp2k�q�B�"�%�^F�,��!�ܚ���}���Ydzx���,60�M�ۧ���^c��̈́�P]'�c�W������o^�B�k\�w�S�|4yRo��ΰ��\"' �ޅ$0��raI�A�-�3�+K��ť��[TM��[�{�ۃe�� 3E �t�"��|A�6W8�t6ɨ��e��o,��Q�g�
�;�4��l���2q�YQx)ږJ4��<�r��H��o�kN�K��ف(tE�'�P�L3�]ʝ�2�ݖ�i�x�ה��eF����%|2ˏ7aă6x������0�A�c�Z���%��rЪX��\��ySp���59���뛔�I����U���|K*�S�Y�*�$R(#�}��t�|���y�-%D�t�R6��`��u����Y�k6��c�nW
�5B�VB+ ����Ǯ�D��4���M� ��e���
^�	pܮr{)%u�������.����c��_Gzf�E���B��-��)�.%�F[�g���h%&լ�!Ϊ���G=.y����*Ҽ?q�y�j@\��f��4��u��B���Eǖ1r�i����&z����~;����7*����Qagp1VTKl��GO�E�.�P3�&�ɃVf楁�ӧ����y��J�[ƥ;.�׺t'��<&��-��vؿ�t���t8]'{��IB��PW-���hb�ud�����
�R��������Sc�Bq2`kZ����\��$)&M�V+���[��������r>$8� ��&��kH"����Z㈯-���@M�	m)�%�'@��Zm݃�7|�K�����mn�@�����b�j�NkSJ)�d���G����e�CZ���3v���O��]��E��]��PX���/7���/����b����~���G����Yg�*б���Y�p��p�Əwϵx*�ֆ9Vi���+#+���m�y��9�#xVQl���Ӌ3`��We=��jH�.��.��mͫlX�s�.����X�"D}g�z	9�~��9�����@M�a���dl���{m�!eZ8�R*�c50�>a�$�(�⽓�;[|����!��`�I�q�G��(����ީߠ`_v��o�xr�3U�K�3��Ty�Է7�p��;�i�?gMR��{�$ݳ��b�b�xY����,!�:r���&����ɗ���NV/(2��{L��4��U}X׊tzH�1��Q�h�(�7)K���c!�9�]&�	.�՚��l�:8
1ҳ`I��!a�F&-!�4�� u/������eY�:�cT�K��R�@=7�i�u��p(&�r�1%|��!�ko}YA���� �U���ͪ �y�ñ�<�J������vM��]�9�X�:������R��j�*�\�lu��D�t��r^]�	�j�,$!rp����� ���2ґ�]C�M^';���rGXS�ԥ��-˃��u$[�A�bZ�-�Ւ�݊����l!L�5atDv���n�xD�u�����ġ!�%D�@��r?�Ɓ�vGOOK��+Hr�!�����(K2�pS˪�wI\�¹��]]ߚ����אt�F�o>>Na`U1��4�D>�7�ܷY�8�흷3cnPXA���&�u'�ah��W.�2	]��5�?&f��1�0՘ɝ�_|;W��CæTdr�V$�p�њ �PbR�k�����+񛐰��Ir�����sȹ����T`�B����ʿ�P����A_Nm�M�d�X��R�G���V�=DK�j����%�5`����~�ή��e�������]��_xjN!M'`�:���
1�IH/��Lz�@H}�UDf�%�d{��e���n i�hƌf�hƌf�hƌf�K�1/줘��wr�������<��7Ǫ� ʪ�1�'4��3^�W�{hC�=���+�K�s݄_4Ɵ�3ďTJ���02Z`�i/#��W�OE�W�ź�̵�5dS�l7���\R���	J{͒� G������'k�9 �N(�50cP7�@�=� N�7�]x��HBD���Ұ�UD�t�iD��:'r_���պ/e���"������xן�u��.��2������H���֛g|���l������;K�4�6��rR%����^�As��k�z<K;8K�5K���������X�Ѐ�
>z�]9��TPnpz����u)O^�Z@��[_w�&)�����D���>�?<��L��x��b`�<)Ҡ��IA�\�*_�V���D�`�l��e�V��8ZZ����3�#���<�74?�.�`����N*�6�͖,�G]���k�u���?|[/v�j��$�Q��縘P&QÙ�-��cƷQ;�Q�1�mD���20�˼�6_45�;�Y����6 �j�
M�t�GHd81"�6(�U�����o��0�j%��c5^�y��'��*��	k�=��^kͼ���y8�@��ٙoAh��z#>��_�Y.��\�Z6�8}�W����9����J���ɗ�Q��G���4��<Aݱ�� i�ң���J)�B���R�:�K���"���-��10�,A-ÂZ�[2]�&6��(W�7����MF󵭊��c0V�oa�-��c��f��q�l#�l����c�?��}��~����r,��5����[������|}����%>b5D2?�S��	����vT�U��T�O^^��w��ܝ�IR�<4�^tZ����@����Rd���vH�Q��N8�jG�?��-]��<�_|�^K���(����	Ǩ��-	ZN�ݘy��Zy������j���L����7�>�4�mP�ت�P[&!��Ֆ�Ug�%���O��W�=OɥE��ATJJ�^"�!_1�}�\�К���kGbGC' p���m,��X<ğN�:s���I�����h��3��C��p�u�_Bv_t�<G�:�jY����w⁗�ɛ�B;d�cg>��9u����p �  Nߊ�I�����P���Snrn �Ubm��K�צ��F���z�%�K�V�*�[�d�z-��!���4Rv���1�x`�n�Z�B�9�7Q��^�Щ�V��6�	8�
� �hܛ�ҲX� [�x:�#�!C|t]�cy&��#A֥R�yf�-H(:�	����*��
�΍����?���;3�΋3�:�+�<)��l�����c��~pԇ�>�����K2���kQ�i~�kL���w����j,K���$���Z����71T����/b�����u���n���R�T�ht>�J�
�˶��1�"X�]�z鏠�qʤl��U_��R6�|O��(���ⶔKQs��/m�O���bE@�����I�f�"KY�˪B3|.QG�ˠc����'�2քK�����n���\?�%Ɛ�{6�����w8�6�oX�\��G���m�#��}�����>��|w�[�u�؞)s��'Os��̖p���Z�7d	��C�H0u�W�B~S3� �f��;W
�沖�"�÷�g���ӞP�Q��-���9����	�̾!w(X��vw�}������t3f`ߐ�Hɋ����C`uW��݅M��ɖz�����������������[~��f��%!�Wa>�뺻47϶�Vt{�پ����+�f��W�~�Ǥ2�T�Ŭ5���Ąh���;�"�H�,��Z������w�S��2���Z�=~^����A���It֋h��ٷj���2H�!�^h5n�E�C�oI��`�Բ2$�Q�Qxh��F�m~��'��� ����E��&�E.��tU�>��z��:��b����Jž�	i��ҳ��4B�q��c�v'�5rOJ��4G	z��.�$�U�Z� `	s( �����ԲƯySH�?�C��Ҡq�w�q�w�q��v���׿L����<�69�9�&q�XJ��a�]�P��;Ԁ�e��>�����I$"(
n*�H�	RAO�Y��q ���ŕ-� mN��]Zy��lD20��	��[e�nw�S�6�rY����oq��vPGj�tI���0M�@��Zj�����v#DH�Y4�������FL�)��T J��=���Y��Y���(b�Q�c��mQw����E��1P�0oQ����z%:��ה��w����� 6tS�K�;�%/37�yb	ռ��9L���9�����plkQ�}��a^���\���VP�-q��Vlj���� ��V.$�9)�t�^���nuk��'��í�CS3�d���]����F�?�&���/"j�f˾4'J^ӺCC�3V6r/	wU"�C����-�_�7��A����LE�u�����,�*_�g�7ᘠ�����V�T:.f��<+?ُ/l%+U�l?qQ��)%w�mI�Jw��֧]ڲ��ҡ?�	�=)��z�h$MXbXHĀ�	&n6�@��(""�?�	�^�[C��̾��C����I�|���N�A��q��?�>8y>���o�һ�,����p۝"���ZK:U�Z+����u��骵�l�Ւä۰.�n�c�ʔ�H4�0G�h�5�R�^57��g�Tf�ul?N���!��$�ЩUP�e���몘�t=m�c�2;O��1R�##����<	�O��F�޹	#�;G��z��V���%�� -z����ֆ�,�u^ٯ��5�I�#}~�Xk�R��d�@�2[�!�5e.�j!�Y���-V���A7��~k�:|�D�yH"!}�ޞ����Lm�,m猍��ظ$[�Vu�POL�ۃm8t��<���r�=�v@f��K����| EĽg��x�g�C�^#""s��a-	�d��Jmu�eTi=�s腛���Km|�a�%q�7���b���.4��b�Mk�s�B!�P���o�@�9{˖XH�`M ��Z�������Z(5�2�����S��RT��s1f��յ��R\)t�S:��DA�v�� �":��ڕX����PA�ڪ�/�8�e1ֳ(_���/���~W��8�	�q�.˃�f.e@C�����j!�pX��}��w���Z'��,��1zᄒ@D�#v�CH��.�:ƒ��4�(��VY�Ѻ�H���	П�хD�
`m��K�Em5�1����]�0�Ln8|�d�,×�șeZ�E8�3m�0s��6 ]���,Q�0I�r�gT#�y��K��R���������Y6�2�@��	�1��{_��[�)\R������L�k�NGAN�.��cs8��E_�L�Eߟ�%r3$9�;��K%n?z4�Z�t"�K�*Y-���i���hk�s�H(�a���}��{���d!���)V�d�4����B/vpR9NV��ݑl��o�C�h*��b��,�'7�4��n�=�����cGFncO��ݏ[h�h�{��I!�����J�\�G�ST7�� K9@z����.��ģ�t�~�N���t�>T�g����1��q޳���2'b�"*�RCE0����U�_��V�����λ�ha�t(���?�Y��D�m�؍9#u�~��eĳb�����:� F����cU۪y�1�C*�᭔�[U}�xmM���LUq�}�"G�=���~�~��z�z����׸���v�C����֫�.k��l�HMI��B��5�BafHm�H�7��:		 ���˄q{	rG֐�8[^P�G/'����3����]�>NMRqſf��3$���S���3�8j	|i�h��c6�{[��teeڰq���q���wo�;uR
G�wF��u������h�~!���?v���S���1o�i�w�û6��q_�m|[a�y��nu4$Gn_���-�\jD�l/��Ki�A��
ј��C4f���O�c�Uz����ᨈC~Ӏy���e(<���g�(
�`�K\i��P��U��b?O�c������%����ۆ;`��Dx��'z��^��}9C�Nj7��8�����U�:=iyCr¤s��q˺q��k�9�	ْl��-]wm�|��K���br^| �}�g/��0NPM|�m:�9̇����
�Ƞ����0b��H�/ɳQU���`���R�9���~����4N�0��8I �,�۞�F؏�r�C[�����A,i^��i��z����TL��Խ��>�b h��U�,2O
c���Y�ׄ3<��\y��ZR�c�)��+����H��nL��l� s٢�����0�C�L�X2M.�-�,xҔS��Bq`B��霔fl�D�/��X��%:��dΡ�"� ��mҖd^�
��@����l�HPN���tU�r7��<K�Rv��PD�)���^�$⳽���W�JF��-�!��ĨWG������u��I?yg��]��g�L��}�.�4���
:���'�r�r����j���Qr��3�s=�Dַ���x\�B܍d+�:���t�zS9��>	���=R.���U�g�s�dZ�n��%�B�gSq�����w%������-���ͫZ�V�uz��NA៨I�Db59�N>���?�i�ߢ���<�p�>}���ߵd�����j�V��G��C�Q�<%*�����+N�3�*���p'}x�c�d��XH�ɱ;[k�x�1��ޯ�n�\�%��J�#0B�A,G�w�ء�!7�
qٞM��l,e���,�i ���D����DE@���P�RJ����Q��4Yv3]�1)Q��������I�Q(�dt ��E΅��r���9H @,pP�i3h���eZ�gY�>�d�}���ֱ����=�nS�p�]�n:+�:�5�+��\�?`��da)���$���H�(Q�SB��g""� �������6�%sc�'������Z(H��j���d���W�hX
qYJm���"�ѐ�5�G*�ye<��(�զc+�Vԗ�����_��Ҝ���d�
���L57�srV8�I?���N9�*U٨�^P�M^l!�셖�6��u����?�O��      2   �   x�ő�
�0����H�ts}	���E����n$lt��(�˟69�����>0��&�m�0�e'R�#Pa�����.�v��{��jk�p�zŽk��ɽ�k~�,�$�SF���Nl�0}Pgc��x4H�18��qQWS�F!����+�κ�ًy�߇�      1   �  x�E�ٕ,1
D�����ZA���vq�~�C�!��Ϝ��gg�����E�+�΅J<%���Ο�F����sK�Qt}�w�ܯ�:�����D�+:�~�}�R6�hY{��C�������1�ƐUX$_�u��U���B��GW��zt����B�H����xEQ�f��Z�ҍ�F&z��Z���gAU(��=��z(�E�	�vF��:�9p�ڏ�]IQ<�M��j�Oѡ�bc`�`��N�U@m%5�U��<��D��b׸60���o7�Y��xf���k:6'�`�j]v���a�Di&0��%cv�@;*�����A�����U2���*I�O�Cz��ꥷ[�*�>�]���~��x�F�Y��V���]
�c#j�E���v��US��6c�~`����lD5����r_܇P��b5X���쬨�L04�6����]�lѷ] hȋmT��d�\{:7&U0����90k�1�H�VRp,,{�J��v�XM�)���+`�6��M��ǚ&�T��-x��6Cn�(�e7FKT������6r���L��	wQN�Y�s�M�+�#x�jr�c> �K���%�5�j��ۚڣ���mA����jy�Ү]�����(^k��?�������6j��c ��`{v˾amƾ���>)���S ���y 5�-^l��*_�_y��-��,YA��Z�n���弯�����W��#a��
���1՘Vi$���TѠ��&��Ja>�TBy@cO,SP�WPV�+[\<E���K�[m��,����L0�i0�U~Q"W�?�fA�QP͉	�5�m�ڃ�:��r��H$ˉl���mG��`ܒF4���M��P--�],~A~0�q��ZX6`�+=(���20�<�����n�s���:>E�q�"�ms�6G	���˾��,� �N�N�i��Z�6����( Z*aZ�<�@�$�''�ʁ�F_���~�YH��Ksn�x�1[Z�Z2�^i�;�vg�fpt� �{H�?�G)G�h΂:��L]���q�r�H�&�pB��%(�=�3���Z�	6
0�#L[Ǳu��l@��l��;�wV1a�����85y��uw�6�F9�hvH���1��)�u;�c�tҍ�,XRI�0���;�8`9�����6��C�(;B@Uv�:F*:hЈ}�����wu/A5[�LQ]>׷��-v���]XPQ�̠@�s�.�DLEm�	���U����i��{'�v'�t	}%;�P�2�	���̨�rKT�UP��Z�\�*��Q�g����i����`C�� �c�]�_v�^b�IAB�����%\�N襤��u8��:���`��Q.����*j����+a
�/��}�
t��r����TTx��/T�����n~�T����\U����\0k��ma�15��+�ɉW@A�Hؕlm�D�����{c��!�Eфꌨ�^�A�,�RT�"���Q�-(�q8<VQm����qz�1g�U�=(��8<d��.*|5����֒Fmi�fL�U����f����S�~
���O��*�u��sB����a�4�Ͽ�y��U��{~��yd~a�����(�	�֖���Z� ����`�Z�[pEk(�}(�n&�'1�:��F��U�jJČ�4E�Z� 
��J�򱒉Hy�|s�-5�~p%華�$O��M�a���L:�I"����]c-#(CO�D�3׀�*]�wy	����*�(���@/%��6��2��J��)���1e���v��O��#�=V�2�թS��+�x�#�'GrzG?{q.S¦"��7�t�R��	�P�#*�J�BK�.�"�z~���5�Z�B�\�~o�h��؈7�l�������N�����
�\k��?o�z6�gy�;,�@U��O0`����pף����Q���xl��l2_�r�-JJ$O��o�%$(�Fh
�:���.'UL��@5�$���gw���P�F��\}�OP9��s���2���v�.%���N�mg�6�T��IR>�����aw�3a*��3��f̻��l�A�k��ҹ�@�bA��iE�v3@Ƭ�{_�n��R_�>'�>E \�HZ�{�M �\�@�����uW�5�ε�����U�J�^`���ia6F��/S:H*�ØF���N�*�y�QK=|*-��tY�Y�}��su+�[i�Rz��#{۶6�ֆ�B2��Q�q^�O��?�v��W�t6���VN�>]�t틳��� �d���l��z�Sk�wk�t��X�K�@�.ؼ^P����ktu��A2ŵ�L��]&�Qh{H'�Yk�'��Z�b�n,�5���hS~���*1k����10��h�8�%t���8J����u��40?��_����������jM��Ŵ6�觿�L?��:�6?����hiI����P�W�z�_F��r+���h|�?������5��w� ��]g��|i4ˮtwtw��d���C��J��Z���e>����ε�����V�o#�1���;W
�@Z���+�ʚ���� �X�.^^�P�L�؍��Գq�n�3N��
��#M����Q�w�#��;�<�(�0��?����3���Z2ʭ��^#���XN�	���3�*�o�#Z��)֬�##!�"�-O��Z=���,�I��g������k��Gv#���v7�_�x4���&�,���ĈgF��+�+�w�X��2��q���$���������g9u#�YwW���������cۙ��5*�'�:"ͻ��$�_�|�SJ�p�����
eqJ��/��oI�hx �LYLa K��T���ˤt����6����/�{�ݹ;���H6�щ��Y۱�b�G=�<~h-Z-�8m�J��+��v�^ۡ���L�y��C|�]�y1^/����8}/��<���~�Oa��a��t�)kp}|%֊_*�Ji�w��;�t\u�����,r�?w�V��=}x�Oa�N��(�j��v�s�������2���|:*?�����>8�"dr�ޯ�ϼ�C|ى����?Y�+�o�d�����q[_\���9u|u�s��J�^��Y�Yk�U�/c�q�U����=���\�=vxE�x?�\�cC�CI%if����O⧿��~5�������N_N�/�Ӂ�2�2��	2�۷�2���^�@�S��7���V�|�I�~+�_k�e��U��`��2���mӷm���-ش�?�
qL�ns�8����&~��o�x!#iS�m���l_�=m���nt���ۜ����6�:9�4�f��	x��ྜ�z~�"���q���nU��*����w0�E���G���~%�ي������V� �^�Ij9�SA�ht^ztbz83-8f�7�h�|��C8-V�Bq󺮕�οjüV7l���X��F�yz�*�D�\��#�u%1�Zj��0V�;���]f��R�b�!�J�J�~X�]��T���qk��8ڈ�N��id�N�غ�_��/��,��z��L����9\�XBbr�v�zt�z(9���(W=��J��v��n2�'�=��I���l���z��8X���>�d�M6l�ݣ����6J�,� y����p�������v����q���''� �<�X��m��F���j�KydG��H9��Eݱ��5/���<�Y5v�%
�4��+Z*+�Z?�R;~@���X�6T�G�:@O��#��W~+@2݇?��w��W���|:M�	f�&QR;�Jx7,�S?
(d���}�$}�
���Z��V�8Z���]q�f߽�wo��F�q��utIR�3N˵k�-w�}(.�T�\� ^cym~��)��y�щv�`? ;U>Ȝ'���8�:���|�R���8j��V��z~}�Ս����vr���A���̜O�Hi{���u���'??:
��Vr ��:kt�#~�,$�����k;}�Y{mad�n>���<'}__�����k��H&�8�����Ǔ�鿉�b9�N�P&��u�ǡ
��������������      ,   R
  x�]�͒��@�����dc����*�T%�ld�f q%��y������lf��Z����ⷿ��l
����_�Bڬ[ByL��n_�Ѓ[e�lz�My.��N��
���ݾ�K���)�b�W׵�Ɨ5���d{�,�JT�t/k&���n�ߢ�#f�7W�CY3���3e}~���5S�`B���C��6$1��@�+�����.|��Q�U��7��2��1i,�lN�SZ^�"�W��sq5��V6]q�\�^6n�:�?��~��.�N��T�{/�xl�K��h���
��N�����J�������ĥ�u0U���U�8����cS�w��LyTH����X��<�����T��E?��x΂wn.���c�����'�a��꩖���3�i�W�s�NL��]v�(�	��ĸ<7���������f��a�To�$y�j�a��W��~Is_�+qC��	.z�ي���ne['�N6�l��e���;ۊ�˦	�/�cR$M�S?�$�%����C�3�I�v^'����|`Y!LO·?=a����9y�y{�YO^?��=�����-^G�y:��tx��s�d"=U��.��3�{B�Г���<N�<��5zo��\v���~�7���}%�ʮ)��v
Q�;"�6��Y�	�C���Z���3ߝ�W��y(���R����XP��O��Ln�O�����5T�$�ҩ���GY
d����+�)/����-�� �r����!&/.��̵C�?_��m�\f�9����,Y�(�S�Yn�����a�[v�Tp�5�:��aW�s�3���u���3�%	k"����+ �~y��+y`�Q5���R���_��װt�vJX�#G�,Bf-���(�b�̧�r�[H��} ��H�0DG�ɣ���O���b�LBog�A����=^;!
⥸-AQ�͹�b'�Fw}6�ϡ)�g�Ox*�D��eW`*�H�AnE��&9+��`��~Eb�h%3�pt�$h ��?�|i��HD ��YP*8 �j2��+��vj���'j�k��'M���v!���A`8�b
�e�->+`�C����G� ���2`�=e �O���Yt�K;z�uh���8�i��P��mQf����*~���ߌ ����2����lR���+���C�wM&��".W-�qӬN����}Lf��B��W,2hM�H)ӷ�bE)���
RCϧR�1����N��N��sA[��jNv4�W/�8';��ق��N�h"�O$���p`�:�ؔj�2�b씪��&�E[�l󌌝{���}p�\�"'d��H-�u�9��V�yG�a�l��>�TOVٕ�\��j��s�q��d��3��T�I���8W+����G�"@9��H�R��i�`�L���G��{�H=��iwY�� ���׽[��3��/�kր�4�J���d�qߥbΏ��MAڈ�5�
���a�,�8`�P� W�S��������!�\VGX�o{h����z�e.g���j��g������+lffX1Lh�+�"w��
,u@ȼjgT����Y���>t`��u���r��yN��fJZ��3��?��y$o��v)�-����#E����w -�`��;dh���y@����{ w�;��7 w�k�opWNp:��E��2
~�5�oW��T4@wua�fF$l�wMH_�/媟������������@x�� �d�$�!0�c��]��%�hK��dIu_' ��r�}��hRdd'Om�i*q�����g�╓��|�Sk��M�ܚ��l�'��If�����U|��TI� N��T̔����S�!���k���~#\
/� �=��Z/���z3ߔ ؛�5@���5@��d@/��!�I6�����w�pڻ\@�/ŏ��đ`�@��+��։'aM��T��\D��ى;A��}��>ʞ a�l�!wb��C� �_����7P9��pQ���:$�@�"�=@8���m��|�ǔ��� �h���j@0��k��v߸p25�MfDfr�#@�ݐ����Fˣ�n���u)����ڦ*����S W"L�p�ʋ��r9�f��7��nx�ӄ���
��KYR06�qK������*�*��S��p��mfJWh�>-͹����œj�)����M"�����?��[��&��A,BW�qD:�DN�Vy~� ���-����UAӄbCU ��t�0M��J��qJ�q�,V�X���!�B��>��k��!���y;�(z::
��:�
��/���A�j�����������[���37C[B5��K�n��4�V9�J�;�:����X`Q*����R(��>i+D���̅�
XnB!)�l
'�ܸ� 0�s�h$�}j�\ܤ�w�_pQ��F�m:�
2�.Df%{%���I�XHo�Rˤ�`��i���m!?]8O�!��ڨ@a\m���ĸfR+���.�K4��[���r��s|�!LL�3�\|p)�a��r�?ZG����D���*���*L|�^H�s5���I8E��fC���  �o	�������,�6W�     