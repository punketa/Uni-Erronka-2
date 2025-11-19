-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.6.23-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para unipayo
CREATE DATABASE IF NOT EXISTS `unipayo` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `unipayo`;

-- Volcando estructura para tabla unipayo.ikasgaiak
CREATE TABLE IF NOT EXISTS `ikasgaiak` (
  `id_ikasgaia` int(11) NOT NULL AUTO_INCREMENT,
  `izena` varchar(100) NOT NULL,
  `id_irakasle` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_ikasgaia`),
  KEY `id_irakasle` (`id_irakasle`),
  CONSTRAINT `ikasgaiak_ibfk_1` FOREIGN KEY (`id_irakasle`) REFERENCES `irakasleak` (`id_irakasle`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla unipayo.ikasgaiak: ~2 rows (aproximadamente)
INSERT INTO `ikasgaiak` (`id_ikasgaia`, `izena`, `id_irakasle`) VALUES
	(1, 'Hardware', 1),
	(2, 'Software', 2);

-- Volcando estructura para tabla unipayo.ikasleak
CREATE TABLE IF NOT EXISTS `ikasleak` (
  `id_ikasle` int(11) NOT NULL AUTO_INCREMENT,
  `izena` varchar(50) NOT NULL,
  `abizena` varchar(50) NOT NULL,
  `posta` varchar(100) DEFAULT NULL,
  `telefonoa` varchar(20) DEFAULT NULL,
  `hiria` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_ikasle`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla unipayo.ikasleak: ~4 rows (aproximadamente)
INSERT INTO `ikasleak` (`id_ikasle`, `izena`, `abizena`, `posta`, `telefonoa`, `hiria`) VALUES
	(1, 'Ander', 'Martin', 'martin.ander@payo.eus', '700111222', 'Berriz XD'),
	(2, 'Eneko', 'Saez', 'saez.eneko@payo.eus', '700222333', 'Durango'),
	(3, 'Iker', 'Petit', 'petit.iker@payo.eus', '700333444', 'Ermua'),
	(4, 'Oier', 'Garcia', 'garcia.oier@payo.eus', '700444555', 'Soraluze');

-- Volcando estructura para vista unipayo.ikasle_ikasgaiak
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `ikasle_ikasgaiak` (
	`id_ikasle` INT(11) NOT NULL,
	`ikaslea` VARCHAR(1) NOT NULL COLLATE 'latin1_swedish_ci',
	`ikasgaia` VARCHAR(1) NOT NULL COLLATE 'latin1_swedish_ci',
	`irakaslea` VARCHAR(1) NOT NULL COLLATE 'latin1_swedish_ci'
);

-- Volcando estructura para vista unipayo.ikasle_notak
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `ikasle_notak` (
	`id_ikasle` INT(11) NOT NULL,
	`ikaslea` VARCHAR(1) NOT NULL COLLATE 'latin1_swedish_ci',
	`ikasgaia` VARCHAR(1) NOT NULL COLLATE 'latin1_swedish_ci',
	`nota` DECIMAL(4,2) NULL
);

-- Volcando estructura para tabla unipayo.irakasleak
CREATE TABLE IF NOT EXISTS `irakasleak` (
  `id_irakasle` int(11) NOT NULL AUTO_INCREMENT,
  `izena` varchar(50) NOT NULL,
  `abizena` varchar(50) NOT NULL,
  `posta` varchar(100) DEFAULT NULL,
  `telefonoa` varchar(20) DEFAULT NULL,
  `hiria` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_irakasle`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla unipayo.irakasleak: ~2 rows (aproximadamente)
INSERT INTO `irakasleak` (`id_irakasle`, `izena`, `abizena`, `posta`, `telefonoa`, `hiria`) VALUES
	(1, 'Joseba', 'Lopez', 'joseba.lopez@payo.eus', '600123456', 'Eibar'),
	(2, 'Yoritz', 'Azpeitia', 'yoritz.azpeitia@payo.eus', '600654321', 'Azpeitia');

-- Volcando estructura para tabla unipayo.notak
CREATE TABLE IF NOT EXISTS `notak` (
  `id_nota` int(11) NOT NULL AUTO_INCREMENT,
  `id_ikasle` int(11) DEFAULT NULL,
  `id_ikasgaia` int(11) DEFAULT NULL,
  `nota` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`id_nota`),
  KEY `id_ikasle` (`id_ikasle`),
  KEY `id_ikasgaia` (`id_ikasgaia`),
  CONSTRAINT `notak_ibfk_1` FOREIGN KEY (`id_ikasle`) REFERENCES `ikasleak` (`id_ikasle`),
  CONSTRAINT `notak_ibfk_2` FOREIGN KEY (`id_ikasgaia`) REFERENCES `ikasgaiak` (`id_ikasgaia`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla unipayo.notak: ~8 rows (aproximadamente)
INSERT INTO `notak` (`id_nota`, `id_ikasle`, `id_ikasgaia`, `nota`) VALUES
	(1, 1, 1, 0.00),
	(2, 1, 2, 0.00),
	(3, 2, 1, 10.00),
	(4, 2, 2, 10.00),
	(5, 3, 1, 9.00),
	(6, 3, 2, 8.00),
	(7, 4, 1, 5.00),
	(8, 4, 2, 4.00);

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `ikasle_ikasgaiak`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `ikasle_ikasgaiak` AS SELECT i.id_ikasle, i.izena AS ikaslea, g.izena AS ikasgaia, p.izena AS irakaslea
FROM ikasleak i
JOIN ikasgaiak g ON 1=1  
JOIN irakasleak p ON g.id_irakasle = p.id_irakasle 
;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `ikasle_notak`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `ikasle_notak` AS SELECT i.id_ikasle, i.izena AS ikaslea, g.izena AS ikasgaia, n.nota
FROM ikasleak i
JOIN notak n ON i.id_ikasle = n.id_ikasle
JOIN ikasgaiak g ON g.id_ikasgaia = n.id_ikasgaia 
;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
