
-- 1. Selecciona todos los nombres de las películas sin que aparezcan duplicados.

SELECT title
FROM `film`;

-- 2. Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".

SELECT title
FROM `film`
WHERE `rating`= 'PG-13';

-- 3. Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.

SELECT `title`, `description`
FROM `film`
WHERE `description` LIKE '%amazing%';

-- 4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.

SELECT `title`
FROM `film`
WHERE `length`>120;

-- 5. Recupera los nombres de todos los actores.

SELECT CONCAT(`first_name`, " ", `last_name`) AS 'Full_name'
FROM `actor`;

-- 6. Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.

SELECT CONCAT(`first_name`, " ", `last_name`) AS 'Full_name'
FROM `actor`
WHERE `last_name` LIKE 'GIBSON';

-- 7. Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.

SELECT CONCAT(`first_name`, " ", `last_name`) AS 'Full_name'
FROM `actor`
ORDER BY `actor_id` ASC
LIMIT 11
OFFSET 9;

-- 8. Encuentra el título de las películas en la tabla `film` que no sean ni "R" ni "PG-13" en cuanto a su clasificación.

SELECT `title`, `rating`
FROM `film`
WHERE `rating` NOT LIKE 'R' 
		AND `rating`NOT LIKE 'PG-13'
ORDER BY `rating`;

-- 9. Encuentra la cantidad total de películas en cada clasificación de la tabla `film` y muestra la clasificación junto con el recuento.

SELECT `rating`, COUNT(`film_id`) AS 'Total_film'
FROM `film`
GROUP BY `rating`
ORDER BY `rating`;

/* 10. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, 
 su nombre y apellido junto con la cantidad de películas alquiladas.
*/

SELECT 
  `customer`.`customer_id`,
  `customer`.`first_name`,
  `customer`.`last_name`,
  COUNT(`rental`.`rental_id`) AS 'Peliculas_alquiladas'
FROM 
  `customer`
INNER JOIN 
  `rental` ON `customer`.`customer_id` = `rental`.`customer_id`
GROUP BY  
  `customer`.`customer_id`, `customer`.`first_name`, `customer`.`last_name`;
  
  /* 11. Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto 
  con el recuento de alquileres.
  */
  
SELECT `C`.`name`, COUNT(`R`.`rental_id`) AS 'Peliculas_alquiladas'
FROM `category` AS `C`
INNER JOIN `film_category` AS `FC`
	ON `C`.`category_id` = `FC`.`category_id`
INNER JOIN `inventory`AS `I`
	ON `FC`.`film_id` = `I`.`film_id`
INNER JOIN `rental`AS `R`
	ON `I`.`inventory_id` = `R`.`inventory_id`
GROUP BY `C`.`name`;

/* 12. Encuentra el promedio de duración de las películas para cada clasificación de la tabla `film` y muestra la clasificación 
junto con el promedio de duración.
*/

SELECT `rating`, ROUND(AVG(`length`),2) AS 'Duracion_promedio'
FROM `film`
GROUP BY `rating`;

-- 13. Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".

SELECT `A`.`first_name`,`A`.`last_name`
FROM `Actor` AS `A`
INNER JOIN `film_actor` AS `FA`
	ON `A`.`actor_id`= `FA`.`actor_id`
INNER JOIN `film` AS `F`
	ON `FA`.`film_id`= `F`.`film_id`
WHERE `F`.`title` = "Indian Love";

-- 14. Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.

SELECT `title`, `description`
FROM `film`
WHERE `description` LIKE '%dog%' OR 
	`description` LIKE '%cat%';
    
-- 15. Hay algún actor o actriz que no apareca en ninguna película en la tabla `film_actor`.

SELECT *
FROM `film_actor` AS `FA`
INNER JOIN `actor` AS `A`
	ON `FA`.`actor_id` = `A`.`actor_id`
WHERE `A`.`actor_id` = NULL;

-- 16. Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.

SELECT `title`
FROM `film`
WHERE `release_year` BETWEEN 2005 AND 2010;

-- 17. Encuentra el título de todas las películas que son de la misma categoría que "Family".

SELECT `F`.`title`, `C`.`name` AS 'Categoria'
FROM film AS F
INNER JOIN `film_category` AS `FC`
	ON `F`.`film_id`= `FC`.`film_id`
INNER JOIN `category` AS `C`
	ON `FC`.`category_id`= `C`.`category_id`
WHERE `C`.`name`= "Family";

-- 18. Muestra el nombre y apellido de los actores que aparecen en más de 10 películas.

SELECT DISTINCT `A`.`first_name`, `A`.`last_name` 
FROM `actor` AS `A`
INNER JOIN `film_actor` AS `FA`
ON `A`.`actor_id` = `FA`.`actor_id`
									WHERE `A`.`actor_id` IN ( SELECT `actor_id`
															FROM `film_actor`
															GROUP BY `actor_id`
															HAVING COUNT(`film_id`) > 10);

-- 19. Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la tabla `film`.

  SELECT `title`, `rating`,`length`
  FROM `film`
  WHERE `rating` = "R" AND `length` > 120;
  
  /* 20. Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos y 
  muestra el nombre de la categoría junto con el promedio de duración.
  */
  
  SELECT `C`.`name`, ROUND(AVG(length),2) AS 'promedio_duracion'
  FROM `category` AS C
  INNER JOIN `film_category` AS `FC`
	ON `C`.`category_id` = `FC`.`category_id`
  INNER JOIN `film` AS `F`
	ON `FC`.`film_id`= `F`.`film_id`
 GROUP BY `C`.`name`
 HAVING AVG(length) > 120;
 
 /*
 21. Encuentra los actores que han actuado en al menos 5 películas y muestra el nombre del actor junto 
 con la cantidad de películas en las que han actuado.
 */
 
SELECT `A`.`first_name`, `A`.`last_name`, COUNT(`FA`.`film_id`) AS 'Peliculas'
FROM `actor` AS `A`
INNER JOIN `film_actor` AS `FA`
	ON `A`.`actor_id` = `FA`.`actor_id`
GROUP BY `A`.`first_name`, `A`.`last_name`
HAVING COUNT(`film_id`) >= 5;

/*
22. Encuentra el título de todas las películas que fueron alquiladas por más de 5 días. 
Utiliza una subconsulta para encontrar los rental_ids con una duración superior a 5 días y
luego selecciona las películas correspondientes.
*/

SELECT `F`.`title`,DATEDIFF(`R`.`return_date`, `R`.`rental_date`) AS 'Duracion_alquiler'
FROM `rental` AS `R`
INNER JOIN `inventory` AS `I`
	ON `R`.`inventory_id` = `I`.`inventory_id`
INNER JOIN `film` AS `F`
	ON `I`.`film_id` = `F`.`film_id`
WHERE DATEDIFF(`R`.`return_date`, `R`.`rental_date`) > 5
ORDER BY DATEDIFF(`R`.`return_date`, `R`.`rental_date`) DESC;

/* 23. Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría "Horror". 
Utiliza una subconsulta para encontrar los actores que han actuado en películas de la categoría "Horror" y
 luego exclúyelos de la lista de actores.
 */
 
SELECT `actor`.`first_name`, `actor`.`last_name`
FROM `actor`
WHERE `actor`.`actor_id` NOT IN (
						SELECT `A`.`actor_id`
						FROM `actor` AS `A`
						INNER JOIN `film_actor` AS `FA`
							ON `A`.`actor_id` = `FA`.`actor_id`
						INNER JOIN `film_category` AS `FC`
							ON `FA`.`film_id` = `FC`.`film_id`
						INNER JOIN `category` AS `C`
							ON `FC`.`category_id` = `C`.`category_id`
						WHERE `C`.`name` = "Horror"
						GROUP BY `A`.`actor_id`);

-- 24 BONUS: Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos 

SELECT `F`.`title`, `C`.`name`
FROM `film` AS `F`
INNER JOIN `film_category` AS `FC`
	ON `F`.`film_id` = `FC`.`film_id`
INNER JOIN `category` AS `C`
	ON `FC`.`category_id` = `C`.`category_id`
WHERE `C`.`name`= "Comedy" AND 
	`F`.`length` >180;
    
-- 25. BONUS: Encuentra todos los actores que han actuado juntos en al menos una película. 
-- La consulta debe mostrar el nombre y apellido de los actores y el número de películas en las que han actuado juntos.

SELECT CONCAT(`A`.`first_name`," ",`A`.`last_name`) AS 'Actor_1', CONCAT(`A2`.`first_name`," ", `A2`.`last_name`) AS 'Actor_2', COUNT(Concat(`C1`.`actor_id`, " ", `C2`.`actor_id`)) AS 'Nº peliculas'
FROM `film_actor` AS `C1`
JOIN `film_actor`AS `C2`
	ON `C1`.`film_id` = `C2`.`film_id`
INNER JOIN `actor` AS `A`
	ON `C1`.`actor_id`= `A`.`actor_id`
INNER JOIN `actor` AS `A2`
	ON `C2`.`actor_id`= `A2`.`actor_id`
WHERE `C1`.`actor_id` < `C2`.`actor_id`
GROUP BY `A`.`first_name`,`A`.`last_name`, `A2`.`first_name`,`A2`.`last_name`;