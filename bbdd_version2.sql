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


CREATE TABLE IF NOT EXISTS usuarios_libros_comentarios (
    id_comentario INT NOT NULL AUTO_INCREMENT,
    id_libro INT NOT NULL,
    id_usuario INT NOT NULL,
    comentario text,
    PRIMARY KEY (id_comentario),
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
    DECLARE res_login varchar(16);
    SET _res = -99; -- ERROR NO CONTROLADO
    SET res_login = NULL;
	
       SELECT usuario
       FROM usuarios
       WHERE usuario LIKE _username and pass LIKE _password
       INTO res_login;
       
       IF(res_login IS NULL) THEN
			SET _res = -1; -- Usuario y contraseña no coinciden
		ELSE
			SET _res = 0; -- Usuario y contraseña coinciden
		END IF;
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

-- --------Hay que comprobar si funiona-------------------------------------PROCEDIMIENTO PARA actualizar el estado libros del usuario ---------------------------------------------------------------------------------------------
Drop PROCEDURE if EXISTS nuevo_libro_usuario;
DELIMITER //
CREATE PROCEDURE nuevo_libro_usuario(in _idLibro int,
                        in _id_usuario int,
                        in _estado enum('Pendiente','Leyendo','Terminado'))
BEGIN
	Declare existente int;
    set existente =  0;
    
    select id_usuarios_libros into existente
    From usuarios_libros
    where id_libro = _idLibro and id_usuario = _id_usuario;
    
    if existente is null then
		insert into usuarios_libros (id_libro,id_usuario,estado)
		values(_idLibro,_id_usuario,_estado);
        
	else
		UPDATE estado
		SET eatado = _estado
		where id_libro = _idLibro and id_usuario = _id_usuario;
        
    end if;
    
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


select * from libros;
select * from usuarios_libros;





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


-- --------------------------------------------------------------------------PROCEDIMIENTO PARA FILTRAR LIBROS POR EL GÉNERO -------------------------------------------------------------------------------------

drop procedure if exists filtrarPorGenero;
DELIMITER //
CREATE PROCEDURE filtrarPorGenero(IN _gen VARCHAR(255), OUT _result INT)
BEGIN
    DECLARE genreExists INT DEFAULT 0;

    -- Verificar si el género existe en la lista ENUM
    SELECT COUNT(*) INTO genreExists
    FROM information_schema.COLUMNS
    WHERE TABLE_NAME = 'libros' AND COLUMN_NAME = 'genero'
          AND COLUMN_TYPE LIKE CONCAT('%', _gen, '%');

    IF genreExists = 0 THEN
        -- El género no existe en la lista ENUM
        SET _result = -1;
    ELSE
        -- El género existe, ahora verificamos si hay libros de ese género
        SELECT COUNT(*) INTO _result
        FROM libros
        WHERE genero = _gen;

        IF _result = 0 THEN
            -- No hay libros de ese género
            SET _result = -2;
        END IF;
    END IF;
END//
DELIMITER ; 


-- --------------------------------------------------------------------------PROCEDIMIENTO PARA FILTRAR LIBROS POR TÍTULO -------------------------------------------------------------------------------------
drop procedure if exists filtrarPorTitulo;
DELIMITER //
CREATE PROCEDURE filtrarPorTitulo(IN _titulo VARCHAR(255), OUT _result INT)
BEGIN
    DECLARE titleExists INT DEFAULT 0;

    -- Verificar si el título existe en la tabla de libros
    SELECT COUNT(*) INTO titleExists
    FROM libros
    WHERE titulo = _titulo;

    IF titleExists = 0 THEN
        -- El título no existe
        SET _result = -1;
    ELSE
        -- El título existe, ahora obtener la información del libro
        SELECT id_libro
        FROM libros
        WHERE titulo = _titulo;
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



-- --------------------------------------------------------------------------PROCEDIMIENTO PARA FILTRAR LIBROS POR TÍTULO -------------------------------------------------------------------------------------
drop procedure if exists filtrarPorTitulo;
DELIMITER //
CREATE PROCEDURE filtrarPorTitulo(IN _titulo VARCHAR(255), OUT _result INT)
BEGIN
    DECLARE titleExists INT DEFAULT 0;

    -- Verificar si el título existe en la tabla de libros
    SELECT COUNT(*) INTO titleExists
    FROM libros
    WHERE titulo like CONCAT('%', _titulo, '%');

    IF titleExists = 0 THEN
        -- El título no existe
        SET _result = -1;
    ELSE
        -- El título existe, ahora obtener la información del libro
        SELECT libros.titulo, libros.portada, autores.nombre
        FROM libros join autores 
        on libros.autor_id = autores.id_autor
        WHERE titulo like CONCAT('%', _titulo, '%');
    END IF;
END//
DELIMITER ;

-- CALL filtrarPorTitulo("La",@resultado);
-- SELECT @resultado;



-- --------------------------------------------------------------------------PROCEDIMIENTO PARA FILTRAR LIBROS POR Género -------------------------------------------------------------------------------------
drop procedure if exists filtrarPorGenero;
DELIMITER //
CREATE PROCEDURE filtrarPorGenero(IN _genero VARCHAR(255), OUT _result INT)
BEGIN
    DECLARE generoExists INT DEFAULT 0;

    -- Verificar si el título existe en la tabla de libros
    SELECT COUNT(*) INTO generoExists
    FROM libros
    WHERE genero like CONCAT('%', _genero, '%');

    IF generoExists = 0 THEN
        -- El genero no existe
        SET _result = -1;
    ELSE
        -- El genero existe, ahora obtener la información del libro
        SELECT libros.titulo, libros.portada, autores.nombre
        FROM libros join autores 
        on libros.autor_id = autores.id_autor
        WHERE genero like CONCAT('%', _genero, '%');
    END IF;
END//
DELIMITER ;

 -- CALL filtrarPorGenero("ppoo",@resultado);
 -- SELECT @resultado;


-- --------------------------------------------------------------------------PROCEDIMIENTO PARA FILTRAR LIBROS POR Autor -------------------------------------------------------------------------------------
drop procedure if exists filtrarPorAutor;
DELIMITER //
CREATE PROCEDURE filtrarPorAutor(IN _autor VARCHAR(255), OUT _result INT)
BEGIN
    DECLARE autorExists INT DEFAULT 0;

    -- Verificar si el título existe en la tabla de libros
    SELECT COUNT(*) INTO autorExists
    FROM autores
    WHERE nombre like CONCAT('%', _autor, '%');

    IF autorExists = 0 THEN
        -- El genero no existe
        SET _result = -1;
    ELSE
        -- El genero existe, ahora obtener la información del libro
        SELECT libros.titulo, libros.portada, autores.nombre
        FROM libros join autores 
        on libros.autor_id = autores.id_autor
        WHERE autores.nombre like CONCAT('%', _autor, '%');
    END IF;
END//
DELIMITER ;

 --  CALL filtrarPorAutor("Li",@resultado);
-- SELECT @resultado;


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

-- CALL fichaDelLibro( "Harry","Row", "Proyecto Final\mark I\imagenes\HPCamara", @resultado, @ff);
-- SELECT @resultado, @ff;



select * from usuarios;

 CALL bloqueo_de_cuenta( "jorgito","11",@resultado);
 SELECT @resultado;


CALL cogerFotoPerfil( "jorgito",@resultado);
 SELECT @resultado;


-- Call Login('jorgito','1234',@resul);
-- SELECT @resul;


Select * from Usuarios;
Select * from autores;
select * from Libros;
select * from usuarios_libros;

-- update usuarios 
-- set intentos_fallidos = 0 
-- where usuarios.id_usuario = 1



