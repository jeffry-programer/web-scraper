-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-04-2023 a las 01:16:31
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `comparador`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(10) NOT NULL,
  `pesoVolumen_idpesoVolumen` int(10) NOT NULL,
  `Marca_idMarca` int(10) NOT NULL,
  `tipoProducto_idtipoProducto` int(10) NOT NULL,
  `subCategoria_idsubCategoria` int(10) NOT NULL,
  `Nombre` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Referencia` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Descripcion` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FotoPrincipal` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detalles` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contadorVisitas` int(20) DEFAULT NULL,
  `contadorVentas` int(20) DEFAULT NULL,
  `linkProducto` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`Nombre`) VALUES
('Cereal original ALL BRAN 400 Gramo'),
('Spaghetti BARILLA MARCA EXCLUSIVA 500 gr'),
('Penne Rigate BARILLA MARCA EXCLUSIVA 500 gr'),
('Pasta Fusilli BARILLA MARCA EXCLUSIVA 500 gr'),
('Pasta Farfalle BARILLA MARCA EXCLUSIVA 500 gr'),
('Arroz premium castellanos bolsa x 2500 gr'),
('Arroz Premuim CASTELLANO 1000 gr'),
('Arroz Premium castellanos integral x 1000 gr'),
('Cereal Arroz Chocolate CHOCO KRISPIS 410 gr'),
('Cereal Arroz Chocolate CHOCO KRISPIS 630 gr'),
('Cereal CHOCO KRISPIS 370 Gramo'),
('Fideo Clasica COMARRICO 454 gr'),
('Spaguetti Vermicelli 1000 gr'),
('Pasta Penne Rigate 500 gr'),
('Cereal CORN FLAKES 500 Gramo'),
('Cereal Sin Gluten CORN FLAKES 405 Gramo'),
('Arroz Vitamor 3k DIANA 3000g'),
('Arroz Vitamor DIANA 5000g'),
('Arroz Blanco Arroba DIANA 12500g'),
('Arroz DIANA 1000g'),
('Arroz Premium DIANA 1000g'),
('Arroz Premium DIANA 2500g'),
('Arroz Premium DIANA 4000g'),
('Arroz blanco Diana x 500 gr DIANA 500 gr'),
('Arroz Integral DIANA 1000g'),
('Arroz Premium Coco DIANA 500g'),
('Arroz Parbolizado X 1kg'),
('Arroz Parborizado DONA PEPA 3000 gr'),
('Pasta Clasica Spaghetti X 1000 gr'),
('Pasta Clasica Spaghetti X 250 gr'),
('Pasta Cor/Nte Cabello De Angel DORIA 250 gr'),
('Pasta Clasica Tornillos X 250 gr'),
('Pasta Concha DORIA 500 gr'),
('Pasta Clasica Macarron X 250 gr'),
('Pasta Corriente Fideos DORIA 500 gr'),
('Pasta Clasica Spaghetti X 500 gr'),
('Macarrones Con Salsa De Queso Caja x 210 gr'),
('Pasta Clasica Tallarin X 250 gr'),
('Pasta Corriente Letras DORIA 250 gr'),
('Pasta Corriente Conchitas DORIA 250 gr'),
('Pasta Clasica Fideo X 250 gr'),
('Spaghetti Doria Sin Gluten X 250 gr'),
('Pasta Tornillos De Verduras X 250 gr'),
('Cabello De Angel DORIA 500 gr'),
('Lasagna Precocida'),
('Ravioli De Carne'),
('GRANOLA EKONO 400 Gramo'),
('Arroba De Arroz Blanco X 25 Libras De 454 Gr C.u'),
('Frijol Cargamanto Rojo EKONO 454 gr'),
('Arroz Blanco Exito 3000 gr'),
('Arroz Blanco Bolsa X 5000 gr'),
('Granola Coco Exito x 500 gr'),
('Arroz Blanco Arroba Exito X 12500 gr'),
('Arroz Especial exito X 500 gr'),
('Granola Vainilla Exito'),
('ARROZ PREMIUM ALTO RENDIMIENTO FEDERAL 2500 Gramo'),
('ARROZ EXTRA GOURMET FEDERAL 2500 Gramo'),
('Cereal original FITNESS 570 gr'),
('Arroz Blanco FLOR HUILA 5000 gr'),
('Arroz Blanco FLOR HUILA 3000 gr'),
('Lenteja FRESCAMPO 500 gr'),
('Lenteja FRESCAMPO 1000 gr'),
('Frijol Bola Roja FRESCAMPO 500 gr'),
('Frijol Zaragoza FRESCAMPO 500 gr'),
('Frijol Bola Roja FRESCAMPO 1000 gr'),
('Garbanzo FRESCAMPO 500 gr'),
('Maiz Pira FRESCAMPO 500 gr'),
('Frijol Cargamanto Rosado FRESCAMPO 500 gr'),
('Frijol Cargamanto Blanco FRESCAMPO 500 gr'),
('Arveja Verde FRESCAMPO 500 gr'),
('Frijol Caraota FRESCAMPO 500 gr'),
('Pasta Espagueti'),
('Garbanzo FRESCAMPO 1000 gr'),
('Pasta Fideos'),
('Frijol Cabeza Negra FRESCAMPO 500 gr'),
('Arveja Verde 1 kg'),
('Frijol Nima FRESCAMPO 500 gr'),
('Maiz Trillado Blanco X 1000 gr'),
('Frijol Blanquillo FRESCAMPO 500 gr'),
('PASTA FIDEOS FRESCAMPO 250 Gramo'),
('Maiz Pira X 1000 gr'),
('Arroz Blanco FRESCAMPO 1000 gr'),
('Pasta Espagueti'),
('Pasta Macarron'),
('Pasta conchas 400 gr'),
('Frijol Zaragoza FRESCAMPO 1000 gr'),
('CEREAL EN AROS FRUTAL FROOT LOOPS 450 gr'),
('Cereal infantil FROOT LOOPS 210 Gramo'),
('Pasta Spaguetti x 1000 gr'),
('Pasta Conchas LA MUNECA 250 gr'),
('Spaguetti LA MUNECA 500 gr'),
('Pasta Espaguetti LA MUNECA 250 gr'),
('PASTA PARA LASAGNA LA MUNECA 400 gr'),
('PASTA CABELLO DE ANGEL LA MUNECA 500 gr'),
('Bicarbonato De Cocina MAXSODA 500 gr'),
('CEREAL MILO 500 gr'),
('Cereal bolsa MILO 200 gr'),
('Pasta Penne Rigate Monticello Bolsa x 500 g'),
('Pasta Premium Spaghetti X 500 gr'),
('Pasta Premium Fusilli X 500 gr'),
('Cereal original ALL BRAN 400 Gramo'),
('Cereal CHOCO KRISPIS 370 Gramo'),
('Cereal Arroz Chocolate CHOCO KRISPIS 630 gr'),
('Cereal CORN FLAKES 500 Gramo'),
('Cereal Sin Gluten CORN FLAKES 405 Gramo'),
('GRANOLA EKONO 400 Gramo'),
('Cereal infantil FROOT LOOPS 210 Gramo'),
('Cereal bolsa MILO 200 gr'),
('Ravioli De Carne');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `Producto_FKIndex2` (`subCategoria_idsubCategoria`),
  ADD KEY `Producto_FKIndex4` (`tipoProducto_idtipoProducto`),
  ADD KEY `Producto_FKIndex5` (`Marca_idMarca`),
  ADD KEY `Producto_FKIndex6` (`pesoVolumen_idpesoVolumen`);
ALTER TABLE `producto` ADD FULLTEXT KEY `Nombre` (`Nombre`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6248;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
