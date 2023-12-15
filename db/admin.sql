-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-12-2023 a las 12:41:18
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `admin`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `amount` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`id`, `name`, `amount`, `price`, `id_supplier`) VALUES
(1, 'HP 240 G8 ', 80, 2769000, 2),
(2, 'Asus Ryzen', 77, 2660000, 5),
(3, 'Lenovo Dual Core', 94, 1392600, 4),
(4, 'Dell inspiron 3520', 20, 2590900, 1),
(5, 'MacBook Air', 73, 3950000, 1),
(6, 'Lenovo ThinkPad', 89, 3899900, 3),
(7, 'ASUS ROG', 20, 30443900, 5),
(8, 'Asus X51', 76, 1349000, 5),
(9, 'All In One HP', 63, 1799000, 2),
(10, 'Dell Inspiron 15', 20, 2769900, 1),
(11, 'HP Pavilion x360', 90, 4060000, 2),
(12, 'HP Intel Core 1255U', 15, 4195456, 2),
(13, 'HP victus', 23, 3299900, 2),
(14, 'HP 245 G9 ', 97, 1559900, 2),
(15, 'Lenovo IdeaCentre ', 58, 1959901, 4),
(16, 'Asus Vivobook', 100, 3799900, 5),
(17, 'MacBook Pro', 38, 5218400, 3),
(18, 'Lenovo IdeadPad', 61, 1799400, 4),
(19, 'Notebook Dell 3501', 60, 2090000, 1),
(20, 'Dell vostro 3490', 62, 2790000, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sales`
--

INSERT INTO `sales` (`id`, `id_product`, `amount`, `date`) VALUES
(1, 1, 44, '2023-12-15'),
(2, 2, 37, '2023-12-15'),
(3, 3, 88, '2023-12-15'),
(4, 4, 12, '2023-12-15'),
(5, 5, 52, '2023-12-15'),
(6, 6, 71, '2023-12-15'),
(7, 7, 5, '2023-12-15'),
(8, 8, 16, '2023-12-15'),
(9, 9, 63, '2023-12-15'),
(10, 10, 19, '2023-12-15'),
(11, 11, 83, '2023-12-15'),
(12, 12, 15, '2023-12-15'),
(13, 13, 11, '2023-12-15'),
(14, 14, 86, '2023-12-15'),
(15, 15, 46, '2023-12-15'),
(16, 16, 82, '2023-12-15'),
(17, 17, 21, '2023-12-15'),
(18, 18, 29, '2023-12-15'),
(19, 19, 28, '2023-12-15'),
(20, 20, 52, '2023-12-15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `brand` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `supplier`
--

INSERT INTO `supplier` (`id`, `name`, `brand`) VALUES
(1, 'Dell Inc.', 'Dell'),
(2, 'HP Inc.', 'HP'),
(3, 'Apple Inc.', 'Apple'),
(4, 'Lenovo Group Limited', 'Lenovo'),
(5, 'Asus Inc.', 'Asus');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Indices de la tabla `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`);

--
-- Indices de la tabla `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id`);

--
-- Filtros para la tabla `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
