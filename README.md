## Prueba técnica Módulo 2 SQL

## INDICE
1. [Introducción](#1-introducción)
2. [Documentación](#2-documentación)
3. [Instrucciones, Comandos y Consultas en SQL](#3-instrucciones-comandos-y-consultas-en-sql)
4. [Recursos utilizados](#4-recursos-utilizados)

# 1. INTRODUCCION: 

Este repositorio contiene consultas SQL  para resolver una prueba técnica basada en la base de datos Sakila.

Esta prueba técnica está propuesta por los profesores del bootcamp sobre DataAnalyst para todas las alumnas de la promoG de Adalab. 

El fin de este ejercicio es  poner en práctica todos los conocimientos sobre SQL adquiridos a lo largo del módulo.


# 2. DOCUMENTACION:

La prueba técnica consta de 23 ejercicios obligatorios y 2 ejercicios de bonus acerca de consultas SQL sobre la base de datos Sakila.
 A continuación se detallan los enunciados:
    
    1. Selecciona todos los nombres de las películas sin que aparezcan duplicados.
    2. Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".
    3. Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.
    4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.
    5. Recupera los nombres de todos los actores.
    6. Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.
    7. Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.
    8. Encuentra el título de las películas en la tabla `film` que no sean ni "R" ni "PG-13" en cuanto a su clasificación.
    9. Encuentra la cantidad total de películas en cada clasificación de la tabla `film` y muestra la clasificación junto con el recuento.
    10. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas       alquiladas.
    11. Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres.
    12. Encuentra el promedio de duración de las películas para cada clasificación de la tabla `film` y muestra la clasificación junto con el promedio de duración.
    13. Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".
    14. Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.
    15. Hay algún actor o actriz que no apareca en ninguna película en la tabla `film_actor`.
    16. Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.
    17. Encuentra el título de todas las películas que son de la misma categoría que "Family".
    18. Muestra el nombre y apellido de los actores que aparecen en más de 10 películas.
    19. Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la tabla `film`.
    20. Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos y muestra el nombre de la categoría junto con el promedio de duración.
    21. Encuentra los actores que han actuado en al menos 5 películas y muestra el nombre del actor junto con la cantidad de películas en las que han actuado.
    22. Encuentra el título de todas las películas que fueron alquiladas por más de 5 días. Utiliza una subconsulta para encontrar los rental_ids con una duración superior a 5 días y luego selecciona las películas correspondientes.
    23. Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría "Horror". Utiliza una subconsulta para encontrar los actores que han actuado en películas de la categoría "Horror" y luego exclúyelos de la lista de actores.
    24. BONUS: Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en la tabla `film`.
    25. BONUS: Encuentra todos los actores que han actuado juntos en al menos una película. La consulta debe mostrar el nombre y apellido de los actores y el número de películas en las que han actuado juntos.

# 3. Intrucciones,comandos y queris utilizados en los scripts de SQL: 

    1.  Queris basicas
    2.  Queris basicas y cláusula 'WHERE'
    3.  Queris basicas con operador especial de filtro 'LIKE', el comodin % y la cláusula 'WHERE'
    4.  Queris basicas y cláusula 'WHERE'
    5.  Queris basicas con la función 'CONCAT'
    6.  Queris basicas con operador especial de filtro 'LIKE', la cláusula 'WHERE' y  la función 'CONCAT'
    7.  Queris basicas con las cláusulas 'LIMIT', 'OFFSET' y 'ORDER BY'
    8.  Queris basicas con operador especial de filtro 'NOT LIKE',las cláusulas 'ORDER BY'y 'WHERE' y el operador 'AND'
    9.  Queris avanzadas con cláusulas 'GROUP BY' y 'ORDER BY' y la función 'COUNT'
    10. Queris avanzadas junto con un join del tipo 'INNER JOIN',la cláusula 'GROUP BY' y la función 'COUNT'
    11. Queris avanzadas junto con tres join del tipo 'INNER JOIN', la cláusula 'GROUP BY' y la función 'COUNT'
    12. Queris avanzadas, la cláusula 'GROUP BY' y la función 'ROUND' para limitar el uso de decimales
    13. Queris basicas junto con dos join del tipo 'INNER JOIN' y la cláusula 'WHERE'
    14. Queris basicas con operador especial de filtro 'LIKE',el comodin % y la cláusula 'WHERE'
    15. Queris basicas junto con un join del tipo 'INNER JOIN' y la cláusula 'WHERE'
    16. Queris basicas con las cláusulas 'BETWEEN' y 'WHERE'.
    17. Queris básicas junto con dos join del tipo 'INNER JOIN' y la cláusula 'WHERE
    18. Una subconsulta de queris basicas y avanzadas mediante la cáusula 'WHERE'junto con un join de tipo 'INNER JOIN', la sentencia 'HAVING', la cláusula 'GROUP BY' y la función'COUNT'.
    19. Queris básicas, cláusula WHERE y el operador 'AND'
    20. Queris avanzadas junto con dos join del tipo 'INNER JOIN',  la sentencia 'HAVING', la cláusula 'GROUP BY' y las funciones 'AVG' y 'ROUND'
    21. Queris avanzadas junto con un join del tipo 'INNER JOIN', la sentencia 'HAVING, la cláusula 'GROUP BY' y la función COUNT.
    22. Queris avanzadas junto con dos join del tipo 'INNER JOIN', las cláusulas 'WHERE' y  'GROUP BY' y la función 'DATEDIFF'.
    23. Subconsulta  de queris básicas y avanzadas mediante la cláusula "NOT IN", tres join del tipo 'INNER JOIN' y las cláusulas 'GROUP BY' y WHERE.
    24. Queris básicas junto con  dos join del tipo 'INNER JOIN, la cláusula 'WHERE' y el operador AND.
    25. Queris avanzadas junto con 2 join del tipo 'INNER JOIN' y un join del tipo SELF JOIN, las cláusulas WHERE y GROUP BY y la función 'COUNT'.

# 4. Recursos utilizados:

    - Lecciones del módulo.
    - Esquema conexión de tablas SAKILA.
   
        



