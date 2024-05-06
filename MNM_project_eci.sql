# 1. Genera una consulta que obtenga la lista ordenada de todas las referencias sin venta
SELECT *
FROM articulos a
left JOIN  ventas v
ON a.referencia = v.referencia
WHERE v.Referencia IS NULL;


# 2. Genera una consulta que obtenga las ventas comprendidas entre 2010 y 2011 (ambos incluidos), que estén asociados a una campaña de tipo VENTA y que sean del departamento de JOYERÍA.
SELECT *
FROM ventas v
LEFT JOIN articulos a
ON v.referencia = a.referencia
LEFT JOIN departamentos d
ON a.id_dpto = d.Id_Dpto
WHERE YEAR(fecha_venta) IN (2010, 2011) AND d.Desc_Dpto LIKE 'JOYERIA'
order by(Fecha_Venta)
;


/* 3. Genere una consulta que cree un campo "co_ranking" que clasifique en orden ascendente las campañas según el total de venta, 
              siendo 1 la campaña que más ha vendido y N la que menos. (N = Total de campañas)*/
SELECT d.Id_Campania,sum(Precio),RANK() OVER(ORDER BY sum(Precio) DESC) AS Ranking
FROM ventas v
LEFT JOIN articulos a
ON v.referencia = a.referencia
LEFT JOIN dpto_campanias d
ON a.id_dpto = d.Id_Dpto
LEFT JOIN campanias c
ON d.Id_Campania = c.Id_Campania
group by Id_Campania
;


# 5. Clasifique todas las ventas en Mayor, Igual o Menor precio respecto a la media de los precios de todas las ventas realizadas.
SELECT talon,precio,avg(precio) AS AV,
		(CASE 
			WHEN 50.986249685287476 >precio  THEN 'Menor'  
			WHEN 50.986249685287476 <precio THEN 'Mayor'
            ELSE 'Igual' END)
            AS clasificacion
            
FROM ventas
GROUP BY precio ORDER BY precio DESC
;

/*Genere una consulta que para cada campaña de tipo "venta" obtenga el talón medio, precio medio,
        nº de referencias compradas y nº de talones con venta superior al talón medio.*/
SELECT c.Id_Campania, v.Talon,
		AVG(v.PRECIO) as AVGPrecio,
		AVG(v.Talon) as AVGTalon,
        COUNT(ar.Referencia)
FROM Articulos as ar
LEFT JOIN Ventas as v
ON ar.referencia = v.referencia
LEFT JOIN Dpto_Campanias as d
ON d.Id_Dpto = ar.Id_Dpto
LEFT JOIN Campanias as c
ON c.Id_Campania = d.Id_Campania
WHERE c.Tipo = 'VENTA'
GROUP BY c.Id_Campania;


# 8. Genere una o varias consultas que devulevan las combinaciones de familias y campañas cuya venta haya sido superior a 100€
SELECT d.Id_Campania, SUM(v.precio)
FROM Familias as f
JOIN Articulos as ar
ON f.id_dpto = ar.id_dpto
JOIN VENTAS as v
ON ar.referencia = v.referencia
JOIN Dpto_Campanias as d
ON d.Id_Dpto = f.id_dpto
GROUP BY d.Id_Campania
HAVING SUM(v.precio)>100;


/*9. Genere una o varias consultas que permitan catalogar los artículos vendidos y que no son de la Campaña CA1, según si se tratan de artículos de Ropa o Accesorios. 
                 En base a los departamentos y familias. NOTA: Se valorará la elaboración de la consulta y no la veracidad del propio catálogo)*/
SELECT talon,desc_familia,id_campania
FROM Familias as f
JOIN Articulos as ar
ON f.id_dpto = ar.id_dpto
JOIN ventas as v
ON ar.referencia = v.referencia
JOIN Dpto_Campanias as d
ON d.Id_Dpto = f.id_dpto
WHERE d.Id_Campania != 'CA1' 
GROUP BY f.desc_familia
HAVING SUM(talon);


                        /*10. Genere una o varias consultas que devuelvan la variación del total de venta entre años. 
Tomando como variación la siguiente fórmula $$\dfrac{Year_{n} – Year_{n-1}}{Year_{n-1}}$$ (Se valorará el control de valores 0 en la división o de indeterminaciones)*/
SELECT EXTRACT(YEAR from a.Fecha_Venta)as Fecha,
a.ventas1,
LEAD(EXTRACT(YEAR from a.Fecha_Venta))OVER(
       ORDER BY EXTRACT(YEAR from a.fecha_venta) ASC) as Fecha2,
a.ventas2,
((a.ventas1 - a.ventas2)/a.ventas2) as ventasnetas
FROM (
		SELECT SUM(v.precio) as ventas1 ,LEAD((sum(v.precio)), 1) OVER(
		ORDER BY EXTRACT(YEAR from v.fecha_venta) ASC) AS ventas2 , v.Fecha_Venta
		FROM Ventas as v
		GROUP BY EXTRACT(YEAR from v.fecha_venta)) as A;


