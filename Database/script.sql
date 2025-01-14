-- -----------------------------------------------------
-- Schema db_universidad
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_universidad
-- -----------------------------------------------------

drop schema if exists db_universidad;

CREATE SCHEMA IF NOT EXISTS db_universidad default character set utf8 collate utf8_spanish_ci ;
USE db_universidad;

-- bot_carrera

drop table if exists bot_carreras;

create table bot_carreras(
	za_carrera int not null,
    codigo_carrera varchar(15) not null,
    nombre_carrera varchar(100) not null,
    activo bit,
    constraint PK_za_carrera primary key(za_carrera),
    constraint UK_codigo_carrera unique(codigo_carrera),
    constraint UK_nombre_carrera unique(nombre_carrera)
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
	constraint UK_nombre_jornada unique(za_carrera,nombre_jornada)
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
	constraint UK_dia unique(za_carrera, za_jornada, dia)
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
    constraint PK_ano_pensum primary key(za_carrera, ano_pensum),
    constraint UK_codigo_pensum unique(za_carrera,codigo_pensum)
);

-- bot_cursos

drop table if exists bot_cursos;

create table bot_cursos(
    za_curso int not null,
    nombre_curso varchar(150) not null,
    usa_laboratorio bit not null,
    activo bit not null,
    constraint PK_za_curso primary key(za_curso),
    constraint UK_nombre_curso unique(nombre_curso)
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
				references bot_pensums(za_carrera, ano_pensum)
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
    za_jornada int not null,
    ano int not null,
    no_semestre int not null,
    seccion varchar(2) not null,
    za_curso int not null,
    za_profesor int not null,
    za_dia int not null,
    hora_inicio time not null,
    hora_fin time not null,
    constraint PK_asignaciones primary key(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_curso, za_dia),
    constraint UK_profesor_en_seccion_y_dia UNIQUE(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_profesor, za_dia),
    constraint UK_hora_inicio_en_dia UNIQUE(za_carrera,ano_pensum,za_jornada,ano,no_semestre,seccion,za_dia,hora_inicio), 
    constraint FK_asignaciones_a_pensums foreign key(za_carrera, ano_pensum, za_curso)
				references bot_cursos_pensums(za_carrera, ano_pensum, za_curso),
	constraint FK_asignaciones_a_catedraticos foreign key(za_profesor)
				references bot_catedraticos(za_profesor),
	CONSTRAINT FK_asig_a_diasjornadas FOREIGN KEY(za_carrera,za_jornada,za_dia)
				REFERENCES bot_dias_jornadas(za_carrera,za_jornada,za_dia),
	CONSTRAINT CK_horario CHECK(hora_inicio < hora_fin)
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

drop user if exists 'usuario'@'%';
create user 'usuario'@'%' identified by 'usuario';
grant select, insert, update, delete on db_universidad.* to 'usuario'@'%';
grant execute on *.* to 'usuario'@'%';

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
    in name_carrera varchar(100),
    in activ bit,
    in accion int(1)
)
begin

	if(accion = 1)
    then
		if not exists(
			select * from bot_carreras where za_carrera = za_carera
		)
		then
			select ifnull(max(za_carrera),0) + 1 into za_carera from bot_carreras;
			
			insert into bot_carreras values(za_carera, cod_carrera, name_carrera, activ);
		else
		
			update bot_carreras
			set
				codigo_carrera = cod_carrera,
				nombre_carrera = name_carrera,
				activo = activ
			where
				za_carrera = za_carera;
		
		end if;
    elseif(accion = 2) then
		delete from bot_carreras where za_carrera = za_carera;
    end if;

end//;

delimiter ;
DROP FUNCTION IF EXISTS ins_carrera;

delimiter //
create function ins_carrera(
    cod_carrera varchar(15),
    name_carrera varchar(100),
    activ bit
) RETURNS INT DETERMINISTIC
begin
	declare za_carera int default 0;
	select ifnull(max(za_carrera),0) + 1 into za_carera from bot_carreras;
	insert into bot_carreras(za_carrera,codigo_carrera,nombre_carrera,activo) 
		values(za_carera, cod_carrera, name_carrera, activ);
	return za_carera;
end//

delimiter ;
DROP PROCEDURE IF EXISTS upd_carrera;

delimiter //
create procedure upd_carrera(
	in za_carera int,
	in cod_carrera varchar(15),
    in name_carrera varchar(100),
    in activ bit)
begin
	update bot_carreras
	set
		codigo_carrera = cod_carrera,
		nombre_carrera = name_carrera,
		activo = activ
	where za_carrera = za_carera;
end//

delimiter //
create procedure sen_bot_jornadas(
	in za_jor int,
    in za_carre int,
    in nombre_jor varchar(30),
    in activ bit,
    in accion int
)
begin

	if(accion = 1)
    then
		if not exists(
			select * from bot_jornadas
            where
				za_jornada = za_jor and
                za_carrera = za_carre
        )
        then
			select ifnull(max(za_jornada),0) + 1 into za_jor from bot_jornadas
            where
				za_carrera = za_carre;
			insert into bot_jornadas values(za_jor, za_carre, nombre_jor, activ);
        else
			update bot_jornadas
            set
				nombre_jornada = nombre_jor,
                activo = activ
			where
				za_jornada = za_jor and
                za_carrera = za_carre;
        end if;
    else
		if exists(
			select * from bot_jornadas where za_carrera = za_carre and za_jornada = za_jor
        )
        then
			delete from bot_jornadas
            where
				za_carrera = za_carre and
                za_jornada = za_jor;
        end if;
    end if;

end//;

delimiter ;
DROP FUNCTION IF EXISTS ins_jornada;

delimiter //
CREATE FUNCTION ins_jornada(
    za_carre int,
    nombre_jor varchar(30),
    activ bit
) RETURNS INT DETERMINISTIC 
BEGIN
	DECLARE za_jor INT DEFAULT 0;
    
    select ifnull(max(za_jornada),0) + 1 into za_jor  from bot_jornadas 
		where za_carrera = za_carre;
	
    insert into bot_jornadas(za_carrera,za_jornada,nombre_jornada,activo) 
		values(za_carre, za_jor, nombre_jor, activ);
	RETURN za_jor;
END//

delimiter ;
DROP PROCEDURE IF EXISTS upd_jornada;

delimiter //
CREATE PROCEDURE upd_jornada(
	in za_carre int,
	in za_jor int,
    in nombre_jor varchar(30),
    in activ bit)
BEGIN
	update bot_jornadas
	set
		nombre_jornada = nombre_jor,
		activo = activ
	where za_carrera = za_carre and za_jornada = za_jor;
END//

delimiter //
create procedure sen_bot_pensums(
	in ano_pen int,
    in za_carre int,
    in cod_pensum varchar(10),
    in activ bit,
    in accion int
)
begin

	if(accion = 1)
    then
    
		if not exists(
			select * from bot_pensums where za_carrera = za_carre and ano_pensum = ano_pen
        )
        then
        
			insert into bot_pensums values(za_carre,ano_pen,cod_pensum,activ);
        
        else
			update bot_pensums
            set
				codigo_pensum = cod_pensum,
                activo = activ
			where
				za_carrera = za_carre and
                ano_pensum = ano_pen;
        end if;
    
    elseif(accion = 2)
    then
		if exists(
			select * from bot_pensums where za_carrera = za_carre and ano_pensum = ano_pen
        )
        then
			delete from bot_pensums where za_carrera = za_carre and ano_pensum = ano_pen;
        end if;
    end if;

end//;

delimiter ;
DROP PROCEDURE IF EXISTS ins_pensum;

delimiter //
CREATE PROCEDURE ins_pensum(
	in za_carre int,
	in ano_pen int,
    in cod_pensum varchar(10),
    in activ bit)
BEGIN
	insert into bot_pensums(za_carrera,ano_pensum,codigo_pensum,activo) 
		values(za_carre,ano_pen,cod_pensum,activ);
END//

delimiter ;
DROP PROCEDURE IF EXISTS upd_pensum;

delimiter //
CREATE PROCEDURE upd_pensum(
	in za_carre int,
	in ano_pen int,
    in cod_pensum varchar(10),
    in activ bit)
BEGIN
	update bot_pensums
	set
		codigo_pensum = cod_pensum,
		activo = activ
	where
		za_carrera = za_carre and ano_pensum = ano_pen;
END//

delimiter ;
DROP PROCEDURE IF EXISTS del_pensum;

delimiter //
CREATE PROCEDURE del_pensum(
	in za_carre int,
	in ano_pen int)
BEGIN
	delete from bot_pensums where za_carrera = za_carre and ano_pensum = ano_pen;
END//

delimiter //

create procedure sen_bot_cursos(
	in za_cur int,
    in nombre_cur varchar(100),
    in usa_lab bit,
    in activ bit,
    in accion int
)
begin

	if(accion = 1)
    then
		
        if not exists(
			select * from bot_cursos where za_curso = za_cur
        )
        then
			select ifnull(max(za_curso),0) + 1 into za_cur from bot_cursos;
            
            insert into bot_cursos values(za_cur,nombre_cur,usa_lab,activ);
		else
			update bot_cursos
            set
				nombre_curso = nombre_cur,
                usa_laboratorio = usa_lab,
                activo = activ
			where
				za_curso = za_cur;
        end if;
    
    elseif(accion = 2)
    then
		if exists(
			select * from bot_cursos where za_curso = za_cur
        )
        then
			delete from bot_cursos where za_curso = za_cur;
        end if;
    end if;

end//;

delimiter ;
DROP FUNCTION IF EXISTS ins_curso;

delimiter //
create function ins_curso(
    nombre_cur varchar(100),
    usa_lab bit,
    activ bit)
RETURNS INT DETERMINISTIC
begin
	declare za_cur int default 0;
	select ifnull(max(za_curso),0) + 1 into za_cur from bot_cursos;
    insert into bot_cursos(za_curso,nombre_curso,usa_laboratorio,activo) 
		values(za_cur,nombre_cur,usa_lab,activ);
	RETURN za_cur;
end//

delimiter ;
DROP PROCEDURE IF EXISTS upd_curso;

delimiter //
create procedure upd_curso(
	in za_cur int,
	in nombre_cur varchar(100),
    in usa_lab bit,
    in activ bit)
begin
	update bot_cursos
	set
		nombre_curso = nombre_cur,
		usa_laboratorio = usa_lab,
		activo = activ
	where za_curso = za_cur;
end//


delimiter //
create procedure sen_bot_catedraticos(
	in za_prof int,
    in nombre varchar(100),
    in apellido varchar(100),
    in profesi varchar(200),
    in activ bit,
    in accion int
)
begin

	if(accion = 1)
    then
    
		if not exists(
			select * from bot_catedraticos where za_profesor = za_prof
        )
        then
			select ifnull(max(za_profesor),0) + 1 into za_prof from bot_catedraticos;
            insert into bot_catedraticos values(za_prof,nombre,apellido,profesi,activ);
        else
			update bot_catedraticos
            set
				nombres = nombre,
                apellidos = apellido,
                profesion = profesi,
                activo = activ
			where
				za_profesor = za_prof;
        end if;
    
    elseif(accion = 2)
    then
		if exists(
			select * from bot_catedraticos where za_profesor = za_prof
        )
        then
			delete from bot_catedraticos where za_profesor = za_prof;
        end if;
    end if;

end//;

delimiter ;
DROP FUNCTION IF EXISTS ins_catedratico;

delimiter //
CREATE FUNCTION ins_catedratico(
    nombre varchar(100),
    apellido varchar(100),
    profesi varchar(200),
    activ bit) 
RETURNS INT DETERMINISTIC
begin
	declare za_prof int default 0;
	select ifnull(max(za_profesor),0) + 1 into za_prof from bot_catedraticos;
    insert into bot_catedraticos(za_profesor,nombres,apellidos,profesion,activo) 
		values(za_prof,nombre,apellido,profesi,activ);
	RETURN za_prof;
end//

delimiter ;
DROP PROCEDURE IF EXISTS upd_catedratico;

delimiter //
create procedure upd_catedratico(
	in za_prof int,
    in nombre varchar(100),
    in apellido varchar(100),
    in profesi varchar(200),
    in activ bit)
begin
	update bot_catedraticos
	set
		nombres = nombre,
		apellidos = apellido,
		profesion = profesi,
		activo = activ
	where za_profesor = za_prof;
end//

delimiter //
create procedure sen_bot_cursos_pensums(
	in za_carre int,
    in ano_pen int,
    in za_cur int,
    in cic int,
    in activ bit,
    in accion int
)
begin

	if(accion = 1)
    then
    
		if not exists(
			select * from bot_cursos_pensums where za_carrera = za_carre and ano_pensum = ano_pen and za_curso = za_cur
        )
        then
			insert into bot_cursos_pensums values(za_carre,ano_pen,za_cur,cic,activ);
        else
			update bot_cursos_pensums
            set
				ciclo = cic,
                activo = activ
			where
				za_carrera = za_carre and
                ano_pensum = ano_pen and
                za_curso = za_cur;
        end if;
    
    elseif(accion = 2)
    then
		if exists(
			select * from bot_cursos_pensums where za_carrera = za_carre and ano_pensum = ano_pen and za_curso = za_cur
        )
        then
			delete from bot_cursos_pensums where za_carrera = za_carre and ano_pensum = ano_pen and za_curso = za_cur;
        end if;
    end if;

end//;

delimiter ;
DROP PROCEDURE IF EXISTS ins_cursopensum;

delimiter //
CREATE PROCEDURE ins_cursopensum(
	in za_carre int,
    in ano_pen int,
    in za_cur int,
    in cic int,
    in activ bit)
BEGIN
	insert into bot_cursos_pensums(za_carrera,ano_pensum,za_curso,ciclo,activo) 
		values(za_carre,ano_pen,za_cur,cic,activ);
END//

delimiter ;
DROP PROCEDURE IF EXISTS upd_cursopensum;

delimiter //
CREATE PROCEDURE upd_cursopensum(
	in za_carre int,
    in ano_pen int,
    in za_cur int,
    in cic int,
    in activ bit)
BEGIN
	update bot_cursos_pensums
	set
		ciclo = cic,
		activo = activ
	where
		za_carrera = za_carre and
		ano_pensum = ano_pen and
		za_curso = za_cur;
END//

delimiter //
CREATE PROCEDURE sen_bot_dias_jornadas(
	in za_d int,
    in za_jor int,
    in za_carre int,
    in di varchar(20),
    in activ bit,
    in accion int
)
begin

	if(accion = 1)
    then
		
        if not exists(
			select * from bot_dias_jornadas
            where
				za_carrera = za_carre and
                za_jornada = za_jor and
                za_dia = za_d
        )
        then
			
            select ifnull(max(za_dia),0) + 1 into za_d from bot_dias_jornadas
            where
				za_carrera = za_carre and
                za_jornada = za_jor;
                
			insert into bot_dias_jornadas values(za_jor, za_carre, za_d, di, activ);
            
        else
        
			update bot_dias_jornadas
            set
				dia = di,
                activo = activ
			where
				za_carrera = za_carre and
                za_jornada = za_jor and
                za_dia = za_d;
        
        end if;
        
    else
    
		if exists(
			select * from bot_dias_jornadas
            where
				za_carrera = za_carre and
                za_jornada = za_jor and
                za_dia = za_d
        )
        then
        
			delete from bot_dias_jornadas
            where
				za_carrera = za_carre and
                za_jornada = za_jor and
                za_dia = za_d;
        
        end if;
    
    end if;

end//;

delimiter ;
DROP FUNCTION IF EXISTS ins_dia;

delimiter //
CREATE FUNCTION ins_dia(
	za_carre int,
    za_jor int,
    di varchar(20),
    activ bit
) RETURNS INT DETERMINISTIC
BEGIN
	DECLARE za_d INT DEFAULT 0;
    
    select ifnull(max(za_dia),0) + 1 into za_d from bot_dias_jornadas
	where za_carrera = za_carre and za_jornada = za_jor;
        
	insert into bot_dias_jornadas(za_carrera,za_jornada,za_dia,dia,activo) 
    values(za_carre, za_jor, za_d, di, activ);
    
    RETURN za_d;
END//

delimiter ;
DROP PROCEDURE IF EXISTS upd_dia;

delimiter //
CREATE PROCEDURE upd_dia(
	in za_carre int,
    in za_jor int,
	in za_d int,
    in di varchar(20),
    in activ bit)
BEGIN
	update bot_dias_jornadas
	set
		dia = di,
		activo = activ
	where za_carrera = za_carre and
		za_jornada = za_jor and
		za_dia = za_d;
END//

delimiter ;
DROP PROCEDURE IF EXISTS del_dia;

delimiter //
CREATE PROCEDURE del_dia(
	in za_carre int,
    in za_jor int,
	in za_d int)
BEGIN
	delete from bot_dias_jornadas
	where za_carrera = za_carre and
		za_jornada = za_jor and
		za_dia = za_d;
END//

delimiter //
create procedure sen_bot_asignaciones(
	in za_carrer int,
    in ano_pen int,
    in za_jor int,
    in an int,
    in no_semes int,
    in sec varchar(2),
    in za_cur int,  
    in za_prof int,
    in za_di int,
    in hora_ini varchar(10),
    in hora_fi varchar(10),
    in accion int
)
begin

	if(accion = 1)
    then
    
		if not exists(
			select * from bot_asignaciones
            where
				za_carrera = za_carrer and
                ano_pensum = ano_pen and
                za_jornada = za_jor and
                ano = an and
                no_semestre = no_semes and
                seccion = sec and
                za_curso = za_cur and
                za_profesor = za_prof and
                za_dia = za_di and
                hora_inicio = hora_ini
        )
        then
			insert into bot_asignaciones values(za_carrer,ano_pen, za_jor, an, no_semes, sec, za_cur, za_prof,za_di, convert(hora_ini,time), convert(hora_fi,time));
        else
			update bot_asignaciones
            set
				ano = an,
				no_semestre = no_semes,
                seccion = sec,
                za_dia = za_di,
                hora_inicio = convert(hora_ini,time),
                hora_fin = convert(hora_fi,time)
			where
				za_carrera = za_carrer and
                ano_pensum = ano_pen and
                za_jornada = za_jor and
                ano = an and
                no_semestre = no_semes and
                seccion = sec and
                za_curso = za_cur and
                za_profesor = za_prof and
                za_dia = za_di and
                hora_inicio = hora_ini;
        end if;
    
    elseif(accion = 2)
    then
		if exists(
			select * from bot_asignaciones
            where
				za_carrera = za_carrer and
                ano_pensum = ano_pen and
                za_jornada = za_jor and
                ano = an and
                no_semestre = no_semes and
                seccion = sec and
                za_curso = za_cur and
                za_profesor = za_prof and
                za_dia = za_di and
                hora_inicio = hora_ini
        )
        then
			delete from bot_asignaciones
			where
				za_carrera = za_carrer and
                ano_pensum = ano_pen and
                za_jornada = za_jor and
                ano = an and
                no_semestre = no_semes and
                seccion = sec and
                za_curso = za_cur and
                za_profesor = za_prof and
                za_dia = za_di and
                hora_inicio = hora_ini;
        end if;
    end if;

end//;
delimiter //

-- Todos los selects necesarios
delimiter //

create procedure cos_bot_jornadas(
	in za_carre int,
    in za_jor int
)
begin

	if(za_jor = 0)
    then
		select
			jor.za_carrera,
            jor.za_jornada,
            jor.nombre_jornada,
            jor.activo,
            car.nombre_carrera,
            car.codigo_carrera
		from
			bot_jornadas as jor inner join
            bot_carreras as car on
            car.za_carrera = jor.za_carrera
		where
			jor.za_carrera = za_carre;
    else
		select
			jor.za_carrera,
            jor.za_jornada,
            jor.nombre_jornada,
            jor.activo,
            car.nombre_carrera,
            car.codigo_carrera
		from
			bot_jornadas as jor inner join
            bot_carreras as car on
            car.za_carrera = jor.za_carrera
		where
			jor.za_carrera = za_carre and
            jor.za_jornada = za_jor;
    end if;

end//;

delimiter //

delimiter //

create procedure cos_bot_dias_jornadas(
	in za_carre int,
    in za_jor int,
    in za_di int
)
begin

	if(za_di = 0)
    then
		select
			dias.za_dia,
            dias.za_carrera,
            dias.za_jornada,
            dias.dia,
            dias.activo,
            jor.nombre_jornada,
            car.nombre_carrera,
            car.codigo_carrera
		from
			bot_dias_jornadas as dias inner join
            bot_jornadas as jor on
            jor.za_jornada = dias.za_jornada and
            jor.za_carrera = dias.za_carrera
            
            inner join
            
            bot_carreras as car on
            car.za_carrera = jor.za_carrera
		
        where
			dias.za_jornada = za_jor and
            dias.za_carrera = za_carre;
        
    else
		select
			dias.za_dia,
            dias.za_carrera,
            dias.za_jornada,
            dias.dia,
            dias.activo,
            jor.nombre_jornada,
            car.nombre_carrera,
            car.codigo_carrera
		from
			bot_dias_jornadas as dias inner join
            bot_jornadas as jor on
            jor.za_jornada = dias.za_jornada and
            jor.za_carrera = dias.za_carrera
            
            inner join
            
            bot_carreras as car on
            car.za_carrera = jor.za_carrera
		
        where
			dias.za_jornada = za_jor and
            dias.za_carrera = za_carre and
            dias.za_dia = za_di;
    end if;

end//;

delimiter //

delimiter //
create procedure cos_bot_pensums(
	in za_carre int,
    in ano_pen int
)
begin

	if(ano_pen = 0)
    then
		select
			pen.za_carrera,
            pen.ano_pensum,
            pen.codigo_pensum,
            pen.activo,
            car.nombre_carrera,
            car.codigo_carrera
		from
			bot_pensums as pen inner join
            bot_carreras as car on
            car.za_carrera = pen.za_carrera
		where
			pen.za_carrera = za_carre;
    else
		select
			pen.za_carrera,
            pen.ano_pensum,
            pen.codigo_pensum,
            pen.activo,
            car.nombre_carrera,
            car.codigo_carrera
		from
			bot_pensums as pen inner join
            bot_carreras as car on
            car.za_carrera = pen.za_carrera
		where
			pen.za_carrera = za_carre and
            pen.ano_pensum = ano_pen;
    end if;

end//;

delimiter ;


drop procedure if exists cos_bot_cursos_pensums;
delimiter //
create procedure cos_bot_cursos_pensums(
	in za_carre int,
    in ano_pen int,
    in za_cur int
)
begin

	if(za_cur = 0)
    then
    
		select
			cur.za_carrera,
            cur.ano_pensum,
            cur.ciclo,
            cur.activo,
            curr.za_curso,
            curr.nombre_curso,
            curr.usa_laboratorio,
            curr.activo as curso_activo
		from
			bot_cursos_pensums as cur 
            
            inner join
            
            bot_cursos curr on
            curr.za_curso = cur.za_curso
            
		where
			cur.za_carrera = za_carre and
            cur.ano_pensum = ano_pen;
    
    else
		select
			cur.za_carrera,
            cur.ano_pensum,
            cur.ciclo,
            cur.activo,
            curr.za_curso,
            curr.nombre_curso,
            curr.usa_laboratorio,
            curr.activo as curso_activo
		from
			bot_cursos_pensums as cur 
            
            inner join
            
            bot_cursos curr on
            curr.za_curso = cur.za_curso
            
		where
			cur.za_carrera = za_carre and
            cur.ano_pensum = ano_pen and
            cur.za_curso = za_cur;
    end if;

end//;

delimiter ;


##############################################################################################
################### FUNCIONES ################################################################
##############################################################################################

DROP FUNCTION IF EXISTS numcursoscatedraticoenjornada;
DELIMITER //
# Funcion para saber el numero de cursos diferentes a cierto curso
# que un catedratico tiene asignados en una jornada
CREATE FUNCTION numcursoscatedraticoenjornada(
	za_carrer int,
    ano_pen int,
    za_jor int,
    an int,
    no_semes int,
    za_cur int,
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
        za_curso != za_cur AND
        za_profesor = za_prof
    GROUP BY za_carrera,ano_pensum,za_jornada,ano,no_semestre,za_curso,za_profesor) SUB;
    
    RETURN numcursos;
END//
DELIMITER ;


#######---------------------------------------------------------------##########
DROP FUNCTION IF EXISTS catedraticodecurso;
DELIMITER //
# Funcion para saber el catedratico que da un curso en cierta seccion
CREATE FUNCTION catedraticodecurso(
	za_carrer int,
    ano_pen int,
    za_jor int,
    an int,
    no_semes int,
    sec VARCHAR(2),
    za_cur int
) RETURNS INT DETERMINISTIC
BEGIN
	DECLARE za_prof INT DEFAULT 0;
    SELECT DISTINCT za_profesor INTO za_prof
    FROM bot_asignaciones
    WHERE za_carrera = za_carrer AND
		ano_pensum = ano_pen AND
        za_jornada = za_jor AND
        ano = an AND
        no_semestre MOD 2 = no_semes MOD 2 AND
        seccion = sec AND
        za_curso = za_cur;
    
    RETURN za_prof;
END//
DELIMITER ;

#######---------------------------------------------------------------##########
DROP FUNCTION IF EXISTS numcursosdiferentesdecatedraticoenseccion;
DELIMITER //
# Funcion para saber el numero de cursos diferentes a cierto curso
# que un catedratico tiene asignados para una seccion en especifico
CREATE FUNCTION numcursosdiferentesdecatedraticoenseccion(
	za_carrer int,
    ano_pen int,
    za_jor int,
    an int,
    no_semes int,
    sec VARCHAR(2),
    za_cur int,
    za_prof int
) RETURNS INT DETERMINISTIC
BEGIN
	DECLARE numcursos INT DEFAULT 0;
    
    SELECT COUNT(DISTINCT za_curso) INTO numcursos 
    FROM (
		SELECT za_curso 
        FROM bot_asignaciones 
		WHERE za_carrera = za_carrer AND
			ano_pensum = ano_pen AND
			za_jornada = za_jor AND
			ano = an AND
			no_semestre = no_semes AND
			seccion = sec AND
			za_curso != za_cur AND 
			za_profesor = za_prof 
		GROUP BY za_curso
    ) SUB;
    
    RETURN numcursos;
END//
DELIMITER ;

#######---------------------------------------------------------------##########
DROP FUNCTION IF EXISTS numcursosdiferentesensecciondia;
DELIMITER //
# Funcion para saber el numero de cursos diferentes asignados
# en un dia para una seccion en especifico
CREATE FUNCTION numcursosdiferentesensecciondia(
	za_carrer int,
    ano_pen int,
    za_jor int,
    an int,
    no_semes int,
    sec VARCHAR(2),
    za_di int
) RETURNS INT DETERMINISTIC
BEGIN
	DECLARE numcursos INT DEFAULT 0;
    
    
		SELECT COUNT(DISTINCT za_curso) INTO numcursos  
        FROM (SELECT za_curso FROM bot_asignaciones 
		WHERE za_carrera = za_carrer AND
		ano_pensum = ano_pen AND
		za_jornada = za_jor AND
		ano = an AND
		no_semestre = no_semes AND
		seccion = sec AND
        za_dia = za_di
		GROUP BY za_curso) SUB;
    
    RETURN numcursos;
END//
DELIMITER ;

#######---------------------------------------------------------------##########
DROP FUNCTION IF EXISTS numcursosdiferentesenseccionjornada;
DELIMITER //
# Funcion para saber el numero de cursos diferentes a cierto curso
# asignados en una jornada para una seccion en especifico
CREATE FUNCTION numcursosdiferentesenseccionjornada(
	za_carrer int,
    ano_pen int,
    za_jor int,
    an int,
    no_semes int,
    sec VARCHAR(2),
    za_cur int
) RETURNS INT DETERMINISTIC
BEGIN
	DECLARE numcursos INT DEFAULT 0;
    
    
		SELECT COUNT(DISTINCT za_curso) INTO numcursos  
        FROM (
			SELECT za_curso FROM bot_asignaciones 
			WHERE za_carrera = za_carrer AND
				ano_pensum = ano_pen AND
				za_jornada = za_jor AND
				ano = an AND
				no_semestre = no_semes AND
				seccion = sec AND
                za_curso != za_cur
			GROUP BY za_curso
		) SUB;
    
    RETURN numcursos;
END//
DELIMITER ;

########################################################################################
######################### TRIGGERS ####################################################
########################################################################################

DROP TRIGGER IF EXISTS tr_bot_asignaciones;

delimiter //
create trigger tr_bot_asignaciones
	before insert on bot_asignaciones
    for each row
begin

	DECLARE catdecurso INT DEFAULT 0;
	
    # test para verificar que en un día no se asignen más de 5 cursos por seccion
	if (numcursosdiferentesensecciondia(NEW.za_carrera,NEW.ano_pensum,NEW.za_jornada,NEW.ano,NEW.no_semestre,NEW.seccion,NEW.za_dia) >= 5)
    then
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERR_MAXCURSOSENDIA';
        
	# test para verificar que en una jornada no se asignen más de 5 cursos por seccion
	elseif(numcursosdiferentesenseccionjornada(NEW.za_carrera,NEW.ano_pensum,NEW.za_jornada,NEW.ano,NEW.no_semestre,NEW.seccion,NEW.za_curso) >= 5)
    then
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERR_MAXCURSOSENJORNADA';
        
    # test para verificar que no se asigne mas de un curso en una seccion a un catedratio    
	elseif(numcursosdiferentesdecatedraticoenseccion(NEW.za_carrera,NEW.ano_pensum,NEW.za_jornada,NEW.ano,NEW.no_semestre,NEW.seccion,NEW.za_curso,NEW.za_profesor) >= 1)
    then
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERR_MISMOCATENSECCION';
	/*elseif(
		(
			select
				count(*)
			from
				bot_asignaciones as asig
			where
				asig.za_carrera = new.za_carrera and
                asig.ano_pensum = new.ano_pensum and
                asig.ano = new.ano and
                asig.no_semestre = new.no_semestre and
                asig.za_profesor = new.za_profesor
        ) >= 5
    )
    then
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error, Un catedrático no puede tener más de 6 cursos.';
        Esto todavia no esta*/
    
    # test para validar que un catedratico no se asigne más de 3 cursos por jornada
	elseif(numcursoscatedraticoenjornada(NEW.za_carrera,NEW.ano_pensum,NEW.za_jornada,
				NEW.ano,NEW.no_semestre,NEW.za_curso,NEW.za_profesor) >= 3)
    then
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERR_MAXCURSOSCATEDRATICOENJORNADA';
        
	
    else

		SET catdecurso = catedraticodecurso(NEW.za_carrera,NEW.ano_pensum,NEW.za_jornada,NEW.ano,NEW.no_semestre,NEW.seccion,NEW.za_curso);
        
        # test para validar que no se asigne mas de un catedratico al mismo curso en diferentes dias
		if(catdecurso != 0 AND catdecurso != NEW.za_profesor) then
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'ERR_CATDECURSODIFERENTE';
		end if;
    
    end if;

end//;

delimiter ;

####-----------------------------------------------------##################

DROP TRIGGER IF EXISTS tr_bfupdate_asignaciones;

delimiter //
create trigger tr_bfupdate_asignaciones
	before update on bot_asignaciones
    for each row
begin

	DECLARE catdecurso INT DEFAULT 0;
	
    # test para verificar que en un día no se asignen más de 5 cursos por seccion
	if (numcursosdiferentesensecciondia(NEW.za_carrera,NEW.ano_pensum,NEW.za_jornada,NEW.ano,NEW.no_semestre,NEW.seccion,NEW.za_dia) >= 5)
    then
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERR_MAXCURSOSENDIA';
        
	# test para verificar que en una jornada no se asignen más de 5 cursos por seccion
	elseif(numcursosdiferentesenseccionjornada(NEW.za_carrera,NEW.ano_pensum,NEW.za_jornada,NEW.ano,NEW.no_semestre,NEW.seccion,NEW.za_curso) >= 5)
    then
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERR_MAXCURSOSENJORNADA';
        
    # test para verificar que no se asigne mas de un curso en una seccion a un catedratio    
	elseif(numcursosdiferentesdecatedraticoenseccion(NEW.za_carrera,NEW.ano_pensum,NEW.za_jornada,NEW.ano,NEW.no_semestre,NEW.seccion,NEW.za_curso,NEW.za_profesor) >= 1)
    then
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERR_MISMOCATENSECCION';
	/*elseif(
		(
			select
				count(*)
			from
				bot_asignaciones as asig
			where
				asig.za_carrera = new.za_carrera and
                asig.ano_pensum = new.ano_pensum and
                asig.ano = new.ano and
                asig.no_semestre = new.no_semestre and
                asig.za_profesor = new.za_profesor
        ) >= 5
    )
    then
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error, Un catedrático no puede tener más de 6 cursos.';
        Esto todavia no esta*/
    
    # test para validar que un catedratico no se asigne más de 3 cursos por jornada
	elseif(numcursoscatedraticoenjornada(NEW.za_carrera,NEW.ano_pensum,NEW.za_jornada,
				NEW.ano,NEW.no_semestre,NEW.za_curso,NEW.za_profesor) >= 3)
    then
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERR_MAXCURSOSCATEDRATICOENJORNADA';
        
	
    else

		SET catdecurso = catedraticodecurso(NEW.za_carrera,NEW.ano_pensum,NEW.za_jornada,NEW.ano,NEW.no_semestre,NEW.seccion,NEW.za_curso);
        
        # test para validar que no se asigne mas de un catedratico al mismo curso en diferentes dias
		if(catdecurso != 0 AND catdecurso != NEW.za_profesor) then
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'ERR_CATDECURSODIFERENTE';
		end if;
    
    end if;

end//;

delimiter ;