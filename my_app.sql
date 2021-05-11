-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 10-05-2021 a las 21:25:40
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `my_app`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
CREATE TABLE `restaurants` (
  `id_restaurant` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `kind_food` set('Catalán','Mexicano','Vegetariano','Mediterráneo','Chino','Japonés','Coreano','Americano','Brasería','Alemán','Saludable','Sushi','Kebap','Asiático','Casero','Vegano','Latinoamericano','Italiano') NOT NULL,
  `photo` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `restaurants`
--

INSERT INTO `restaurants` (`id_restaurant`, `name`, `address`, `lat`, `lng`, `kind_food`, `photo`) VALUES
(1, 'La Patsa Lab', 'Carrer de Casanova, 94, 08011 Barcelona', 41.38707389461881, 2.1574234216480668, 'Italiano', 'LaPatsaLab.jpg'),
(2, 'Out of China', 'Carrer d\'Aribau, 112, 08036 Barcelona', 41.39070660441379, 2.1572142155616807, 'Chino', 'OutOfChina.jpg'),
(3, 'Tequila Cantina Mexicana', 'Carrer de Bilbao 13 08005 Barcelona', 41.400864, 2.20624, 'Mexicano', 'TequilaCantinaMexicana.jpg'),
(4, 'Obon', 'Plaça de Maragall 13 08027 Barcelona', 41.42063, 2.181085, 'Mexicano,Vegetariano,Mediterráneo', 'Obon.jpg'),
(5, 'Restaurant L\'Ona', 'Carretera Km. 638.5, N-II', 41.491767, 2.368998, 'Vegetariano,Mediterráneo', 'RestaurantLOna.jpg'),
(6, 'Pura Brasa Rambla Catalunya', 'Rambla de Catalunya, 13, 08007 Barcelona', 41.38804567693486, 2.1678208490240816, '', 'PuraBrasaRamblaCatalunya.jpg'),
(7, 'Restaurante Peruano Paradise', 'Av. de Roma, 101, 08029 Barcelona', 41.384638545919636, 2.1522114380082935, 'Latinoamericano', 'RestaurantePeruanoParadise.jpg'),
(8, 'Restaurante mi Tierra Urgell', 'Carrer del Comte d\'Urgell, 76, 08011 Barcelona', 41.38286754177503, 2.158498535769257, 'Latinoamericano', 'RestauranteMiTierraUrgell.jpg'),
(9, 'Restaurante la Limeñita', 'Carrer de Provença, 61, 08029 Barcelona', 41.384787819388634, 2.148400470523462, 'Latinoamericano', 'RestauranteLaLimenita.jpg'),
(10, 'Restaurant Corea', 'Ronda de Sant Pere, 25, 08010 Barcelona', 41.39010005323988, 2.1757053325962876, 'Coreano', 'RestaurantCorea.jpg'),
(11, 'Veggie Garden', 'Gran Via de les Corts Catalanes, 602, 08007 Barcelona, B', 41.387137771538974, 2.1667360256122783, 'Vegano', 'VeggieGarden.jpg'),
(12, 'Hummus Barcelona', 'Carrer de València, 227, 08007 Barcelona', 41.39145211273897, 2.16238011832407, 'Vegetariano,Asiático,Vegano', 'HummusBarcelona.jpg'),
(16, 'JaponJi', 'Carrer de les Jonqueres, 4, 08003 Barcelona', 41.38823885977767, 2.174343981275683, 'Japonés', 'JaponJi.jpg'),
(17, 'Restaurante Tokyo Sushi', 'Carrer Comtal, 20, 08002 Barcelona', 41.386886567551024, 2.17421523524746, 'Japonés,Sushi', 'RestauranteTokyoSushi.jpg'),
(18, 'Restaurante de El Corte Inglés', 'Avda, Avinguda del Portal de l\'Àngel, 19-21, 08002 Barcelona', 41.38588167162475, 2.172989482336116, '', 'RestauranteDelCorteIngles.jpg'),
(19, 'Restaurante Les Delícies', 'Gran Via de les Corts Catalanes, 644, 08007 Barcelona, B', 41.390276586494984, 2.1701677985302945, 'Catalán', 'RestauranteLesDelicies.jpg'),
(20, 'Bar APZ', 'Carrer d\'Estruc, 32, 08002 Barcelona', 41.38731447872952, 2.1726247019819462, 'Casero', 'BarAPZ.jpg'),
(21, 'Hard Rock Cafe', 'Pl. de Catalunya, 21, 08002 Barcelona', 41.38603461319411, 2.1711119360462616, 'Americano', 'HardRockCafe.jpg'),
(22, 'The Ranch Smokehouse', 'Ronda de la Universitat, 20, 08007 Barcelona', 41.3870391814889, 2.168091237451813, 'Americano', 'TheRanchSmokehouse.jpg'),
(23, 'Restaurante Alt Heidelberg', 'Ronda de la Universitat, 5, 08007 Barcelona', 41.38645257710772, 2.1656846254120703, 'Alemán', 'RestauranteAltHeidelberg.jpg'),
(24, 'Rainbow Buffet Libre', 'Carrer de Casanova, 42, 08011 Barcelona', 41.384476395789406, 2.1607560663516887, 'Sushi', 'RainbowBuffetLibre.jpg'),
(25, 'Restaurant Macrobiòtic Zen', 'Carrer de Muntaner, 12, 08011 Barcelona', 41.38450859474549, 2.1630842237934704, 'Vegetariano', 'RestaurantMacrobioticZen.jpg'),
(26, 'Gelida', 'Carrer de la Diputació, 133, 08015 Barcelona', 41.38305107295075, 2.1574254333059613, 'Catalán', 'Gelida.jpg'),
(27, 'Juice Dudes', 'Ronda de la Universitat, 1, 08007 Barcelona', 41.38632730669127, 2.1653325855204284, 'Saludable', 'JuiceDudes.jpg'),
(28, 'Gonzalez & Co', 'C. del Consell de Cent, 297, 08007 Barcelona', 41.38885681651673, 2.162572592410033, 'Mexicano', 'GonzalezCo.jpg'),
(29, 'Flamant', 'Carrer d\'Enric Granados, 23, 08007 Barcelona', 41.38861534011998, 2.161821573912074, 'Mediterráneo', 'Flamant.jpg'),
(30, 'Restaurante Santa Anna', 'Carrer de Santa Anna, 8, 08002 Barcelona', 41.385296953665375, 2.1726556182728864, 'Mediterráneo', 'RestauranteSantaAnna.jpg'),
(31, 'Pure Cuisine - El Triangle', 'C. de Pelai, 13, 08001 Barcelona', 41.3860551320221, 2.169506102595996, 'Asiático', 'PureCuisineElTriangle.jpg'),
(32, 'El Jardín del Edén', 'Carrer de Jovellanos, 3, 08001 Barcelona', 41.38549166142136, 2.168948203140354, '', 'ElJardinDelEden.jpg'),
(33, 'Bismilla Kebap', 'Carrer de Joaquín Costa, 22, 08001 Barcelona', 41.38229789820947, 2.1675708888052254, 'Kebap', 'BismillaKebap.jpg'),
(44, 'Rosa Negra Raval', 'Carrer dels Àngels, 6, 08001 Barcelona', 41.3822707294171, 2.1697126327088476, 'Mexicano', 'RosaNegraRaval.jpg'),
(45, 'Restaurant La Boqueria', 'Carrer de la Boqueria, 17, 08002 Barcelona', 41.38164081279209, 2.175142764852773, 'Mediterráneo', 'RestaurantLaBoqueria.jpg'),
(46, 'Bistrot Bilou', 'Carrer de Pau Claris, 85, 08010 Barcelona', 41.38999023439286, 2.171010821969746, '', 'BistrotBilou.jpg'),
(47, 'Casa Carmen Passeig de Gracia', 'Carrer de Casp, 17, 08010 Barcelona', 41.38932568063708, 2.171177118909956, 'Mediterráneo', 'CasaCarmenPasseigDeGracia.jpg'),
(48, 'RAO Restaurant', 'Carrer de les Sitges, 3, 08001 Barcelona', 41.38441551959821, 2.1704797446226234, 'Catalán', 'RAORestaurant.jpg'),
(49, 'Majide', 'Carrer dels Tallers, 48, 08001 Barcelona', 41.38505446522564, 2.168128117822023, 'Japonés', 'Majide.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id_restaurant`),
  ADD UNIQUE KEY `name` (`name`,`address`),
  ADD UNIQUE KEY `lat` (`lat`,`lng`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id_restaurant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
