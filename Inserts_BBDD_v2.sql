-- ------------------------------------- AUTORES ------------------------------------------------------------
select * from Autores;
-- drop table if exists Autores

select * from libros;

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

insert into autores (Nombre, Pais, Siglo)
values ('Rebecca Yarros', 'Estados Unidos', 'XXI');

insert into autores (Nombre, Pais, Siglo)
values ('Rachel Bels', 'España', 'XXI');

insert into autores (Nombre, Pais, Siglo)
values ('Mayte Uceda', 'España', 'XXI');

insert into autores (Nombre, Pais, Siglo)
values ('Santiago Posteguillo', 'España', 'XXI');

insert into autores (Nombre, Pais, Siglo)
values ('Bram Stoker', 'Irlanda', 'XIX');

insert into autores (Nombre, Pais, Siglo)
values ('Krystal Sutherland', 'Australia', 'XX');

insert into autores (Nombre, Pais, Siglo)
values ('Javier Castillo', 'España', 'XXI');

insert into autores (Nombre, Pais, Siglo)
values ('Dolores Redondo', 'España', 'XXI');

insert into autores (Nombre, Pais, Siglo)
values ('Hannah Grace', 'Reino Unido', 'XXI');



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
La flor curó a la reina, que dio a luz a una preciosa niña de cabello plateado pero portadora de una magi
a muy peligrosa: el poder de herir, en vez del poder de curar. 
Por el bien del reino, Rapunzel fue encerrada en una torre y quedó al cuidado de una única persona, la poderosa Madre Gothel.
Sabiendo que debía proteger al mundo de su peligrosa cabellera, la princesa ha permanecido en la torre durante diecinueve años…, 
hasta que decide abandonarla para ir a ver las misteriosas luces flotantes. Rapunzel se verá envuelta en una inesperada aventura con dos ladrones 
llamados Gina y Flynn Rider. Lejos de alcanzar su final feliz, Rapunzel descubrirá que hay muchas cosas que no sabe sobre su historia, sus poderes y su futuro.', 
'Liz Braswell', 'Literatura Juvenil', 2022, 'Imagenes\tornaloqueyafue.jpg', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf',@resultado);
SELECT @resultado;

CALL insert_libro('No importa la distancia', '¿Qué hubiera pasado si Meg tuviera que convertirse en una diosa griega?
Después de que Hércules demostrase que es un verdadero héroe y recuperara su divinidad, todo parece ir sobre ruedas. 
Hasta que Zeus le dice a Megara que no puede estar con Hércules porque ella es…, bueno, mortal. Por suerte, Hera tiene
 una solución y le ofrece a Meg la oportunidad de probar que merece un sitio en el monte Olimpo…como diosa. 
 Lo único que tiene que hacer es cumplir una misteriosa misión.
¿Cuál es la misión? Bueno, no es más que rescatar a la mujer de su exnovio del Inframundo. El exnovio al que ella salvó entregándole su alma a Hades. 
El exnovio que de inmediato rehízo su vida con otra mientras ella estaba ', 
'Liz Braswell', 'Literatura Juvenil', 2022, 'Imagenes\hercules.jpg', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf', @resultado);
SELECT @resultado;

CALL insert_libro('Espejito, espejito mágico...', 'Tras la muerte de su querida madre, 
el reino pasa a manos de la madrastra de Blancanieves, conocida como la Reina Malvada.
Blancanieves, resignada, intenta afrontar la situación de la mejor manera posible, 
pero pronto la situación cambiará para la princesa: sale a la luz una información reveladora acerca de sus padres y, 
por otro lado, se produce un intento ?fallido? de acabar con su vida.', 
'Liz Braswell', 'Literatura Juvenil', 2022, 'Imagenes\blancanieves.jpg', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf', @resultado);
SELECT @resultado;

CALL insert_libro('La Sirenita', 'Han pasado cinco años desde que la infame Bruja del Mar derrotó a la Sirenita y mató al rey Tritón. 
Ariel es la reina muda de Atlántica, mientras que Úrsula gobierna el reino del príncipe Eric. Pero cuando Ariel descubre que existe la 
posibilidad de que su padre siga con vida, no tiene más remedio que regresar a un mundo que nunca creyó que volvería a ver. 
Úrsula amenaza con destruir tierra y mar. ¿Podrá la Sirenita detenerla esta vez antes de que sea demasiado tarde?', 
'Liz Braswell', 'Literatura Juvenil', 2022, 'Imagenes\laSirenita.jpg', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf', @resultado);
SELECT @resultado;

CALL insert_libro('Aladdin', '¿Qué hubiera pasado si Aladdín no hubiera encontrado la lámpara mágica? Descubre la historia que nunca te han contado.
Tras robar la lámpara del Genio, Jafar usa sus dos primeros deseos para convertirse en sultán y en el hechicero más poderoso del mundo.
 Bajo su dictadura, los ciudadanos de Agrabah viven con miedo esperando su tercer deseo. 
 El joven Aladdín y la destronada princesa Jasmine liderarán la rebelión del pueblo contra el tirano', 
'Liz Braswell', 'Literatura Juvenil', 2022, 'Imagenes\aladdin.jpg', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf', @resultado);
SELECT @resultado;

CALL insert_libro('Frozen', 'Como futura reina de Arendelle, la vida de la princesa Elsa está llena de expectativas y responsabilidades,
 pero sobre todo de preguntas. ¿Qué tipo de gobernante será? 
 ¿Cuándo tendrá que elegir un pretendiente? ¿Y por qué siempre ha tenido la sensación de que le falta una parte vital de sí misma?
Tras la inesperada muerte de sus padres, Elsa se ve obligada a responder estas preguntas antes de lo esperado: 
se convierte en la reina de su pueblo y cada vez se siente más sola. Cuando unos misteriosos poderes aparecen, 
Elsa comienza a recordar pequeñas partes de su infancia hasta entonces enterradas en la memoria; momentos que incluyen a una niña de aspecto muy familiar. 
Decidida a llenar el vacío que siempre ha sentido, Elsa debe afrontar un desgarrador viaje a través de su gélido reino para deshacer una terrible maldición… 
y encontrar a la princesa perdida de Arendelle.', 
'Liz Braswell', 'Literatura Juvenil', 2022, 'Imagenes\frozen.jpg', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf', @resultado);
SELECT @resultado;

CALL insert_libro('La Bella Durmiente', '¿Qué hubiera pasado si la Bella Durmiente no se hubiera despertado? Descubre la historia que nunca te han contado.
No parece muy complicado: matar al dragón, besar a la princesa, despertarla...
 Pero ¿qué pasa si al recibir el beso no sólo no se despierta la princesa, sino que el príncipe cae presa del sueño también? 
 En el mundo de los sueños, sólo Aurora podrá librarse de la maldición de Maléfica, despertarse a sí misma y ser dueña de su destino..', 
'Liz Braswell', 'Literatura Juvenil', 2022, 'Imagenes\bellaDurmiente.jpg', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf', @resultado);
SELECT @resultado;

CALL insert_libro('La Bella y la Bestia', '¿Qué hubiera pasado si la madre de Bella hubiera hechizado a la Bestia? Descubre la historia que nunca te han contado.
Bella es una chica lista, ingeniosa e inquieta que sueña con escapar de su aldea y explorar el mundo. Pero su vida cambia para siempre cuando se convierte en prisionera de una terrible bestia.
En su primera noche en el castillo, Bella descubre que la bestia esconde una rosa encantada. Al tocarla, su mente se llena de imágenes de su madre desaparecida, y descubre que ella fue la hechicera 
que lanzó la maldición sobre la Bestia, el castillo y todos sus habitantes. ¿Conseguirán Bella y la Bestia, trabajando en equipo, desentrañar el misterio que unió el destino de sus dos familias muchos años atrás?', 
'Liz Braswell', 'Literatura Juvenil', 2022, 'Imagenes\bellaybestia.jpg', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf', @resultado);
SELECT @resultado;





CALL insert_libro('Harry Potter y la Piedra Filosofal', 'Con las manos temblorosas, Harry le dio la vuelta al sobre y vio un  sello de lacre púrpura con un escudo de armas:
 un león, un águila, un tejón y una serpiente, que rodeaban una gran letra H."
Harry Potter nunca ha oído hablar de Hogwarts hasta que empiezan a caer  cartas en el felpudo del número 4 de Privet Drive. 
Llevan la dirección  escrita con tinta verde en un sobre de pergamino amarillento con un  sello de lacre púrpura, y sus horripilantes tíos se apresuran a  confiscarlas. 
Más tarde, el día que Harry cumple once años, Rubeus  Hagrid, un hombre gigantesco cuyos ojos brillan como escarabajos negros,  
irrumpe con una noticia extraordinaria: Harry Potter es un mago, y le  han concedido una plaza en el Colegio Hogwarts de Magia y Hechicería. 
¡Está a punto de comenzar una aventura increíble!',
'J.K. Rowling', 'Fantasía', 1999, 'Imagenes\harryPotter1.jpg', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf', @resultado);
SELECT @resultado;

CALL insert_libro('Harry Potter y la Cámara Secreta', 'Hay una conspiración, Harry Potter. Una conspiración para hacer que este año sucedan las cosas más terribles en el Colegio Hogwarts de Magia y Hechicería.»
El verano de Harry Potter ha incluido el peor cumpleaños de su vida, las funestas advertencias de un elfo doméstico llamado Dobby y el rescate de casa de los Dursley protagonizado por su amigo Ron Weasley 
al volante de un coche mágico volador. De vuelta en el Colegio Hogwarts de Magia y Hechicería, donde va a empezar su segundo curso, Harry oye unos extraños susurros que resuenan por los pasillos vacíos.
 Y entonces empiezan los ataques y varios alumnos aparecen petrificados... Por lo visto, las siniestras predicciones de Dobby se están cumpliendo...',
'J.K. Rowling', 'Fantasía', 1999, 'Imagenes\harryPotter2.jpg', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf', @resultado);
SELECT @resultado;

CALL insert_libro('Harry Potter y el prisionero de Azkaban', '«Bienvenido al autobús noctámbulo, transporte de emergencia para el brujo abandonado a su suerte. 
Levante la varita, suba a bordo y lo llevaremos a donde quiera.»
Cuando el autobús noctámbulo irrumpe en una calle oscura y frena con fuertes chirridos delante de Harry, comienza para él un nuevo curso en Hogwarts, 
lleno de acontecimientos extraordinarios. Sirius Black, asesino y seguidor de lord Voldemort, se ha fugado, y dicen que va en busca de Harry. 
En su primera clase de Adivinación, la profesora Trelawney ve un augurio de muerte en las hojas de té de la taza de Harry... 
Pero quizá lo más aterrador sean los dementores que patrullan por los jardines del colegio, capaces de sorberte el alma con su beso...',
'J.K. Rowling', 'Fantasía', 1999, 'Imagenes\harryPotter3.jpg', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf', @resultado);
SELECT @resultado;

CALL insert_libro('Harry Potter y el Cáliz de Fuego', 'Se va a celebrar en Hogwarts el Torneo de los Tres Magos. 
Sólo los  alumnos mayores de diecisiete años pueden participar en esta competición, pero, aun así, Harry sueña con ganarla. 
En Halloween,  cuando el cáliz de fuego elige a los campeones, Harry se lleva una  sorpresa al ver que su nombre es uno de los escogidos por el cáliz  mágico. 
Durante el torneo deberá enfrentarse a desafíos mortales,  dragones y magos tenebrosos, pero con la ayuda de Ron y Hermione, sus mejores amigos, ¡quizá logre salir con vida!',
'J.K. Rowling', 'Fantasía', 1999, 'Imagenes\harryPotter4.jpg', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf', @resultado);
SELECT @resultado;

CALL insert_libro('Harry Potter y la Orden del Fénix', 'En un curso repleto de secretos y subterfugios, Dolores Umbridge,
 Suma Inquisidora de Hogwarts, escudriña cada detalle de la vida en la escuela como parte del encargo del Ministerio de Magia de vigilar a Dumbledore
 y a su célebre alumno.Pero el valor llama a un leal grupo de estudiantes a formar el Ejército de Dumbledore, con el objetivo de detener a Umbridge y 
 conseguir dominar la clase de magia que necesitarán para enfrentarse a las fuerzas oscuras.',
'J.K. Rowling', 'Fantasía', 1999, 'Imagenes\harryPotter5.jpg', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf', @resultado);
SELECT @resultado;

CALL insert_libro('Harry Potter y el Misterio del Príncipe', 'Con dieciseis años cumplidos, Harry inicia el sexto curso en Hogwarts en  
medio de terribles acontecimientos que asolan Inglaterra. Elegido capitán del equipo de quidditch, los ensayos, los exámenes y las chicas ocupan todo su tiempo, pero la tranquilidad dura poco.
A pesar de los ferreos controles de seguridad que protegen la escuela,  dos alumnos son brutalmente atacados. Dumbledore sabe que se  acerca el  momento, 
anunciado por la Profecía, en que Harry y Voldemort se enfrentarán a muerte: "El único con poder para vencer al  Señor  Tenebroso se acerca... 
Uno de los dos debe morir a manos del otro, pues  ninguno de los dos podrá vivir mientras siga el otro  con vida.',
'J.K. Rowling', 'Fantasía', 1999, 'Imagenes\harryPotter6.jpg', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf', @resultado);
SELECT @resultado;


CALL insert_libro('Harry Potter y las reliquias de la muerte', 'Cuando se monta en el sidecar de la moto de Hagrid y se eleva en el  cielo, 
dejando Privet Drive por última vez, Harry Potter sabe que lord  Voldemort y sus mortífagos se hallan cerca. 
El encantamiento protector  que había mantenido a salvo a Harry se ha roto, pero el no puede seguir  escondiendose. 
El Señor Tenebroso se dedica a aterrorizar a todos los  seres queridos de Harry, y, para detenerlo, este habrá de encontrar y destruir los horrocruxes que quedan. 
La batalla definitiva debe comenzar: Harry tendrá que alzarse y enfrentarse a su enemigo...',
'J.K. Rowling', 'Fantasía', 1999, 'Imagenes\harryPotter7.jpg', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf', @resultado);
SELECT @resultado;



CALL insert_libro('Alas de Sangre', 'Violet Sorrengail creía que se uniría al Cuadrante de los Escribas para vivir una vida tranquila, 
sin embargo, por órdenes de su madre, debe unirse a los miles de candidatos que, en el Colegio de Guerra de Basgiath, luchan por formar 
parte de la élite de Navarre: el Cuadrante de los Jinetes de dragones.',
'Rebecca Yarros', 'Fantasía', 2023, 'Imagenes\AlasSangre.jpg', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf', @resultado);
SELECT @resultado;

CALL insert_libro('Alas de Hierro', 'Ahora comienza el verdadero entrenamiento, y Violet no sabe cómo logrará superarlo. 
No solo porque es brutal y agotador o porque está diseñado para llevar al límite el umbral del dolor de los jinetes, 
sino porque el nuevo vicecomandante está empeñado en demostrarle lo débil que es, a menos que traicione al hombre al que ama. 
La voluntad de sobrevivir no será suficiente este año, porque Violet conoce el secreto que se oculta entre los muros del colegio, y nada,
 ni siquiera el fuego de dragón, será suficiente para salvarlos.',
'Rebecca Yarros', 'Fantasía', 2024, 'Imagenes\AlasHierro.jpg', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf', @resultado);
SELECT @resultado;





CALL insert_libro('Bella al Desnudo', 'Érase una vez, una Princesa Valiente…
Me llamo Bella Johnson. Sí, Bella con elle, como la del famoso cuento, 
nada de Bela que en esta historia no hay vampiros; aunque sí, algunos que bien podrían haber salido de una novela de terror. 
Tengo veintinueve años, vivo en Madrid y trabajo como secretaria para una importante empresa de publicidad de la capital. 
Soy impulsiva, me gusta creer que divertida, y no me dejo dominar fácilmente. Quizá esto se deba a que diez años atrás sufrí un suceso (diría que traumático)
 que cambió mi vida: me alejé de mi familia, dejé de ser la que era y desde entonces no he vuelto a relacionarme con los hombres con normalidad.',
'Rachel Bels', 'Romance', 2016, 'Imagenes\bellaAlDesnudo.jpg', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf', @resultado);
SELECT @resultado;

CALL insert_libro('Desnudando a la Bestia', 'El paso de Daniel por mi vida ha sido como un tsunami,
 y no solo porque haya resultado brutalmente implacable haciendo de paso honor a su apodo, 
 sino más bien porque si hay algo que tuve claro desde el primer momento, es que después de él, nada volvería a ser como antes.
La segunda parte de esta historia nos acercará más al pasado de Daniel y puede que así comprendamos mejor cómo ha llegado a convertirse 
en esa temible bestia. A este proceso de descubrimiento hay que añadirle varios giros del destino, un problema de comunicación de 
proporciones catastróficas, la posibilidad de que Daniel vaya a la cárcel, mi ansia por querer saberlo todo sobre él demasiado rápido y las malas decisiones.',
'Rachel Bels', 'Romance', 2017, 'Imagenes\desnudandoBestia.jpg', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf', @resultado);
SELECT @resultado;

CALL insert_libro('Bella y Bestia', 'Dos años han pasado desde que abandoné aquel hospital de Madrid y me marché dejando todo atrás. 
Me he mudado a Nueva York, trabajo para una importante revista y he decidido darle una nueva oportunidad al amor tras conocer a Barry Wilson, 
un atractivo neurocirujano que ha sido capaz de demostrarme que las relaciones pueden darse de otra manera.
Pero lo bueno dura poco y una llamada relacionada con Daniel lo cambiará todo.',
'Rachel Bels', 'Romance', 2018, 'Imagenes\bellaYlabestia.jpg', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf', @resultado);
SELECT @resultado;

CALL insert_libro('Cenicienta no pertenece a nadie', 'Érase una vez, una princesa valiente…
Una prostituta.
Una esclava.
Pocas personas conocen mi verdadero nombre, puedes llamarme Ce o Cenicienta si te vas más ese rollo. ¿Que a qué rollo me refiero? 
Al de pagar por sexo. No es que yo trabaje en ello porque quiera, he sido coaccionada por mi madrastra.
Y había perdido completamente la esperanza de salir de esta pesadilla hasta que tuve la posibilidad de acudir a una misteriosa fiesta de máscaras, 
que podría haberse convertido en mi llave para escapar de esta cárcel si las cosas hubiesen salido bien, pero… no lo hicieron. Nunca lo hacen. 
Aunque, conocí a Jon, hijo de uno de los mayores y más peligrosos proxenetas del país, pero que, jugando bien mis cartas, puede convertirse en mi modo de escape de esta miserable vida.',
'Rachel Bels', 'Romance', 2020, 'Imagenes\ceni.jpg', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf', @resultado);
SELECT @resultado;


CALL insert_libro('El maestro del azúcar', 'Dos jóvenes unidas por el mismo destino, que emigran por amor y lealtad a la familia. Una isla exótica que oculta bajo su luz antiguos odios y venganzas.
Norte de España, 1895: dos mujeres abandonan la apacible villa de Colombres para viajar a la lejana isla de Cuba. Sus motivos no pueden ser más distintos.
Mar, la hija del medico del pueblo, emprende la travesía siguiendo a su padre, encargado de dirigir un consultorio en una plantación de azúcar llamada Dos Hermanos.
Paulina, viuda demasiado joven y de origen humilde, se ve obligada a embarcar para contraer matrimonio con el prestigioso maestro de azúcar de la hacienda, un hombre a quien no conoce.
La primera sueña con ser medico; la segunda se pregunta si será feliz con su inminente esposo.
Dos jóvenes unidas por el mismo destino, que emigran por amor y lealtad a la familia. Una isla exótica que oculta bajo su luz antiguos odios y venganzas. Todo ello a las puertas de la Guerra Necesaria, que dará a Cuba su independencia.',
'Mayte Uceda', 'Historia', 2024, 'Imagenes\azzucar.jpg', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf', @resultado);
SELECT @resultado;

CALL insert_libro('Roma soy yo', 'DESPUÉS DE JULIO CÉSAR, EL MUNDO NUNCA VOLVIÓ A SER EL MISMO.
Si alguna vez hubo un hombre nacido para cambiar el curso de la  Historia, ese fue Julio César. Su leyenda, veinte siglos después, sigue más viva que nunca.
Roma, año 77 a.C. El cruel senador Dolabela va a ser juzgado por  corrupción, pero ha contratado a los mejores abogados, ha comprado al  jurado y, además, 
es conocido por usar la violencia contra todos los que  se enfrentan a él. Nadie se atreve a ser el fiscal, hasta que de pronto,  contra todo pronóstico, 
un joven patricio de tan solo veintitrés años  acepta llevar la acusación, defender al pueblo de Roma y desafiar el  poder de las élites. El nombre del desconocido abogado es Cayo Julio César.',
'Santiago Posteguillo', 'Historia', 2022, 'Imagenes\roma.jpg', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf', @resultado);
SELECT @resultado;

CALL insert_libro('Maldita Roma', 'Mare Internum, año 75 a. C. Un barco mercante navega rumbo a la isla de Rodas. 
A bordo, Julio César acompañado sólo por su fiel Labieno. Obligado por sus enemigos a exiliarse de Roma, se dirige al encuentro con el maestro Apolonio para aprender oratoria y de este modo,
 a su regreso, iniciar una feroz pugna para ingresar en el Senado y enfrentarse allí al temido Cicerón.
Así arranca la extraordinaria segunda entrega de la saga dedicada a Julio César por Santiago Posteguillo. E
n Maldita Roma encontraremos ya al mito en la plenitud de su talento político y militar, dispuesto a vencer cualquier obstáculo en su imparable conquista del poder.',
'Santiago Posteguillo', 'Historia', 2023, 'Imagenes\malditaRoma.jpg', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf', @resultado);
SELECT @resultado;



CALL insert_libro('Drácula', 'Las de Bram Stoker y Jonathan Harker fueron vidas paralelas. 
Stoker era el secretario particular de Henry Irving, un reputado actor shakespeariano y propietario del Lyceum Theatre de Londres; 
Harker, el del enigmático conde Drácula, quien lo convocó a su castillo de Transilvania para negociar la adquisición de una mansión en Londres. 
No es casual que el personaje de Drácula se inspire en las facciones e idiosincrasia de Irving, ni que Stoker hiciese una lectura pública en el Lyceum Theatre días antes de su edición.',
'Bram Stoker', 'Terror', 1897, 'Imagenes\dracula.jpg', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf', @resultado);
SELECT @resultado;

CALL insert_libro('La casa de las grietas', 'Iris, Gray y Vivi Hollow son tres hermanas incuestionablemente
extrañas. Cuando eran niñas, desaparecieron en una calle de Edimburgo y regresaron un mes más tarde sin recordar lo sucedido. A partir de ese momento comenzaron a experimentar cambios extraños y espeluznantes.
Primero, su cabello oscuro se volvió blanco. Luego, sus ojos azules se tornaron negros. Y aunque nunca aumentan de peso, comen sin mesura, incapaces de aplacar su insaciable apetito. La gente las encuentra insoportablemente
bellas, inquietantemente excitantes e inexplicablemente peligrosas. Pero ahora, diez años después, Gray desaparece dejando unas pistas confusas sobre su paradero, e Iris y Vivi inician su búsqueda. Sin embargo, no son las únicas que
están tras ella. Las dos hermanas sufren persecuciones que rozan lo sobrenatural, mientras comienzan a darse cuenta de que la historia que les han contado sobre su pasado se desmorona, y que el lugar de donde volvieron
aparentemente ilesas hace diez años podría estar reclamando su regreso.',
'Krystal Sutherland', 'Terror', 2022, 'Imagenes\grietas.jpg', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf', @resultado);
SELECT @resultado;



CALL insert_libro('La grieta del silencio', 'Staten Island, 1981. La bicicleta de Daniel Miller aparece abandonada en las inmediaciones de su casa. 
No hay rastro del pequeño. Treinta años después, en 2011, la periodista de investigación del Manhattan Press Miren Triggs sigue una pista que la conduce hasta el terrible hallazgo de un cadáver con los labios sellados.
Miren Triggs y Jim Schmoer, su antiguo profesor de periodismo, tratarán de descubrir qué vincula ambos casos mientras ayudan a Ben Miller, padre de Daniel y ex inspector del FBI, 
a reconstruir por última vez la desaparición de su hijo. Se adentrarán así en las profundidades de un enigma lleno de recovecos en los que resuenan las voces del pasado. 
¿Qué le sucedió a Daniel? ¿Quién se esconde tras el horrible asesinato? ¿Puede el silencio ser el refugio de la verdad?',
'Javier Castillo', 'Misterio', 2024, 'Imagenes\silencioG.jpg', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf', @resultado);
SELECT @resultado;

CALL insert_libro('Esperando al diluvio', 'Entre los años 1968 y 1969, el asesino al que la prensa bautizaría como John Biblia mató a tres mujeres en Glasgow.
 Nunca fue identificado y el caso todavía sigue abierto hoy en día. En esta novela, a principios de los años ochenta, el investigador de policía escocés Noah Scott 
 Sherrington logra llegar hasta John Biblia, pero un fallo en su corazón en el último momento le impide arrestarlo. A pesar de su frágil estado de salud, 
 y contra los consejos médicos y la negativa de sus superiores para que continúe con la persecución del asesino en serie, Noah sigue una corazonada que lo llevará hasta el Bilbao de 1983. 
 Justo unos días antes de que un verdadero diluvio arrase la ciudad.',
'Dolores Redondo', 'Misterio', 2024, 'Imagenes\diluvio.jpg', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf', @resultado);
SELECT @resultado;

CALL insert_libro('Romper el Hielo', 'Anastasia Allen está decidida a entrar en el equipo olímpico de patinaje artístico de Estados Unidos y, 
cuando consigue una beca para la Universidad de California, todo parece ir de acuerdo con su plan.
El objetivo de Nathan Hawkins como capitán del equipo de hockey es mantener a sus chicos sobre el hielo cueste lo que cueste, 
pero todo se complica cuando tienen que compartir pista con una patinadora guapísima y con muy mal genio.
La situación obliga a estos rivales a pasar tiempo juntos, pero Anastasia está tranquila. Sabe perfectamente que un jugador de hockey jamás podría distraerla, y mucho menos Nate... ¿verdad?',
'Hannah Grace', 'Romance', 2024, 'Imagenes\romperHielo.jpg', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf', @resultado);
SELECT @resultado;





CALL insert_libro('Cien años de soledad','La historia épica de la familia Buendía en el pueblo mágico de Macondo, desde su fundación hasta su decadencia, explorando temas 
		como el amor, la soledad y la política a través de generaciones.','Gabriel García Márquez','Clásicos','1967','Imagenes\cien.jpg', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf', @resultado);
SELECT @resultado;

CALL insert_libro('El libro de los abrazos',' Colección de relatos que presenta una serie de pequeñas historias, anécdotas y reflexiones que abordan temas diversos como 
		la política, el amor, la injusticia social y la naturaleza humana, todo ello tejido con la prosa característica de Galeano. Cada relato invita a la reflexión 
		sobre la vida y el mundo que nos rodea.','Eduardo Galeano','Poesía','1989','Imagenes\abrazos.jpg', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf', @resultado);
SELECT @resultado;

CALL insert_libro('El Aleph','Colección de cuentos que exploran temas como la metaficción, los laberintos, los espejos y la infinitud. En el cuento que da nombre al libro, 
	"El Aleph", Borges introduce la idea de un punto en el espacio que contiene todas las cosas simultáneamente. Cada relato en la colección es una obra 
    maestra que desafía la percepción y ofrece una visión única y compleja del mundo.','Jorge Luis Borges','Clásicos','1949','Imagenes\aleph.jpg', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf', @resultado);
SELECT @resultado;

CALL insert_libro('1984','Una distopía clásica que presenta un sombrío futuro totalitario. La historia sigue a Winston Smith, un funcionario del Partido, mientras lucha contra
	la opresión y la manipulación del Estado. La novela explora temas como la vigilancia omnipresente, la represión del pensamiento libre y la distorsión de la verdad.
    La figura del Gran Hermano y la neolengua son elementos emblemáticos que han dejado una marca duradera en la literatura y la crítica social.','George Orwell','Clásicos','1949','Imagenes\1984.jpg', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf', @resultado);
SELECT @resultado;


CALL insert_libro('Un mundo feliz','Una sociedad futura donde la estabilidad y la felicidad superficial son prioridades, logradas a través del control totalitario y la manipulación 
	genética. La novela sigue a Bernard Marx, un disidente que cuestiona el sistema, y a John, un "salvaje" que proviene de una reserva fuera de la sociedad civilizada. 
    Huxley explora temas de conformidad, tecnología, y la búsqueda del significado en una sociedad que valora la comodidad sobre la verdad.','Aldous Huxley','Clásicos','1932','Imagenes\feliz.jpg', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf', @resultado);
SELECT @resultado;


CALL insert_libro('La Iliada','Epopeya griega que narra los eventos del último año de la Guerra de Troya, centrándose en el conflicto entre el héroe griego Aquiles y el 
	príncipe troyano Héctor. La obra aborda temas como el honor, la gloria, la ira de los dioses y la condición humana en medio de la guerra.','Homero','Historia','0','Imagenes\iliada.png', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf', @resultado);
SELECT @resultado;


CALL insert_libro('120 jornadas en Sodoma','Una obra conocida por su exploración provocativa y extrema de la depravación sexual y la corrupción moral. La historia sigue a cuatro 
	aristócratas franceses que buscan satisfacer sus deseos más oscuros en un aislado castillo. La novela es notoria por sus descripciones gráficas de violencia y 
    perversión, sirviendo como una crítica satírica de la decadencia de la sociedad y el abuso de poder. La obra es una de las más controvertidas y transgresoras en 
    la historia de la literatura.','Marqués de Sade','Romance','1905','Imagenes\sodoma.jpg', 'Imagenes\Harry Potter y la Piedra Filosofal.pdf', @resultado);
SELECT @resultado;

-- CALL insert_libro(, @resultado);
SELECT @resultado;



