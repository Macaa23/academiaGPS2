CREATE DATABASE  IF NOT EXISTS `danzaycultura` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `danzaycultura`;

DROP TABLE IF EXISTS `profesor`;
CREATE TABLE `profesor` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `RUT` varchar(255) NOT NULL UNIQUE,
  `Nombre` varchar(255) NOT NULL,
  `Especialidad` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

insert into profesor (RUT, Nombre, Especialidad) values ('100026295', 'Sonia Caceres', 'Danzas orientales');
insert into profesor (RUT, Nombre, Especialidad) values ('465465455', 'Fernando Rodriguez', 'Guitarra');
insert into profesor (RUT, Nombre, Especialidad) values ('165674469', 'Alberto Lillo', 'Danzas modernas');
insert into profesor (RUT, Nombre, Especialidad) values ('878754566', 'Jesus Figueroa', 'Dramatizacion');

DROP TABLE IF EXISTS `curso`;
CREATE TABLE `curso` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Cupo` int NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Nivel` varchar(255) NOT NULL,
  `prof_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`prof_id`) REFERENCES `profesor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


insert into curso (Cupo, Nombre, Nivel, prof_id) values (20, 'Danza arabe', 'Intermedio', 4);
insert into curso (Cupo, Nombre, Nivel, prof_id) values (15, 'Baile entretenido', 'Basico', 5);
insert into curso (Cupo, Nombre, Nivel, prof_id) values (15, 'Guitarra acustica', 'Intermedio', 6);
insert into curso (Cupo, Nombre, Nivel, prof_id) values (10, 'Improvisacion', 'Avanzado', 7);

DROP TABLE IF EXISTS `postulante`;
CREATE TABLE `postulante` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `password` varchar(15) NOT NULL,
  `userName` varchar(30) NOT NULL,
  `RUT` varchar(255) NOT NULL UNIQUE,
  `emailAddress` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `dateOfBirth` datetime NOT NULL,
  `genero` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

insert into postulante (password, userName, RUT, emailAddress, Nombre, dateOfBirth, genero, telefono) values ('asdf', 'CoffeeBean', '165740173', 'coffee@gmail.com', 'Adrian Parra Riveros', '1995/04/30', 'Masculino','123667554');
insert into postulante (password, userName, RUT, emailAddress, Nombre, dateOfBirth, genero, telefono) values ('mxd', 'SendPKS', '185556552', 'gms@gmail.com', 'Gustavo Bolivar Molina', '1995/05/30', 'Masculino','55662233');
insert into postulante (password, userName, RUT, emailAddress, Nombre, dateOfBirth, genero, telefono) values ('ironviking', 'Ragnar', '1900160013', 'nordicasgard@gmail.com', 'Erick Hackon Fernandez', '1997/10/02', 'Masculino','98456523');
insert into postulante (password, userName, RUT, emailAddress, Nombre, dateOfBirth, genero, telefono) values ('faithfully', 'Ace43', '180015450', 'urraandrea123@gmail.com', 'Andrea Urra Muñoz', '1995/01/28', 'Femenino','74518269');
insert into postulante (password, userName, RUT, emailAddress, Nombre, dateOfBirth, genero, telefono) values ('powerpuffbubble', 'BurbujaAzul', '188996553', 'pascal.ssolange@gmail.com', 'Pascal Villarroel Seguel', '1994/09/03', 'Femenino','85656232');
insert into postulante (password, userName, RUT, emailAddress, Nombre, dateOfBirth, genero, telefono) values ('dipper03', 'Keycard67', '196552320', 'wendy87@gmail.com', 'Mabel Pino Ramirez', '1993/08/06', 'Femenino','95642153');
insert into postulante (password, userName, RUT, emailAddress, Nombre, dateOfBirth, genero, telefono) values ('SolidSnake', 'GrayFox', '17556662', 'jvellastu@gmail.com', 'Jean Villalon Albornoz', '1992/02/20', 'Masculino','65856523');
insert into postulante (password, userName, RUT, emailAddress, Nombre, dateOfBirth, genero, telefono) values ('qwerty', 'pdSpark', '1075120200', 'ampr@gmail.com', 'Bart García Matos', '1996/03/12', 'Masculino','95846517');
insert into postulante (password, userName, RUT, emailAddress, Nombre, dateOfBirth, genero, telefono) values ('12356', 'choroy', '153030014', '5612asd@gmail.com', 'Manlio Orozco Guardado', '1998/02/20', 'Masculino','45175184');
INSERT INTO postulante(password, userName, RUT, emailAddress, Nombre, dateOfBirth, genero, telefono) VALUES('zxcvb', 'msgoon', '184706016', 'prime@gmail.com', 'Laya Anaya Banda', '1996/03/12', 'Femenino','95471517');
INSERT INTO postulante(password, userName, RUT, emailAddress, Nombre, dateOfBirth, genero, telefono) VALUES('ztii88', 'BPM', '192066670', 'pREX@gmail.com', 'Lemuel Abreu Nava', '1989/03/12', 'Masculino','99995471');
INSERT INTO postulante(password, userName, RUT, emailAddress, Nombre, dateOfBirth, genero, telefono) VALUES('kjhg', 'ehne', '172905447', 'ehne@gmail.com', 'Emanuel Longoria Ferrer', '1956/04/20', 'Masculino','95117548');
INSERT INTO postulante(password, userName, RUT, emailAddress, Nombre, dateOfBirth, genero, telefono) VALUES('45635', 'rune', '98736182', 'rune@gmail.com', 'Ludwiq Espinoza Toro', '1989/04/20', 'Masculino','94571542');
INSERT INTO postulante(password, userName, RUT, emailAddress, Nombre, dateOfBirth, genero, telefono) VALUES('asfd1235', 'millia', '85982443', 'choii@gmail.com', 'Naiara Jiménez Pedroza', '1993/04/15', 'Femenino','12457899');
INSERT INTO postulante(password, userName, RUT, emailAddress, Nombre, dateOfBirth, genero, telefono) VALUES('795117', 'HP', '133850945', 'HPUMP@gmail.com', 'Antoinette Soria Oquendo', '1990/03/15', 'Femenino','98654712');
INSERT INTO postulante(password, userName, RUT, emailAddress, Nombre, dateOfBirth, genero, telefono) VALUES('sngi350as', 'hiddenparts', '100275848', 'HPasrts@gmail.com', 'Guillermina Arenas Malave', '1991/05/15', 'Femenino','11245715');
INSERT INTO postulante(password, userName, RUT, emailAddress, Nombre, dateOfBirth, genero, telefono) VALUES('snooping4as', 'robotnik', '133850945', 'IVOr@gmail.com', 'Alfeo Ayala Urbina', '1988/05/15', 'Masculino','99457618');
INSERT INTO postulante(password, userName, RUT, emailAddress, Nombre, dateOfBirth, genero, telefono) VALUES('adfb2455', 'sonic', '69387667', 'hedeg@gmail.com', 'Alfeo Ayala Urbina', '1970/04/23', 'Femenino','21517548');
INSERT INTO postulante(password, userName, RUT, emailAddress, Nombre, dateOfBirth, genero, telefono) VALUES('sadfn3434', 'tails', '79035963', 'miles@gmail.com', 'Tirso Tejeda Muñoz', '1970/04/23', 'Masculino','294146582');
INSERT INTO postulante(password, userName, RUT, emailAddress, Nombre, dateOfBirth, genero, telefono) VALUES('mammas24', 'mario', '161016292', 'spagett@gmail.com', 'Dagoberto Narváez Barreto', '1980/02/13', 'Masculino','51421679');
INSERT INTO postulante(password, userName, RUT, emailAddress, Nombre, dateOfBirth, genero, telefono) VALUES('pizag34', 'luigi', '4316767-7', 'gree@gmail.com', 'Armentario Salas Solano', '1970/05/14', 'Masculino','24712854');
INSERT INTO postulante(password, userName, RUT, emailAddress, Nombre, dateOfBirth, genero, telefono) VALUES('fhh4954', 'peach', '103861926', 'brella@gmail.com', 'Lucina Cortez Perea', '1990/03/23', 'Femenino','75694582');

DROP TABLE IF EXISTS `inscripcion`;
CREATE TABLE `inscripcion` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `Estado` varchar(255) NOT NULL,
  `postulante_id` bigint(20) unsigned NOT NULL,
  `course_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`postulante_id`) REFERENCES `postulante` (`id`),
  FOREIGN KEY (`course_id`) REFERENCES `curso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

insert into inscripcion (fecha, estado, postulante_id, course_id) values ('2017/05/30', 'inscrito', 57,7);
insert into inscripcion (fecha, estado, postulante_id, course_id) values ('2017/05/30', 'inscrito', 57,8);
insert into inscripcion (fecha, estado, postulante_id, course_id) values ('2017/05/30', 'inscrito', 57,9);
insert into inscripcion (fecha, estado, postulante_id, course_id) values ('2017/05/30', 'inscrito', 57,10);

insert into inscripcion (fecha, estado, postulante_id, course_id) values ('2017/05/29', 'inscrito', 54,7);
insert into inscripcion (fecha, estado, postulante_id, course_id) values ('2017/05/29', 'inscrito', 54,8);
insert into inscripcion (fecha, estado, postulante_id, course_id) values ('2017/05/29', 'inscrito', 54,9);
insert into inscripcion (fecha, estado, postulante_id, course_id) values ('2017/05/29', 'inscrito', 54,10);

insert into inscripcion (fecha, estado, postulante_id, course_id) values ('2017/05/29', 'inscrito', 55,7);
insert into inscripcion (fecha, estado, postulante_id, course_id) values ('2017/05/29', 'inscrito', 55,8);
insert into inscripcion (fecha, estado, postulante_id, course_id) values ('2017/05/29', 'inscrito', 55,9);
insert into inscripcion (fecha, estado, postulante_id, course_id) values ('2017/05/29', 'inscrito', 55,10);

insert into inscripcion (fecha, estado, postulante_id, course_id) values ('2017/05/29', 'inscrito', 56,7);
insert into inscripcion (fecha, estado, postulante_id, course_id) values ('2017/05/29', 'inscrito', 56,8);
insert into inscripcion (fecha, estado, postulante_id, course_id) values ('2017/05/29', 'inscrito', 56,9);
insert into inscripcion (fecha, estado, postulante_id, course_id) values ('2017/05/29', 'inscrito', 56,10);

insert into inscripcion (fecha, estado, postulante_id, course_id) values ('2017/05/29', 'inscrito', 58,7);
insert into inscripcion (fecha, estado, postulante_id, course_id) values ('2017/05/29', 'inscrito', 58,8);
insert into inscripcion (fecha, estado, postulante_id, course_id) values ('2017/05/29', 'inscrito', 58,9);
insert into inscripcion (fecha, estado, postulante_id, course_id) values ('2017/05/29', 'inscrito', 58,10);

CREATE VIEW ranking AS
SELECT curso.Nombre, curso.Nivel, curso.Cupo, count(inscripcion.id) as Inscritos_totales 
FROM inscripcion JOIN curso on inscripcion.course_id=curso.id GROUP BY curso.Nombre;