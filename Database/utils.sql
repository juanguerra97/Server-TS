# Funciones y procedimientos utilitarios

USE db_universidad;

DROP FUNCTION IF EXISTS numcursoscatedraticoenjornada;
DELIMITER //
# Funcion para 
CREATE FUNCTION numcursoscatedraticoenjornada(
	za_carrer int,
    ano_pen int,
    za_jor int,
    an int,
    no_semes int,
    za_prof int
) RETURNS INT DETERMINISTIC
BEGIN
	DECLARE numcursos INT DEFAULT 0;
    SELECT COUNT(*) INTO numcursos FROM (SELECT COUNT(*)
	FROM bot_asignaciones 
    WHERE za_carrera = za_carrer AND
		ano_pensum = ano_pen AND
        za_jornada = za_jor AND
        ano = an AND
        no_semestre MOD 2 = no_semes MOD 2 AND
        za_profesor = za_prof
    GROUP BY za_carrera,ano_pensum,za_jornada,ano,no_semestre,za_curso,za_profesor) SUB;
    
    RETURN numcursos;
END//
DELIMITER ;
