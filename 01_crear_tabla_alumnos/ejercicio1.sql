--EJERCICIO 1
DROP TABLE CASCADE CONSTRAINTS ALUMNOS;

CREATE  TABLE  ALUMNOS (
DNI VARCHAR2 ( 10 ),
NOMBRE VARCHAR2 ( 30 ) NOT NULL ,
NÚMERO DE EDAD ( 2 ),
NUMERO DE CURSO ( 1 ),
CONSTRAINT ALUM_DNI_PK FOREIGN KEY (DNI),
CONSTRAINT ALUM_EDAD_CK CHECK (EDAD > = 5  Y EDAD <= 20 ),
CONSTRAINT ALUM_NOMBRE_CK CHECK (NOMBRE = UPPER (NOMBRE)),
CONSTRAINT ALUM_CURSO_CK CHECK (CURSO IN ( 1 , 2 , 3 ))
);