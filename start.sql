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



DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postulante` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `dateOfBirth` datetime NOT NULL,
  `emailAddress` varchar(50) CHARACTER SET latin1 NOT NULL,
  `firstName` varchar(30) CHARACTER SET latin1 NOT NULL,
  `lastName` varchar(30) CHARACTER SET latin1 NOT NULL,
  `teacher_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_teacher_id_idx` (`teacher_id`),
  CONSTRAINT `fk_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (60,'1991-03-08 00:00:00','behemoth13@yandex.ru','Alex','Afanasyeu',52);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--



--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (52,'adminadmin','adminadmin');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;