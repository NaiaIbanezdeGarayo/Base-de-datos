--1.Crear un listado único con todos los oficios que haya en el departamento 10. Incluir la localidad del departamento en el resultado.
--VERSIÓN 1
DESC EMPLE
DESC DEPART
SELECT EMPLE.OFICIO, DEPART.LOC --QUIERO VER ESTAS COLUMNAS
FROM DEPART, EMPLE
WHERE DEPART.DEPT_NO = EMPLE.DEPT_NO AND EMPLE.DEPT_NO = 10; --JOIN 

DESC EMPLE 
DESC DEPART;

--VERSIÓN 2
DESC EMPLE
DESC DEPART
SELECT E.OFICIO, D.LOC --QUIERO VER ESTAS COLUMNAS
FROM DEPART D, EMPLE E
WHERE D.DEPT_NO = E.DEPT_NO AND E.DEPT_NO = 10; --JOIN 

DESC EMPLE 
DESC DEPART;

--2.Obtener salida
/*DEPT_NO		DNOMBRE			NÚMERO DE EMPLEADOS
	10			CONTABILIDAD	3
	20			INVESTIGACIÓN	5
	30			VENTAS			6
	40			PRODUCCIÓN		0	
*/

SELECT DEPART.DEPT_NO, DEPART.DNOMBRE, EMPLE.EMP_NO
FROM DEPART.EMPLE
WHERE DEPART.DEPT_NO=EMPLE.DEPT_NO;

--3.Visualizar el número de departamento, el nombre del departamento, y la cantidad de empleados del departamento con más empleados.

/*4.Mostrar el apellido, el nombre del departamento y el salario de cualquier empleado cuyo salario y 
comisión coincidan con los de cualquier empleado que trabaje en Barcelona, incluidos los que no tienen comisión.*/

--VERSIÓN 1
SELECT E.APELLIDO, D.DNOMBRE, E.SALARIO, E.COMISION_PCT
FROM EMPLE E, DEPART D
WHERE D.DEPT_NO = E.DEPT_NO --JOIN
AND (SALARIO, COMISION_PCT) IN (SELECT SALARIO,COMISION_PCT
								FROM DEPART D, EMPLE EMPLE
								WHERE E.DEPT_NO = D.DEPT_NO
								AND UPPER(D.LOC)='BARCELONA');

--VERSIÓN 2
SELECT E.APELLIDO, D.DNOMBRE, E.SALARIO, NVL2(E.COMISION_PCT, 'CON COMISION', 'SIN COMISION')
FROM EMPLE E, DEPART D
WHERE D.DEPT_NO = E.DEPT_NO --JOIN
AND (SALARIO, COMISION_PCT) IN (SELECT SALARIO,COMISION_PCT
								FROM EMPLE 
								WHERE DEPT_NO = (SELECT DEPT_NO
													FROM DEPART
													WHERE UPPER(LOC)='BARCELONA');
--Aquellos que tienen comisión nula no aparecen
SELECT E.APELLIDO, D.DNOMBRE, E.SALARIO, E.COMISION_PCT
FROM DEPART D, EMPLE EMPLE
WHERE D.DEPT_NO = E.DEPT_NO	--JOIN
AND (E.SALARIO, NVL(E.COMISION_PCT,-1))
		IN (SELECT E.SALARIO, NVL(E,COMISION_PCT,-1)
			FROM EMPLE E, DEPART DEPT_NO
			WHERE E.DEPT_NO = D.DEPT_NO
			AND upper(D.LOC)='BARCELONA');
