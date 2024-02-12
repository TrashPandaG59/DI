-- ------------------------------------- AUTORES ------------------------------------------------------------
-- select * from Autores
-- drop table if exists Autores

insert into autores (Nombre, Pais, Siglo)
values ('J.K. Rowling', 'Reino Unido', 'XX');

insert into autores (Nombre, Pais, Siglo)
values ('Liz Braswell', 'Reino Unido', 'XX');

insert into autores (Nombre, Pais, Siglo)
values ('Gabriel García Márquez', 'Colombia', 'XX');

insert into autores (Nombre, Pais, Siglo)
values ('Eduardo Galeano', 'Uruguay', 'XX');

insert into autores (Nombre, Pais, Siglo)
values ('Jorge Luis Borges', 'Argentina', 'XX');

insert into autores (Nombre, Pais, Siglo)
values ('George Orwell', 'Reino Unido', 'XX');

insert into autores (Nombre, Pais, Siglo)
values ('Aldous Huxley', 'Reino Unido', 'XX');

insert into autores (Nombre, Pais, Siglo)
values ('Jack Kerouac', 'Estados Unidos', 'XX');

insert into autores (Nombre, Pais, Siglo)
values ('Homero', 'Grecia', 'VIII a.c');

insert into autores (Nombre, Pais, Siglo)
values ('Marqués de Sade', 'Francia', 'XVIII');


-- ------------------------------------- Editoriales ------------------------------------------------------------
insert into editoriales (nombre, creacion_year, link)
values ('Planeta de Libros', '1964', 'https://www.planetadelibros.com');

insert into editoriales (nombre, creacion_year, link)
values ('Grupo Anaya', '1959', 'https://www.grupoanaya.es');

insert into editoriales (nombre, link)
values ('Apache Libros', 'https://apachelibros.com');





-- ------------------------------------- LIBROS ------------------------------------------------------------
CALL insert_libro('Torna lo que ya fue', '¿Qué hubiera pasado si la madre de Rapunzel hubiera bebido de la flor equivocada?
Desesperados por salvar la vida de su querida reina y de la pequeña que llevaba en su vientre, los súbditos peinaron las 
tierras en busca de lo único que podía curarlas: la mítica Flor Gota de Sol. Sin embargo, alguien cogió por error la Flor Gota de Luna. 
La flor curó a la reina, que dio a luz a una preciosa niña de cabello plateado pero portadora de una magia muy peligrosa: el poder de herir, en vez del poder de curar. 
Por el bien del reino, Rapunzel fue encerrada en una torre y quedó al cuidado de una única persona, la poderosa Madre Gothel.
Sabiendo que debía proteger al mundo de su peligrosa cabellera, la princesa ha permanecido en la torre durante diecinueve años…, 
hasta que decide abandonarla para ir a ver las misteriosas luces flotantes. Rapunzel se verá envuelta en una inesperada aventura con dos ladrones 
llamados Gina y Flynn Rider. Lejos de alcanzar su final feliz, Rapunzel descubrirá que hay muchas cosas que no sabe sobre su historia, sus poderes y su futuro.', 
'Liz Braswell', 'Literatura Juvenil', 2022, 'Proyecto Final/mark I/imagenes/tornaloqueyafue.jpg', @resultado);
SELECT @resultado;

CALL insert_libro('Harry Potter y la Piedra Filosofal', '"Con las manos temblorosas, Harry le dio la vuelta al sobre y vio un  sello de lacre púrpura con un escudo de armas:
 un león, un águila, un tejón y una serpiente, que rodeaban una gran letra H."
Harry Potter nunca ha oído hablar de Hogwarts hasta que empiezan a caer  cartas en el felpudo del número 4 de Privet Drive. 
Llevan la dirección  escrita con tinta verde en un sobre de pergamino amarillento con un  sello de lacre púrpura, y sus horripilantes tíos se apresuran a  confiscarlas. 
Más tarde, el día que Harry cumple once años, Rubeus  Hagrid, un hombre gigantesco cuyos ojos brillan como escarabajos negros,  
irrumpe con una noticia extraordinaria: Harry Potter es un mago, y le  han concedido una plaza en el Colegio Hogwarts de Magia y Hechicería. 
¡Está a punto de comenzar una aventura increíble! ',
'J.K. Rowling', 'Fantasía', 1999, 'Proyecto Final\mark I\imagenes\harrypotterylapiedrafilosofal.jpg', @resultado);
SELECT @resultado;



CALL insert_libro('Harry Potter y la Cámara Secreta', '«Hay una conspiración, Harry Potter. Una conspiración para hacer que este año sucedan las cosas más terribles en el Colegio Hogwarts de Magia y Hechicería.»
El verano de Harry Potter ha incluido el peor cumpleaños de su vida, las funestas advertencias de un elfo doméstico llamado Dobby y el rescate de casa de los Dursley protagonizado por su amigo Ron Weasley 
al volante de un coche mágico volador. De vuelta en el Colegio Hogwarts de Magia y Hechicería, donde va a empezar su segundo curso, Harry oye unos extraños susurros que resuenan por los pasillos vacíos.
 Y entonces empiezan los ataques y varios alumnos aparecen petrificados... Por lo visto, las siniestras predicciones de Dobby se están cumpliendo.... ',
'J.K. Rowling', 'Fantasía', 1999, 'Proyecto Final\mark I\imagenes\HPCamarasecreta.jpeg', @resultado);
SELECT @resultado;

CALL insert_libro('Cien años de soledad','La historia épica de la familia Buendía en el pueblo mágico de Macondo, desde su fundación hasta su decadencia, explorando temas 
		como el amor, la soledad y la política a través de generaciones.','Gabriel García Márquez','Clásicos','1967','Pictures\libros\cien.jpg', @resultado);
SELECT @resultado;

CALL insert_libro('El libro de los abrazos',' Colección de relatos que presenta una serie de pequeñas historias, anécdotas y reflexiones que abordan temas diversos como 
		la política, el amor, la injusticia social y la naturaleza humana, todo ello tejido con la prosa característica de Galeano. Cada relato invita a la reflexión 
		sobre la vida y el mundo que nos rodea.','Eduardo Galeano','Poesía','1989','Pictures\libros\abrazos.jpg', @resultado);
SELECT @resultado;

CALL insert_libro('El Aleph','Colección de cuentos que exploran temas como la metaficción, los laberintos, los espejos y la infinitud. En el cuento que da nombre al libro, 
	"El Aleph", Borges introduce la idea de un punto en el espacio que contiene todas las cosas simultáneamente. Cada relato en la colección es una obra 
    maestra que desafía la percepción y ofrece una visión única y compleja del mundo.','Jorge Luis Borges','Clásicos','1949','Pictures\libros\aleph.jpg', @resultado);
SELECT @resultado;

CALL insert_libro('1984','Una distopía clásica que presenta un sombrío futuro totalitario. La historia sigue a Winston Smith, un funcionario del Partido, mientras lucha contra
	la opresión y la manipulación del Estado. La novela explora temas como la vigilancia omnipresente, la represión del pensamiento libre y la distorsión de la verdad.
    La figura del Gran Hermano y la neolengua son elementos emblemáticos que han dejado una marca duradera en la literatura y la crítica social.','George Orwell','Clásicos','1949','Pictures\libros\1984.jpg', @resultado);
SELECT @resultado;


CALL insert_libro('Un mundo feliz','Una sociedad futura donde la estabilidad y la felicidad superficial son prioridades, logradas a través del control totalitario y la manipulación 
	genética. La novela sigue a Bernard Marx, un disidente que cuestiona el sistema, y a John, un "salvaje" que proviene de una reserva fuera de la sociedad civilizada. 
    Huxley explora temas de conformidad, tecnología, y la búsqueda del significado en una sociedad que valora la comodidad sobre la verdad.','Aldous Huxley','Clásicos','1932','Pictures\libros\feliz.jpg', @resultado);
SELECT @resultado;


CALL insert_libro('La Iliada','Epopeya griega que narra los eventos del último año de la Guerra de Troya, centrándose en el conflicto entre el héroe griego Aquiles y el 
	príncipe troyano Héctor. La obra aborda temas como el honor, la gloria, la ira de los dioses y la condición humana en medio de la guerra.','Homero','Historia','0','Pictures\libros\iliada.png', @resultado);
SELECT @resultado;


CALL insert_libro('120 jornadas en Sodoma','Una obra conocida por su exploración provocativa y extrema de la depravación sexual y la corrupción moral. La historia sigue a cuatro 
	aristócratas franceses que buscan satisfacer sus deseos más oscuros en un aislado castillo. La novela es notoria por sus descripciones gráficas de violencia y 
    perversión, sirviendo como una crítica satírica de la decadencia de la sociedad y el abuso de poder. La obra es una de las más controvertidas y transgresoras en 
    la historia de la literatura.','Marqués de Sade','Romance','1905','Pictures\libros\sodoma.jpg', @resultado);
SELECT @resultado;

-- CALL insert_libro(, @resultado);
SELECT @resultado;



