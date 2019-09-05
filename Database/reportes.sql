-- Reporte No1.

-- aun no disponible


-- reporte NO2.1 Llamado desde el Codigo del Catedratico
/*Lista de catedráticos con sus cursos que tiene asignados, nombre de carrera,
nombre de curso y horario. El dato de búsqueda debe ser por código de
catedrático , año y número del semestre (1,2). 
ejemplo: call reporte_catedratico(7,2018,1);    devuelve al catedratico con el za_profesor = 7
                                                año 2018 y semestre 2
call reporte_catedratico (7,0,2);  devuelve al catedratico con el za_profesor = 7
                                    el cero representa al año actual y semestre 2

*/

USE `db_universidad`;
DROP procedure IF EXISTS `reporte_catedratico`;

DELIMITER $$
CREATE PROCEDURE `reporte_catedratico`(
in codigo_ca int,
in anio int,
in sem int)
BEGIN
declare a int;
select year(current_date()) into a; 
if (anio = 0)
then
	select distinct bot_catedraticos.nombres as Nombre, 
					bot_catedraticos.apellidos as Apellido,
					bot_carreras.nombre_carrera as Carrera,
					bot_cursos.nombre_curso as Curso,
					bot_asignaciones.hora_inicio,
					bot_asignaciones.hora_fin
from bot_carreras                
		inner join bot_jornadas on bot_carreras.za_carrera = bot_jornadas.za_carrera
		inner join bot_dias_jornadas on bot_jornadas.za_carrera = bot_dias_jornadas.za_carrera
		inner join bot_asignaciones on bot_asignaciones.za_carrera = bot_dias_jornadas.za_carrera
		inner join bot_catedraticos on bot_catedraticos.za_profesor = bot_asignaciones.za_profesor
		inner join bot_cursos_pensums on bot_cursos_pensums.za_curso = bot_asignaciones.za_curso
		inner join bot_cursos on bot_cursos.za_curso = bot_cursos_pensums.za_curso
	where bot_catedraticos.za_profesor  = codigo_ca
	and bot_dias_jornadas.za_dia = bot_asignaciones.za_dia
	and bot_asignaciones.ano = a
    and bot_asignaciones.no_semestre = sem
	and  bot_catedraticos.activo = 1;
else 
	select distinct bot_catedraticos.nombres as Nombre, 
					bot_catedraticos.apellidos as Apellido,
					bot_carreras.nombre_carrera as Carrera,
					bot_cursos.nombre_curso as Curso,
					bot_asignaciones.hora_inicio,
					bot_asignaciones.hora_fin
from bot_carreras                
		inner join bot_jornadas on bot_carreras.za_carrera = bot_jornadas.za_carrera
		inner join bot_dias_jornadas on bot_jornadas.za_carrera = bot_dias_jornadas.za_carrera
		inner join bot_asignaciones on bot_asignaciones.za_carrera = bot_dias_jornadas.za_carrera
		inner join bot_catedraticos on bot_catedraticos.za_profesor = bot_asignaciones.za_profesor
		inner join bot_cursos_pensums on bot_cursos_pensums.za_curso = bot_asignaciones.za_curso
		inner join bot_cursos on bot_cursos.za_curso = bot_cursos_pensums.za_curso
	where bot_catedraticos.za_profesor  = codigo_ca
	and bot_dias_jornadas.za_dia = bot_asignaciones.za_dia
	and bot_asignaciones.ano = anio
    and ((bot_asignaciones.no_semestre + 1) MOD 2) + 1 = sem
	and  bot_catedraticos.activo = 1;
    end if;
END$$

DELIMITER ;






/* reporte NO3 listar los cursos  por catedráticos, la información es: código
de catedrático, nombre y total de cursos asignados, esta en orden
descendente por la cantidad de cursos. No hay que mandarle ningun dato*/
drop procedure  if exists reporte_cursos;
delimiter //

create procedure reporte_cursos(
	
)
begin
	
select   bot_catedraticos.za_profesor as Codigo_Catedratico, 
		 bot_catedraticos.nombres as Nombre, 
	     bot_catedraticos.apellidos as Apellido,
         count(bot_asignaciones.za_curso) as Cursos_asignados
from bot_cursos
	join bot_cursos_pensums on bot_cursos_pensums.za_curso = bot_cursos.za_curso
	join bot_asignaciones on bot_asignaciones.za_curso = bot_cursos_pensums.za_curso
	join bot_catedraticos on bot_catedraticos.za_profesor = bot_asignaciones.za_profesor
	group by bot_catedraticos.za_profesor order by count(bot_asignaciones.za_curso) desc;

end //

delimiter ;
