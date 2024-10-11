### Estructura de la Base de Datos (nutriplannerDWH.sql)
El archivo define una estructura de base de datos para un sistema de Data Warehouse. Incluye las siguientes tablas:

- **dim_fecha**: Contiene información temporal, como el año, mes, día, día de la semana, y trimestre, con una clave primaria `fecha_id`.
- **dim_producto**: Define productos con campos como `nombre_producto`, `codigo_barras`, y `fuente`, con `producto_id` como clave primaria y una restricción única para `codigo_barras`.
- **dim_unidad**: Almacena descripciones de unidades de medida, con una clave primaria `unidad_id`.
- **dim_usuario**: Representa usuarios con datos como nombre, apellido, correo, fecha de nacimiento y estado, con una clave primaria `usuario_id`.
- **fact_compras**: Tabla de hechos que registra compras, relacionando usuarios, productos y fechas de compra.

Estas tablas parecen estar diseñadas para soportar un esquema dimensional enfocado en el análisis de datos de compras y productos.

### Script OLTP (nutriplannerOLTP.sql)
Este script define una estructura de base de datos para un proceso transaccional OLTP. Incluye las siguientes tablas:

- **usuarios**: Almacena información de los usuarios, incluyendo nombre, apellido, fecha de nacimiento, correo electrónico, estado y contraseña. Tiene una clave primaria `usuario_id`.
- **productos**: Contiene los productos con campos como `codigo_barras`, `nombre_producto`, `descripcion_producto` y `fuente`. Usa `producto_id` como clave primaria.
- **compras**: Registra compras realizadas por los usuarios, asociando una fecha y estado a la compra. `compra_id` es la clave primaria y se referencia a `usuario_id` de la tabla `usuarios`.
- **unidades**: Almacena las unidades de medida utilizadas en los productos, con una clave primaria `unidad_id`.

Este script está diseñado para manejar la carga de datos operativos de usuarios, productos y compras de manera eficiente.

---
