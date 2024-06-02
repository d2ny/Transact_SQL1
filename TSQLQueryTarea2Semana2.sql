/*
1.Agregar al menos 1 promoci�n  que no tenga un usuario asignado.
2.Agregar al menos 1 usuario  que no tenga ninguna promoci�n.
3.Listar usuarios �nicos que tengan promociones, usando predicados.
4.Listar usuarios que no tengan promociones, usando predicados y joins.
5.Listar promociones que no tengan usuarios asignados, usando predicados y joins.
6.Ordene las promociones por descripci�n y tipo de promoci�n, de forma que presente los tipos de promoci�n de forma ascendente y las descripciones de forma descendente.
7.Agregue al menos 3 usuarios m�s que comiencen con �J�
8.Traiga el 10% de los usuarios que comienzan con �J�.
9.Traiga el listado de los usuarios que comienzan con �J�, brinc�ndose los primeros 3, y �nicamente los siguientes 2 usuarios m�s.
10.Liste los ultimos accesos de los usuarios en formato dd/mm/aaaa.
11.Liste el largo de caracteres de cada nombre de usuario con proyecci�n nombreUsuario, largo
12.Reemplace todos los nombres de los usuarios que inician con J por G y l�stelas en orden descendente.
*/

--1. Se agrega una promoci�n sin usuario asignado.
INSERT INTO Promocion (descripcion,tipoPromocionID)
VALUES ('Semana Santa',11)

--2. Se agrega 1 usuario sin promoci�n.
INSERT INTO Usuario (nombreUsuario, ultimoAcceso, estado)
VALUES ('Monica Hidalgo',GETDATE(),1)

--3. Se listan usuarios �nicos sin promociones.
SELECT  DISTINCT U.nombreUsuario FROM Usuario U
INNER JOIN Promocion P on U.usuarioID=P.usuarioID

--4. Se listas usuarios que no tienen promociones.
SELECT DISTINCT U.nombreUsuario FROM Usuario U
FULL JOIN Promocion P on U.usuarioID=P.usuarioID
WHERE P.usuarioID is NULL AND U.nombreUsuario is NOT NULL

--5. Se listan promociones que no tienen usuarios asignados.
SELECT DISTINCT P.descripcion FROM Promocion P
CROSS JOIN Usuario U
WHERE P.usuarioID is NULL

--6.  SE listas las promociones y el tipo de promoci�n ordenados.
SELECT descripcion, tipoPromocionID FROM Promocion
ORDER BY tipoPromocionID ASC, descripcion DESC

--7. Se agregan 3 usuarios m�s que comienzan con �J�.
INSERT INTO Usuario (nombreUsuario, ultimoAcceso, estado)
VALUES ('Jimena Sanchez',GETDATE(),0)

INSERT INTO Usuario (nombreUsuario, ultimoAcceso, estado)
VALUES ('Javier Hayabusa',GETDATE(),1)

INSERT INTO Usuario (nombreUsuario, ultimoAcceso, estado)
VALUES ('Joanna Dark',GETDATE(),0)

--8. Se lista el 10% de los usuarios que comienzan con �J�.
SELECT TOP 10 PERCENT nombreUsuario FROM Usuario
WHERE nombreUsuario LIKE 'J%'

--9. Se listan los usuarios que comienzan con �J�, brinc�ndose los primeros 3, y �nicamente los siguientes 2 usuarios m�s.
SELECT nombreUsuario FROM Usuario
WHERE nombreUsuario LIKE 'J%'
ORDER BY nombreUsuario OFFSET 2 ROWS FETCH NEXT 2 ROWS ONLY

--10. Ultimos dos accesos de los usuarios en formato dd/mm/aaaa.
SELECT TOP 2 CONVERT(NVARCHAR(15),ultimoAcceso,103) FechaFormatoCR FROM Usuario
ORDER BY ultimoAcceso DESC

--11. Se listan los nombres de usuarios y el largo de cada uno, ordenado por el largo de mayor a menor.
SELECT nombreUsuario, LEN(nombreUsuario) LargoDelNombre FROM Usuario
ORDER BY LargoDelNombre DESC

--12. Se listan todos los nombres de los usuarios que inician con J y se reemplazan por G, en orden descendente.
SELECT REPLACE(nombreUsuario,'J','G') FROM Usuario
WHERE nombreUsuario LIKE 'J%' ORDER BY nombreUsuario DESC