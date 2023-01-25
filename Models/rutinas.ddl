CREATE DATABASE `rutinas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

CREATE TABLE `avance` (
  `idAvance` char(30) NOT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  `idserieavance` int DEFAULT NULL,
  PRIMARY KEY (`idAvance`),
  KEY `series` (`idserieavance`),
  CONSTRAINT `series` FOREIGN KEY (`idserieavance`) REFERENCES `seriesavance` (`idserieavance`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `circuito` (
  `idcircuito` int NOT NULL,
  `claveCircuito` char(15) NOT NULL,
  `series` decimal(9,0) DEFAULT NULL,
  `ejercicio` int DEFAULT NULL,
  PRIMARY KEY (`idcircuito`,`claveCircuito`),
  KEY `ejercicio` (`ejercicio`),
  CONSTRAINT `ejercicio` FOREIGN KEY (`ejercicio`) REFERENCES `ejercicio` (`idEjercicio`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `ejercicio` (
  `idEjercicio` int NOT NULL AUTO_INCREMENT,
  `nombre` char(50) NOT NULL,
  `repeticiones` decimal(9,0) NOT NULL,
  `imagen` char(50) DEFAULT NULL,
  PRIMARY KEY (`idEjercicio`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rutina` (
  `idRutina` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int NOT NULL,
  `descripcionDia` char(30) DEFAULT NULL,
  `idcircuito` int NOT NULL,
  PRIMARY KEY (`idRutina`),
  KEY `circuitos` (`idUsuario`),
  KEY `idcircuito` (`idcircuito`),
  CONSTRAINT `circuitos` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `rutina_ibfk_1` FOREIGN KEY (`idcircuito`) REFERENCES `circuito` (`idcircuito`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `seriesavance` (
  `idserieavance` int NOT NULL AUTO_INCREMENT,
  `claveseries` char(30) NOT NULL,
  `serie` int DEFAULT NULL,
  `idRutina` int DEFAULT NULL,
  `idcircuito` int DEFAULT NULL,
  `PesoUsado` int DEFAULT NULL,
  `UnidadMedida` char(5) DEFAULT NULL,
  PRIMARY KEY (`idserieavance`,`claveseries`),
  KEY `idRutina` (`idRutina`),
  KEY `idcircuito` (`idcircuito`),
  CONSTRAINT `seriesavance_ibfk_1` FOREIGN KEY (`idRutina`) REFERENCES `rutina` (`idRutina`),
  CONSTRAINT `seriesavance_ibfk_2` FOREIGN KEY (`idcircuito`) REFERENCES `rutina` (`idcircuito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `usuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `usuario` char(10) NOT NULL,
  `password` char(8) NOT NULL,
  `nombre` char(30) NOT NULL,
  `edad` decimal(2,0) NOT NULL,
  `correo` char(30) NOT NULL,
  `estatura` decimal(3,0) NOT NULL,
  `peso` decimal(10,0) NOT NULL,
  `genero` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `complexion` char(10) DEFAULT NULL,
  `diasActividad` decimal(8,0) DEFAULT NULL,
  `meta` char(30) DEFAULT NULL,
  `imc` decimal(10,0) NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
