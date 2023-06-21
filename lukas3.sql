-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-06-2023 a las 18:48:50
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `lukas3`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultoria`
--

CREATE TABLE `consultoria` (
  `id_consultoria` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `consultoria` text NOT NULL,
  `id_estado_consultoria` int(11) DEFAULT NULL,
  `id_documento` int(11) DEFAULT NULL,
  `notas` int(1) NOT NULL DEFAULT 1 CHECK (`notas` between 1 and 7),
  `documento` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `consultoria`
--

INSERT INTO `consultoria` (`id_consultoria`, `id_usuario`, `id_empresa`, `consultoria`, `id_estado_consultoria`, `id_documento`, `notas`, `documento`) VALUES
(1, NULL, NULL, 'asdasdasd', NULL, NULL, 1, './uploads/fileUpload-1687245610726.docx');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultoriax_documento`
--

CREATE TABLE `consultoriax_documento` (
  `id_consultoria` int(11) NOT NULL,
  `id_documento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `id_documento` int(11) NOT NULL,
  `documento` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `id_empresa` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `numero` int(11) NOT NULL,
  `rut_empresa` varchar(12) NOT NULL,
  `ciudad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_consultoria`
--

CREATE TABLE `estado_consultoria` (
  `id_estado_consultoria` int(11) NOT NULL,
  `comentario` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id_tipo_usuario` int(11) NOT NULL,
  `tipo_usuario` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id_tipo_usuario`, `tipo_usuario`) VALUES
(1, 'alumno'),
(2, 'consultor'),
(3, 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `rut` varchar(12) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `contrasena` varchar(50) NOT NULL,
  `id_tipo_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `rut`, `correo`, `contrasena`, `id_tipo_usuario`) VALUES
(6, '12', '12', '2', '12', 1),
(7, '123', '123', '123', '123', 2),
(8, '1234', '123', '123', '123', 3),
(9, 'asd', 'asd', 'asd', 'asd', NULL),
(11, 'ibani', '1', '1', '1', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `consultoria`
--
ALTER TABLE `consultoria`
  ADD PRIMARY KEY (`id_consultoria`),
  ADD KEY `consultoria_ibfk_1` (`id_usuario`),
  ADD KEY `consultoria_ibfk_2` (`id_empresa`),
  ADD KEY `consultoria_ibfk_3` (`id_documento`),
  ADD KEY `consultoria_ibfk_4` (`id_estado_consultoria`);

--
-- Indices de la tabla `consultoriax_documento`
--
ALTER TABLE `consultoriax_documento`
  ADD PRIMARY KEY (`id_consultoria`,`id_documento`),
  ADD KEY `consultoriax_documento_ibfk_2` (`id_documento`);

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`id_documento`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id_empresa`);

--
-- Indices de la tabla `estado_consultoria`
--
ALTER TABLE `estado_consultoria`
  ADD PRIMARY KEY (`id_estado_consultoria`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id_tipo_usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `usuario_ibfk_1` (`id_tipo_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `consultoria`
--
ALTER TABLE `consultoria`
  MODIFY `id_consultoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `documentos`
--
ALTER TABLE `documentos`
  MODIFY `id_documento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id_empresa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado_consultoria`
--
ALTER TABLE `estado_consultoria`
  MODIFY `id_estado_consultoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `id_tipo_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `consultoria`
--
ALTER TABLE `consultoria`
  ADD CONSTRAINT `consultoria_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `consultoria_ibfk_2` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id_empresa`),
  ADD CONSTRAINT `consultoria_ibfk_3` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id_documento`),
  ADD CONSTRAINT `consultoria_ibfk_4` FOREIGN KEY (`id_estado_consultoria`) REFERENCES `estado_consultoria` (`id_estado_consultoria`);

--
-- Filtros para la tabla `consultoriax_documento`
--
ALTER TABLE `consultoriax_documento`
  ADD CONSTRAINT `consultoriax_documento_ibfk_1` FOREIGN KEY (`id_consultoria`) REFERENCES `consultoria` (`id_consultoria`),
  ADD CONSTRAINT `consultoriax_documento_ibfk_2` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id_documento`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `tipo_usuario` (`id_tipo_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
