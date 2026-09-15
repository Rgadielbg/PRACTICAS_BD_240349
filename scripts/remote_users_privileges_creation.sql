/* Cracion de usuarios remotoes */
CREATE USER 'marco.ramirez'@'%' IDENTIFIED BY 'qwerty123';
CREATE USER 'ricardo.gadiel'@'%' IDENTIFIED BY '240349';
CREATE USER 'rodolfo.hernandez'@'%' IDENTIFIED BY '240836';
CREATE USER 'jenny.canales'@'%' IDENTIFIED BY '240556';


/*Asignacion de privilegios de super usuario IMPORTANTE: YOOOP*/
GRANT ALL PRIVILEGES ON *.* TO 'ricardo.gadiel'@'%';

/*Asignar privilegios de seleccion, INSERCCION,actualizacion y eliminacion  AL USUARIO DE LA IZQUIERDA*/
GRANT SELECT, INSERT, UPDATE, DELETE ON `db_test`.* TO 'jenny.canales'@'%';

/*CREACION DE ROLES PARA EL SISTEMA DE ECOMMERCE*/
CREATE ROLE 'admin';
CREATE ROLE 'seller';
CREATE ROLE 'buyer';
CREATE ROLE 'support';
CREATE ROLE 'commont';
CREATE ROLE 'user_not_registered';



/*ASIGNAR PRIVILEGIOS A LOS ROLES CREADOS*/

GRANT ALL PRIVILEGES ON db_test.* TO 'admin';
--SUPPORT 
GRANT SELECT, INSERT, UPDATE ON db_test.* TO 'support';


/*ASIGNAR ROLES A LOS USARIOS CREADOS*/
GRANT 'admin' TO 'marco.ramirez'@'%';

GRANT 'support' TO 'jenny.canales'@'%';
