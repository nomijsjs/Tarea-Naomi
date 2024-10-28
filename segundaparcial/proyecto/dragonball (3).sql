-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-10-2024 a las 16:38:58
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
-- Base de datos: `dragonball`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `characters`
--

CREATE TABLE `characters` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `race` enum('Saiyan','Namek','Humano','Freezer Race','Majin') DEFAULT NULL,
  `level` int(11) DEFAULT 1,
  `strength` int(11) DEFAULT 50,
  `speed` int(11) DEFAULT 50,
  `endurance` int(11) DEFAULT 50,
  `experience` int(11) DEFAULT 0,
  `avatar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `characters`
--

INSERT INTO `characters` (`id`, `user_id`, `name`, `race`, `level`, `strength`, `speed`, `endurance`, `experience`, `avatar`) VALUES
(1, 1, 'AKANE', 'Saiyan', 63, 220, 237, 232, 0, 'Avatar5.jpeg'),
(2, 1, 'NAMI', 'Freezer Race', 14, 87, 95, 87, 0, 'Avatar1.jpeg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `character_transformations`
--

CREATE TABLE `character_transformations` (
  `id` int(11) NOT NULL,
  `character_id` int(11) DEFAULT NULL,
  `transformation_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `create_tournament`
--

CREATE TABLE `create_tournament` (
  `id_torneo` int(11) NOT NULL,
  `id_jugadores` varchar(35) NOT NULL,
  `lista_torneo` varchar(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tournaments`
--

CREATE TABLE `tournaments` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `winner_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tournament_participants`
--

CREATE TABLE `tournament_participants` (
  `id` int(11) NOT NULL,
  `tournament_id` int(11) DEFAULT NULL,
  `character_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transformations`
--

CREATE TABLE `transformations` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `level_required` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `avatar` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `avatar`) VALUES
(1, 'NAOMI', 'NAOGG@GMAIL.COM', '$2y$10$OvEOenwlKGLfCfpRyLyZHe8Gx34GZMRulGL39RY1K8IALoLK1Ljd6', 'Avatar4.jpeg'),
(2, 'tilini', 'papure@gmail.com', '$2y$10$lYHHRx5jXtRd8gFjE.aXW.r7h9afi3xyDmuPccxLtclb7dOdRsxIW', 'Avatar1.png'),
(3, 'NAOMI', 'NAO@GMAIL.COM', '$2y$10$LLk56Rv3vriMuC.R6/6xQeMybfiGhAWsvl2pPx.FAPZ8QVLmpSMgW', 'Avatar10.png'),
(4, 'nami', 'nami@gmail.com', '$2y$10$xNay7AVveZoCN99gcegNLupXJkZ5iYfNg5uh/A5NS9iDmCBAvmIJy', 'Avatar8.jpeg'),
(5, 'val', 'val@gmail.com', '$2y$10$oj5N8KcN6a2tftFjT8XxLu9sj2VHb/357Aiw9a4Zt2SJjVSytnXTO', 'Avatar8.png');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `character_transformations`
--
ALTER TABLE `character_transformations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `character_id` (`character_id`),
  ADD KEY `transformation_id` (`transformation_id`);

--
-- Indices de la tabla `create_tournament`
--
ALTER TABLE `create_tournament`
  ADD PRIMARY KEY (`id_torneo`);

--
-- Indices de la tabla `tournaments`
--
ALTER TABLE `tournaments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `winner_id` (`winner_id`);

--
-- Indices de la tabla `tournament_participants`
--
ALTER TABLE `tournament_participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tournament_id` (`tournament_id`),
  ADD KEY `character_id` (`character_id`);

--
-- Indices de la tabla `transformations`
--
ALTER TABLE `transformations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `characters`
--
ALTER TABLE `characters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `character_transformations`
--
ALTER TABLE `character_transformations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tournaments`
--
ALTER TABLE `tournaments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tournament_participants`
--
ALTER TABLE `tournament_participants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `transformations`
--
ALTER TABLE `transformations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `characters`
--
ALTER TABLE `characters`
  ADD CONSTRAINT `characters_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `character_transformations`
--
ALTER TABLE `character_transformations`
  ADD CONSTRAINT `character_transformations_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `characters` (`id`),
  ADD CONSTRAINT `character_transformations_ibfk_2` FOREIGN KEY (`transformation_id`) REFERENCES `transformations` (`id`);

--
-- Filtros para la tabla `tournaments`
--
ALTER TABLE `tournaments`
  ADD CONSTRAINT `tournaments_ibfk_1` FOREIGN KEY (`winner_id`) REFERENCES `characters` (`id`);

--
-- Filtros para la tabla `tournament_participants`
--
ALTER TABLE `tournament_participants`
  ADD CONSTRAINT `tournament_participants_ibfk_1` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`id`),
  ADD CONSTRAINT `tournament_participants_ibfk_2` FOREIGN KEY (`character_id`) REFERENCES `characters` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
