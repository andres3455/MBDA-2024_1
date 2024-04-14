-------------------------------------------------------------PROYECTO MBDA 2024-1---------------------------------------------------------------------
----------------------------------------------------    ANDRES FELIPE RODRIGUEZ CHAPARRO    ----------------------------------------------------------
----------------------------------------------------    CARLOS ANDRES AVELLANEDA FRANCON    ----------------------------------------------------------
--------------------------------------------------------------- CYCLING WOLRD   -----------------------------------------------------------------
/*
                                                    ESTRUCTURA Y RESTRICCIONES DECLARATIVAS
*/

/*
                                            ---------------------PERSISTENCIA--------------
*/

/*
    TABLAS
*/
/*
CREACION DE TABLAS 
*/
CREATE TABLE Comprador(
Nid NUMBER(15)NOT NULL,
Tid VARCHAR2(3) NOT NULL CHECK (Tid IN ('CC', 'TI', 'CE', 'NT', 'RC')),
Direccion VARCHAR2(50) NOT NULL,
Celular NUMBER (10) NOT NULL,
Correo VARCHAR2(30) NOT NULL CHECK((SUBSTR(correo, LENGTH(correo)-1, 1) LIKE '%.%') AND (SUBSTR(correo, INSTR(correo, '@')+1, 1) LIKE '%@%'))
);

CREATE TABLE Busqueda(
B_id NUMBER(5) NOT NULL,
B_tid VARCHAR2(3) NOT NULL CHECK (Tid IN ('CC', 'TI', 'CE', 'NT', 'RC')),
Nid NUMBER(15)NOT NULL,
Codigo VARCHAR2(6) NOT NULL,
Serial VARCHAR2(14) NOT NULL
);

CREATE TABLE Vendedor(
Tid VARCHAR2(3)CHECK (Tid IN ('CC', 'TI', 'CE', 'NT', 'RC')),
Nid NUMBER(15)NOT NULL,
Direccion VARCHAR2 (50),
Celular NUMBER (10) NOT NULL,
Correo VARCHAR2(30)CHECK((SUBSTR(correo, LENGTH(correo)-1, 1) LIKE '%.%') AND (SUBSTR(correo, INSTR(correo, '@')+1, 1) LIKE '%@%')),
Foto VARCHAR2(100),CONSTRAINT check_foto_format CHECK (REGEXP_LIKE(Foto, '^https://') AND REGEXP_LIKE(Foto, '.pdf$'))
);



CREATE TABLE Registro(
R_id NUMBER(5) NOT NULL,
R_Tid VARCHAR2(3) NOT NULL CHECK (Tid IN ('CC', 'TI', 'CE', 'NT', 'RC')),
Nid NUMBER(15) NOT NULL,
Codigo VARCHAR2(6)NOT NULL,
Serial VARCHAR2 (14),
cantidad NUMBER (2)
);

CREATE TABLE Componente(
Codigo VARCHAR2(6) NOT NULL,
Marca VARCHAR2(12) NOT NULL,
Tipo VARCHAR (15) NOT NULL,
Descripcion VARCHAR2(100),
Numero_Articulo NUMBER (4) NOT NULL,
Fecha DATE,
Foto VARCHAR2(100) NOT NULL,CONSTRAINT check_foto_format CHECK (REGEXP_LIKE(Foto, '^https://') AND REGEXP_LIKE(Foto, '.pdf$')),
PRECIO NUMBER(3,2) NOT NULL
);

CREATE TABLE Bicicleta(
Serial VARCHAR2 (14) NOT NULL,
Marca VARCHAR2 (20) NOT NULL,
Color VARCHAR2 (10) NOT NULL,
Daños VARCHAR2 (12) NOT NULL,
Tipo VARCHAR2 (25) NOT NULL CHECK (Tipo IN ('Ruta',' MTB', 'Gravel', 'Otro')),
Foto VARCHAR2(100) NOT NULL,CONSTRAINT check_foto_format CHECK (REGEXP_LIKE(Foto, '^https://') AND REGEXP_LIKE(Foto, '.pdf$'))
);

CREATE TABLE Tarjeta_de_propiedad(
Numero NUMBER(4) NOT NULL,
Propietario VARCHAR2 (30) NOT NULL,     
Serial VARCHAR2(14) NOT NULL,
Cedula NUMBER(10) NOT NULL,
Modelo NUMBER (4) NOT NULL,
Color VARCHAR2 (10) NOT NULL,
Fecha DATE NOT NULL,
Codigo_compra VARCHAR2(7) NOT NULL
);

CREATE TABLE Articulos_Comprados(
A_c_id NUMBER(5) NOT NULL,
Orden NUMBER (8) NOT NULL,
Componentes_c VARCHAR2(6) ,
Bicicletas_c VARCHAR2 (14) ,
cantidad NUMBER (2) NOT NULL
);

CREATE TABLE Marca(
Nit NUMBER (8) NOT NULL,
Nombre VARCHAR2 (20) NOT NULL,
Descripcion VARCHAR (100) NOT NULL
);

CREATE TABLE Orden_de_compra(
NumeroOrden NUMBER (4) NOT NULL,
Fecha DATE NOT NULL,
Descripcion VARCHAR2(100),
Monto NUMBER (4,3) NOT NULL,
Pago VARCHAR2 (20) NOT NULL CHECK(Pago IN (50, 100, 150, 200, 250)),
Estado VARCHAR2(1) NOT NULL CHECK(Estado IN ('A', 'R', 'P'))
);

CREATE TABLE Envio(
Nide NUMBER(4) NOT NULL,
NumeroOrden NUMBER (4) NOT NULL,
Fecha DATE NOT NULL, 
Estado VARCHAR(1) NOT NULL CHECK(Estado IN ('A', 'R', 'P'),
Tipo_envio VARCHAR(1) NOT NULL CHECK(Tipo_envio IN ('D', 'L')
);

CREATE TABLE Foro(
F_id NUMBER (3) NOT NULL,
Categoria VARCHAR2(15) NOT NULL,
DESCRIPCION VARCHAR2(100) NOT NULL,
Pid NUMBER(3) NOT NULL,
Rid NUMBER(3) NOT NULL
);

CREATE TABLE Pregunta(
Pid NUMBER(3) NOT NULL,
Pregunta VARCHAR2 (200) NOT NULL
);

CREATE TABLE Respuesta(
Rid NUMBER(3) NOT NULL,
Respuesta VARCHAR2(200) NOT NULL
);

CREATE TABLE Pregunta_X_Persona(
PXP_id NUMBER (3) NOT NULL,
Tid VARCHAR2(3) NOT NULL CHECK (Tid IN ('CC', 'TI', 'CE', 'NT', 'RC')),
Nid NUMBER(15) NOT NULL,
Pid NUMBER(3) NOT NULL
);

CREATE TABLE Respuesta_X_Persona(
RXP_id NUMBER (3) NOT NULL,
Tid VARCHAR2(3) NOT NULL CHECK (Tid IN ('CC', 'TI', 'CE', 'NT', 'RC')),
Nid NUMBER(15) NOT NULL,
Rid NUMBER(3) NOT NULL
);

/*
    ATRIBUTOS
*/

/*
    PRIMARIAS
*/
/*ALTER TABLE Comprador ADD CONSTRAINT PK_TID_COMPRADOR PRIMARY KEY (Tid);*/
ALTER TABLE Comprador ADD CONSTRAINT PK_NID PRIMARY KEY (Nid);

/*ALTER TABLE Vendedor ADD CONSTRAINT PK_TID_VENDEDOR PRIMARY KEY (Tid);*/
ALTER TABLE Vendedor ADD CONSTRAINT PK_NID_VENDEDOR PRIMARY KEY (Nid);

ALTER TABLE Busqueda ADD CONSTRAINT PK_ID_BUSQUEDA PRIMARY KEY (B_id);

ALTER TABLE Registro ADD CONSTRAINT PK_ID_REGISTRO PRIMARY KEY (R_id);

ALTER TABLE Componente ADD CONSTRAINT PK_ID_COMPONENETES PRIMARY KEY (Codigo);

ALTER TABLE Bicicleta ADD CONSTRAINT PK_ID_BICICLETA PRIMARY KEY (Serial);

ALTER TABLE Articulos_comprados ADD CONSTRAINT PK_ID_ARTICULOS_COMPRADOS PRIMARY KEY (A_c_id);

ALTER TABLE Orden_de_compra ADD CONSTRAINT PK_ID_ORDEN_DE_COMPRA PRIMARY KEY (NumeroOrden);

ALTER TABLE Tarjeta_de_propiedad ADD CONSTRAINT PK_ID_TARJETA_DE_PROPIEDAD PRIMARY KEY (Numero);

ALTER TABLE Marca ADD CONSTRAINT PK_ID_MARCA PRIMARY KEY (Nit); 

ALTER TABLE Envio ADD CONSTRAINT PK_ID_ENVIO PRIMARY KEY (Nide);

ALTER TABLE Foro ADD CONSTRAINT PK_ID_FORO PRIMARY KEY (F_id);

ALTER TABLE Pregunta ADD CONSTRAINT PK_ID_PREGUNTA PRIMARY KEY (Pid); 

ALTER TABLE Respuesta ADD CONSTRAINT PK_ID_RESPUESTA PRIMARY KEY (Rid); 

ALTER TABLE Pregunta_X_Persona ADD CONSTRAINT PK_ID_PXP PRIMARY KEY (PXP_id);

ALTER TABLE Respuesta_X_Persona ADD CONSTRAINT PK_ID_RXP PRIMARY KEY (RXP_id);

/*
    UNICAS
*/

ALTER TABLE Componente ADD CONSTRAINT UK_FOTO_COMPONENTE UNIQUE (Foto);

ALTER TABLE Bicicleta ADD CONSTRAINT UK_FOTO_BICICLETA UNIQUE (Foto);

ALTER TABLE Vendedor ADD CONSTRAINT UK_CORREO_VENDEDOR UNIQUE (Correo);

ALTER TABLE Comprador ADD CONSTRAINT UK_CORREO_COMPRADOR UNIQUE (Correo);


/*
    FORANEAS
*/
ALTER TABLE Busqueda ADD CONSTRAINT FK_ID_BUSQUEDA FOREIGN KEY (B_id) REFERENCES Comprador (Nid);
/*ALTER TABLE Busqueda ADD CONSTRAINT FK_TID_BUSQUEDA FOREIGN KEY (B_tid) REFERENCES Comprador (Tid);*/
ALTER TABLE Busqueda ADD CONSTRAINT FK_CODIGO_BUSQUEDA FOREIGN KEY (Codigo) REFERENCES Componente (Codigo);
ALTER TABLE Busqueda ADD CONSTRAINT FK_SERIAL_BUSQUEDA FOREIGN KEY (Serial) REFERENCES Bicicleta (Serial);

ALTER TABLE Registro ADD CONSTRAINT FK_ID_REGISTRO FOREIGN KEY (R_id) REFERENCES Vendedor(Nid);
/*ALTER TABLE Registro ADD CONSTRAINT FK_TID_REGISTRO FOREIGN KEY (R_tid) REFERENCES Vendedor(Tid);*/
ALTER TABLE Registro ADD CONSTRAINT FK_CODIGO_REGISTRO FOREIGN KEY (Codigo) REFERENCES Componente (Codigo);
ALTER TABLE Registro ADD CONSTRAINT FK_SERIAL_REGISTRO FOREIGN KEY (Serial) REFERENCES Bicicleta (Serial);

ALTER TABLE Bicicleta ADD CONSTRAINT FK_MARCA_BICICLETA FOREIGN KEY (Marca) REFERENCES Marca(Nombre);

ALTER TABLE Tarjeta_de_propiedad ADD CONSTRAINT FK_SERIAL_TARJETAPR FOREIGN KEY (Serial) REFERENCES Bicicleta(Serial);

ALTER TABLE Articulos_Comprados ADD CONSTRAINT FK_COMPONENTES_C_ARC FOREIGN KEY (Componentes_c) REFERENCES Componente(Codigo);
ALTER TABLE Articulos_Comprados ADD CONSTRAINT FK_BICICLETAS_C_ARC FOREIGN KEY (Bicicletas_c) REFERENCES Bicicleta(Serial);
ALTER TABLE Articulos_Comprados ADD CONSTRAINT FK_NORC_ARC FOREIGN KEY (Orden) REFERENCES Orden_de_compra(numeroOrden);

ALTER TABLE Envio ADD CONSTRAINT FK_ORDEN_ENVIO FOREIGN KEY (Orden) REFERENCES Orden_de_compra(numeroOrden);


ALTER TABLE Foro ADD CONSTRAINT FK_PID_FORO FOREIGN KEY (Pid) REFERENCES Pregunta(Pid);
ALTER TABLE Foro ADD CONSTRAINT FK_RID_FORO FOREIGN KEY (Rid) REFERENCES Respuesta(Rid);

ALTER TABLE Pregunta_X_Persona ADD CONSTRAINT FK_NID_PXP FOREIGN KEY (Nid) REFERENCES Comprador (Nid); 
/*ALTER TABLE Pregunta_X_Persona ADD CONSTRAINT FK_TID_PXP FOREIGN KEY (Tid) REFERENCES Comprador (Tid); */ 
ALTER TABLE Pregunta_X_Persona ADD CONSTRAINT FK_PID_PXP FOREIGN KEY (Pid) REFERENCES Pregunta (Pid);

ALTER TABLE Respuesta_X_Persona ADD CONSTRAINT FK_NID_RXP FOREIGN KEY (Nid) REFERENCES Comprador (Nid); 
/*ALTER TABLE Respuesta_X_Persona ADD CONSTRAINT FK_TID_RXP FOREIGN KEY (Tid) REFERENCES Comprador (Tid);*/ 
ALTER TABLE Respuesta_X_Persona ADD CONSTRAINT FK_RID_RXP FOREIGN KEY (RID) REFERENCES Respuesta (Rid);


/*
    XTABLAS
*/
/*
DROP TABLE Comprador;
DROP TABLE Busqueda;
DROP TABLE Vendedor;
DROP TABLE Registro;
DROP TABLE Componente;
DROP TABLE Bicicleta;
DROP TABLE Tarjeta_de_propiedad;
DROP TABLE Articulos_Comprados;
DROP TABLE Marca;
DROP TABLE Orden_de_compra;
DROP TABLE Envio;
DROP TABLE Foro;
DROP TABLE Pregunta;
DROP TABLE Respuesta;
DROP TABLE Pregunta_X_Persona;
DROP TABLE Respuesta_x_Persona;

*/


/*
    CONSULTAS
*/

/* Sleccionar toda la tabla*/
SELECT * FROM Comprador;
/* Seleccionar comprador con Nid especifico*/
SELECT * FROM Comprador WHERE Nid = 123456789;
/* Join entre tablas */
SELECT c.Nid, c.Direccion, b.B_id, b.Codigo
FROM Comprador c
JOIN Busqueda b ON c.Nid = b.Nid;
/* Seleccionar todos los comprados con direccion Especifica */
SELECT * FROM Comprador
WHERE Direccion LIKE '%CiudadEjemplo%';

/*Cantidad de compradores en la tabla */
SELECT COUNT(*) FROM Comprador;

/* une las tablas Comprador, Busqueda y Componente para obtener información sobre los compradores y los componentes que han buscado*/
SELECT c.Nid, c.Direccion, b.B_id, b.Codigo, comp.Marca, comp.Tipo
FROM Comprador c
JOIN Busqueda b ON c.Nid = b.Nid
JOIN Componente comp ON b.Codigo = comp.Codigo;



/*join entre las tablas Comprador y Orden_de_compra para obtener la cantidad total gastada por cada comprador*/
SELECT c.Nid, SUM(o.Monto) AS TotalGastado
FROM Comprador c
JOIN Orden_de_compra o ON c.Nid = o.NumeroOrden
GROUP BY c.Nid;

/* une las tablas Envio y Comprador para obtener información sobre un envío específico junto con los detalles del comprador*/
SELECT e.Nide, e.NumeroOrden, e.Fecha, e.Estado, e.TipoE, c.Direccion, c.Celular
FROM Envio e
JOIN Comprador c ON e.Nide = c.Nid
WHERE e.NumeroOrden = 1234;

/*une las tablas Pregunta y Respuesta para obtener todas las preguntas y respuestas asociadas a un foro específico*/
SELECT p.Pregunta, r.Respuesta
FROM Pregunta p
JOIN Respuesta r ON p.Pid = r.Rid
WHERE p.Pid = 1;


/*
                                            -----------------------PRUEBAS------------------------
*/
DELETE FROM COMPRADOR
WHERE NID = 100000000000001;
/*
POBLAR OK
*/
INSERT INTO Comprador (Nid, Tid, Direccion, Celular, Correo) VALUES(100000000000001, 'CC', 'Avenida Sexta, Cali', 3235679302, 'Anderson@Gmail.com');
INSERT INTO Comprador (Nid, Tid, Direccion, Celular, Correo) VALUES(100000000000002, 'CC', 'Avenida Las palmas, Medellin', 3145672311, 'Oscar@Gmail.com');
INSERT INTO Comprador (Nid, Tid, Direccion, Celular, Correo) VALUES(100000000000003, 'CC', 'Calle 100, Bogota', 3156781254, 'Nicolas@Gmail.com');
INSERT INTO Comprador (Nid, Tid, Direccion, Celular, Correo) VALUES(100000000000004, 'CC', 'Avenida 15, Zipaquira', 3167130796, 'Andres@Gmail.com');
INSERT INTO Comprador (Nid, Tid, Direccion, Celular, Correo) VALUES(100000000000005, 'CC', 'Avenida Chilacos, Chia', 3873450135, 'SaraKatherin@Gmail.com');

INSERT INTO Busqueda (B_id, B_tid, Nid, Codigo, Serial) VALUES (10001, 'B01', 100000000000001, 'C12345', 'W12345678901234');
INSERT INTO Busqueda (B_id, B_tid, Nid, Codigo, Serial) VALUES (10002, 'B02', 100000000000002, 'C54321', 'S43210987654321');



/*
POBLAR NO OK
*/

/*
XPOBLAR
*/


/*
                                                RESTRICCIONES DECLARATIVAS , PROCEDIMENTALES Y AUTOMATIZACION
*/

/*
                                            --------------------PERSISTENCIA----------------------------
*/

/*
TUPLAS
*/


/*
ACCIONES
*/

/*
DISPARADORES
*/
CREATE OR REPLACE TRIGGER TR_PREFIJO_CEL ON vendedor AFTER INSERT, UPDATE 
DECLARE
    prefijo VARCHAR2(3);
FOR EACH ROW
BEGIN    
    SELECT SUBSTR(Celular, 1, 3) 
    INTO prefijo
    FROM Vendedor;

    IF NEW.prefijo NOT IN ('300', '301', '305', '310', '311', '312', '315', '316', '317', '318', '320') THEN
         RAISE_APPLICATION_ERROR(-20003,'Error, el prefijo del celular no es válido');
    END IF;    
END;
/*
XDISPARADORES
*/

/*
                                            ---------------------PRUEBAS-------------------------------------
*/



