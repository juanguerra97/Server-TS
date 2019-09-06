
USE db_universidad;

# CARRERAS
INSERT INTO bot_carreras(za_carrera,codigo_carrera,nombre_carrera,activo) VALUES(1,'1490','INGENIERIA EN SISTEMAS',1);
INSERT INTO bot_carreras(za_carrera,codigo_carrera,nombre_carrera,activo) VALUES(2,'1234','ENFERMERIA',1);
INSERT INTO bot_carreras(za_carrera,codigo_carrera,nombre_carrera,activo) VALUES(3,'8763','ARQUITECTURA',1);
INSERT INTO bot_carreras(za_carrera,codigo_carrera,nombre_carrera,activo) VALUES(4,'7614','MEDICINA',1);
INSERT INTO bot_carreras(za_carrera,codigo_carrera,nombre_carrera,activo) VALUES(5,'8623','MERCADOTECNIA',1);
INSERT INTO bot_carreras(za_carrera,codigo_carrera,nombre_carrera,activo) VALUES(6,'8874','TURISMO',1);
INSERT INTO bot_carreras(za_carrera,codigo_carrera,nombre_carrera,activo) VALUES(7,'4526','TRABAJO SOCIAL',1);
INSERT INTO bot_carreras(za_carrera,codigo_carrera,nombre_carrera,activo) VALUES(8,'9873','INGENIERIA CIVIL',1);
INSERT INTO bot_carreras(za_carrera,codigo_carrera,nombre_carrera,activo) VALUES(9,'7728','CONTADURIA',0);
INSERT INTO bot_carreras(za_carrera,codigo_carrera,nombre_carrera,activo) VALUES(10,'7765','INGLES',1);

# JORNADAS
#=> INGENIERIA EN SISTEMAS
INSERT INTO bot_jornadas(za_carrera,za_jornada,nombre_jornada,activo) VALUES(1,1,'MATUTINA',1);
INSERT INTO bot_jornadas(za_carrera,za_jornada,nombre_jornada,activo) VALUES(1,2,'VESPERTINA',1);
INSERT INTO bot_jornadas(za_carrera,za_jornada,nombre_jornada,activo) VALUES(1,3,'FIN DE SEMANA',1);
#=> ENFERMERIA
INSERT INTO bot_jornadas(za_carrera,za_jornada,nombre_jornada,activo) VALUES(2,1,'MATUTINA',1);
#=> ARQUITECTURA
INSERT INTO bot_jornadas(za_carrera,za_jornada,nombre_jornada,activo) VALUES(3,1,'MATUTINA',1);
#=> MEDICINA
INSERT INTO bot_jornadas(za_carrera,za_jornada,nombre_jornada,activo) VALUES(4,1,'MATUTINA',1);
#=> MERCADOTECNIA
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

###### pensums
#=>INGENIERIA EN SISTEMAS
INSERT INTO bot_pensums(za_carrera,ano_pensum,codigo_pensum,activo) VALUES(1,1996,'1996',1);
INSERT INTO bot_pensums(za_carrera,ano_pensum,codigo_pensum,activo) VALUES(1,1998,'1998',1);
INSERT INTO bot_pensums(za_carrera,ano_pensum,codigo_pensum,activo) VALUES(1,1999,'1999',1);
INSERT INTO bot_pensums(za_carrera,ano_pensum,codigo_pensum,activo) VALUES(1,2001,'2001',1);
INSERT INTO bot_pensums(za_carrera,ano_pensum,codigo_pensum,activo) VALUES(1,2002,'2002',1);
INSERT INTO bot_pensums(za_carrera,ano_pensum,codigo_pensum,activo) VALUES(1,2005,'2005',1);
INSERT INTO bot_pensums(za_carrera,ano_pensum,codigo_pensum,activo) VALUES(1,2014,'2014',1);
#=> ENFERMERIA
INSERT INTO bot_pensums(za_carrera,ano_pensum,codigo_pensum,activo) VALUES(2,2004,'2004',1);
INSERT INTO bot_pensums(za_carrera,ano_pensum,codigo_pensum,activo) VALUES(2,2010,'2010',1);
#=> ARQUITECTURA
INSERT INTO bot_pensums(za_carrera,ano_pensum,codigo_pensum,activo) VALUES(3,2016,'2016',1);
#=> MEDICINA
INSERT INTO bot_pensums(za_carrera,ano_pensum,codigo_pensum,activo) VALUES(4,2013,'2013',1);
#=> MERCADOTECNIA
INSERT INTO bot_pensums(za_carrera,ano_pensum,codigo_pensum,activo) VALUES(5,2014,'2014',1);

# cursos
#INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149005,'',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149001,'DESARROLLO HUMANO Y PROFESIONAL',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149002,'METODOLOGIA DE LA INVESTIGACION',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149003,'CONTABILIDAD I',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149004,'INTRODUCCION A LOS SISTEMAS DE COMPUTO',1,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149005,'LOGICA',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149006,'PRECALCULO',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149007,'ALGEBRA LINEAL',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149008,'ALGORITMOS',1,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149009,'CONTABILIDAD II',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149010,'MATEMATICA DISCRETA',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149011,'FISICA I',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149012,'PROGRAMACION I',1,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149013,'CALCULO I',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149014,'PROCESO ADMINISTRATIVO',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149015,'DERECHO INFORMATICO',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149016,'MICROECONOMIA',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149017,'PROGRAMACION II',1,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149018,'CALCULO II',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149019,'ESTADISTICA I',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149020,'FISICA II',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149021,'METODOS NUMERICOS',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149022,'PROGRAMACION III',1,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149023,'EMPRENDEDORES DE NEGOCIOS',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149024,'ELECTRONICA ANALOGICA',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149025,'ESTADISTICA II',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149026,'INVESTIGACION DE OPERACIONES',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149027,'BASES DE DATOS I',1,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149028,'AUTOMATAS Y LENGUAJES FORMALES',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149029,'SISTEMAS OPERATIVOS I',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149030,'ELECTRONICA DIGITAL',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149031,'BASES DE DATOS II',1,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149032,'ANALISIS DE SISTEMAS I',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149033,'SISTEMAS OPERATIVOS II',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149034,'ARQUITECTURA DE COMPUTADORAS I',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149035,'COMPILADORES',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149036,'DESARROLLO WEB',1,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149037,'ANALISIS DE SISTEMAS II',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149038,'REDES DE COMPUTADORAS I',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149039,'ETICA PROFESIONAL',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149040,'ARQUITECTURA DE COMPUTADORAS II',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149041,'ADMINISTRACION DE TECNOLOGIAS DE INFORMACION',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149042,'INGENIERIA DE SOFTWARE',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149043,'PROYECTO DE GRADUACION I',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149044,'REDES DE COMPUTADORAS II',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149045,'INTELIGENCIA ARTIFICIAL',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149046,'TELECOMUNICACIONES',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149047,'SEMINARIOS DE TECNOLOGIAS DE INFORMACION',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149048,'ASEGURAMIENTO DE LA CALIDAD DEL SOFTWARE',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149049,'PROYECTO DE GRADUACION II',0,1);
INSERT INTO bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) VALUES(149050,'SEGURIDAD Y AUDITORIA DE SISTEMAS',0,1);


# relaciones de cursos y pensums
#INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(,,,,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149001,1,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149002,1,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149003,1,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149004,1,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149005,1,1);

INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149006,2,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149007,2,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149008,2,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149009,2,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149010,2,1);

INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149011,3,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149012,3,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149013,3,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149014,3,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149015,3,1);

INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149016,4,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149017,4,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149018,4,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149019,4,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149020,4,1);

INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149021,5,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149022,5,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149023,5,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149024,5,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149025,5,1);

INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149026,6,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149027,6,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149028,6,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149029,6,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149030,6,1);

INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149031,7,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149032,7,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149033,7,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149034,7,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149035,7,1);

INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149036,8,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149037,8,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149038,8,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149039,8,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149040,8,1);

INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149041,9,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149042,9,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149043,9,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149044,9,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149045,9,1);

INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149046,10,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149047,10,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149048,10,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149049,10,1);
INSERT INTO bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) VALUES(1,2014,149050,10,1);


# catedraticos
#INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(,'','','',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(78956,'DORIAN','COUTIÑO','LIC. AUDITOR Y CONTADOR PUBLICO',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(866958,'JOSUE','QUIJIVIX','ING. CIVIL',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(69865,'SAMUEL','GOMEZ','ING. EN SISTEMAS',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(896856,'KEIBIN','BARRIOS','ING. CIVIL',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(13008,'OSCAR','GARCIA','ING. EN SISTEMAS',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(789668,'HEIDI','REINOSO','INGA. INDUSTRIAL',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(12996,'NOE','SANCHEZ','ING. EN SISTEMAS',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(98668,'JOSE','COMELLI','LIC. AUDITOR Y CONTADOR PUBLICO',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(489586,'LEONARDO','FUENTES','ING. EN ELECTRONICA',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(1235213,'MANUEL','MAZARIEGOS','ING. EN ELECTRONICA',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(4655,'MARVIN','MENCHU','ING. EN SISTEMAS',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(12341235,'CARLOS','GOMEZ','ING. EN SISTEMAS',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(89686,'OTTO','ROJAS','ING. INDUSTRIAL',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(89568,'LUIS','SOSA','ING. EN SISTEMAS',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(7895688,'ANGELICA','COJULUN','INGA. INDUSTRIAL',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(89658,'ALMA','LOPEZ','LICDA. EN ECONOMIA',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(896586,'MANOLO','RIVERA','ING. EN SISTEMAS',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(88771139,'WALTER','BAUTISTA','ING. EN SISTEMAS',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(17750,'LILY','LOPEZ','LIC. TRABAJO SOCIAL',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(11234,'AIME','MORI','INGA. EN SISTEMAS',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(66532,'FERNANDO','ARRIVILLAGA','ING. EN SISTEMAS',0);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(66773,'JUAN','ORDOÑEZ','ING. EN SISTEMAS',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(666713,'FLAVIO','OVALLE','ING. EN ELECTRONICA',0);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(667813,'ROSSANA','FUENTES','LICDA. EN ECONOMIA',0);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(997662,'DONALD','MONTERROSO','LIC. EN TRABAJO SOCIAL',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(8877813,'CARMEN','GONZALEZ','LICDA. EN DERECHO',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(1010101,'DURWIN','RUIZ','ING. EN SISTEMAS',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(10532101,'CARLOS','SAC','LIC. TRABAJO SOCIAL',1);
INSERT INTO bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) VALUES(10887501,'FRANZ','POLANCO','ING. EN SISTEMAS',0);


#### ASIGNACIONES
#INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(,,,,,,,,,,);
INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2016,1,'A',149001,17750,1,'07:00:00','09:00:00');
INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2016,1,'A',149002,667813,1,'16:00:00','18:00:00');
INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2016,1,'A',149003,78956,1,'11:00:00','13:00:00');
INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2016,1,'A',149004,66773,1,'09:00:00','11:00:00');
INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2016,1,'A',149005,66532,1,'14:00:00','16:00:00');

INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2016,2,'A',149006,1235213,1,'09:00:00','11:00:00');
INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2016,2,'A',149007,11234,1,'14:00:00','16:00:00');
INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2016,2,'A',149008,4655,1,'16:00:00','18:00:00');
INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2016,2,'A',149009,78956,1,'07:00:00','09:00:00');
INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2016,2,'A',149010,666713,1,'11:00:00','13:00:00');

INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2017,3,'A',149011,896856,1,'11:00:00','13:00:00');
INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2017,3,'A',149012,69865,1,'09:00:00','11:00:00');
INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2017,3,'A',149013,666713,1,'07:00:00','09:00:00');
INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2017,3,'A',149014,997662,1,'16:00:00','18:00:00');
INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2017,3,'A',149015,8877813,1,'14:00:00','16:00:00');

INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2017,4,'A',149016,667813,1,'11:00:00','13:00:00');
INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2017,4,'A',149017,89568,1,'14:00:00','16:00:00');
INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2017,4,'A',149018,8877813,1,'07:00:00','09:00:00');
INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2017,4,'A',149019,896856,1,'16:00:00','18:00:00');
INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2017,4,'A',149020,7895688,1,'09:00:00','11:00:00');
																																																
INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2018,5,'A',149021,12341235,1,'16:00:00','18:00:00');
INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2018,5,'A',149022,69865,1,'14:00:00','16:00:00');
INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2018,5,'A',149023,10532101,1,'11:00:00','13:00:00');
INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2018,5,'A',149024,1235213,1,'07:00:00','09:00:00');
INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2018,5,'A',149025,896856,1,'09:00:00','11:00:00');

INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2018,6,'B',149026,89686,1,'14:00:00','16:00:00');
INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2018,6,'B',149027,12341235,1,'11:00:00','13:00:00');
INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2018,6,'B',149028,66532,1,'16:00:00','18:00:00');
INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2018,6,'B',149029,10887501,1,'07:00:00','09:00:00');
INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2018,6,'B',149030,1235213,1,'09:00:00','11:00:00');

INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2019,7,'A',149031,89568,1,'11:00:00','13:00:00');
INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2019,7,'A',149032,88771139,1,'14:00:00','16:00:00');
INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2019,7,'A',149033,896586,1,'09:00:00','11:00:00');
INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2019,7,'A',149034,12341235,1,'07:00:00','09:00:00');
INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2019,7,'A',149035,667813,1,'16:00:00','18:00:00');

INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2019,8,'A',149036,88771139,1,'14:00:00','16:00:00');
INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2019,8,'A',149037,12341235,1,'16:00:00','18:00:00');
INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2019,8,'A',149038,1235213,1,'11:00:00','13:00:00');
INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2019,8,'A',149039,17750,1,'09:00:00','11:00:00');
INSERT INTO bot_asignaciones(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso,za_profesor,za_dia,hora_inicio,hora_fin) VALUES(1,2014,3,2019,8,'A',149040,1010101,1,'07:00:00','09:00:00');

COMMIT;