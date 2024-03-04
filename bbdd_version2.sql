Drop database if exists app_libros;
CREATE DATABASE IF NOT EXISTS app_libros;
USE app_libros;

DROP TABLE IF EXISTS usuarios_libros_comentarios;
DROP TABLE IF EXISTS usuarios_libros;
DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS libros;
DROP TABLE IF EXISTS editoriales;
DROP TABLE IF EXISTS autores;


CREATE TABLE IF NOT EXISTS usuarios (
    id_usuario INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    usuario VARCHAR(255) NOT NULL,
    email  VARCHAR(255) NOT NULL,
    pass VARCHAR(255) NOT NULL, -- hash
    libros_leidos INT,
    fecha_alta date,
    foto_perfil varchar(255) default 'C:\\Users\\lucia.jaime.martin_a\\Desktop\\Asignaturas\\DI\\Proyecto Final\\imagenes\\foto_perfil_defecto.jpg' not null,
    intentos_fallidos INT DEFAULT 0,
	ultimo_intento TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_usuario)
);



CREATE TABLE IF NOT EXISTS autores (
    id_autor INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    pais VARCHAR(255) NOT NULL,
    siglo VARCHAR(255),
    PRIMARY KEY (id_autor)
);

CREATE TABLE IF NOT EXISTS editoriales (
    id_editorial INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    creacion_year year,
	link varchar(255),
    id_libro int, 
    PRIMARY KEY (id_editorial)
);

CREATE TABLE IF NOT EXISTS libros (
    id_libro INT NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    sinopsis TEXT NOT NULL,
    autor_id int not null,
    genero ENUM('Ficción', 'No Ficción', 'Misterio', 'Romance', 'Aventura', 'Ciencia Ficción', 'Fantasía', 'Terror', 'Suspenso', 'Drama', 'Poesía', 'Biografía', 'Ensayo', 'Clásicos', 'Historia', 'Religión', 'Ciencia', 'Filosofía', 'Política', 'Autoayuda', 'Literatura Infantil', 'Literatura Juvenil') NOT NULL,
    puntuacion INT,
    publicacion year,
    portada varchar(255),
    editorial INT,
    PRIMARY KEY (id_libro),
    FOREIGN KEY (autor_id) REFERENCES autores(id_autor),
    FOREIGN KEY (editorial) REFERENCES editoriales(id_editorial)
);

CREATE TABLE IF NOT EXISTS usuarios_libros (
    id_usuarios_libros INT NOT NULL AUTO_INCREMENT,
    id_libro INT NOT NULL,
    id_usuario INT NOT NULL,
    estado enum('Pendiente','Leyendo','Terminado'),
    puntuacion_usuario int,
    PRIMARY KEY (id_usuarios_libros),
    FOREIGN KEY (id_libro) REFERENCES libros (id_libro),
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
);


CREATE TABLE IF NOT EXISTS usuarios_libros_puntuacion (
    id_puntuacion INT NOT NULL AUTO_INCREMENT,
    id_libro INT NOT NULL,
    id_usuario INT NOT NULL,
    puntuacion int not null,
    PRIMARY KEY (id_puntuacion),
    FOREIGN KEY (id_libro) REFERENCES libros (id_libro),
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
);



-- ------------------------------------------------------------------------ PROCEDIMIENTOS ALMACENADOS ----------------------------------------------------------------------------------------------------------------

-- PROCEDIMIENTO ALMACENADO QUE INSERTE UN NUEVO USUARIO
drop procedure if exists InsertarUsuario;
DELIMITER //

CREATE PROCEDURE InsertarUsuario(
    IN nom VARCHAR(255),
    IN apell VARCHAR(255),
    IN usu VARCHAR(255),
    IN em VARCHAR(255),
    IN pass VARCHAR(30),
    OUT resul INT
)
BEGIN
    DECLARE fecha DATETIME;
    SET fecha = CURRENT_TIMESTAMP();
    SET resul = -99; -- error no controlado
    
    IF em NOT LIKE '%@hotmail.es' AND em NOT LIKE '%@yahoo.com' AND em NOT LIKE '%@gmail.com' THEN
        SET resul = -1; -- email no válido
    ELSEIF EXISTS (
        SELECT 1
        FROM usuarios
        WHERE usuario = usu
    ) THEN
        SET resul = -2; -- Usuario ya existe
    ELSEIF EXISTS (
        SELECT 1
        FROM usuarios
        WHERE email = em
    ) THEN
        SET resul = -3; -- Email ya existe
    ELSE 
        INSERT INTO usuarios (nombre, apellido, usuario, email, pass, libros_leidos,fecha_alta)
        VALUES (nom, apell, usu, em, pass, 0 ,fecha);
        set resul = 0;
    END IF;
END //

DELIMITER ;


-- ------------------------------------------------------------------------ PROCEDIMIENTO PARA EL LOGIN DE LA APP ---------------------------------------------------------------------------------------------------

DROP PROCEDURE IF EXISTS Login;
DELIMITER //
CREATE PROCEDURE Login(IN _username varchar(16),
						IN _password varchar(40),
						OUT _res INT)
BEGIN
-- Declaración de variables
    DECLARE res_login varchar(16);
    DECLARE tries int;
	DECLARE horaDeBann timestamp;
    -- errores controlados y inicialización de variables
    SET _res = -99; -- ERROR NO CONTROLADO
    SET tries = 0;
    SET res_login = NULL;

-- meter datos de la base de datos en las variables temporales
		Select intentos_fallidos
        from usuarios
        WHERE usuario LIKE _username
        into tries ;
       
        Select count(*)
        from usuarios
        where usuario Like _username and pass like _password
        into res_login;
        
        select ultimo_intento
        from usuarios
        where usuario like _username
        into horaDeBann; 
        
	
    if(sysdate() > horaDeBann) then -- si la hora actual es mayor que el ultimo intento entra 
		
       IF(tries = 3) then
       -- aquí agota el ultimo intento de hacer login y le meto el bann 
			update usuarios 
			set ultimo_intento = date_add(SYSDATE(), INTERVAL 30 SECOND)
			where usuario like _username;
			set _res = -2; -- mensaje de que se va banneado
		ELSE
			IF(res_login like 0 and horaDeBann < sysdate()) THEN
				SET _res = -1; -- Usuario y contraseña no coinciden
				Update usuarios
				Set intentos_fallidos = intentos_fallidos +1
                where usuario like _username; 
			ELSE
				SET _res = 0; -- Usuario y contraseña coinciden
				Update usuarios
				Set intentos_fallidos = 0
                where usuario like _username;
			END IF;
		END IF;
        
	-- aqui es cuando compruebo que ya pasaron los 30 seg y le reseteo los intentos fallidos
        if(tries = 3 and sysdate() >= horaDeBann) then
				Update usuarios
				Set intentos_fallidos = 0
                where usuario like _username;
        end if; 
	else 
		set _res = -3; -- intenta hacer login mientras está banneado
	 end if; 
   
END//
DELIMITER ;


-- ------------------------------------------------------------------------------PROCEDIMIENTO PARA INSERTAR UN LIBRO ---------------------------------------------------------------------------------------------

Drop PROCEDURE if EXISTS insert_libro;
DELIMITER //
CREATE PROCEDURE insert_libro(IN _titulo varchar(255),
						IN _sinopsis text,
                        IN _autor varchar(255),
                        in _genero enum('Ficción', 'No Ficción', 'Misterio', 'Romance', 'Aventura', 
                        'Ciencia Ficción', 'Fantasía', 'Terror', 'Suspenso', 'Drama', 'Poesía', 'Biografía', 'Ensayo', 
                        'Clásicos', 'Historia', 'Religión', 'Ciencia', 'Filosofía', 'Política', 'Autoayuda', 'Literatura Infantil', 'Literatura Juvenil'),
                        in _anopublic int,
                        in _portada varchar(255),
						OUT _res varchar(255))
BEGIN
	DECLARE id_del_autor INT;
    Declare _tituloRepetido VARCHAR(255);
    DECLARE mensaje VARCHAR(255);
    
    -- Inicializar _res
    SET _res = NULL;
    
    -- Buscar el id_autor correspondiente al nombre del autor
    SELECT id_autor INTO id_del_autor FROM autores WHERE nombre LIKE _autor;
    
    select titulo into _tituloRepetido From libros where titulo like _titulo and autor_id = id_del_autor;
    
    
    
    -- Verificar si se encontró un id_autor
    IF id_del_autor IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Autor no encontrado, por favor, introduzca antes los datos del autor';
        SET _res = 'Error: Autor no encontrado';
        
	ELSEIF _tituloRepetido is not null then
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Titulo de autor repetido';
        SET _res = 'Titulo de autor repetido';
    
    ELSE
        -- Insertar el libro
        INSERT INTO libros (titulo, sinopsis, autor_id, genero, publicacion, portada)
        VALUES (_titulo, _sinopsis, id_del_autor, _genero, _anopublic, _portada);
        
        SET _res = 'Libro insertado exitosamente';
    END IF;

END//
DELIMITER ;

-- --------------------------------------------------------------------------------PROCEDIMIENTO PARA actualizar el estado libros del usuario -----------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS nuevo_libro_usuario;
DELIMITER //
CREATE PROCEDURE nuevo_libro_usuario(
    IN _titulo VARCHAR(255),
    IN _autor VARCHAR(255),
    IN _usuario VARCHAR(255),
    IN _estado ENUM('Pendiente', 'Leyendo', 'Terminado')
)
BEGIN
    DECLARE filas_afectadas INT;
    DECLARE _idUsuario INT;
    DECLARE _idLibro INT;

    -- Obtener el id del usuario
    SELECT id_usuario INTO _idUsuario
    FROM usuarios
    WHERE usuario = _usuario;

    -- Verificar si el usuario existe
    IF _idUsuario IS NOT NULL THEN
        -- Obtener el id del libro
        SELECT l.id_libro INTO _idLibro
        FROM libros l
        JOIN autores a ON l.autor_id = a.id_autor
        WHERE l.titulo LIKE CONCAT('%', _titulo, '%') AND a.nombre LIKE CONCAT('%', _autor, '%');

        -- Verificar si el libro existe
        IF _idLibro IS NOT NULL THEN
            -- Verificar si el registro ya existe
            SELECT COUNT(*) INTO filas_afectadas
            FROM usuarios_libros
            WHERE id_libro = _idLibro AND id_usuario = _idUsuario;

            IF filas_afectadas = 0 THEN
                -- Si no existe, insertar un nuevo registro con estado "Pendiente"
                INSERT INTO usuarios_libros (id_libro, id_usuario, estado)
                VALUES (_idLibro, _idUsuario, 'Pendiente');
            ELSE
                -- Si existe, actualizar el estado según la preferencia del usuario
                UPDATE usuarios_libros
                SET estado = _estado
                WHERE id_libro = _idLibro AND id_usuario = _idUsuario;
            END IF;
        ELSE
            -- El libro no existe, manejar según tus necesidades
            -- Puedes lanzar una excepción, registrar un mensaje, etc.
            -- En este ejemplo, simplemente se imprime un mensaje
            SELECT 'El libro no existe' AS mensaje;
        END IF;
    ELSE
        -- El usuario no existe, manejar según tus necesidades
        -- Puedes lanzar una excepción, registrar un mensaje, etc.
        -- En este ejemplo, simplemente se imprime un mensaje
        SELECT 'El usuario no existe' AS mensaje;
    END IF;
END//
DELIMITER ;

-- CALL puntuacion_libro(1,1, 'Pendiente');



-- --------Hay que comprobar si funiona-------------------------------------PROCEDIMIENTO PARA actualizar la puntuación de un libro ---------------------------------------------------------------------------------------------

Drop PROCEDURE if EXISTS puntuacion_libro;
DELIMITER //
CREATE PROCEDURE puntuacion_libro(IN _id_libro int,
						IN _puntuacion text,
                        in _idLibro int,
                        in _id_usuario int,
						OUT _res varchar(255))
BEGIN
	Declare media int;
    declare _cantidadOppiniones decimal(2,1);
    declare _sumaTotalOpiniones int;
    
    if _puntuacion > -1 and _puntuacion < 5 then
		insert into usuarios_libros (id_libro,id_usuario,puntuacion_usuario)
		values(_idLibro,_id_usuario,_puntuacion);
    end if;
    
    select count(puntuacion_usuario) into _cantidadOppiniones From usuarios_libros
    where id_libro like _idLibro;
    
    select sum(puntuacion_usuario) into _sumaTotalOpiniones From usuarios_libros
    where id_libro like _idLibro;
    
    set media = _sumaTotalOpiniones/_cantidadOppiniones;
    
    UPDATE libros
	SET puntuacion = media
	WHERE id_libro = _idLibro;
    
END//
DELIMITER ;






-- --------------------------------------------------------------------------PROCEDIMIENTO PARA COGER LA FOTO DE PERFIL ------------------------------------------------------------------------------------------
drop procedure if exists cogerFotoPerfil;
DELIMITER //

CREATE PROCEDURE cogerFotoPerfil(
    IN _nomusuario VARCHAR(16),
    OUT resul varchar(255)
)


BEGIN	
    set resul = 'C:\\Users\\lucia.jaime.martin_a\\Desktop\\Asignaturas\\DI\\Proyecto Final\\imagenes\\foto_perfil_defecto.jpg';
    
    select foto_perfil
    from usuarios
    where usuario like _nomusuario
    into resul;

END //

DELIMITER ;


-- --------------------------------------------------------------------------PROCEDIMIENTO PARA FILTRAR LIBROS POR TODO (TÍTULO, AUTOR Y GENERO) -------------------------------------------------------------------------------------
drop procedure if exists filtrarPorTodo;
DELIMITER //
CREATE PROCEDURE filtrarPorTodo(IN _cadenaIntroducida VARCHAR(255), 
								OUT _result INT)
BEGIN
    DECLARE titleExists INT DEFAULT 0;
    
    -- Verificar si el título existe en la tabla de libros  
     SELECT COUNT(*) INTO titleExists
    FROM libros
    JOIN autores ON libros.autor_id = autores.id_autor
    WHERE autores.nombre LIKE CONCAT('%', _cadenaIntroducida, '%')
      OR libros.titulo LIKE CONCAT('%', _cadenaIntroducida, '%')
      OR libros.genero LIKE CONCAT('%', _cadenaIntroducida, '%');
    

    IF titleExists = 0 THEN
        -- No hay resultados
        SET _result = -1;    
    
    ELSE
        -- El título existe, ahora obtener la información del libro
        SELECT libros.titulo, libros.portada, autores.nombre
        FROM libros join autores 
        on libros.autor_id = autores.id_autor
        WHERE autores.nombre LIKE CONCAT('%', _cadenaIntroducida, '%')
      OR libros.titulo LIKE CONCAT('%', _cadenaIntroducida, '%')
      OR libros.genero LIKE CONCAT('%', _cadenaIntroducida, '%');
    END IF;
END//
DELIMITER ;




-- ------------------------------------------------------PROCEDIMIENTO PARA CALCURLAR CUÁNTOS LIBROS ESTÁ LEYENDO EL USUARIO, MÁXIMO 4 ---------------------------------------------------------------------
DROP PROCEDURE IF EXISTS cantidadLibrosLeyendo;
DELIMITER //
CREATE PROCEDURE cantidadLibrosLeyendo(IN _usu varchar(255),
										OUT resul int)
BEGIN	
	declare _id int;
    set resul = 0;
    
    select id_usuario
    from usuarios
    where usuario like _usu
    into _id;   
    
    
    select count(*)
    from usuarios_libros
    where estado = 'Leyendo' and id_usuario = _id
    into resul;

END //

DELIMITER ;


-- -----------------------------------------------------------PROCEDIMIENTO PARA SACAR LA CANTIDAD DE LIBROS LEÍDOS POR UN USUARIO ----------------------------------------------------------------------------------

DROP PROCEDURE IF EXISTS totalLibrosLeidos;
DELIMITER //
CREATE PROCEDURE totalLibrosLeidos(IN _usu varchar(255),
										OUT resul int)
BEGIN	
    set resul = -99;
    
    select libros_leidos
    from usuarios
    where usuario like _usu
    into resul;

END //

DELIMITER ;



-- -----------------------------------------------------------Bloquear durante segundos la cuenta por contraseña o usuario incorrecto ----------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS bloqueo_de_cuenta;
DELIMITER //
CREATE PROCEDURE bloqueo_de_cuenta(
    IN _username VARCHAR(255),
    IN _password VARCHAR(255),
    OUT _res INT
)
BEGIN
    DECLARE v_count INT DEFAULT 0;
    DECLARE v_locked TIMESTAMP;

    -- Busca el usuario y verifica la contraseña
    SELECT COUNT(*), MAX(fecha_bloqueo) INTO v_count, v_locked
    FROM usuarios
    WHERE username = p_username AND password = p_password;

    IF v_count = 1 THEN
        -- Si la cuenta no está bloqueada y la contraseña es correcta, restablece los intentos fallidos
        UPDATE usuarios
        SET intentos_fallidos = 0, fecha_bloqueo = NULL
        WHERE username = p_username;
        
        SET _res = 0; -- Indica éxito
    ELSE
        -- Si la cuenta está bloqueada o la contraseña es incorrecta, incrementa los intentos fallidos
        UPDATE usuarios
        SET intentos_fallidos = intentos_fallidos + 1
        WHERE username = p_username;
        
        -- Comprueba si la cuenta debe estar bloqueada
        SELECT COUNT(*) INTO v_count
        FROM usuarios
        WHERE username = p_username AND intentos_fallidos >= 3;
        
        IF v_count = 1 THEN
            -- Establece un bloqueo temporal de 30 segundos
            UPDATE usuarios
            SET fecha_bloqueo = NOW() + INTERVAL 30 SECOND
            WHERE username = p_username;
        END IF;
        
        SET _res = -1; -- Indica error
    END IF;
END //
DELIMITER ;




-- -----------------------------------------------------------PROCEDIMIENTO PARA SACAR la ficha del libro escogido ----------------------------------------------------------------------------------

DROP PROCEDURE IF EXISTS fichaDelLibro;
DELIMITER //
CREATE PROCEDURE fichaDelLibro(
    IN _titulo VARCHAR(255),
    IN _autor VARCHAR(255),
    IN _portada VARCHAR(255),
    OUT resul INT,
    OUT stringTotal TEXT
)
BEGIN
    DECLARE libroExistente INT DEFAULT 0;

    SET resul = -99;
    SET stringTotal = "";

    SELECT COUNT(*) INTO libroExistente
    FROM libros
    JOIN autores ON libros.autor_id = autores.id_autor
    WHERE autores.nombre LIKE CONCAT('%', _autor, '%')
      AND libros.titulo LIKE CONCAT('%', _titulo, '%')
      AND libros.portada LIKE CONCAT('%', _portada, '%');

    IF libroExistente = 0 THEN
        -- El libro no existe
        SET resul = -1;
    ELSE
        -- El libro existe, ahora obtener la información del libro
        SELECT CONCAT(libros.titulo, ';', libros.portada, ';', autores.nombre, ';', libros.sinopsis) INTO stringTotal
        FROM libros
        JOIN autores ON libros.autor_id = autores.id_autor
        WHERE autores.nombre LIKE CONCAT('%', _autor, '%')
          AND libros.titulo LIKE CONCAT('%', _titulo, '%')
          AND libros.portada LIKE CONCAT('%', _portada, '%');
    END IF;

END //
DELIMITER ;

Drop Procedure if exists LibrosUsuario; 
Delimiter // 
Create procedure LibrosUsuarios(in _user varchar(50))
BEGIN 
	Declare _iduser int; 

    select id_usuario
    from usuarios
    where _user = usuario
    into _ideuser; 
    
    Select l.titulo,a.nombre, l.portada 
    from usuarios_libros ul join libros l on ul.id_libro =l.id_libro
    join autores a on l.autor_id = a.id_autor 
    where ul.id_usuario = _iduser; 
    
END// 
DELIMITER ; 

Drop procedure if exists configuracion; 
Delimiter $$ 
Create procedure configuracion(in _kcambiar text, in _aloquecambiar varchar(255), in _user varchar(255) ,out _res int)
Begin
	declare iduser int;
 select id_usuario
		from usuarios
		where usuario = _user
		into iduser;  
	if (_kcambiar = "nomUser") then
		update usuarios set usuario = _aloquecambiar where id_usuario = iduser;
        set _res = 0;
	elseif (_kcambiar = "pass") then 
		update usuarios set pass = _aloquecambiar where id_usuario = iduser;
        set _res = 0;
	elseif (_kcambiar = "correo") then
		update usuarios set email = _aloquecambiar where id_usuario = iduser;
        set _res = 0;
	else 
		set _res = -1; -- el kcambiar hay algo que no va
    end if; 

end $$
delimiter ; 
-- ---------------------------------------- Vistas-------------------------------------------------------------------------------------------------------------------------------
Create view autoresDeLibros as 
Select a.nombre, a.siglo, l.titulo, l.genero 
from autores a join libros l
on a.id_autor = l.autor_id;

-- Crear la vista
CREATE VIEW puntuacionMediaLibros AS
SELECT l.id_libro, l.titulo, AVG(ulc.puntuacion) AS mediaDePuntos
FROM libros l
LEFT JOIN usuarios_libros_puntuacion ulc ON l.id_libro = ulc.id_libro
GROUP BY l.id_libro, l.titulo;



