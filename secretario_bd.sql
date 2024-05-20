-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-09-2023 a las 05:50:35
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `secretario_bd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informe_mensual`
--

CREATE TABLE `informe_mensual` (
  `Anio` int(11) NOT NULL,
  `Mes` varchar(45) NOT NULL,
  `Publicaciones` int(11) DEFAULT NULL,
  `Videos` int(11) DEFAULT NULL,
  `Horas` int(11) DEFAULT NULL,
  `Revistas` int(11) DEFAULT NULL,
  `ID_Publicador` int(11) DEFAULT NULL,
  `AnioServicio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `informe_mensual`
--

INSERT INTO `informe_mensual` (`Anio`, `Mes`, `Publicaciones`, `Videos`, `Horas`, `Revistas`, `ID_Publicador`, `AnioServicio`) VALUES
(2023, 'Agosto', 2, 3, 15, 3, 2, 2023);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicador`
--

CREATE TABLE `publicador` (
  `ID_Publicador` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `FechaBautismo` date DEFAULT NULL,
  `Sexo` enum('Hombre','mujer') NOT NULL,
  `Notas` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `publicador`
--

INSERT INTO `publicador` (`ID_Publicador`, `Nombre`, `FechaNacimiento`, `FechaBautismo`, `Sexo`, `Notas`) VALUES
(2, 'Erick Fernández', '1993-11-25', '2023-09-15', 'Hombre', 'Primer publicador de la tabla');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta`
--

CREATE TABLE `tarjeta` (
  `AnioServicio` int(11) NOT NULL,
  `Mes` varchar(45) DEFAULT NULL,
  `ID_Publicador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tarjeta`
--

INSERT INTO `tarjeta` (`AnioServicio`, `Mes`, `ID_Publicador`) VALUES
(2023, 'Agosto', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `informe_mensual`
--
ALTER TABLE `informe_mensual`
  ADD PRIMARY KEY (`Anio`,`Mes`),
  ADD KEY `ID_Publicador` (`ID_Publicador`),
  ADD KEY `AnioServicio` (`AnioServicio`);

--
-- Indices de la tabla `publicador`
--
ALTER TABLE `publicador`
  ADD PRIMARY KEY (`ID_Publicador`);

--
-- Indices de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD PRIMARY KEY (`AnioServicio`),
  ADD KEY `ID_Publicador` (`ID_Publicador`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `publicador`
--
ALTER TABLE `publicador`
  MODIFY `ID_Publicador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `informe_mensual`
--
ALTER TABLE `informe_mensual`
  ADD CONSTRAINT `informe_mensual_ibfk_1` FOREIGN KEY (`ID_Publicador`) REFERENCES `publicador` (`ID_Publicador`),
  ADD CONSTRAINT `informe_mensual_ibfk_2` FOREIGN KEY (`AnioServicio`) REFERENCES `tarjeta` (`AnioServicio`);

--
-- Filtros para la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD CONSTRAINT `tarjeta_ibfk_1` FOREIGN KEY (`ID_Publicador`) REFERENCES `publicador` (`ID_Publicador`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
