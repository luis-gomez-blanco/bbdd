-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.27-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para dannys_dinner
DROP DATABASE IF EXISTS `dannys_dinner`;
CREATE DATABASE IF NOT EXISTS `dannys_dinner` /*!40100 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci */;
USE `dannys_dinner`;

-- Volcando estructura para tabla dannys_dinner.menu
DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id_producto` int(2) NOT NULL,
  `nombre_producto` varchar(25) NOT NULL,
  `precio` decimal(4,2) NOT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla dannys_dinner.menu: ~4 rows (aproximadamente)
REPLACE INTO `menu` (`id_producto`, `nombre_producto`, `precio`) VALUES
	(1, 'sushi', 10.00),
	(2, 'curry', 15.00),
	(3, 'ramen', 12.00),
	(4, 'noodles', 11.50);

-- Volcando estructura para tabla dannys_dinner.miembro
DROP TABLE IF EXISTS `miembro`;
CREATE TABLE IF NOT EXISTS `miembro` (
  `id_cliente` char(1) NOT NULL,
  `fecha_alta` date DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla dannys_dinner.miembro: ~4 rows (aproximadamente)
REPLACE INTO `miembro` (`id_cliente`, `fecha_alta`) VALUES
	('A', '2023-01-07'),
	('B', '2023-01-09'),
	('C', NULL),
	('D', '2023-01-03');

-- Volcando estructura para tabla dannys_dinner.ventas
DROP TABLE IF EXISTS `ventas`;
CREATE TABLE IF NOT EXISTS `ventas` (
  `id_cliente` char(1) NOT NULL,
  `id_producto` int(2) NOT NULL,
  `fecha_pedido` date NOT NULL,
  KEY `fk_ven_id_cli` (`id_cliente`),
  KEY `fk_ven_id_pro` (`id_producto`),
  CONSTRAINT `fk_ven_id_cli_mie_di_cli` FOREIGN KEY (`id_cliente`) REFERENCES `miembro` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ven_id_pro_men_id_pro` FOREIGN KEY (`id_producto`) REFERENCES `menu` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Volcando datos para la tabla dannys_dinner.ventas: ~15 rows (aproximadamente)
REPLACE INTO `ventas` (`id_cliente`, `id_producto`, `fecha_pedido`) VALUES
	('A', 1, '2023-01-01'),
	('A', 2, '2023-01-01'),
	('A', 2, '2023-01-07'),
	('A', 3, '2023-01-10'),
	('A', 3, '2023-01-11'),
	('A', 3, '2023-01-11'),
	('B', 2, '2023-01-01'),
	('B', 2, '2023-01-02'),
	('B', 1, '2023-01-04'),
	('B', 1, '2023-01-11'),
	('B', 3, '2023-01-16'),
	('B', 3, '2023-02-01'),
	('C', 3, '2023-01-01'),
	('C', 3, '2023-01-01'),
	('C', 3, '2023-01-07');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
