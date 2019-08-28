
USE db_universidad;

# CARRERAS
INSERT INTO bot_carreras(za_carrera,codigo_carrera,nombre_carrera,activo) VALUES(1,'1490','INGENIERIA EN SISTEMAS',1);
INSERT INTO bot_carreras(za_carrera,codigo_carrera,nombre_carrera,activo) VALUES(2,'1234','ENFERMERIA',1);
INSERT INTO bot_carreras(za_carrera,codigo_carrera,nombre_carrera,activo) VALUES(3,'8763','ARQUITECTURA',1);
INSERT INTO bot_carreras(za_carrera,codigo_carrera,nombre_carrera,activo) VALUES(4,'7614','MEDICINA',1);
INSERT INTO bot_carreras(za_carrera,codigo_carrera,nombre_carrera,activo) VALUES(5,'8623','MERCADOTECNIA',1);

# JORNADAS
INSERT INTO bot_jornadas(za_carrera,za_jornada,nombre_jornada,activo) VALUES(1,1,'MATUTINA',1);
INSERT INTO bot_jornadas(za_carrera,za_jornada,nombre_jornada,activo) VALUES(1,2,'VESPERTINA',1);
INSERT INTO bot_jornadas(za_carrera,za_jornada,nombre_jornada,activo) VALUES(1,3,'FIN DE SEMANA',1);
INSERT INTO bot_jornadas(za_carrera,za_jornada,nombre_jornada,activo) VALUES(2,1,'MATUTINA',1);
INSERT INTO bot_jornadas(za_carrera,za_jornada,nombre_jornada,activo) VALUES(3,1,'MATUTINA',1);
INSERT INTO bot_jornadas(za_carrera,za_jornada,nombre_jornada,activo) VALUES(4,1,'MATUTINA',1);
INSERT INTO bot_jornadas(za_carrera,za_jornada,nombre_jornada,activo) VALUES(5,1,'MATUTINA',1);
INSERT INTO bot_jornadas(za_carrera,za_jornada,nombre_jornada,activo) VALUES(5,2,'FIN DE SEMANA',1);


# DIAS DE JORNADAS
#INSERT INTO bot_dias_jornadas(za_carrera,za_jornada,za_dia,dia,activo) VALUES(,,,'',1);
INSERT INTO bot_dias_jornadas(za_carrera,za_jornada,za_dia,dia,activo) VALUES(1,1,1,'LUNES',1);
INSERT INTO bot_dias_jornadas(za_carrera,za_jornada,za_dia,dia,activo) VALUES(1,1,2,'MARTES',1);
INSERT INTO bot_dias_jornadas(za_carrera,za_jornada,za_dia,dia,activo) VALUES(1,1,3,'MIERCOLES',1);
INSERT INTO bot_dias_jornadas(za_carrera,za_jornada,za_dia,dia,activo) VALUES(1,1,4,'JUEVES',1);
INSERT INTO bot_dias_jornadas(za_carrera,za_jornada,za_dia,dia,activo) VALUES(1,1,5,'VIERNES',1);
INSERT INTO bot_dias_jornadas(za_carrera,za_jornada,za_dia,dia,activo) VALUES(1,2,1,'LUNES',1);
INSERT INTO bot_dias_jornadas(za_carrera,za_jornada,za_dia,dia,activo) VALUES(1,2,2,'MARTES',1);
INSERT INTO bot_dias_jornadas(za_carrera,za_jornada,za_dia,dia,activo) VALUES(1,2,3,'MIERCOLES',1);
INSERT INTO bot_dias_jornadas(za_carrera,za_jornada,za_dia,dia,activo) VALUES(1,2,4,'JUEVES',1);
INSERT INTO bot_dias_jornadas(za_carrera,za_jornada,za_dia,dia,activo) VALUES(1,2,5,'VIERNES',1);
INSERT INTO bot_dias_jornadas(za_carrera,za_jornada,za_dia,dia,activo) VALUES(1,3,1,'SABADO',1);
INSERT INTO bot_dias_jornadas(za_carrera,za_jornada,za_dia,dia,activo) VALUES(2,1,1,'LUNES',1);
INSERT INTO bot_dias_jornadas(za_carrera,za_jornada,za_dia,dia,activo) VALUES(2,1,2,'MARTES',1);
INSERT INTO bot_dias_jornadas(za_carrera,za_jornada,za_dia,dia,activo) VALUES(2,1,3,'MIERCOLES',1);
INSERT INTO bot_dias_jornadas(za_carrera,za_jornada,za_dia,dia,activo) VALUES(2,1,4,'JUEVES',1);
INSERT INTO bot_dias_jornadas(za_carrera,za_jornada,za_dia,dia,activo) VALUES(2,1,5,'VIERNES',1);
INSERT INTO bot_dias_jornadas(za_carrera,za_jornada,za_dia,dia,activo) VALUES(3,1,1,'LUNES',1);
INSERT INTO bot_dias_jornadas(za_carrera,za_jornada,za_dia,dia,activo) VALUES(3,1,2,'MARTES',1);
INSERT INTO bot_dias_jornadas(za_carrera,za_jornada,za_dia,dia,activo) VALUES(3,1,3,'MIERCOLES',1);
INSERT INTO bot_dias_jornadas(za_carrera,za_jornada,za_dia,dia,activo) VALUES(3,1,4,'JUEVES',1);
INSERT INTO bot_dias_jornadas(za_carrera,za_jornada,za_dia,dia,activo) VALUES(3,1,5,'VIERNES',1);
INSERT INTO bot_dias_jornadas(za_carrera,za_jornada,za_dia,dia,activo) VALUES(4,1,1,'LUNES',1);
INSERT INTO bot_dias_jornadas(za_carrera,za_jornada,za_dia,dia,activo) VALUES(4,1,2,'MARTES',1);
INSERT INTO bot_dias_jornadas(za_carrera,za_jornada,za_dia,dia,activo) VALUES(4,1,3,'MIERCOLES',1);
INSERT INTO bot_dias_jornadas(za_carrera,za_jornada,za_dia,dia,activo) VALUES(4,1,4,'JUEVES',1);
INSERT INTO bot_dias_jornadas(za_carrera,za_jornada,za_dia,dia,activo) VALUES(4,1,5,'VIERNES',1);
INSERT INTO bot_dias_jornadas(za_carrera,za_jornada,za_dia,dia,activo) VALUES(5,1,1,'LUNES',1);
INSERT INTO bot_dias_jornadas(za_carrera,za_jornada,za_dia,dia,activo) VALUES(5,1,2,'MARTES',1);
INSERT INTO bot_dias_jornadas(za_carrera,za_jornada,za_dia,dia,activo) VALUES(5,1,3,'MIERCOLES',1);
INSERT INTO bot_dias_jornadas(za_carrera,za_jornada,za_dia,dia,activo) VALUES(5,1,4,'JUEVES',1);
INSERT INTO bot_dias_jornadas(za_carrera,za_jornada,za_dia,dia,activo) VALUES(5,1,5,'VIERNES',1);
INSERT INTO bot_dias_jornadas(za_carrera,za_jornada,za_dia,dia,activo) VALUES(5,2,1,'SABADO',1);

# pensums
INSERT INTO bot_pensums(za_carrera,ano_pensum,codigo_pensum,activo) VALUES(1,2000,'2000',1);
INSERT INTO bot_pensums(za_carrera,ano_pensum,codigo_pensum,activo) VALUES(1,2009,'2009',1);
INSERT INTO bot_pensums(za_carrera,ano_pensum,codigo_pensum,activo) VALUES(1,2014,'2014',1);
INSERT INTO bot_pensums(za_carrera,ano_pensum,codigo_pensum,activo) VALUES(2,2004,'2004',1);
INSERT INTO bot_pensums(za_carrera,ano_pensum,codigo_pensum,activo) VALUES(2,2010,'2010',1);
INSERT INTO bot_pensums(za_carrera,ano_pensum,codigo_pensum,activo) VALUES(3,2016,'2016',1);
INSERT INTO bot_pensums(za_carrera,ano_pensum,codigo_pensum,activo) VALUES(4,2013,'2013',1);
INSERT INTO bot_pensums(za_carrera,ano_pensum,codigo_pensum,activo) VALUES(5,2014,'2014',1);

# cursos
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(1,'DESARROLLO HUMANO',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(2,'LOGICA',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(3,'PRECALCULO',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(4,'ALGORITMOS',1,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(5,'MATEMATICA DISCRETA',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(6,'DERECHO INFORMATICO',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(7,'PROGRAMACION I',1,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(8,'CALCULO I',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(10,'FISICA I',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(11,'PROGRAMACION II',1,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(12,'CALCULO II',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(13,'ESTADISTICA I',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(14,'METODOS NUMERICOS',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(15,'PROGRAMACION III',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(16,'ELECTRONICA ANALOGICA',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(17,'BASES DE DATOS I',1,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(18,'SISTEMAS OPERATIVOS I',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(19,'BASES DE DATOS II',1,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(20,'ANALISIS DE SISTEMAS I',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(21,'COMPILADORES',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(22,'DESARROLLO WEB',0,1);

# relaciones de cursos y pensums
#INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(,,,,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,1,1,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,2,1,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,3,2,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,4,2,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,5,2,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,6,3,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,7,3,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,8,3,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,10,3,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,11,4,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,12,4,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,13,4,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,14,5,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,15,5,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,16,6,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,17,6,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,18,6,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,19,7,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,20,7,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,21,7,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,22,8,1);


# catedraticos
#INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(,'','','',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(1,'KEIBIN','BARRIOS','ING. CIVIL',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(2,'HEIDI','REINOSO','ING. INDUSTRIAL',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(3,'MANUEL','MAZARIEGOS','ING. EN ELECTRONICA',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(4,'MARVIN','MENCHU','ING. EN SISTEMAS',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(5,'CARLOS','GOMEZ','ING. EN SISTEMAS',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(6,'LUIS','SOSA','ING. EN SISTEMAS',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(7,'ANGELICA','COJULUN','ING. INDUSTRIAL',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(8,'MANOLO','RIVERA','ING. EN SISTEMAS',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(9,'WALTER','BAUTISTA','ING. EN SISTEMAS',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(10,'LILY','LOPEZ','LIC. TRABAJO SOCIAL',1);


COMMIT;