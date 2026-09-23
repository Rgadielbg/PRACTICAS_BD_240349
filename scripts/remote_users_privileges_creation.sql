/* =========================================================
   1. ELIMINACIÓN PREVIA (OPCIONAL/LIMPIEZA)
   ========================================================= */
-- Si deseas reiniciar permisos desglosados, puedes ejecutar este bloque.

/* =========================================================
   2. CREACIÓN DE USUARIOS REMOTOS (%)
   ========================================================= */

CREATE USER IF NOT EXISTS 'marco.ramirez'@'%' IDENTIFIED BY 'qwerty123';
CREATE USER IF NOT EXISTS 'ricardo.gadiel'@'%' IDENTIFIED BY '240349';
CREATE USER IF NOT EXISTS 'rodolfo.hernandez'@'%' IDENTIFIED BY '240836';
CREATE USER IF NOT EXISTS 'jenny.canales'@'%' IDENTIFIED BY '240556';
CREATE USER IF NOT EXISTS 'aaron.ali'@'%' IDENTIFIED BY '240045';
CREATE USER IF NOT EXISTS 'maguito.rojas'@'%' IDENTIFIED BY '240242';


/* =========================================================
   3. CREACIÓN DE ROLES
   ========================================================= */

CREATE ROLE IF NOT EXISTS 'superadmin';
CREATE ROLE IF NOT EXISTS 'admin';
CREATE ROLE IF NOT EXISTS 'seller';
CREATE ROLE IF NOT EXISTS 'buyer';
CREATE ROLE IF NOT EXISTS 'support';
CREATE ROLE IF NOT EXISTS 'commont';
CREATE ROLE IF NOT EXISTS 'user_not_registered';


/* =========================================================
   4. PRIVILEGIOS DE LOS ROLES
   ========================================================= */

/* SUPERADMIN: Control total del servidor */
GRANT ALL PRIVILEGES ON *.* TO 'superadmin' WITH GRANT OPTION;

/* ADMIN: Control total sobre la base de datos db_test */
GRANT ALL PRIVILEGES ON db_test.* TO 'admin';

/* SUPPORT: Lectura, inserción y actualización en db_test */
GRANT SELECT, INSERT, UPDATE ON db_test.* TO 'support';

/* SELLER: Lectura, inserción y actualización en db_test */
GRANT SELECT, INSERT, UPDATE ON db_test.* TO 'seller';

/* BUYER: Solo lectura en db_test */
GRANT SELECT ON db_test.* TO 'buyer';


/* =========================================================
   5. ASIGNACIÓN DE ROLES A USUARIOS
   ========================================================= */

GRANT 'superadmin' TO 'ricardo.gadiel'@'%';
GRANT 'admin'      TO 'marco.ramirez'@'%';
GRANT 'seller'     TO 'jenny.canales'@'%';
GRANT 'support'    TO 'maguito.rojas'@'%';
GRANT 'support'    TO 'aaron.ali'@'%';
GRANT 'buyer'      TO 'rodolfo.hernandez'@'%';


/* =========================================================
   6. ACTIVAR ROLES POR DEFECTO PARA LOS USUARIOS
   ========================================================= */

SET DEFAULT ROLE 'superadmin' TO 'ricardo.gadiel'@'%';
SET DEFAULT ROLE 'admin'      TO 'marco.ramirez'@'%';
SET DEFAULT ROLE 'seller'     TO 'jenny.canales'@'%';
SET DEFAULT ROLE 'support'    TO 'maguito.rojas'@'%';
SET DEFAULT ROLE 'support'    TO 'aaron.ali'@'%';
SET DEFAULT ROLE 'buyer'      TO 'rodolfo.hernandez'@'%';


/* =========================================================
   7. RECARGAR TABLA DE PRIVILEGIOS
   ========================================================= */

FLUSH PRIVILEGES;