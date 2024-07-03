-- 1: Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo='alumno' ORDER BY apellido1, apellido2, nombre ASC;
-- 2: Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo='alumno' AND telefono IS NULL;
-- 3: Retorna el llistat dels alumnes que van néixer en 1999.
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo='alumno' AND YEAR(fecha_nacimiento)=1999;
-- 4: Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo='profesor' AND telefono IS NULL AND UPPER(nif) LIKE '%K';
-- 5: Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
SELECT nombre FROM asignatura WHERE cuatrimestre=1 AND curso=3 AND id_grado=7;
-- 6: Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
SELECT apellido1, apellido2, p.nombre, d.nombre FROM persona p JOIN profesor pr ON p.id=pr.id_profesor JOIN departamento d ON pr.id_departamento=d.id ORDER BY apellido1, apellido2, p.nombre ASC;
-- 7: Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.
SELECT asig.nombre, anyo_inicio, anyo_fin FROM asignatura asig JOIN alumno_se_matricula_asignatura al_matr ON id_asignatura=asig.id JOIN persona p ON id_alumno=p.id JOIN curso_escolar ON al_matr.id_curso_escolar=curso_escolar.id WHERE UPPER(nif)='26902806M'; 
-- 8: Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
SELECT d.nombre FROM departamento d JOIN profesor pr ON id_departamento=d.id JOIN asignatura asig ON asig.id_profesor=pr.id_profesor JOIN grado ON grado.id=asig.id_grado WHERE grado.nombre='Grado en Ingeniería Informática (Plan 2015)' GROUP BY d.nombre;
-- 9: Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
SELECT p.nombre, apellido1, apellido2 FROM persona p JOIN alumno_se_matricula_asignatura al_matr ON id_alumno=p.id JOIN curso_escolar ON id_curso_escolar=curso_escolar.id WHERE anyo_inicio=2018 GROUP BY p.id;
-- LEFT JOIN & RIGHT JOIN 1: Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
SELECT d.nombre AS departamento, p.apellido1, p.apellido2, p.nombre FROM profesor prof RIGHT JOIN persona p ON p.id=prof.id_profesor LEFT JOIN departamento d ON prof.id_departamento=d.id ORDER BY d.nombre, apellido1, apellido2, p.nombre ASC;
-- 2: Retorna un llistat amb els professors/es que no estan associats a un departament.
SELECT apellido1, apellido2, p.nombre FROM persona p LEFT JOIN profesor pr ON p.id=pr.id_profesor WHERE id_departamento IS NULL; 
-- 3: Retorna un llistat amb els departaments que no tenen professors/es associats.
SELECT d.nombre, id_profesor FROM departamento d LEFT JOIN profesor pr ON d.id=pr.id_departamento WHERE id_profesor IS NULL; 
-- 4: Retorna un llistat amb els professors/es que no imparteixen cap assignatura.
SELECT apellido1, apellido2, p.nombre FROM persona p LEFT JOIN profesor pr ON p.id=pr.id_profesor LEFT JOIN asignatura asig ON asig.id_profesor=pr.id_profesor WHERE asig.id_profesor IS NULL; 
-- 5: Retorna un llistat amb les assignatures que no tenen un professor/a assignat.
SELECT asig.nombre FROM asignatura asig LEFT JOIN profesor pr ON asig.id_profesor=pr.id_profesor WHERE pr.id_profesor IS NULL;
-- 6: Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
SELECT d.nombre FROM departamento d LEFT JOIN profesor pr ON d.id=pr.id_departamento LEFT JOIN asignatura asig ON pr.id_profesor=asig.id_profesor GROUP BY d.nombre HAVING COUNT(asig.id)=0;
-- CONSULTAS RESUM 1: Retorna el nombre total d'alumnes que hi ha.
SELECT COUNT(p.id) AS total_alumnos FROM persona p WHERE p.tipo='alumno';
-- 2: Calcula quants alumnes van néixer en 1999.
SELECT COUNT(p.id) AS numero_alumnos_1999 FROM persona p WHERE p.tipo='alumno' AND YEAR(fecha_nacimiento)=1999;
-- 3: Calcula quants professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es.
SELECT d.nombre, COUNT(id_profesor) AS numero_profesores FROM departamento d RIGHT JOIN profesor pr ON d.id=pr.id_departamento GROUP BY d.nombre ORDER BY numero_profesores DESC;
-- 4: Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors/es associats. Aquests departaments també han d'aparèixer en el llistat.
SELECT d.nombre, COUNT(id_profesor) AS numero_profesores FROM departamento d LEFT JOIN profesor pr ON d.id=pr.id_departamento GROUP BY d.nombre;
-- 5: Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingues en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
SELECT grado.nombre, COUNT(asig.id) AS numero_asignaturas FROM grado LEFT JOIN asignatura asig ON grado.id=asig.id_grado GROUP BY grado.nombre ORDER BY numero_asignaturas DESC;
-- 6: Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.
SELECT grado.nombre, COUNT(asig.id) AS numero_asignaturas FROM grado RIGHT JOIN asignatura asig ON grado.id=asig.id_grado GROUP BY grado.nombre HAVING numero_asignaturas > 40 ORDER BY numero_asignaturas DESC;
-- 7: Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.
SELECT grado.nombre, asig.tipo, SUM(asig.creditos) AS suma_creditos FROM grado LEFT JOIN asignatura asig ON grado.id=asig.id_grado GROUP BY grado.nombre, asig.tipo;
-- 8: Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats.
SELECT curso.anyo_inicio, COUNT(al_matr.id_alumno) AS numero_alumnos FROM alumno_se_matricula_asignatura al_matr RIGHT JOIN curso_escolar curso ON al_matr.id_curso_escolar=curso.id GROUP BY curso.anyo_inicio;
-- 9: Retorna un llistat amb el nombre d'assignatures que imparteix cada professor/a. El llistat ha de tenir en compte aquells professors/es que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.
SELECT p.id, p.nombre, apellido1, apellido2, COUNT(asig.id) AS numero_asignaturas FROM persona p JOIN profesor pr ON p.id=pr.id_profesor LEFT JOIN asignatura asig ON pr.id_profesor=asig.id_profesor GROUP BY p.id ORDER BY numero_asignaturas DESC; 
-- 10: Retorna totes les dades de l'alumne/a més jove.
SELECT * FROM persona p WHERE tipo='alumno' ORDER BY fecha_nacimiento DESC LIMIT 1; 
-- 11: Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura.
SELECT p.nombre, apellido1, apellido2 FROM persona p JOIN profesor pr ON p.id=pr.id_profesor JOIN departamento d ON pr.id_departamento=d.id LEFT JOIN asignatura asig ON pr.id_profesor=asig.id_profesor GROUP BY p.id HAVING COUNT(asig.id)=0;