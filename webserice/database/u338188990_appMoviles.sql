-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 29-01-2025 a las 16:41:35
-- Versión del servidor: 10.11.10-MariaDB
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u338188990_appMoviles`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carros`
--

CREATE TABLE `carros` (
  `cod_carro` int(11) NOT NULL,
  `cedula_carro` varchar(10) NOT NULL,
  `nombre_carro` varchar(100) NOT NULL,
  `placa_carro` varchar(10) NOT NULL,
  `hora_entrada` datetime NOT NULL,
  `hora_salida` datetime DEFAULT NULL,
  `valor_pago` decimal(10,2) DEFAULT 0.00,
  `estado_carro` enum('Pendiente','Pagado') NOT NULL DEFAULT 'Pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `carros`
--

INSERT INTO `carros` (`cod_carro`, `cedula_carro`, `nombre_carro`, `placa_carro`, `hora_entrada`, `hora_salida`, `valor_pago`, `estado_carro`) VALUES
(1, '1723456789', 'Toyota Corolla', 'ABC123', '2025-01-29 08:00:00', NULL, 0.00, 'Pendiente'),
(2, '1801234567', 'Chevrolet Spark', 'XYZ456', '2025-01-29 09:15:00', NULL, 0.00, 'Pendiente'),
(3, '1109876543', 'Hyundai Tucson', 'DEF789', '2025-01-29 10:30:00', NULL, 0.00, 'Pendiente'),
(4, '0956781234', 'Ford Ranger', 'GHI321', '2025-01-29 11:45:00', NULL, 0.00, 'Pendiente'),
(5, '0604321987', 'Kia Sportage', 'JKL654', '2025-01-29 12:00:00', NULL, 0.00, 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `apellido` varchar(200) NOT NULL,
  `estatus` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `estado` enum('pendiente','completada') NOT NULL DEFAULT 'pendiente',
  `fecha_creacion` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`id`, `titulo`, `descripcion`, `estado`, `fecha_creacion`) VALUES
(15, 'Ejercicio diario', 'Completar 30 minutos de ejercicio en la mañana', 'completada', '2025-01-29 06:55:33'),
(22, 'jugar', 'futbol', 'pendiente', '2025-01-29 07:08:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `cod_usuario` int(11) NOT NULL,
  `ci_usuario` varchar(10) NOT NULL,
  `nom_usuario` varchar(50) NOT NULL,
  `ape_usuario` varchar(50) NOT NULL,
  `correo_usuario` varchar(100) NOT NULL,
  `clave_usuario` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`cod_usuario`, `ci_usuario`, `nom_usuario`, `ape_usuario`, `correo_usuario`, `clave_usuario`) VALUES
(1, '1803641420', 'Juan', 'Pérez', 'juan.perez@example.com', '$1234'),
(2, '1801234567', 'María', 'Gómez', 'maria.gomez@example.com', '$2y$10$XJLWIVKUs8Uv3/pqmfHwu.HQczJ1M6iXJ36y7NU/ZQfpINP3eZ7nK'),
(3, '1109876543', 'Carlos', 'Ramírez', 'carlos.ramirez@example.com', '$2y$10$uhXZ1zOsYY5RfB76fncr9ueBz7MKqrrvDzt50ihBdmk0JTYA2D/2y'),
(4, '0956781234', 'Ana', 'López', 'ana.lopez@example.com', '$2y$10$wY/KFxMy6/6tpEk3hu6FmeIEblw7TC.MFhjZme9eSDWxJQZExxKGO'),
(5, '0604321987', 'David', 'Mendoza', 'david.mendoza@example.com', '$2y$10$XsP05yBZQvMw/Uj9zKowte7B/uH9.E4K2I8tF6EdtyolGc4ZlgXji');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carros`
--
ALTER TABLE `carros`
  ADD PRIMARY KEY (`cod_carro`),
  ADD UNIQUE KEY `placa_carro` (`placa_carro`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`cod_usuario`),
  ADD UNIQUE KEY `ci_usuario` (`ci_usuario`),
  ADD UNIQUE KEY `correo_usuario` (`correo_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carros`
--
ALTER TABLE `carros`
  MODIFY `cod_carro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `cod_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
