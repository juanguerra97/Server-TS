-- -----------------------------------------------------
-- Schema db_universidad
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_universidad
-- -----------------------------------------------------

drop schema if exists db_universidad;

CREATE SCHEMA IF NOT EXISTS db_universidad DEFAULT CHARACTER SET utf8 ;
USE db_universidad;

-- bot_carrera

drop table if exists bot_carreras;

create table bot_carreras(
	za_carrera int not null,
    codigo_carrera varchar(15) not null,
    nombre_carrera varchar(30) not null,
    activo bit,
    constraint PK_za_carrera primary key(za_carrera),
    unique(za_carrera)
);

-- bot_jornadas

drop table if exists bot_jornadas;

create table bot_jornadas(
	za_jornada int not null,
    za_carrera int not null,
    nombre_jornada varchar(30) not null,
    activo bit not null,
    constraint PK_za_jornada primary key(za_carrera,za_jornada),
    constraint FK_jornadas_carreras foreign key(za_carrera)
				references bot_carreras(za_carrera),
	unique(za_carrera,za_jornada)
);

-- bot_dias_jornadas

drop table if exists bot_dias_jornadas;

create table bot_dias_jornadas(
	za_jornada int not null,
    za_carrera int not null,
    za_dia int not null,
    dia varchar(20) not null,
    activo bit not null,
    constraint PK_za_dia primary key(za_carrera, za_jornada, za_dia),
    constraint FK_dias_a_jornadas foreign key(za_carrera,za_jornada)
				references bot_jornadas(za_carrera,za_jornada),
	unique(za_carrera, za_jornada, za_dia)
);

/*-- bot_horarios

drop table if exists bot_horarios;

create table bot_horarios(
	za_carrera int not null,
    za_jornada int not null,
    za_dia int not null,
    za_horario int not null,
    hora_inicio time not null,
    hora_fin time not null,
    activo bit not null,
    constraint PK_za_horario primary key(za_carrera, za_jornada, za_dia, za_horario),
    constraint FK_horarios_a_dias_jornadas foreign key(za_carrera, za_jornada, za_dia)
				references bot_dias_jornadas(za_carrera, za_jornada, za_dia),
	unique(za_carrera, za_jornada, za_dia)
);*/

-- bot_pensums

drop table if exists bot_pensums;

create table bot_pensums(
	za_carrera int not null,
    ano_pensum int not null,
    codigo_pensum varchar(10) not null,
    activo bit not null,
    constraint PK_ano_pensum primary key(za_carrera, ano_pensum)
);

-- bot_cursos

drop table if exists bot_cursos;

create table bot_cursos(
    za_curso int not null,
    nombre_curso varchar(30) not null,
    usa_laboratorio bit not null,
    activo bit not null,
    constraint PK_za_curso primary key(za_curso),
    unique(za_curso)
);

-- bot_cursos_pensum

drop table if exists bot_cursos_pensums;

create table bot_cursos_pensums(
	za_carrera int not null,
    ano_pensum int not null,
    za_curso int not null,
    ciclo int not null,
    activo bit not null,
    constraint PK_za_cursos_pensum primary key(za_carrera, ano_pensum, za_curso),
    constraint FK_curpensum_a_cursos foreign key(za_curso)
				references bot_cursos(za_curso),
	constraint FK_curpensum_a_pensums foreign key(za_carrera, ano_pensum)
				references bot_pensums(za_carrera, ano_pensum),
	unique(za_carrera, ano_pensum, za_curso)
);

-- bot_lin_profesiones
/*
drop table if exists bot_lin_profesiones;

create table bot_lin_profesiones(
	za_profesion int not null,
    profesion varchar(200) not null,
    activo bit not null,
    constraint PK_profesion primary key(za_profesion),
    unique (za_profesion)
);
*/
-- bot_catedraticos

drop table if exists bot_catedraticos;

create table bot_catedraticos(
	za_profesor int not null,
    nombres varchar(100) not null,
    apellidos varchar(100) not null,
    profesion varchar(200) not null,
    activo bit not null,
    constraint PK_za_profesor primary key(za_profesor)
);

-- bot_asignaciones

drop table if exists bot_asignaciones;

create table bot_asignaciones(
	za_carrera int not null,
    ano_pensum int not null,
    za_curso int not null,
    za_profesor int not null,
    no_semestre int not null,
    ano int not null,
    seccion varchar(2) not null,
    hora_inicio time not null,
    hora_fin time not null,
    constraint PK_asignaciones primary key(za_carrera,ano_pensum,za_curso, za_profesor),
    constraint FK_asignaciones_a_pensums foreign key(za_carrera, ano_pensum, za_curso)
				references bot_cursos_pensums(za_carrera, ano_pensum, za_curso),
	constraint FK_asignaciones_a_catedraticos foreign key(za_profesor)
				references bot_catedraticos(za_profesor),
	unique(za_carrera,ano_pensum, za_curso, za_profesor)
);

-- bot_usuarios

drop table if exists bot_usuarios;

create table bot_usuarios(
	za_usuario int not null,
    usuario varchar(50) not null,
    contrasena varchar(20) not null,
    foto varchar(200) not null default 'img/user.png',
    activo bit not null default 1,
    constraint PK_usuario primary key(za_usuario),
    unique(za_usuario)
);

drop user if exists 'usuario'@'localhost';
grant select, insert, update, delete on db_universidad.* to 'usuario'@'localhost' identified by 'usuario';
grant execute on *.* to 'usuario'@'localhost';

insert into bot_usuarios values(1,'Admin','Admin','vistas/modulos/img/admin.png',1);


drop procedure if exists cos_bot_usuarios_loggeo;

delimiter //

create procedure cos_bot_usuarios_loggeo(
	in users varchar(100),
    in contra varchar(100)
)
begin

	select * from bot_usuarios
    where 	usuario = users and
			contrasena = contra;

end;//

delimiter //

delimiter //

create procedure sen_bot_carreras(
	in za_carera int,
    in cod_carrera varchar(15),
    in name_carrera varchar(30),
    in activ bit,
    in accion int(1)
)
begin

	if not exists(
		select * from bot_carreras where za_carrera = za_carera
    )
    then
		select ifnull(max(za_carrera),0) + 1 into za_carera from bot_carreras;
        
        insert into bot_carreras values(za_carera, cod_carrera, name_carrera, activ);
    else
    
		update bot_carreras
        set
			codigo_carrera = cod_carera,
            nombre_carrera = name_carrera,
            activo = activ
		where
			za_carrera = za_carera;
    
    end if;

end//;

delimiter //