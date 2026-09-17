/* =========================================================
   CREACIÓN DE USUARIOS REMOTOS
   ========================================================= */

CREATE USER IF NOT EXISTS 'marco.ramirez'@'%'
    IDENTIFIED BY 'qwerty123';

CREATE USER IF NOT EXISTS 'ricardo.gadiel'@'%'
    IDENTIFIED BY '240349';

CREATE USER IF NOT EXISTS 'rodolfo.hernandez'@'%'
    IDENTIFIED BY '240836';

CREATE USER IF NOT EXISTS 'jenny.canales'@'%'
    IDENTIFIED BY '240556';

CREATE USER IF NOT EXISTS 'aaron.ali'@'%'
    IDENTIFIED BY '240045';

CREATE USER IF NOT EXISTS 'maguito.rojas'@'%'
    IDENTIFIED BY '240242';


/* =========================================================
   CREACIÓN DE ROLES
   ========================================================= */

CREATE ROLE IF NOT EXISTS 'superadmin';
CREATE ROLE IF NOT EXISTS 'admin';
CREATE ROLE IF NOT EXISTS 'seller';
CREATE ROLE IF NOT EXISTS 'buyer';
CREATE ROLE IF NOT EXISTS 'support';
CREATE ROLE IF NOT EXISTS 'commont';
CREATE ROLE IF NOT EXISTS 'user_not_registered';


/* =========================================================
   PRIVILEGIOS DE LOS ROLES
   ========================================================= */

/* SUPERADMIN */
GRANT ALL PRIVILEGES
ON *.*
TO 'superadmin';


/* ADMIN */
GRANT ALL PRIVILEGES
ON db_test.*
TO 'admin';


/* SUPPORT */
GRANT SELECT, INSERT, UPDATE
ON db_test.*
TO 'support';


/* =========================================================
   ASIGNACIÓN DE ROLES A USUARIOS
   ========================================================= */

/* RICARDO -> SUPERADMIN */
GRANT 'superadmin'
TO 'ricardo.gadiel'@'%';


/* MARCO -> ADMIN */
GRANT 'admin'
TO 'marco.ramirez'@'%';


/* JENNY -> SUPPORT */
GRANT 'support'
TO 'jenny.canales'@'%';


/* AARON -> SUPPORT */
GRANT 'support'
TO 'maguito.rojas'@'%';




/* =========================================================
   ACTIVAR ROLES POR DEFECTO
   ========================================================= */

SET DEFAULT ROLE 'superadmin'
TO 'ricardo.gadiel'@'%';

SET DEFAULT ROLE 'admin'
TO 'marco.ramirez'@'%';

SET DEFAULT ROLE 'support'
TO 'jenny.canales'@'%';


SET DEFAULT ROLE 'support'
TO 'maguito.rojas'@'%';