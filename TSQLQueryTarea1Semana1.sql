--Tarea 1 Semana 1 Descripción

--1. Instale SQL Server 2022 developer
--2. Instale SMSS
--3. Restaure o haga attach a la base de datos SQLBas
--4. Obtenga la Fecha mediante un select
--5. Obtenga los usuarios activos que inician con ‘J’ con nombreUsuario, estado 1 (Activo)
--6. Obtenga las promociones únicas, con el campo descripcion.
--7. Obtenga las promociones con tipoPromocionID10,11,12, y 14 de forma que se visualice como:
--   Cuando el valor sea 10 presente “Standard anual”
--   Cuando el valor sea 11 presente ¨Standard semestral¨
--   Cuando el valor sea 12 presente ¨Standard mensual¨
--   Cuando el valor sea 14 presente ¨Standard cuatrimestre¨


--Obtiene la fecha mediante un SELECT
SELECT GETDATE() AS Fecha

--Obtiene los usuarios activos que inician con 'J' con nombreUsuario, estado 1
SELECT nombreUsuario, estado FROM Usuario
WHERE nombreUsuario LIKE 'J%' AND estado = 1

--Obtiene las promociones únicas con DISTINCT
SELECT DISTINCT descripcion FROM Promocion

--Uso del CASE para clasificar el tipo de promoción ya sea 10, 11, 12 o 14
SELECT CASE 
		WHEN tipoPromocionID = 10 THEN 'Standard anual' 
		WHEN tipoPromocionID = 11 THEN 'Standard semestral'
		WHEN tipoPromocionID = 12 THEN 'Standard mensual'
		ELSE 'Standard cuatrimestre'
		END AS Tipo_De_Promocion
FROM Promocion