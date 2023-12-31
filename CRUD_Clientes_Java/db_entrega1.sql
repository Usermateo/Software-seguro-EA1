PGDMP                          {            db_entrega1    15.2    15.2 )    A           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            B           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            C           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            D           1262    16399    db_entrega1    DATABASE     �   CREATE DATABASE db_entrega1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';
    DROP DATABASE db_entrega1;
                postgres    false            �            1259    16432 	   almacenes    TABLE     �   CREATE TABLE public.almacenes (
    codigo character varying(50) NOT NULL,
    nombre character varying(255) NOT NULL,
    direccion character varying(255) NOT NULL,
    gerente character varying(255) NOT NULL
);
    DROP TABLE public.almacenes;
       public         heap    postgres    false            �            1259    16400 	   articulos    TABLE       CREATE TABLE public.articulos (
    codigo character varying(50) NOT NULL,
    nombre character varying(255) NOT NULL,
    unidad character varying(50) NOT NULL,
    existencia integer NOT NULL,
    cantidad_max integer NOT NULL,
    cantidad_min integer NOT NULL
);
    DROP TABLE public.articulos;
       public         heap    postgres    false            �            1259    16417    articulos_grupos    TABLE     �   CREATE TABLE public.articulos_grupos (
    codigo_articulo character varying(50) NOT NULL,
    codigo_grupo character varying(50) NOT NULL
);
 $   DROP TABLE public.articulos_grupos;
       public         heap    postgres    false            �            1259    16439    clientes    TABLE     �   CREATE TABLE public.clientes (
    cedula character varying(50) NOT NULL,
    nombre character varying(255) NOT NULL,
    direccion character varying(255) NOT NULL,
    telefono character varying(50) NOT NULL
);
    DROP TABLE public.clientes;
       public         heap    postgres    false            �            1259    16446    compras    TABLE     H  CREATE TABLE public.compras (
    numero_factura character varying(50) NOT NULL,
    fecha date NOT NULL,
    valor_total_compra double precision NOT NULL,
    tipo character varying(50) NOT NULL,
    codigo_articulo character varying(50),
    cantidad_articulo integer NOT NULL,
    valor_articulo double precision NOT NULL
);
    DROP TABLE public.compras;
       public         heap    postgres    false            �            1259    16412    grupos    TABLE     �   CREATE TABLE public.grupos (
    codigo_grupo character varying(50) NOT NULL,
    descripcion character varying(255) NOT NULL
);
    DROP TABLE public.grupos;
       public         heap    postgres    false            �            1259    16476    pedidos    TABLE     �   CREATE TABLE public.pedidos (
    numero_pedido character varying(50) NOT NULL,
    fecha date NOT NULL,
    codigo_articulo character varying(50),
    cantidad_articulo integer NOT NULL
);
    DROP TABLE public.pedidos;
       public         heap    postgres    false            �            1259    16466    precios_venta    TABLE     �   CREATE TABLE public.precios_venta (
    codigo_precio character varying(50) NOT NULL,
    descripcion character varying(255) NOT NULL,
    codigo_articulo character varying(50),
    valor_precio double precision NOT NULL
);
 !   DROP TABLE public.precios_venta;
       public         heap    postgres    false            �            1259    16405    proveedores    TABLE     �   CREATE TABLE public.proveedores (
    nit character varying(50) NOT NULL,
    nombre character varying(255) NOT NULL,
    direccion character varying(255) NOT NULL,
    telefono character varying(50) NOT NULL
);
    DROP TABLE public.proveedores;
       public         heap    postgres    false            �            1259    16456    ventas    TABLE     F  CREATE TABLE public.ventas (
    numero_factura character varying(50) NOT NULL,
    fecha date NOT NULL,
    valor_total_venta double precision NOT NULL,
    tipo character varying(50) NOT NULL,
    codigo_articulo character varying(50),
    cantidad_articulo integer NOT NULL,
    valor_articulo double precision NOT NULL
);
    DROP TABLE public.ventas;
       public         heap    postgres    false            �            1259    16486    vista_ventas    VIEW     �   CREATE VIEW public.vista_ventas AS
 SELECT ventas.numero_factura,
    ventas.fecha,
    ventas.valor_total_venta AS valor_total,
    ventas.codigo_articulo,
    ventas.valor_articulo
   FROM public.ventas;
    DROP VIEW public.vista_ventas;
       public          postgres    false    221    221    221    221    221            9          0    16432 	   almacenes 
   TABLE DATA           G   COPY public.almacenes (codigo, nombre, direccion, gerente) FROM stdin;
    public          postgres    false    218   �3       5          0    16400 	   articulos 
   TABLE DATA           c   COPY public.articulos (codigo, nombre, unidad, existencia, cantidad_max, cantidad_min) FROM stdin;
    public          postgres    false    214   �4       8          0    16417    articulos_grupos 
   TABLE DATA           I   COPY public.articulos_grupos (codigo_articulo, codigo_grupo) FROM stdin;
    public          postgres    false    217   �5       :          0    16439    clientes 
   TABLE DATA           G   COPY public.clientes (cedula, nombre, direccion, telefono) FROM stdin;
    public          postgres    false    219   �5       ;          0    16446    compras 
   TABLE DATA           �   COPY public.compras (numero_factura, fecha, valor_total_compra, tipo, codigo_articulo, cantidad_articulo, valor_articulo) FROM stdin;
    public          postgres    false    220   b6       7          0    16412    grupos 
   TABLE DATA           ;   COPY public.grupos (codigo_grupo, descripcion) FROM stdin;
    public          postgres    false    216   6       >          0    16476    pedidos 
   TABLE DATA           [   COPY public.pedidos (numero_pedido, fecha, codigo_articulo, cantidad_articulo) FROM stdin;
    public          postgres    false    223   �6       =          0    16466    precios_venta 
   TABLE DATA           b   COPY public.precios_venta (codigo_precio, descripcion, codigo_articulo, valor_precio) FROM stdin;
    public          postgres    false    222   7       6          0    16405    proveedores 
   TABLE DATA           G   COPY public.proveedores (nit, nombre, direccion, telefono) FROM stdin;
    public          postgres    false    215    7       <          0    16456    ventas 
   TABLE DATA           �   COPY public.ventas (numero_factura, fecha, valor_total_venta, tipo, codigo_articulo, cantidad_articulo, valor_articulo) FROM stdin;
    public          postgres    false    221   �7       �           2606    16438    almacenes almacenes_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.almacenes
    ADD CONSTRAINT almacenes_pkey PRIMARY KEY (codigo);
 B   ALTER TABLE ONLY public.almacenes DROP CONSTRAINT almacenes_pkey;
       public            postgres    false    218            �           2606    16421 &   articulos_grupos articulos_grupos_pkey 
   CONSTRAINT        ALTER TABLE ONLY public.articulos_grupos
    ADD CONSTRAINT articulos_grupos_pkey PRIMARY KEY (codigo_articulo, codigo_grupo);
 P   ALTER TABLE ONLY public.articulos_grupos DROP CONSTRAINT articulos_grupos_pkey;
       public            postgres    false    217    217            �           2606    16404    articulos articulos_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.articulos
    ADD CONSTRAINT articulos_pkey PRIMARY KEY (codigo);
 B   ALTER TABLE ONLY public.articulos DROP CONSTRAINT articulos_pkey;
       public            postgres    false    214            �           2606    16445    clientes clientes_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (cedula);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public            postgres    false    219            �           2606    16450    compras compras_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.compras
    ADD CONSTRAINT compras_pkey PRIMARY KEY (numero_factura);
 >   ALTER TABLE ONLY public.compras DROP CONSTRAINT compras_pkey;
       public            postgres    false    220            �           2606    16416    grupos grupos_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.grupos
    ADD CONSTRAINT grupos_pkey PRIMARY KEY (codigo_grupo);
 <   ALTER TABLE ONLY public.grupos DROP CONSTRAINT grupos_pkey;
       public            postgres    false    216            �           2606    16480    pedidos pedidos_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_pkey PRIMARY KEY (numero_pedido);
 >   ALTER TABLE ONLY public.pedidos DROP CONSTRAINT pedidos_pkey;
       public            postgres    false    223            �           2606    16470     precios_venta precios_venta_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.precios_venta
    ADD CONSTRAINT precios_venta_pkey PRIMARY KEY (codigo_precio);
 J   ALTER TABLE ONLY public.precios_venta DROP CONSTRAINT precios_venta_pkey;
       public            postgres    false    222            �           2606    16411    proveedores proveedores_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (nit);
 F   ALTER TABLE ONLY public.proveedores DROP CONSTRAINT proveedores_pkey;
       public            postgres    false    215            �           2606    16460    ventas ventas_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_pkey PRIMARY KEY (numero_factura);
 <   ALTER TABLE ONLY public.ventas DROP CONSTRAINT ventas_pkey;
       public            postgres    false    221            �           2606    16422 6   articulos_grupos articulos_grupos_codigo_articulo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.articulos_grupos
    ADD CONSTRAINT articulos_grupos_codigo_articulo_fkey FOREIGN KEY (codigo_articulo) REFERENCES public.articulos(codigo);
 `   ALTER TABLE ONLY public.articulos_grupos DROP CONSTRAINT articulos_grupos_codigo_articulo_fkey;
       public          postgres    false    217    214    3213            �           2606    16427 3   articulos_grupos articulos_grupos_codigo_grupo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.articulos_grupos
    ADD CONSTRAINT articulos_grupos_codigo_grupo_fkey FOREIGN KEY (codigo_grupo) REFERENCES public.grupos(codigo_grupo);
 ]   ALTER TABLE ONLY public.articulos_grupos DROP CONSTRAINT articulos_grupos_codigo_grupo_fkey;
       public          postgres    false    216    3217    217            �           2606    16451 $   compras compras_codigo_articulo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.compras
    ADD CONSTRAINT compras_codigo_articulo_fkey FOREIGN KEY (codigo_articulo) REFERENCES public.articulos(codigo);
 N   ALTER TABLE ONLY public.compras DROP CONSTRAINT compras_codigo_articulo_fkey;
       public          postgres    false    3213    220    214            �           2606    16481 $   pedidos pedidos_codigo_articulo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_codigo_articulo_fkey FOREIGN KEY (codigo_articulo) REFERENCES public.articulos(codigo);
 N   ALTER TABLE ONLY public.pedidos DROP CONSTRAINT pedidos_codigo_articulo_fkey;
       public          postgres    false    214    3213    223            �           2606    16471 0   precios_venta precios_venta_codigo_articulo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.precios_venta
    ADD CONSTRAINT precios_venta_codigo_articulo_fkey FOREIGN KEY (codigo_articulo) REFERENCES public.articulos(codigo);
 Z   ALTER TABLE ONLY public.precios_venta DROP CONSTRAINT precios_venta_codigo_articulo_fkey;
       public          postgres    false    214    3213    222            �           2606    16461 "   ventas ventas_codigo_articulo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_codigo_articulo_fkey FOREIGN KEY (codigo_articulo) REFERENCES public.articulos(codigo);
 L   ALTER TABLE ONLY public.ventas DROP CONSTRAINT ventas_codigo_articulo_fkey;
       public          postgres    false    214    221    3213            9   �   x�Eϱ�0��<�%̘��87ƐP].СIs��o���#��,e����_��i�`�J�me����!� *I9;��~"�����N&�H�R�ɿ�]��/&]�e$���5�F�D(V��:�����lWr��+�,x"8�G�#dHU[�Z��,f�Q�<���&?����Is�mE���W�      5   �   x�5�K
�0����*�I[����t���\j M �����1jg��[!*PԿ�w.Q@P&�P����B�p�=��y�@�"\��C�ѯ䯋l�A�&}�;q)�-�5Fx:�Q��r)�
'�> os���I��]Vj	�@�v�y���ٍ�Y�n���B������=�      8   &   x�s400�t\�P�	�e3��@,+F��� D	e      :   �   x�=�=
�@F�S�^���j,�E@,,,m]$�ؠ�7�����+|���'��ý����+�'�4��**��e����M�v�gt�D�1�SZ]H<�ǐ�-���f���]?��^�,��7e�r�c�j4^���ؔwl�C��+D���2      ;      x������ � �      7   W   x�s700��9�0�$5��������5'5��(?%?�����d��1�sbQ^*�m��VTZ�X�P��Z�RZ�6�tJM�Lrb���� l��      >      x������ � �      =      x������ � �      6   �   x�]���0���)N��*�L4Q��r�F����|^�B���/���'��o��8�p@(t7x��@k5p��2U�5�&O�ܚ6�����]p�uH�*j"�EA��������Г��;� ��D0�M�Ӑ�b=�:h��ݬ�=�,��ȳ(���?G���D(�l*�*��%���JH      <      x������ � �     