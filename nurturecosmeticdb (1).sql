-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 05, 2021 at 09:40 AM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nurturecosmeticdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phoneNumber` int(11) DEFAULT NULL,
  `birthDate` datetime DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `verified` tinyint(4) NOT NULL DEFAULT '0',
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sexe` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_de87485f6489f5d0995f584195` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `firstName`, `lastName`, `email`, `phoneNumber`, `birthDate`, `password`, `verified`, `createdAt`, `updatedAt`, `role`, `sexe`) VALUES
(1, 'Sadok', 'Laouissi', 'Sadok.laouissi.sl@gmail.com', 22525791, NULL, '$2a$08$dS3TdjjtBz8hDPIYaFM5NuVzknIqz1Avx.oDhluiUwRzBfVZ6xYma', 0, '2021-06-09 11:34:56.489978', '2021-07-13 09:59:32.084196', 'ADMIN', 'Homme');

-- --------------------------------------------------------

--
-- Table structure for table `allergy`
--

DROP TABLE IF EXISTS `allergy`;
CREATE TABLE IF NOT EXISTS `allergy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AllergyName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `clientId` int(11) DEFAULT NULL,
  `Image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2938ccfb01aafc7a4cb873733d6` (`clientId`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `allergy`
--

INSERT INTO `allergy` (`id`, `AllergyName`, `clientId`, `Image`) VALUES
(30, 'Antioxydants', NULL, 'antioxydants.png'),
(31, 'Biocides', NULL, 'biocides.png'),
(32, 'Glycérines', NULL, 'glycerine.png'),
(33, 'Honey', NULL, 'honey.png'),
(34, 'Sheep', NULL, 'sheep.png'),
(35, 'Ultra-violet', NULL, 'uv.png'),
(44, 'Fragrences', NULL, 'image_2021-09-26_180245.png'),
(45, 'Fragrences', 1, 'image_2021-09-26_180245.png');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_ca5ac91f23ecb0530eaeb5dcd9` (`CategoryName`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `CategoryName`, `Image`) VALUES
(6, 'Nettoyant', 'foam.png'),
(7, 'Gommages & Exfoliants', 'scrub.png'),
(9, 'Masques', 'facial-mask.png'),
(10, 'Gamme anti-âge', 'anti-age.png'),
(11, 'Hydratant', 'cream.png'),
(12, 'Solaires et Après soleil', 'sun-cream.png'),
(13, 'Soins lèvres', 'mouth.png'),
(14, 'Bain et Douche', 'shampoo.png'),
(15, 'Hygiène', 'safe.png'),
(16, 'Mains', 'washing-hands.png'),
(17, 'Après Shampoing', 'hair-conditioner.png'),
(18, 'Huiles', 'essential-oil.png'),
(19, 'Shampoings', 'shampoo.png');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phoneNumber` int(11) DEFAULT NULL,
  `birthDate` datetime DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `verified` tinyint(4) NOT NULL DEFAULT '0',
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sexe` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `requestCode` int(11) DEFAULT NULL,
  `requestCodeEndDate` datetime DEFAULT NULL,
  `notificationToken` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_6436cc6b79593760b9ef921ef1` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `firstName`, `lastName`, `email`, `phoneNumber`, `birthDate`, `password`, `verified`, `createdAt`, `updatedAt`, `role`, `sexe`, `requestCode`, `requestCodeEndDate`, `notificationToken`) VALUES
(1, 'Sadok', 'Laouissi', 'Sadok.laouissi@esprit.tn', 55535858, '2021-08-20 00:00:00', '$2a$08$RUpetS5xIhE4j0Vflp4gKOdexHgAlfy4eex2VzAlAhsbUxfOdBMTK', 1, '2021-06-08 16:07:59.597393', '2021-08-20 17:09:41.000000', 'CLIENT', 'HOMME', NULL, '2021-06-08 17:57:40', '7996'),
(4, 'Khawla', 'Afli', 'Sadok@esprit.tn', 22525791, '1996-09-19 00:00:00', '$2a$08$oLASs.UAglmugE7gdvpRIuK/J9t0OR5zXAnGbLWrTN08.dfLNlZx6', 0, '2021-07-13 10:10:32.851046', '2021-09-26 17:46:18.681650', 'CLIENT', 'HOMME', NULL, NULL, NULL),
(44, 'Souhir', 'Kbaier', 'sadok.sl@gmail.com', 55555555, '2021-05-03 00:00:00', '$2a$08$88wZUAXs7bu0nP/z9UgKNumZBf7.l4BwFoqo.xljYxH.vQrjec6jq', 1, '2021-08-22 08:22:02.046796', '2021-09-26 17:46:28.899786', 'CLIENT', 'HOMME', NULL, '2021-08-22 09:23:13', NULL),
(45, 'Nabil', 'Laouissi', 'sadoksadok@sadok.tn', 55535858, '2021-08-02 00:00:00', '$2a$08$SGmvtHSR3bP0b.Ne6XKsyurGSaI8vNlhmdseXZjx0QDybrp72QPQG', 1, '2021-08-22 08:31:21.002936', '2021-09-26 17:46:42.227746', 'CLIENT', 'HOMME', NULL, '2021-08-22 09:31:34', NULL),
(46, 'Aymen', 'Touihri', 'sadok@espriiiiit.tn', 55555555, '2016-08-01 00:00:00', '$2a$08$2bNtH2BGPHqqT4oGEwf1C..mhDb0NTE7iemkbg1NyYYmwg8TEw3NK', 1, '2021-08-22 08:36:26.480031', '2021-09-26 17:46:56.117768', 'CLIENT', 'HOMME', NULL, '2021-08-22 09:36:32', NULL),
(47, 'sadyo', 'sadyo', 'sad.laouissi@esprit.tn', 55535855, '1996-09-19 00:00:00', '$2a$08$zEjrVUPsYINeJSS40pV9Ie8LGVkYE3OyP6Vk44c45JKCVT1BQUm3C', 0, '2021-09-29 01:21:59.270749', '2021-09-29 01:22:09.000000', 'CLIENT', 'HOMME', 3012, '2021-09-29 02:22:09', NULL),
(48, 'sady', 'sady', 'sad.laouissi@es.tn', 55535858, '2013-08-13 00:00:00', '$2a$08$lbbSXa08xJLtwHwA9.i4Su.eCO.PfguiVoGnOJC2XhxpnJlwQeuse', 0, '2021-09-29 01:24:02.336423', '2021-09-29 01:24:20.000000', 'CLIENT', 'HOMME', 5649, '2021-09-29 02:24:20', NULL),
(49, 'sadsad', 'sadsad', 'sadsad@esprit.tn', 55555555, '1998-09-15 00:00:00', '$2a$08$kC2JUCk/puvuQFMTmOOt3exv7.0rMVP/5XHZNq4AwZSpY4v4aINxO', 1, '2021-09-29 01:25:33.098966', '2021-09-29 01:25:49.000000', 'CLIENT', 'HOMME', NULL, '2021-09-29 02:25:39', NULL),
(51, 'Sadok', 'Laouissi', 'Sadok.laouissi.s@esprit.tn', 55535858, '1996-09-19 00:00:00', '$2a$08$NdE8zLwkariTsICuTH.xz.y7IQtLHwWf6tH/3B1sItK.KPPDoZpjW', 1, '2021-09-29 01:29:51.471937', '2021-09-29 01:30:17.000000', 'CLIENT', 'HOMME', NULL, '2021-09-29 02:30:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client_favoris`
--

DROP TABLE IF EXISTS `client_favoris`;
CREATE TABLE IF NOT EXISTS `client_favoris` (
  `clientId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  PRIMARY KEY (`clientId`,`productId`),
  KEY `IDX_bdc7e8edd75a40badfd0926801` (`clientId`),
  KEY `IDX_3c8830d36dbad089cfce5e4733` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `client_favoris`
--

INSERT INTO `client_favoris` (`clientId`, `productId`) VALUES
(1, 101);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `clientId` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rate` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_e99f8e5bcbccaec7b0b7ed65526` (`clientId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `message`, `date`, `clientId`, `type`, `rate`, `status`) VALUES
(1, 'Ajouter QR Code', '2021-07-13 11:40:40.680558', 1, 'Suggestion', 10, 'PENDING\r\n'),
(2, 'Application crashe', '2021-07-13 11:40:40.680558', 4, 'Bug', 10, 'RESOLVED'),
(3, 'Ajouter d\'autres marques', '2021-09-05 11:22:12.000000', 1, 'Autre', 10, 'DECLINED'),
(4, 'Liste Favoris ne marche pas', '2021-09-05 11:22:12.000000', 1, 'Bug', 2, 'RESOLVED'),
(5, 'App compliqué', '2021-09-05 11:22:12.000000', 1, 'Bug', 4, 'PENDING');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
CREATE TABLE IF NOT EXISTS `history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientId` int(11) DEFAULT NULL,
  `consultedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `consultedProductId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_82a25a3a3cca8f81d3ee504950e` (`clientId`),
  KEY `FK_91cbaf9b336a0ceeddeea41e18b` (`consultedProductId`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `clientId`, `consultedAt`, `consultedProductId`) VALUES
(27, 1, '2021-09-12 04:05:53.372126', 84),
(28, 1, '2021-09-16 02:29:13.486375', 84),
(29, 1, '2021-09-17 03:34:03.359028', 84),
(30, 1, '2021-09-18 09:06:06.440713', 84),
(31, 1, '2021-09-18 12:06:00.608947', 84),
(32, 1, '2021-09-18 12:47:55.327086', 84),
(33, 1, '2021-09-26 23:11:23.396589', 84),
(34, 1, '2021-09-26 23:11:45.299075', 101),
(35, 1, '2021-09-26 23:13:53.562792', 19),
(36, 1, '2021-09-26 23:16:54.273892', 101),
(37, 1, '2021-09-27 13:32:25.359986', 84),
(38, 1, '2021-09-27 13:32:27.837041', 101),
(39, 1, '2021-09-27 13:32:30.710787', 19),
(40, 1, '2021-09-27 16:02:22.602302', 19),
(41, 1, '2021-09-27 16:12:24.327897', 19),
(42, 1, '2021-09-27 16:12:26.196238', 84),
(43, 1, '2021-09-27 16:12:32.817552', 101),
(44, 1, '2021-09-28 00:40:38.385467', 19),
(45, 1, '2021-09-28 15:54:05.709417', 84),
(46, 1, '2021-09-28 15:55:20.729285', 101),
(47, 1, '2021-09-28 15:56:02.661715', 19),
(48, 1, '2021-09-28 16:16:39.488494', 19),
(49, 1, '2021-09-28 16:16:41.897290', 84),
(50, 1, '2021-09-28 16:27:56.571959', 19),
(51, 1, '2021-09-28 16:27:58.715049', 84),
(52, 1, '2021-09-28 16:28:00.466517', 101),
(53, 1, '2021-09-28 16:33:03.660452', 19),
(54, 1, '2021-09-28 16:33:10.828644', 101),
(55, 1, '2021-09-28 20:44:15.203091', 84),
(56, 1, '2021-09-28 20:58:14.887096', 101),
(57, 1, '2021-09-28 20:58:22.010761', 84),
(58, 1, '2021-09-28 22:39:32.351415', 84),
(59, 1, '2021-09-28 22:44:45.012353', 84),
(60, 1, '2021-09-28 22:45:10.414400', 31),
(61, 1, '2021-09-29 01:19:48.105142', 84),
(62, 1, '2021-09-29 01:19:54.872289', 101),
(63, 1, '2021-09-29 01:31:04.337548', 84),
(64, 1, '2021-09-29 01:31:23.213354', 101),
(65, 1, '2021-09-29 14:17:59.345149', 19);

-- --------------------------------------------------------

--
-- Table structure for table `history_consulted`
--

DROP TABLE IF EXISTS `history_consulted`;
CREATE TABLE IF NOT EXISTS `history_consulted` (
  `historyId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  PRIMARY KEY (`historyId`,`productId`),
  KEY `IDX_eff96273d9ff6d25bb8ecf55e6` (`historyId`),
  KEY `IDX_aa6b562581938f6877f0da9ed0` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
CREATE TABLE IF NOT EXISTS `ingredient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `IngredientName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `IngredientType` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_2991db847769730f3ec8355ad7` (`IngredientName`)
) ENGINE=InnoDB AUTO_INCREMENT=64240 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ingredient`
--

INSERT INTO `ingredient` (`id`, `IngredientName`, `IngredientType`) VALUES
(63540, 'Tartrate de Coco-Glucoside de Sodium', 'NORMAL'),
(63541, 'Glutamate de Cocoyle Disodique', 'NORMAL'),
(63542, 'Distearate PEG-150', 'NORMAL'),
(63543, 'Sorbitol', 'NORMAL'),
(63544, 'Amide de Colza PEG-4', 'NORMAL'),
(63545, 'Polysorbate 20', 'NORMAL'),
(63546, 'Extrait de Fruit de Citrus Aurantifolia (Citron Vert)', 'NORMAL'),
(63547, 'Extrait de Propolis', 'NORMAL'),
(63548, 'Huile d\'Écorce de Citrus Limon (Citron)*', 'NORMAL'),
(63549, 'Huile de Feuille de Melaleuca Alternifolia (Arbre à Thé)*', 'NORMAL'),
(63550, 'Huile de Fruit de Juniperus Communis (Genévrier)*', 'LOW'),
(63551, 'Glycérine', 'NORMAL'),
(63552, 'Bisabolol', 'NORMAL'),
(63553, 'Propanediol', 'NORMAL'),
(63554, 'Gluconate de Sodium', 'NORMAL'),
(63555, 'Glutamate de Sodium et de Cocoyle', 'NORMAL'),
(63556, 'Capryloyl Glycine', 'NORMAL'),
(63557, 'Allantoïne', 'LOW'),
(63558, 'Glycyrrhizates d\'Ammonium', 'LOW'),
(63559, 'Acide Déshydroacétique', 'NORMAL'),
(63560, 'Hydroxyde de Sodium', 'NORMAL'),
(63561, 'Parfum/Fragrance', 'LOW'),
(63562, 'Alcool Benzylique', 'NORMAL'),
(63563, 'Hexyl Cinnamal', 'LOW'),
(63565, 'Lauroyl Glutamate de Sodium', 'NORMAL'),
(63566, 'Lauryl Glucoside', 'NORMAL'),
(63567, 'Lauroamphoacétate de Sodium', 'NORMAL'),
(63568, 'Bétaïne de Cocamidopropyle', 'LOW'),
(63569, 'Almond Glycérides PEG-60', 'NORMAL'),
(63570, 'Methyl Glucose Dioleate PEG-120', 'NORMAL'),
(63571, 'Distéarate de Glycol', 'LOW'),
(63572, 'Extrait de Fleur de Lavandula Angustifolia (Lavande)*', 'NORMAL'),
(63573, 'Extrait de Feuille d\'Olea Europaea (Olive)', 'NORMAL'),
(63574, 'Extrait de Fruit* de Rosa Canina (Rose Sauvage)', 'NORMAL'),
(63575, 'Extrait d\'Écorce de Magnolia Officinalis (Magnolia)', 'NORMAL'),
(63576, 'Hydroxyacétophénone', 'NORMAL'),
(63577, 'Crosspolymère d\'Acrylates/d\'Alkyl Acrylate C10-30', 'NORMAL'),
(63578, 'Tetrasodium Glutamate Diacetate', 'NORMAL'),
(63579, 'Linalol', 'LOW'),
(63580, 'Citronellol', 'NORMAL'),
(63581, 'Hexyl Cinnamaldéhyde.', 'LOW'),
(63582, 'Alcool Cétéarylique', 'NORMAL'),
(63583, 'Palmitate d\'Éthylhexyle', 'NORMAL'),
(63584, 'Olus Oil/Vegetable Oil/Huile Végétale', 'NORMAL'),
(63585, 'Esters Cétyliques', 'NORMAL'),
(63586, 'Extrait de Fleur de Chamomilla Recutita (Camomille Sauvage)*', 'NORMAL'),
(63587, 'Mel/Honey/Miel', 'NORMAL'),
(63588, 'Huile de Graines d\'Helianthus Annuus (Tournesol)', 'NORMAL'),
(63589, 'Tocophérol', 'NORMAL'),
(63590, 'Oléate de Glycéryle', 'NORMAL'),
(63591, 'Diacétate de Glutamate de Tétrasodium', 'NORMAL'),
(63592, 'Crosspolymère d\'Acrylates/Alkyl Acrylate C10-30', 'NORMAL'),
(63593, 'Carbonate de Dicaprylyle', 'NORMAL'),
(63595, 'Betaïne', 'NORMAL'),
(63596, 'Citrate de Sodium', 'NORMAL'),
(63597, 'Polyglycéryl-6 Caprylate', 'NORMAL'),
(63599, 'Proline', 'NORMAL'),
(63600, 'Polyglyceryl-4 Caprate', 'NORMAL'),
(63601, 'Chlorure de Sodium', 'NORMAL'),
(63602, 'Aqua/Water/Eau', 'NORMAL'),
(63603, 'Crosspolymère Hydroxypropylsulfonate Laurylglucoside de Sodium', 'NORMAL'),
(63604, 'Coco-Betaïne', 'NORMAL'),
(63605, 'Taurate de sodium Méthyl Cocoyl', 'NORMAL'),
(63606, 'Polyacrylate Crosspolymère-6', 'NORMAL'),
(63607, 'Charbon en Poudre', 'NORMAL'),
(63608, 'Poudre de Chondrus Crispus/Carraghénane', 'NORMAL'),
(63609, 'Hydroxypropyl Cyclodextrine', 'NORMAL'),
(63610, 'o-Cymen-5-ol', 'NORMAL'),
(63612, 'Huile de Fruit d\'Olea Europaea (Olive)*', 'NORMAL'),
(63613, 'Palmitate Ethylhexylique', 'NORMAL'),
(63614, 'Huile de Graine d\'Helianthus Annuus (Tournesol)*', 'NORMAL'),
(63615, 'Cetyl Hydroxyéthylcellulose', 'NORMAL'),
(63616, 'Crosspolymère d\'Acrylates/C10-30 Alkyl Acrylate', 'NORMAL'),
(63617, 'Polyglyceryl-2 Dipolyhydroxystearate', 'NORMAL'),
(63618, 'Sodium Hydroxide', 'NORMAL'),
(63619, 'Benzyl Salicylate', 'HIGH'),
(63620, 'Glyceryl Stéarate', 'NORMAL'),
(63621, 'Disodium Cocoamphodiacetate', 'NORMAL'),
(63622, 'Acétate de Cellulose', 'NORMAL'),
(63623, 'Acide Polylactique', 'NORMAL'),
(63624, 'Silicate d\'Aluminium et de Magnésium', 'NORMAL'),
(63625, 'Cellulose Microcristalline', 'NORMAL'),
(63626, 'Fruit d\'Olea Europaea Fruit Oil (Olive)*', 'NORMAL'),
(63627, 'Graine d\'Olea Europaea (Olive) en poudre', 'NORMAL'),
(63628, 'Fleur/Feuille/Tige de Sideritis Perfoliata (Thé)*', 'NORMAL'),
(63629, 'Fleur/Feuille/Tige de Sideritis Scardica (Thé)*', 'NORMAL'),
(63630, 'Fleur/Feuille/Tige de Sideritis Raeseri (Thé)*', 'NORMAL'),
(63631, 'Huile de Lavandula Angustifolia (Lavande)*', 'NORMAL'),
(63632, 'Lécithine Hydrogénée', 'NORMAL'),
(63633, 'Phytate de Sodium', 'NORMAL'),
(63634, 'Gomme de Xanthane', 'NORMAL'),
(63635, 'Tocophéryl Acétate', 'NORMAL'),
(63636, 'Acide Salicylique', 'NORMAL'),
(63637, 'Menthol*', 'NORMAL'),
(63638, 'Triacétate de Panthényle', 'NORMAL'),
(63639, 'Acide Déhydroacétique', 'NORMAL'),
(63640, 'Hydroxypropylcellulose', 'NORMAL'),
(63641, 'Alcool', 'NORMAL'),
(63642, 'Hydroxycitronellal', 'NORMAL'),
(63643, 'Benzoate de Benzyle', 'NORMAL'),
(63645, 'PPG-26-Buteth-26', 'NORMAL'),
(63646, 'Huile de Ricin Hydrogénée PEG-40', 'NORMAL'),
(63647, 'Carbomer de Sodium', 'NORMAL'),
(63648, 'Extrait de Fruit de Prunus Armeniaca (Abricot)*', 'NORMAL'),
(63649, 'Poudre de Noyeau de Prunus Armeniaca (Abricot)', 'NORMAL'),
(63650, 'Talc', 'NORMAL'),
(63651, 'Huile de Fleur de Pelargonium Graveolens (Géranium Rosat)*', 'NORMAL'),
(63652, 'Extrait de Fruit de Cucumis Sativus (Concombre)', 'NORMAL'),
(63653, 'Esters de Jojoba', 'NORMAL'),
(63654, 'CI 73360/Rouge 30 Lake.', 'NORMAL'),
(63655, 'Triglycéride Caprylique/Caprique', 'NORMAL'),
(63656, 'Lactate d\'Alkyle en C12-13', 'NORMAL'),
(63657, 'Alcool Stéarylique', 'NORMAL'),
(63658, 'Stéarate de Glycéryle', 'NORMAL'),
(63659, 'Amidon de Pomme de Terre Modifié', 'NORMAL'),
(63660, 'Triheptanoïne', 'NORMAL'),
(63661, 'Esters de Cétyle', 'NORMAL'),
(63662, 'Extrait de Fruit de Vaccinium Myrtillus (Myrtille)', 'NORMAL'),
(63663, 'Extrait de Miel*', 'NORMAL'),
(63664, 'Extrait de Saccharum Officinarum (Canne à Sucre)', 'NORMAL'),
(63665, 'Poudre de Coquille de Prunus Amygdalus Dulcis (Amande Douce)', 'NORMAL'),
(63666, 'Huile de Fruit de Piper Nigrum (Poivre)', 'NORMAL'),
(63667, 'Extrait de Fruit de Citrus Limon (Citron)', 'NORMAL'),
(63668, 'Extrait de Fruit de Citrus Aurantium Dulcis (Orange)', 'NORMAL'),
(63669, 'Extrait d\'Acer Saccharum (Érable Argenté)', 'NORMAL'),
(63670, 'Arginine', 'NORMAL'),
(63671, 'Glycérides d\'Amandes PEG-60', 'NORMAL'),
(63672, 'Hydroxyéthylcellulose', 'NORMAL'),
(63673, 'Sorbate de Potassium', 'LOW'),
(63674, 'Méthylcrotonate de Citronellyle', 'NORMAL'),
(63675, 'Phénoxyéthanol', 'HIGH'),
(63676, 'Kaolin', 'NORMAL'),
(63677, 'C12-20 Acid PEG-8 Ester', 'NORMAL'),
(63678, 'Helianthus Annuus (Sunflower) Seed Oil', 'NORMAL'),
(63679, 'Magnesium Aluminum Silicate', 'NORMAL'),
(63680, 'Caprylic/Capric Triglyceride', 'NORMAL'),
(63681, 'Illite', 'NORMAL'),
(63682, 'CI 77891/Titanium Dioxide', 'HIGH'),
(63683, 'Isoamyl Laurate', 'NORMAL'),
(63684, 'Calendula Officinalis Flower* Extract', 'NORMAL'),
(63685, 'Rosa Centifolia Flower Extract', 'NORMAL'),
(63686, 'Chamomilla Recutita (Matricaria) Flower* Extract', 'NORMAL'),
(63687, 'Rosa Canina Fruit* Extract', 'NORMAL'),
(63688, 'Aloe Barbadensis Leaf Juice Powder*', 'NORMAL'),
(63689, 'PEG-40 Hydrogenated Castor Oil', 'NORMAL'),
(63690, 'Rosa Damascena Flower Oil*', 'NORMAL'),
(63691, 'Hydrolyzed Wheat Protein', 'NORMAL'),
(63692, 'Hydrolyzed Wheat Starch', 'NORMAL'),
(63693, 'Panthenol', 'NORMAL'),
(63694, 'Glycerin', 'NORMAL'),
(63695, 'Sodium Gluconate', 'NORMAL'),
(63696, 'Disteardimonium Hectorite', 'NORMAL'),
(63697, 'Propylene Carbonate', 'NORMAL'),
(63698, 'Xanthan Gum', 'NORMAL'),
(63699, 'Benzyl Benzoate', 'NORMAL'),
(63700, 'Amyl Cinnamal', 'NORMAL'),
(63701, 'Coumarin', 'NORMAL'),
(63702, 'Benzyl Alcohol', 'NORMAL'),
(63703, 'Amylcinnamyl Alcohol.', 'NORMAL'),
(63704, 'Lactobacillus/Pumpkin Ferment Extract', 'NORMAL'),
(63705, 'PEG-100 Stearate', 'NORMAL'),
(63706, 'Triheptanoin', 'NORMAL'),
(63707, 'Butyrospermum Parkii (Shea) Butter*', 'NORMAL'),
(63708, 'Sodium Acrylates Copolymer', 'NORMAL'),
(63709, 'Cucurbita Pepo (Pumpkin) Seed Oil*', 'NORMAL'),
(63710, 'Zingiber Officinale (Ginger) Root Oil*', 'NORMAL'),
(63711, 'Olea Europaea (Olive) Fruit Oil*', 'NORMAL'),
(63712, 'Lactobacillus Ferment', 'NORMAL'),
(63713, 'Sodium Hyaluronate', 'NORMAL'),
(63714, 'Lecithin', 'NORMAL'),
(63715, 'Hydrogenated Lecithin', 'NORMAL'),
(63716, 'Disodium EDTA', 'NORMAL'),
(63717, 'Mica', 'NORMAL'),
(63718, 'Citral', 'LOW'),
(63719, 'Citronellol.', 'NORMAL'),
(63720, 'Ester PEG-8 d\'Acide C12-20', 'NORMAL'),
(63721, 'Huile de Graine de Helianthus Annuus (Tournesol)', 'NORMAL'),
(63722, 'Olivate d\'Éthylhexyle Hydrogéné', 'NORMAL'),
(63723, 'Glycol de Pentylène', 'LOW'),
(63724, 'Poudre de Charbon', 'NORMAL'),
(63725, 'Extrait d\'Helichrysum Italicum (Immortelle d\'Italie)', 'NORMAL'),
(63726, 'Insaponifiables à l\'Huile d\'Olive Hydrogénée', 'NORMAL'),
(63727, 'Montmorillonite', 'NORMAL'),
(63728, 'Acétate de Tocophéryle', 'NORMAL'),
(63729, 'Carbonate de Propylène', 'NORMAL'),
(63731, 'Squalane', 'NORMAL'),
(63732, 'C13-15 Alkane', 'NORMAL'),
(63733, 'Simmondsia Chinensis (Jojoba) Seed Oil* Cucumis Sativus (Cucumber) Fruit Extract', 'NORMAL'),
(63734, 'Persea Gratissima (Avocado) Oil', 'NORMAL'),
(63735, 'Pelargonium Graveolens Flower Oil*', 'NORMAL'),
(63736, 'Helianthus Annuus (Sunflower) Seed Oil*', 'NORMAL'),
(63737, 'Allantoin', 'NORMAL'),
(63738, 'Sorbitan Oleate', 'NORMAL'),
(63739, 'Acrylates/C10-30 Alkyl Acrylate Crosspolymer', 'NORMAL'),
(63740, 'Citronellyl Methylcrotonate', 'NORMAL'),
(63741, 'Carbomer', 'NORMAL'),
(63742, 'Dehydroacetic Acid', 'NORMAL'),
(63743, 'CI 61570/Green 5', 'NORMAL'),
(63745, 'Hydrogenated Ethylhexyl Olivate', 'NORMAL'),
(63746, 'Simmondsia Chinensis (Jojoba) Seed Oil*', 'NORMAL'),
(63747, 'Triticum Vulgare (Wheat) Germ Oil', 'NORMAL'),
(63748, 'Citrus Aurantium Bergamia (Bergamot) Fruit Oil*', 'NORMAL'),
(63749, 'Hydrogenated Olive Oil Unsaponifiables', 'NORMAL'),
(63750, 'CI 19140/Yellow 5', 'LOW'),
(63751, 'CI 61570/Green 5.', 'NORMAL'),
(63752, 'Beurre de Butyrospermum Parkii (Karité)', 'NORMAL'),
(63753, 'Copolymère d\'Acrylates de Sodium', 'NORMAL'),
(63754, 'Protéines de Blé Hydrolysées', 'NORMAL'),
(63755, 'Hyaluronate de Sodium', 'NORMAL'),
(63756, 'Amidon de Blé Hydrolysé', 'NORMAL'),
(63757, 'Huile de Myrrha de Commiphora (Myrrhe)', 'NORMAL'),
(63758, 'Lécithine', 'NORMAL'),
(63759, 'Hydroxycitronellal.', 'NORMAL'),
(63760, 'Alcool Béhénylique', 'NORMAL'),
(63761, 'Laureth-9', 'NORMAL'),
(63762, 'Diheptanoate de Glycol Néopentylique', 'NORMAL'),
(63763, 'Stéarate', 'NORMAL'),
(63764, 'Alcool PEG-100', 'NORMAL'),
(63765, 'Alcool Arachidique', 'NORMAL'),
(63766, 'Huile de Germe de Triticum Vulgare (Blé)', 'NORMAL'),
(63767, 'Extrait de Tige d\'Opuntia Ficus-Indica (Figue de Barbarie)', 'NORMAL'),
(63768, 'Jus de Feuille d\'Aloe Barbadensis en Poudre*', 'NORMAL'),
(63769, 'Extrait de Fruit* Rosa Canina (Rose Sauvage)*', 'NORMAL'),
(63770, 'Phospholipides', 'NORMAL'),
(63771, 'Caprylyl Glycol', 'LOW'),
(63772, 'Gomme de Xanthan', 'NORMAL'),
(63773, 'Arachidyl Glucoside', 'NORMAL'),
(63774, 'Polydécène Hydrogéné', 'NORMAL'),
(63775, 'Acide Glycyrrhétinique', 'NORMAL'),
(63777, 'Arachidyl Alcohol', 'NORMAL'),
(63778, 'Extrait de Limonium Gerberi (Statice de Gerber)', 'NORMAL'),
(63779, 'Extrait de Calendula Officinalis Flower (Souci)*', 'NORMAL'),
(63780, 'Extrait de Fleur/Feuille/Tige de Sideritis Perfoliata (Thé)*', 'NORMAL'),
(63781, 'Polyglycéryl-10 Stéarate', 'NORMAL'),
(63782, 'Behenyl Alcohol', 'NORMAL'),
(63783, 'PEG-60 Almond Glycerides', 'NORMAL'),
(63784, 'Punica Granatum Fruit Extract', 'NORMAL'),
(63785, 'Citrus Aurantium Dulcis (Orange) Peel Oil*', 'NORMAL'),
(63786, 'Ascorbyl Palmitate', 'NORMAL'),
(63787, 'Phospholipids', 'NORMAL'),
(63788, 'Mannitol', 'NORMAL'),
(63789, 'Cellulose', 'NORMAL'),
(63790, 'Microcrystalline Cellulose', 'NORMAL'),
(63791, 'Hydroxypropyl Methylcellulose', 'NORMAL'),
(63792, 'Decyl Glucoside', 'NORMAL'),
(63793, 'Sodium Carbomer', 'NORMAL'),
(63794, 'Hydrogenated Polydecene', 'NORMAL'),
(63796, 'CI 77491/Iron Oxides', 'LOW'),
(63797, 'Niacinamide', 'NORMAL'),
(63798, 'Citrus Aurantium Dulcis (Orange) Flower Extract', 'NORMAL'),
(63799, 'Ascorbyl Tetraisopalmitate', 'NORMAL'),
(63800, 'Ubiquinone', 'NORMAL'),
(63801, 'CI 77492/Iron Oxides', 'LOW'),
(63802, 'Glycol Butylénique', 'LOW'),
(63803, 'Cocoglycérides', 'NORMAL'),
(63804, 'Esters Polyglycéryl-3 de Candelilla/Jojoba/Son de Riz', 'NORMAL'),
(63805, 'Hydroxyproline Dipalmitoyl', 'NORMAL'),
(63806, 'Amidon de Zea Mays (Maïs)', 'NORMAL'),
(63807, 'Huile Végétale Hydrogénée', 'NORMAL'),
(63808, 'Extrait de Graine de Lupinus Albus (Lupin Blanc)', 'NORMAL'),
(63809, 'Extrait de Graine d\'Avena Strigosa (Avoine)', 'NORMAL'),
(63810, 'Huile de Pépin de Vitis Vinifera (Raisin)', 'NORMAL'),
(63811, 'Extrait de Vigne de Vitis Vinifera (Raisin)', 'NORMAL'),
(63812, 'Escine', 'NORMAL'),
(63813, 'Huile de MyrrhA Commiphora (Myrrhe)', 'NORMAL'),
(63814, 'Néoruscogénine', 'NORMAL'),
(63815, 'Cera Alba/Beewax/Cire d\'abeille*', 'NORMAL'),
(63816, 'Extrait de Feuille d\'Olea Europaea (Olive)*', 'NORMAL'),
(63817, 'Huile de Son d\'Oryza Sativa (Riz)', 'NORMAL'),
(63818, 'Lactylate de Stéaroyl de Sodium', 'NORMAL'),
(63819, 'Linoléate de Glycéryle', 'NORMAL'),
(63820, 'Linoléinate de Glycéryle', 'NORMAL'),
(63821, 'Ruscogénine', 'NORMAL'),
(63822, 'Alcool Phénéthylique', 'NORMAL'),
(63823, 'Hydroxypropyl Cyclodextrin', 'NORMAL'),
(63824, 'Royal Jelly', 'NORMAL'),
(63825, 'Citrus Aurantium Amara (Bitter Orange) Flower Oil*', 'NORMAL'),
(63826, 'Magnolia Officinalis Bark Extract', 'NORMAL'),
(63827, 'Lupinus Albus Seed Extract', 'NORMAL'),
(63828, 'Cetearyl Alcohol', 'NORMAL'),
(63829, 'Polymethyl Methacrylate', 'NORMAL'),
(63830, 'Caprylic/Capric/Succinic Triglyceride', 'NORMAL'),
(63831, 'Ethylene/Acrylic Acid Copolymer', 'NORMAL'),
(63832, 'Dipalmitoyl Hydroxyproline', 'NORMAL'),
(63833, 'Cetearyl Glucoside', 'NORMAL'),
(63834, 'Propolis Extract', 'NORMAL'),
(63835, 'Ginkgo Biloba Leaf Extract', 'NORMAL'),
(63836, 'Cucumis Sativus (Cucumber) Fruit Extract', 'NORMAL'),
(63837, 'Caffeine', 'NORMAL'),
(63838, 'Escin', 'NORMAL'),
(63840, 'Huile d\'Olive/Huile Végétale', 'NORMAL'),
(63841, 'Huile de Graines de Simmondsia Chinensis (Jojoba)*', 'NORMAL'),
(63842, 'Isosorbide Dicarboxylate', 'NORMAL'),
(63843, 'Phosphate de Dicétyle', 'NORMAL'),
(63844, 'Extrait de feuilles de Vitis Vinifera (Raisin)', 'NORMAL'),
(63845, 'Extrait de Fruits de Vitis Vinifera (Raisin)', 'NORMAL'),
(63846, 'Huile de Pépins de Vitis Vinifera (Raisin)*', 'NORMAL'),
(63847, 'Gomme de Pistache Lentiscus (Mastic)', 'NORMAL'),
(63848, 'Hyaluronate de Sodium Hydrolysé', 'NORMAL'),
(63849, 'Huile de Salvia Sclarea (Sauge Sclarée)*', 'NORMAL'),
(63850, 'Huile de Fleur de Citrus Aurantium Amara (Orange Amère)*', 'NORMAL'),
(63851, 'Huile de Feuille de Pogostemon Cablin/ Huile de Pogostemon Cablin (Patchouli)*', 'NORMAL'),
(63852, 'Gomme Sclérotique', 'NORMAL'),
(63853, 'Phosphate de Ceteth-20', 'NORMAL'),
(63854, 'Phosphate de Méthylglucoside', 'NORMAL'),
(63855, 'Lysinate/Prolinate de Cuivre', 'NORMAL'),
(63856, 'Palmitate de Cétyle', 'NORMAL'),
(63857, 'Tétraisopalmitate d\'Ascorbyle', 'NORMAL'),
(63858, 'EDTA Disodique', 'NORMAL'),
(63860, 'Hexylcinnamal', 'LOW'),
(63861, 'Propanediol Dicaprylate', 'NORMAL'),
(63862, 'Isosorbide Dicaprylate', 'NORMAL'),
(63863, 'Extrait de Feuille de Vitis Vinifera (Raisin)', 'NORMAL'),
(63864, 'Extrait de Fruit de Vitis Vinifera (Raisin)', 'NORMAL'),
(63865, 'Mel/Honey/Miel*', 'NORMAL'),
(63866, 'Cera Alba/Beeswax/Cire d\'abeille*', 'NORMAL'),
(63867, 'Huile de Graines de Helianthus Annuus (Tournesol)', 'NORMAL'),
(63868, 'Huile de Feuilles de Pogostemon Cablin (Patchouli)/Huile de Pogostemon Cablin (Patchouli)*', 'NORMAL'),
(63869, 'Methylglucoside Phosphate', 'NORMAL'),
(63870, 'Palmitate de Sorbitan', 'NORMAL'),
(63871, 'Oléate de Sorbitan', 'NORMAL'),
(63872, 'Copolymère de Capryloyl Glycerin/Acide Sébacique', 'NORMAL'),
(63873, 'Diheptyl Succinate', 'NORMAL'),
(63874, 'Stéarate PEG-100', 'NORMAL'),
(63875, 'Stearate PEG-20', 'NORMAL'),
(63876, 'Cetearyl Olivate', 'NORMAL'),
(63877, 'Sorbitan Olivate', 'NORMAL'),
(63878, 'Beurre de Graine de Theobroma (Cacao) (Cocoa)', 'NORMAL'),
(63879, 'Coco-Caprylate/Caprate', 'NORMAL'),
(63880, 'Gomme de Pistacia Lentiscus (Mastic) Huile de Fruit Olea Europaea (Olive)*', 'NORMAL'),
(63881, 'Insaponifiables d\'Huile d\'Olive Hydrogénée', 'NORMAL'),
(63882, 'Huile de Feuilles de Pogostemon Cablin/Huile de Pogostemon Cablin (Patchouli)*', 'NORMAL'),
(63883, 'Papaïne', 'NORMAL'),
(63884, 'Algine', 'NORMAL'),
(63885, '2-Hexanediol', 'NORMAL'),
(63886, 'Extrait d\'Écorce d\'Albizia Julibrissin (Arbre à Soie)', 'NORMAL'),
(63887, 'Dicaprylate de Isosorbide', 'NORMAL'),
(63888, 'Esters de Candelilla/Jojoba/Son de Riz Polyglyceryl-3', 'NORMAL'),
(63889, 'Beurre de graines de Theobroma Cacao (Cacao)', 'NORMAL'),
(63890, 'Gomme de Pistacia Lentiscus (Mastic)', 'NORMAL'),
(63891, 'Sorbitan Palmitate', 'NORMAL'),
(63892, 'Sodium Stearoyl Lactylate', 'NORMAL'),
(63893, 'Alcool Benzylique.', 'NORMAL'),
(63894, 'Huile Hybride Helianthus Annuus/Huile de Graine d\'Helianthus Annuus (Tournesol)', 'NORMAL'),
(63895, 'Tricapryline', 'NORMAL'),
(63896, 'Dicaprylyl Ether', 'NORMAL'),
(63897, 'Propolis*', 'NORMAL'),
(63898, 'Helianthus Annuus (Tournesol)', 'NORMAL'),
(63899, 'Fleur de Rose de Damas*', 'NORMAL'),
(63900, 'Extrait de Lavandula Stoechas (Lavande Papillon)', 'NORMAL'),
(63901, 'Acide Sorbique', 'NORMAL'),
(63902, 'Farnesol.', 'NORMAL'),
(63903, 'Hylocereus Undatus Fruit Extract', 'NORMAL'),
(63904, 'Paeonia Lactiflora Extract/Paeonia Lactiflora Flower Extract', 'NORMAL'),
(63905, 'Rosmarinus Officinalis (Rosemary) Leaf Extract', 'NORMAL'),
(63906, 'Citrus Limon (Lemon) Peel Oil*', 'NORMAL'),
(63907, 'Brassica Campestris (Rapeseed) Seed Oil', 'NORMAL'),
(63908, 'Glycogen', 'NORMAL'),
(63909, 'Polyglyceryl-3 Stearate', 'NORMAL'),
(63910, 'Glyceryl Glucoside', 'NORMAL'),
(63911, 'Glyceryl Stearate Citrate', 'NORMAL'),
(63912, 'Benzoic Acid', 'NORMAL'),
(63913, 'Coumarin.', 'NORMAL'),
(63915, 'Dodecane', 'NORMAL'),
(63916, 'C10-18 Triglycerides', 'NORMAL'),
(63917, 'Dicetyl Phosphate', 'NORMAL'),
(63918, 'Caprylyl/Capryl Glucoside', 'NORMAL'),
(63919, 'Simmondsia Chinensis  (Jojoba) Seed Oil*', 'NORMAL'),
(63920, 'Lilium Candidum Flower Extract', 'NORMAL'),
(63921, 'Pfaffia Paniculata Root Extract', 'NORMAL'),
(63922, 'Ptychopetalum Olacoides Bark/Root Extract', 'NORMAL'),
(63923, 'Copper Lysinate/Prolinate', 'NORMAL'),
(63924, 'Hydrolyzed Sodium Hyaluronate', 'NORMAL'),
(63925, 'Vitis Vinifera (Grape) Seed Oil*', 'NORMAL'),
(63926, 'Euphrasia Officinalis Extract', 'NORMAL'),
(63927, 'Sideritis Perfoliata Flower/Leaf/Stem* Extract', 'NORMAL'),
(63928, 'Sideritis Scardica Flower/Leaf/Stem* Extract', 'NORMAL'),
(63929, 'Sideritis Raeseri Flower/Leaf/Stem* Extract', 'NORMAL'),
(63930, 'Caprylhydroxamic Acid', 'NORMAL'),
(63931, 'Ethyl Lauroyl Arginate HCl', 'NORMAL'),
(63932, 'Methylpropanediol', 'NORMAL'),
(63933, 'Cetyl Palmitate', 'NORMAL'),
(63934, 'Sclerotium Gum', 'NORMAL'),
(63935, 'Ceteth-20 Phosphate', 'NORMAL'),
(63936, 'Inulin', 'NORMAL'),
(63937, 'Cistus Incanus Flower/Leaf/Stem*Extract', 'NORMAL'),
(63938, 'Iris Versicolor Extract', 'NORMAL'),
(63939, 'Chlorella Vulgaris Extract', 'NORMAL'),
(63940, 'Aloe Barbadensis Leaf Juice Powder', 'NORMAL'),
(63941, 'Fructose', 'NORMAL'),
(63942, 'Saccharide Hydrolysate', 'NORMAL'),
(63943, 'Polyacrylate Crosspolymer-6', 'NORMAL'),
(63944, 'Lactic Acid', 'NORMAL'),
(63945, 'Triglycéride Caprylique/Caprique/Succinique', 'NORMAL'),
(63946, 'Dicaprylate de Propanediol', 'NORMAL'),
(63947, 'Succinate de Diheptyle', 'NORMAL'),
(63948, 'Glucoside de Cétéaryle', 'NORMAL'),
(63949, 'Olivate de Sorbitan', 'NORMAL'),
(63950, 'Glutamate de Phytosteryl/Octyldodecyl Lauroyl', 'NORMAL'),
(63951, 'Beurre de Graine de Theobroma Cacao (Cocao)', 'NORMAL'),
(63952, 'Extrait d\'Iris Versicolore', 'NORMAL'),
(63953, 'Extrait de la Fleur/Feuille/Tige* de Cistus Incanus (Ciste)', 'NORMAL'),
(63954, 'Extrait du Fruit de Rosa Canina (Rose Sauvage)*', 'NORMAL'),
(63955, 'Hydrolysat de Saccharide', 'NORMAL'),
(63956, 'Jus de Feuille d\'Aloe Barbadensis* en Poudre', 'NORMAL'),
(63957, 'Copolymère de Capryloyl Glycérine/Acide Sébacique', 'NORMAL'),
(63958, 'Épigallocatéchine Gallatyl Glucoside', 'NORMAL'),
(63959, 'Gallyl Glucoside', 'NORMAL'),
(63960, 'Propyl Gallate', 'NORMAL'),
(63961, 'C9-12 Alkane', 'NORMAL'),
(63962, 'Silica', 'NORMAL'),
(63963, 'Nymphaea Coerulea Flower Extract/Nymphaea Caerulea Flower Extract', 'NORMAL'),
(63964, 'Nelumbo Nucifera Flower Extract', 'NORMAL'),
(63965, 'Bis-Ethylhexyloxyphenol Methoxyphenyl Triazine', 'NORMAL'),
(63966, 'Diethylamino Hydroxybenzoyl Hexyl Benzoate', 'NORMAL'),
(63967, 'Dicaprylyl Carbonate', 'NORMAL'),
(63968, 'Ethylhexyl Triazone', 'NORMAL'),
(63969, 'Ethylhexyl Salicylate', 'NORMAL'),
(63970, 'Sodium Stearoyl Glutamate', 'NORMAL'),
(63971, 'Scutellaria Baicalensis Root Extract', 'NORMAL'),
(63972, 'Glycyrrhiza Glabra (Licorice) Root Extract', 'NORMAL'),
(63973, 'Camellia Sinensis Leaf Extract', 'NORMAL'),
(63974, 'Polygonum Cuspidatum Root Extract', 'NORMAL'),
(63975, 'Chamomilla Recutita (Matricaria) Flower Extract', 'NORMAL'),
(63976, 'Centella Asiatica Extract', 'NORMAL'),
(63977, 'Triacontanyl PVP', 'NORMAL'),
(63978, 'Sodium Hydroxide.', 'NORMAL'),
(63979, 'Alcool Oléylique', 'NORMAL'),
(63980, 'Diisopropyl Dimère Dilinoléate', 'NORMAL'),
(63981, 'Cire de Graine d\'Helianthus Annuus (Tournesol)', 'NORMAL'),
(63982, 'Abiétate de Glycéryle', 'NORMAL'),
(63983, 'Beurre de Graine de Theobroma Cacao (Cacao)', 'NORMAL'),
(63984, 'Cire de Copernicia Cerifera (Carnauba)', 'NORMAL'),
(63985, 'Esters Cétyliques d\'Huile d\'Olive Hydrogénés', 'NORMAL'),
(63986, 'Aroma/Flavor/Arôme', 'NORMAL'),
(63987, 'Huile de Graine de Ribes Nigrum (Cassis)', 'NORMAL'),
(63988, 'Huile de Persea Gratissima (Avocat)', 'NORMAL'),
(63989, 'Huile de Fruit Olea Europaea (Olive)', 'NORMAL'),
(63990, 'Extrait de Racine d\'Alkanna Tinctoria', 'NORMAL'),
(63991, 'Phytostérols', 'NORMAL'),
(63992, 'CI 15850/Rouge 7 Lake', 'NORMAL'),
(63993, 'CI 17200/Rouge 33.', 'NORMAL'),
(63994, 'Huile de Graine de Ricinus Communis (Ricin)*', 'NORMAL'),
(63995, 'Cire d\'Euphorbia Cerifera (Candelilla)', 'NORMAL'),
(63996, 'Huile de Fruit d\'Olea Europaea (Olive)', 'NORMAL'),
(63997, 'Huile de Graine de Brassica Campestris (Colza)', 'NORMAL'),
(63998, 'Extrait de Feuille de Rosmarinus Officinalis (Romarin)', 'NORMAL'),
(63999, 'Extrait de Fruit* de Prunus Armeniaca (Abricot)', 'NORMAL'),
(64000, 'Mel Extract/Honey Extract/Extrait de Miel', 'NORMAL'),
(64001, 'Extrait de Fruit de Thaumatococcus Danielli (Katemfe)', 'NORMAL'),
(64002, 'Tocophéryle', 'NORMAL'),
(64003, 'Maltodextrine', 'NORMAL'),
(64004, 'Extrait de Graine de Castanea Sativa (Châtaigne)', 'NORMAL'),
(64005, 'Hule de Graine d\'Helianthus Annuus (Tournesol)*', 'NORMAL'),
(64006, 'Extrait d\'Écorce de Magnolia Officinalis', 'NORMAL'),
(64007, 'Huile Hybride d\'Helianthus Annuus/Huile de Graine d\'Helianthus Annuus (Tournesol)', 'NORMAL'),
(64008, 'Eugénol', 'NORMAL'),
(64009, 'CI 77491/Oxydes de Fer', 'LOW'),
(64010, 'CI 77499/Oxydes de Fer', 'LOW'),
(64011, 'CI 77492/Oxydes de Fer.', 'LOW'),
(64012, 'Cire d\'Helianthus Annuus Seed/Cire de Graine d\'Helianthus Annuus (Tournesol)', 'NORMAL'),
(64013, 'Huile de Graine de Theobroma Cacao (Cacao)', 'NORMAL'),
(64014, 'ire de Copernicia Cerifera (Carnauba)', 'NORMAL'),
(64015, 'Aroma/Flavor', 'NORMAL'),
(64016, 'Extrait d\'Hypericum Perforatum (Millepertuis)*', 'NORMAL'),
(64017, 'Exrait de Propolis', 'NORMAL'),
(64018, 'Éthylhexyl Methoxycinnamate', 'NORMAL'),
(64019, 'Butyl Methoxydibenzoylmethane', 'NORMAL'),
(64020, 'Huile de Graine de Punica Granatum (Grenadier)*', 'NORMAL'),
(64021, 'Huile de Graines de Carthamus Tinctorius (Carthame)', 'NORMAL'),
(64022, 'Palmitate d\'Ascorbyle', 'NORMAL'),
(64023, 'Acide Linoléique', 'NORMAL'),
(64024, 'Glycyrrhizate d\'Ammonium', 'NORMAL'),
(64025, 'CI 15850/Red 7 Lake.', 'NORMAL'),
(64026, 'Huile de Graines de Ricinus Communis (Ricin)*', 'NORMAL'),
(64027, 'Cinnamal', 'NORMAL'),
(64028, 'Alcool d\'Anis', 'NORMAL'),
(64029, 'Sodium Cocoyl Isethionate', 'NORMAL'),
(64030, 'Coco-Glucoside', 'NORMAL'),
(64031, 'Maléate de Castoryl', 'NORMAL'),
(64032, 'Extrait de Feuille d\'Hamamelis Virginiana (Hamamélis)*', 'NORMAL'),
(64033, 'Extrait de Fleur de Calendula Officinalis (Souci)*', 'NORMAL'),
(64034, 'Huile d\'écorce de Citrus Aurantium Dulcis (Orange)*', 'NORMAL'),
(64035, 'Huile de Fleur de Rose de Damas*', 'NORMAL'),
(64036, 'Glucose Méthylique Dioléate PEG-120', 'NORMAL'),
(64037, 'Acide citrique', 'NORMAL'),
(64038, 'Sodium Laureth Sulfate', 'NORMAL'),
(64039, 'Extrait de Feuille de Saponaria Officinalis (Saponaire)', 'NORMAL'),
(64040, 'Extrait de Sideritis Syriaca (Thé)*', 'NORMAL'),
(64041, 'Huile de Feuille d\'Eucalyptus Globulus*', 'NORMAL'),
(64042, 'Huile d\'Écorce de Citrus Aurantium Bergamia (Bergamote)*', 'NORMAL'),
(64043, 'Hydroxypropyl Guar Hydroxypropyltrimonium Chloride', 'NORMAL'),
(64044, 'Sodium Cocoyl Glutamate', 'NORMAL'),
(64045, 'Isostéarate de Glycéryle PEG-90', 'NORMAL'),
(64046, 'Laureth-2', 'NORMAL'),
(64047, 'Coumarine', 'NORMAL'),
(64048, 'Glucoside Décylique', 'NORMAL'),
(64049, 'Extrait de Fleur de Jasminum Grandiflorum (Jasmin)', 'NORMAL'),
(64050, 'Huile de Feuille de Pogostemon Cablin/Huile de Pogostemon Cablin (Patchouli)*', 'NORMAL'),
(64051, 'Fleur de Lavandula Angustifolia (Lavande)*', 'NORMAL'),
(64052, 'Glycereth-2 Cocoate', 'NORMAL'),
(64053, 'Acide Lactique', 'NORMAL'),
(64054, 'Hexyl Cinnamaldéhyde', 'NORMAL'),
(64055, 'Extrait de Fruit/Feuille de Ficus Carica (Figue)', 'NORMAL'),
(64056, 'Extrait de fruit de l\'Olea Europaea (Olive)', 'NORMAL'),
(64058, 'Acide Benzoïque', 'NORMAL'),
(64059, 'Acide Déhydroacétique.', 'NORMAL'),
(64060, 'Sodium Lauroyl Methyl Isethionate', 'NORMAL'),
(64061, 'Lauryl Olivate', 'NORMAL'),
(64062, 'Lévulinate de Sodium', 'NORMAL'),
(64063, 'Huile de Prunus Amygdalus Dulcis (Amande douce)', 'NORMAL'),
(64064, 'Glutamate de Sodium', 'NORMAL'),
(64065, 'Olea Europaea (Olive) Fruit Oil', 'NORMAL'),
(64066, 'Glycol Distearate', 'NORMAL'),
(64067, 'Disodium Cocoyl Glutamate', 'NORMAL'),
(64068, 'Sorbitan Oleate Decylglucoside Crosspolymer', 'NORMAL'),
(64069, 'Citric Acid', 'NORMAL'),
(64070, 'Crosspolymères d\'Acrylates/d\'Alkyl Acrylate C10-30', 'NORMAL'),
(64071, 'Disodium EDTA.', 'NORMAL'),
(64072, 'C15-19 Alkane', 'NORMAL'),
(64073, 'Theobroma Cacao (Cocoa) Seed Butter', 'NORMAL'),
(64074, 'Heptyl Undecylenate', 'NORMAL'),
(64075, 'Hamamelis Virginiana (Witch Hazel) Leaf* Extract', 'NORMAL'),
(64076, 'Lavandula Angustifolia (Lavender) Flower* Extract', 'NORMAL'),
(64077, 'Prunus Amygdalus Dulcis (Sweet Almond) Oil', 'NORMAL'),
(64078, 'Sodium Phytate', 'NORMAL'),
(64079, 'Alcohol', 'NORMAL'),
(64080, 'Coco-Caprylate', 'NORMAL'),
(64081, 'Huile Prunus Amygdalus Dulcis (Amande Douce)', 'NORMAL'),
(64082, 'Extrait de Fleur/Feuille/Tige de Sideritis Raeseri (Thé)*', 'NORMAL'),
(64083, 'Copolymère Capryloyl Glycérine/Acide Sébacique', 'NORMAL'),
(64084, 'PEG-20 Stéarate', 'NORMAL'),
(64085, 'Citrate de Stéarate de Glycéryle', 'NORMAL'),
(64086, 'Triglycérides C10-18', 'NORMAL'),
(64087, 'Copolymère de Capryloyl Glycérine/d\'Acide Sébacique', 'NORMAL'),
(64088, 'Salicylate de Benzyl', 'NORMAL'),
(64089, 'Benzoate de Benzyl.', 'NORMAL'),
(64090, 'Ethylhexylglycérine', 'NORMAL'),
(64091, 'Phospholipides.', 'NORMAL'),
(64092, 'Polysorbate 60', 'NORMAL'),
(64093, 'Extrait de Fleur/Feuille/Tige de Sideritis Perfoliata*', 'NORMAL'),
(64094, 'Extrait de Fleur/Feuille/Tige de Sideritis Scardica*', 'NORMAL'),
(64095, 'Extrait de Fleur/Feuille/Tige de Sideritis Raeseri*', 'NORMAL'),
(64096, 'Copolymère d\'Acrylates/C10-30 Acrylate d\'Alkyle', 'NORMAL'),
(64097, 'Phenylpropanol', 'NORMAL'),
(64098, 'Caprylate de Glycéryle', 'NORMAL'),
(64099, 'Hydroxyde de Sodium.', 'NORMAL'),
(64100, 'Alpha-Glucan Oligosaccharide', 'NORMAL'),
(64101, 'Extrait de Fleur de Chamomilla Recutita (Matricaria)*', 'NORMAL'),
(64102, 'Crosspolymère d\'Acrylates/C10-30 Acrylate d\'Alkyle', 'NORMAL'),
(64103, 'Citronelllol', 'NORMAL'),
(64104, 'Cocoamphodiacétate Disodique', 'NORMAL'),
(64105, 'Dioleate de Glucose Méthylique PEG-120', 'NORMAL'),
(64106, 'Jus de Feuille d\'Aloe Barbadensis*', 'NORMAL'),
(64107, 'Extrait de Fleur/Feuille/Tige de Sideritis Scardica (Thé)*', 'NORMAL'),
(64108, 'Biotine', 'NORMAL'),
(64109, 'Sulfate de Sodium Cetearyl', 'NORMAL'),
(64110, 'Laurate d\'Isoamyle', 'NORMAL'),
(64111, 'Dicaprylate d\'Isosorbide', 'NORMAL'),
(64112, 'Beurre de Butyrospermum Parkii (Karité)*', 'NORMAL'),
(64113, 'Huile de Graines d\'Helianthus Annuus (Tournesol)*', 'NORMAL'),
(64114, 'Gomme Xanthane', 'NORMAL'),
(64115, 'Polyisobutène Hydrogéné', 'NORMAL'),
(64116, 'Extrait d\'Hypericum Perforatum', 'NORMAL'),
(64117, 'Palmitate de Rétinyle', 'NORMAL'),
(64118, 'Acide Palmitique', 'NORMAL'),
(64119, 'Acide Stéarique', 'NORMAL'),
(64120, 'Copolymère de Glyceryl Acrylate/Acide Acrylique', 'NORMAL'),
(64121, 'Linolénate de Glycéryle', 'NORMAL'),
(64122, 'PEG-4 Rapeseedamide', 'NORMAL'),
(64123, 'Extrait de Fruit d\'Hippophae Rhamnoides (Argousier)*', 'NORMAL'),
(64124, 'Protéine de Lupin hydrolysée', 'NORMAL'),
(64125, 'Phytantriol', 'NORMAL'),
(64126, 'Extrait de Feuille de Rosmarinus Officinalis (Romarin)*', 'NORMAL'),
(64127, 'Extrait de Racine de Ginseng Panax (Ginseng)', 'NORMAL'),
(64128, 'Extrait d\'Écorce de Cinchona Succirubra (Quinquina Rouge)', 'NORMAL'),
(64129, 'Extrait de Fleur/Feuille de Thymus Vulgaris (Thym)*', 'NORMAL'),
(64130, 'Extrait de Feuille d\'Equisetum Arvense (Prêle)*', 'NORMAL'),
(64131, 'Huile d\'Écorce de Citrus Limon (Citron)', 'NORMAL'),
(64132, 'Huile de Fleur/Feuille de Thymus Vulgaris (Thym)*', 'NORMAL'),
(64133, 'Huile de Mentha Piperita (Menthe Poivrée)*', 'NORMAL'),
(64134, 'Polyquaternium-10', 'NORMAL'),
(64135, 'Huile de Feuilles de Laurus Nobilis (Laurier)*', 'NORMAL'),
(64136, 'Huile de Salvia Sclarea (Sclarée Sauvage)*', 'NORMAL'),
(64137, 'Chlorure d\'Hydroxypropyltrimonium de Guar', 'NORMAL'),
(64138, 'SodiumLaureth Sulfate', 'NORMAL'),
(64139, 'Cocamidopropyl Betaine', 'LOW'),
(64140, 'PEG-60 AlmondGlycerides', 'NORMAL'),
(64141, 'Apium Graveolens (Celery) Seed Extract', 'NORMAL'),
(64142, 'Propolis* Extract', 'NORMAL'),
(64143, 'Rosmarinus Officinalis (Rosemary) Leaf* Extract', 'NORMAL'),
(64144, 'Saponaria Officinalis LeafExtract', 'NORMAL'),
(64145, 'Lavandula Angustifolia (Lavender)Oil*', 'NORMAL'),
(64146, 'Melaleuca Alternifolia (Tea Tree) Leaf Oil*', 'NORMAL'),
(64147, 'HydrolyzedWheat Starch', 'NORMAL'),
(64148, 'Jojoba Wax PEG-120 Esters', 'NORMAL'),
(64149, 'Salicylic Acid', 'NORMAL'),
(64150, 'Sodium Levulinate', 'NORMAL'),
(64151, 'Piroctone Olamine', 'NORMAL'),
(64152, 'Glyceryl Oleate', 'NORMAL'),
(64153, 'Tetrasodium GlutamateDiacetate', 'NORMAL'),
(64154, 'Potassium Sorbate', 'NORMAL'),
(64155, 'GuarHydroxypropyltrimonium Chloride', 'NORMAL'),
(64156, 'Laureth-7 Citrate', 'NORMAL'),
(64157, 'Sodium Cocoamphoacetate', 'NORMAL'),
(64158, 'Thymus Vulgaris (Thyme) Flower/Leaf* Extract', 'NORMAL'),
(64159, 'Urtica Dioica (Nettle) Leaf* Extract', 'NORMAL'),
(64160, 'Saponaria Officinalis Leaf Extract', 'NORMAL'),
(64161, 'Mentha Piperita (Peppermint) Oil*', 'NORMAL'),
(64162, 'Thymus Vulgaris (Thyme) Flower/Leaf  Oil*', 'NORMAL'),
(64163, 'Sodium Lauroyl Lactylate', 'NORMAL'),
(64164, 'PEG-120 Methyl Glucose Trioleate', 'NORMAL'),
(64165, 'Polyquaternium-47', 'NORMAL'),
(64166, 'Sodium Chloride', 'NORMAL'),
(64167, 'Disodium PEG-5 Laurylcitrate Sulfosuccinate', 'NORMAL'),
(64168, 'Palmate de Glycéryle Hydrogéné PEG-200', 'NORMAL'),
(64169, 'Extrait de Feuille d\'Urtica Dioica (Ortie)*', 'NORMAL'),
(64170, 'Huile d\'écorce de Citrus Paradisi (Pamplemousse)*', 'NORMAL'),
(64171, 'Glyceryl Cocoate PEG-7', 'NORMAL'),
(64172, 'Salicylate de Benzyle.', 'NORMAL'),
(64173, 'Extrait de Feuille de Camellia Sinensis (Théier)*', 'NORMAL'),
(64174, 'Phosphates d\'Ascorbyle de Sodium', 'NORMAL'),
(64175, 'Extrait de Feuille/Racine de Saponaria Officinalis', 'NORMAL'),
(64176, 'Aspartates de Cuivre', 'NORMAL'),
(64177, 'Aspartate de Zinc', 'NORMAL'),
(64178, 'Aspartate de Manganèse', 'NORMAL'),
(64179, 'Extrait de Feuille/Racine de Saponaria Officinalis (Saponaire)', 'NORMAL'),
(64180, 'Extrait de Fruit de Vanilla Planifolia (Vanille)*', 'NORMAL'),
(64181, 'Acide Hyaluronique Hydrolysé', 'NORMAL'),
(64182, 'Avoine Hydrolysée*', 'NORMAL'),
(64183, 'Alcool Cétylique', 'NORMAL'),
(64184, 'Brassicamidopropyl Diméthylamine', 'NORMAL'),
(64185, 'Alkane C15-19', 'NORMAL'),
(64186, 'Extrait de Fruit d\'Hippophae Rhamnoides (Argousier)', 'NORMAL'),
(64187, 'Extrait de Feuilles de Laurus Nobilis (Laurier)*', 'NORMAL'),
(64188, 'Acide Aspartique', 'NORMAL'),
(64189, 'Isostéarate d\'Huile de Ricin Hydrogéné', 'NORMAL'),
(64190, 'Huile de Graine de Plukenetia Volubilis (Noix Inca)', 'NORMAL'),
(64191, 'Extrait de Feuille d\'Urtica Dioica (Ortie)', 'NORMAL'),
(64192, 'Cetyl Alcohol', 'NORMAL'),
(64193, 'Hydrogenated Castor Oil Isostearate', 'NORMAL'),
(64194, 'Cetyl Esters', 'NORMAL'),
(64195, 'Citrus Paradisi (Grapefruit) Peel Oil*', 'NORMAL'),
(64196, 'Biotin', 'NORMAL'),
(64197, 'Aspartic Acid', 'NORMAL'),
(64198, 'Copolymère de Glycérine Capryloyl/Acide Sébacique', 'NORMAL'),
(64199, 'Huile de Graine de Plukenetia Volubilis', 'NORMAL'),
(64200, 'Extrait de Feuille de Rosmarinus Officinalis (Romarin) *', 'NORMAL'),
(64201, 'CrambeAbyssinica Seed Oil', 'NORMAL'),
(64202, 'HydrolyzedHyaluronic Acid', 'NORMAL'),
(64203, 'Olea Europaea(Olive) Fruit Oil*', 'NORMAL'),
(64204, 'Pelargonium Graveolens FlowerOil*', 'NORMAL'),
(64205, 'Hydrolyzed Oats*', 'NORMAL'),
(64206, 'SodiumGluconate', 'NORMAL'),
(64207, 'Alcool dénat', 'NORMAL'),
(64208, 'Extrait de Racine de Panax Ginseng (Ginseng)*', 'NORMAL'),
(64209, 'Valine', 'NORMAL'),
(64210, 'Thréonine', 'NORMAL'),
(64211, 'Phenylalanine', 'NORMAL'),
(64212, 'Histidine', 'NORMAL'),
(64213, 'Glycine', 'NORMAL'),
(64214, 'Alanine', 'NORMAL'),
(64215, 'Sérine', 'NORMAL'),
(64216, 'Ammonium Glycyrrhizate', 'NORMAL'),
(64217, 'PCA', 'NORMAL'),
(64218, 'Sodium PCA', 'NORMAL'),
(64219, 'Lactate de Sodium', 'NORMAL'),
(64220, 'Isoleucine', 'NORMAL'),
(64221, 'Undécane', 'NORMAL'),
(64222, 'Tridécane', 'NORMAL'),
(64223, 'Huile de Noyau d\'Argania Spinosa (Argan)', 'NORMAL'),
(64224, 'Huile de Graine de Plukenetia Volubilis Seed Oil (Noix Inca)', 'NORMAL'),
(64225, 'Huile de Graine d\'Avena Sativa (Avoine) Huile Hybride d\'Helianthus Annuus/Huile de Graine d\'Helianthus Annuus (Tournesol)', 'NORMAL'),
(64226, 'Copolèmère de Capryloyl Glycérine/Acide Sébacique', 'NORMAL'),
(64227, 'Cera Alba/Beeswax/Cire d\'abeille', 'NORMAL'),
(64228, 'Huile de Graines de Helianthus Annuus (Tournesol)*', 'NORMAL'),
(64229, 'Huile de Bois de Santalum Spicata/Huile de Bois de Fusanus Spicatus (Santal)*', 'NORMAL'),
(64230, 'Alpha-Isométhyl Ionone.', 'NORMAL'),
(64232, 'Huile de Graine d\'Avena Sativa (Avoine)', 'NORMAL'),
(64233, 'Huile Hybride d\'Helianthus Annuus/Huile de Graine d\'Helianthus Annuus (Tournesol)*', 'NORMAL'),
(64234, 'Limonène', 'LOW'),
(64235, 'Salicylate de Benzyle', 'HIGH'),
(64236, 'Geraniol', 'LOW'),
(64237, 'Test', 'MEDIUM'),
(64239, 'Latex', 'LOW');

-- --------------------------------------------------------

--
-- Table structure for table `ingredient_trigered_allergy`
--

DROP TABLE IF EXISTS `ingredient_trigered_allergy`;
CREATE TABLE IF NOT EXISTS `ingredient_trigered_allergy` (
  `ingredientId` int(11) NOT NULL,
  `allergyId` int(11) NOT NULL,
  PRIMARY KEY (`ingredientId`,`allergyId`),
  KEY `IDX_3cd89b9df91acbd18282c06931` (`ingredientId`),
  KEY `IDX_caec7456092b03523b9e59c90d` (`allergyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ingredient_trigered_allergy`
--

INSERT INTO `ingredient_trigered_allergy` (`ingredientId`, `allergyId`) VALUES
(63544, 32),
(63552, 33),
(63557, 33),
(63562, 33),
(63631, 44),
(63632, 44),
(63634, 44),
(64239, 44);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
CREATE TABLE IF NOT EXISTS `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TitleNotification` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BodyNotification` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `clientId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_d9bd2aaeb3d9540983be4ca9e7b` (`clientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Price` float NOT NULL,
  `Rank` float NOT NULL,
  `Image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `ProductShortDescription` longtext COLLATE utf8_unicode_ci NOT NULL,
  `usingAdvice` longtext COLLATE utf8_unicode_ci NOT NULL,
  `isShown` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_3e6ab09ae0f5e9d98fec19e63e` (`Reference`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `ProductName`, `Reference`, `Price`, `Rank`, `Image`, `createdAt`, `updatedAt`, `ProductShortDescription`, `usingAdvice`, `isShown`) VALUES
(19, 'Gel Purifiant - Visage', 'RFR-APIVITA-001', 14, 10, 'image_2021-08-30_144728.png', '2021-08-30 23:10:22.814673', '2021-09-16 04:50:06.264210', 'Un gel nettoyant pour peaux grasses à mixtes.', 'Nettoie efficacement la peau sans irriter \r\nRégule l’excès de sébum et procure une action antiseptique\r\nPrévient l\'acné et tonifie la peau \r\nAvec 3 Huiles essentielles procure une action antibactérienne, tout en stimulant l’humeur et en apai', 1),
(22, 'Eau Micellaire Nettoyante - Visage & Yeux', 'RFR-APIVITA-003', 13, 10, 'image_2021-08-27_220830.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(23, 'Gel Nettoyant Noir– Visage & Yeux', 'RFR-APIVITA-004', 12, 10, 'image_2021-08-27_220937.png', '2021-08-30 23:10:22.814673', '2021-09-01 16:38:50.000000', '', '', 0),
(24, 'Lait Nettoyant Doux - Yeux', 'RFR-APIVITA-005', 12, 10, 'image_2021-08-27_221028.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(26, 'Crème Mains Peaux Sèches et Abîmées - Texture Concentrée', 'RFR-APIVITA-007', 8, 10, 'image_2021-08-27_230549.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(27, 'Crème Mains Hydratation Intense - Texture Riche', 'RFR-APIVITA-008', 18, 10, 'image_2021-08-27_230643.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(28, 'Crème Mains Hydratante - Texture Légère', 'RFR-APIVITA-009', 8, 10, 'image_2021-08-27_230704.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(31, 'Après-shampoing Hydratant', 'RFR-APIVITA-010', 12, 10, 'image_2021-08-27_230909.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(32, 'Huile Capillaire Rescue ', 'RFR-APIVITA-011', 22, 10, 'image_2021-08-27_231127.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(33, 'Après-shampoing Nourrissant et Réparateur ', 'RFR-APIVITA-012', 12, 10, 'image_2021-08-27_231304.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(34, 'Après-shampoing Brillance & Vitalité ', 'RFR-APIVITA-013', 12, 10, 'image_2021-08-30_002858.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(35, 'Après-shampoing pour Racines Grasses et Pointes Sèches', 'RFR-APIVITA-014', 12, 10, 'image_2021-08-30_003506.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(36, 'Après-shampoing pour Cheveux Clairsemés', 'RFR-APIVITA-015', 12, 10, 'image_2021-08-30_003540.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(37, 'Shampoing Hydratant', 'RFR-APIVITA-016', 10, 10, 'image_2021-08-30_003620.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(38, 'Shampoing Nourrissant & Réparateur', 'RFR-APIVITA-017', 10, 10, 'image_2021-08-30_010311.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(39, 'Shampoing Brillance & Vitalité', 'RFR-APIVITA-018', 10, 10, 'image_2021-08-30_010424.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(40, 'Shampoing pour Racines Grasses et Pointes Sèches', 'RFR-APIVITA-019', 12, 10, 'image_2021-08-30_131220.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(41, 'Shampoing Équilibrant pour Cheveux Gras', 'RFR-APIVITA-020', 12, 10, 'image_2021-08-30_131359.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(42, 'Shampoing Antipelliculaire - Pellicules Sèches', 'RFR-APIVITA-021', 12, 10, 'image_2021-08-30_132052.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(43, 'Shampoing Tonique pour Femmes', 'RFR-APIVITA-022', 12, 10, 'image_2021-08-30_132122.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(44, 'Lotion contre la Chute des Cheveux', 'RFR-APIVITA-023', 33, 10, 'image_2021-08-30_132246.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(45, 'Shampoing Tonique pour Hommes', 'RFR-APIVITA-024', 12, 10, 'image_2021-08-30_132326.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(46, 'Gel Nettoyant Intime Doux - Usage Quotidien', 'RFR-APIVITA-025', 10, 10, 'image_2021-08-30_132417.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(47, 'Mousse Nettoyante Intime Douce - Protection Sécheresse', 'RFR-APIVITA-026', 12, 10, 'image_2021-08-30_132503.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(48, 'Crème Corps Hydratante et Apaisante CARING LAVENDER', 'RFR-APIVITA-027', 13, 10, 'image_2021-08-30_132605.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(49, 'Lait Corps Hydratant REFRESHING FIG', 'RFR-APIVITA-028', 13, 10, 'image_2021-08-30_132640.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(50, 'Lait Corps Hydratant Pure Jasmin', 'RFR-APIVITA-029', 13, 10, 'image_2021-08-30_132720.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(51, 'Lait Corps Hydratant TONIC MOUNTAIN TEA', 'RFR-APIVITA-030', 13, 10, 'image_2021-08-30_132747.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(52, 'Crème Corps Hydratante Riche Royal Honey', 'RFR-APIVITA-031', 13, 10, 'image_2021-08-30_132830.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(53, 'Gel Douche Doux pour Peaux Sensibles CARING LAVENDER', 'RFR-APIVITA-032', 10, 10, 'image_2021-08-30_132942.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(54, 'Gel Douche aux Huiles Essentielles Ecopack 500ml REFRESHING FIG', 'RFR-APIVITA-033', 14, 10, 'image_2021-08-30_133021.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(55, 'Gel Douche aux Huiles Essentielles Pure Jasmin', 'RFR-APIVITA-034', 10, 10, 'image_2021-08-30_133105.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(56, 'Gel Douche aux Huiles Essentielles', 'RFR-APIVITA-035', 10, 10, 'image_2021-08-30_133145.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(57, 'Gel Douche aux Huiles Essentielles Ecopack 500ml', 'RFR-APIVITA-036', 14, 10, 'image_2021-08-30_133256.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(58, 'Gel Douche aux Huiles Essentielles', 'RFR-APIVITA-037', 10, 10, 'image_2021-08-30_133335.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(59, 'Soin des Lèvres au Beurre de Cacao ', 'RFR-APIVITA-038', 6, 10, 'image_2021-08-30_133345.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(60, 'Soin des Lèvres à la Grenade', 'RFR-APIVITA-039', 6, 10, 'image_2021-08-30_133531.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(61, 'Soin des Lèvres à la Camomille SPF15', 'RFR-APIVITA-040', 6, 10, 'image_2021-08-30_133607.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(62, 'Soin des Lèvres à la Propolis', 'RFR-APIVITA-041', 6, 10, 'image_2021-08-30_133638.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(63, 'Soin des Lèvres à la Châtaigne', 'RFR-APIVITA-042', 6, 10, 'image_2021-08-30_133713.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(64, 'Soin des Lèvres BEE PRINCESS', 'RFR-APIVITA-043', 6, 10, 'image_2021-08-30_133750.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(65, 'Soin des Lèvres au Miel', 'RFR-APIVITA-044', 6, 10, 'image_2021-08-30_133820.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(66, 'Lip Care Black Currant', 'RFR-APIVITA-045', 5, 10, 'image_2021-08-30_133845.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(67, 'Hydra Sensitive Soothing Face Cream SPF50+', 'RFR-APIVITA-046', 20, 10, 'image_2021-08-30_134723.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(68, 'Gel-Crème Hydratant', 'RFR-APIVITA-047', 20, 10, 'image_2021-08-30_134813.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(69, 'Gel Rafraîchissant et Hydratant pour les Yeux', 'RFR-APIVITA-048', 17, 10, 'image_2021-08-30_134859.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(70, 'Crème Hydratante Confort - Texture Riche', 'RFR-APIVITA-049', 20, 10, 'image_2021-08-30_134931.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(71, 'Booster Hydratant Fraîcheur', 'RFR-APIVITA-050', 23, 10, 'image_2021-08-30_135003.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(72, 'Sérum Yeux Soin Intensif', 'RFR-APIVITA-051', 36, 10, 'image_2021-08-30_140147.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(73, 'Sérum Activateur d\'Éclat et Anti-fatigue', 'RFR-APIVITA-052', 35, 10, 'image_2021-08-30_140346.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(74, 'Huile Visage Raffermissante', 'RFR-APIVITA-053', 34, 10, 'image_2021-08-30_140445.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(75, 'Crème Yeux & Lèvre Lift Rides', 'RFR-APIVITA-054', 30, 10, 'image_2021-08-30_140514.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(76, 'Crème de Nuit Lift Régénérante', 'RFR-APIVITA-055', 36, 10, 'image_2021-08-30_140543.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(77, 'Crème Lift Rides & Fermeté ', 'RFR-APIVITA-056', 36, 10, 'image_2021-08-30_140611.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(78, 'Sérum Lift Rides & Fermeté', 'RFR-APIVITA-057', 39, 10, 'image_2021-08-30_140641.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(79, 'Masque Lissant Contour des Yeux au Raisin', 'RFR-APIVITA-058', 4, 10, 'image_2021-08-30_140911.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(80, 'Masque Contour des Yeux Cernes & Signes de Fatigue au Ginkgo Biloba', 'RFR-APIVITA-059', 4, 10, 'image_2021-08-30_141009.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(83, 'Masque Visage Raffermissant & Revitalisant à la Gelée Royale', 'RFR-APIVITA-060', 5, 10, 'image_2021-08-30_141206.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(84, 'Masque Visage Lissant & Raffermissant au Raisin', 'RFR-APIVITA-061', 4, 10, 'image_2021-08-30_141248.png', '2021-08-30 23:10:22.814673', '2021-09-12 03:50:57.136999', 'RÉDUCTEUR DE RIDES ET RAFFERMISSANT, Réduit l\'apparence des ridules tout en renforçant \r\nla fermeté de la peau  avec de l\'huile de raisin et de l\'huile d\'olive\r\nHydrate et améliore l’élasticité de la peau avec de la coenzyme Q10, des vitamines A et E, de l\'acide hyaluronique et du panthénol\r\nTonifie la peau avec de l\'huile essentielle de patchouli\r\n', 'Lisse les ridules \r\nAméliore l\'élasticité de la peau \r\nRevitalise les peaux matures', 1),
(85, 'Masque Visage Radiance à l\'Orange', 'RFR-APIVITA-062', 4, 10, 'image_2021-08-30_141308.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(86, 'Masque Visage Hydratant & Anti-pollution à la Lavande de Mer', 'RFR-APIVITA-064', 4, 10, 'image_2021-08-30_141351.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(87, 'Masque Visage Hydratant & Apaisant à la Figue de Barbarie', 'RFR-APIVITA-065', 4, 10, 'image_2021-08-30_141421.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(88, 'Masque Visage Hydratant & Nourrissant au Miel', 'RFR-APIVITA-066', 4, 10, 'image_2021-08-30_141443.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(89, 'Masque Visage Hydratant et Rafraîchissant à l\'Aloe', 'RFR-APIVITA-067', 4, 10, 'image_2021-08-30_141504.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(90, 'Masque Visage Hydratation Intense au Concombre', 'RFR-APIVITA-068', 4, 10, 'image_2021-08-30_141527.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(91, 'Masque Noir Purifiant et Équilibrant à la Propolis', 'RFR-APIVITA-069', 4, 10, 'image_2021-08-30_141556.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(92, 'Masque Visage Détox à la Citrouille', 'RFR-APIVITA-070', 4, 10, 'image_2021-08-30_141623.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(93, 'Masque Visage Nettoyant Doux à l\'argile rose', 'RFR-APIVITA-071', 4, 10, 'image_2021-08-30_141648.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(94, 'Masque Visage Nettoyant Profond à l\'Argile Verte', 'RFR-APIVITA-072', 4, 10, 'image_2021-08-30_144414.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(95, 'Gommage Visage Illuminateur à la Myrtille', 'RFR-APIVITA-073', 4, 10, 'image_2021-08-30_144454.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(96, 'Gommage Visage Exfoliation Douce à l\'Abricot', 'RFR-APIVITA-074', 4, 10, 'image_2021-08-30_144556.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(97, 'Gommage Visage Exfoliation Profonde à l\'Olive', 'RFR-APIVITA-075', 4, 10, 'image_2021-08-30_144653.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(100, 'Lait Nettoyant 3 en 1 - Visage & Yeux', 'RFR-APIVITA-078', 13, 10, 'image_2021-08-30_145041.png', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061', '', '', 0),
(101, 'Mousse Onctueuse Nettoyante - Visage et Yeux', 'RFR-APIVITA-002', 13, 10, 'image_2021-08-27_220607.png', '2021-09-26 18:05:04.135331', '2021-09-28 20:56:00.490629', 'Une crème moussante nettoyante onctueuse pour le visage et les yeux.', 'Nettoie en douceur les impuretés et le maquillage sans déshydrater la peau\nElimine les impuretés et le maquillage sans dessécher la peau.\nL’olive hydrate, la propolis fournit une action antioxydante, la lavande apaise.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
CREATE TABLE IF NOT EXISTS `product_categories` (
  `productId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  PRIMARY KEY (`productId`,`categoryId`),
  KEY `IDX_6156a79599e274ee9d83b1de13` (`productId`),
  KEY `IDX_fdef3adba0c284fd103d0fd369` (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`productId`, `categoryId`) VALUES
(19, 6),
(31, 10),
(31, 11),
(84, 6),
(84, 9),
(101, 6),
(101, 7);

-- --------------------------------------------------------

--
-- Table structure for table `product_ingredients`
--

DROP TABLE IF EXISTS `product_ingredients`;
CREATE TABLE IF NOT EXISTS `product_ingredients` (
  `productId` int(11) NOT NULL,
  `ingredientId` int(11) NOT NULL,
  PRIMARY KEY (`productId`,`ingredientId`),
  KEY `IDX_0c47e7d54540edb8171ebe4e77` (`productId`),
  KEY `IDX_b40728e717eb031baa2e85371e` (`ingredientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_ingredients`
--

INSERT INTO `product_ingredients` (`productId`, `ingredientId`) VALUES
(19, 63540),
(19, 63541),
(19, 63542),
(19, 63543),
(19, 63544),
(19, 63545),
(19, 63546),
(19, 63547),
(19, 63548),
(19, 63549),
(19, 63550),
(19, 63551),
(19, 63552),
(19, 63553),
(19, 63554),
(19, 63555),
(19, 63556),
(19, 63557),
(19, 63558),
(19, 63559),
(19, 63560),
(19, 63561),
(19, 63562),
(19, 63563),
(19, 63574),
(19, 63579),
(19, 63602),
(19, 63693),
(19, 64029),
(19, 64069),
(19, 64139),
(19, 64234),
(22, 63547),
(22, 63551),
(22, 63553),
(22, 63560),
(22, 63561),
(22, 63563),
(22, 63566),
(22, 63572),
(22, 63574),
(22, 63575),
(22, 63576),
(22, 63579),
(22, 63582),
(22, 63583),
(22, 63584),
(22, 63585),
(22, 63586),
(22, 63587),
(22, 63588),
(22, 63589),
(22, 63590),
(22, 63591),
(22, 63593),
(22, 63602),
(22, 63612),
(22, 63615),
(22, 63616),
(22, 63617),
(22, 63634),
(22, 63693),
(22, 63719),
(22, 64063),
(22, 64088),
(22, 64090),
(22, 64230),
(84, 63540),
(84, 63541),
(84, 63542),
(84, 63543),
(84, 63544),
(84, 63545),
(84, 63546),
(84, 63547),
(84, 63548),
(84, 63549),
(84, 63550),
(84, 63551),
(84, 63552),
(84, 63553),
(84, 63554),
(101, 63544),
(101, 63545),
(101, 63549),
(101, 63553),
(101, 63557),
(101, 63941),
(101, 64239);

-- --------------------------------------------------------

--
-- Table structure for table `product_skin_types`
--

DROP TABLE IF EXISTS `product_skin_types`;
CREATE TABLE IF NOT EXISTS `product_skin_types` (
  `productId` int(11) NOT NULL,
  `skinTypeId` int(11) NOT NULL,
  PRIMARY KEY (`productId`,`skinTypeId`),
  KEY `IDX_fd51b2a8be5a143ef5ea8741aa` (`productId`),
  KEY `IDX_55d58aeaae7b4e97a1c6cfbfde` (`skinTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_skin_types`
--

INSERT INTO `product_skin_types` (`productId`, `skinTypeId`) VALUES
(19, 1),
(19, 4),
(84, 1),
(101, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_type`
--

DROP TABLE IF EXISTS `product_type`;
CREATE TABLE IF NOT EXISTS `product_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TypeName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_type`
--

INSERT INTO `product_type` (`id`, `TypeName`, `Image`) VALUES
(1, 'Bio', 'bio.png'),
(2, 'Vegan', 'vegan.png'),
(3, 'Naturelle', 'neturelle.png'),
(4, 'Sans allergènes', 'antibacterial.png'),
(5, 'Eco', 'eco.png'),
(6, 'Organique', 'organic.png');

-- --------------------------------------------------------

--
-- Table structure for table `product_types`
--

DROP TABLE IF EXISTS `product_types`;
CREATE TABLE IF NOT EXISTS `product_types` (
  `productId` int(11) NOT NULL,
  `productTypeId` int(11) NOT NULL,
  PRIMARY KEY (`productId`,`productTypeId`),
  KEY `IDX_6ee30c7f441b25c11565219327` (`productId`),
  KEY `IDX_55f9f57084243c545466ea7ffa` (`productTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_types`
--

INSERT INTO `product_types` (`productId`, `productTypeId`) VALUES
(19, 1),
(22, 3),
(23, 3),
(24, 3),
(26, 3),
(27, 3),
(28, 3),
(31, 3),
(32, 3),
(33, 3),
(34, 3),
(35, 3),
(36, 3),
(37, 3),
(38, 3),
(39, 3),
(40, 3),
(41, 3),
(42, 3),
(43, 3),
(44, 3),
(45, 3),
(46, 3),
(47, 3),
(48, 3),
(49, 3),
(50, 3),
(51, 3),
(52, 3),
(53, 3),
(54, 3),
(55, 3),
(56, 3),
(57, 3),
(58, 3),
(59, 3),
(60, 3),
(61, 3),
(62, 3),
(63, 3),
(64, 3),
(65, 3),
(66, 3),
(67, 3),
(68, 3),
(69, 3),
(70, 3),
(71, 3),
(72, 3),
(73, 3),
(74, 3),
(75, 3),
(76, 3),
(77, 3),
(78, 3),
(79, 3),
(80, 3),
(83, 3),
(84, 3),
(85, 3),
(86, 3),
(87, 3),
(88, 3),
(89, 3),
(90, 3),
(91, 3),
(92, 3),
(93, 3),
(94, 3),
(95, 3),
(96, 3),
(97, 3),
(100, 3),
(101, 3),
(101, 4);

-- --------------------------------------------------------

--
-- Table structure for table `skin`
--

DROP TABLE IF EXISTS `skin`;
CREATE TABLE IF NOT EXISTS `skin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SkinDescription` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SkinType` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Nature` float NOT NULL,
  `Hydratation` float NOT NULL,
  `Imperfection` float NOT NULL,
  `Sensitivity` float NOT NULL,
  `Eclat` float NOT NULL,
  `AntiAge` float NOT NULL,
  `clientId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `REL_2f6dd0a991d4c92bb116d87288` (`clientId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `skin`
--

INSERT INTO `skin` (`id`, `SkinDescription`, `SkinType`, `Nature`, `Hydratation`, `Imperfection`, `Sensitivity`, `Eclat`, `AntiAge`, `clientId`) VALUES
(2, 'Text SkinDescription', 'NORMAL', 10, 10, 10, 10, 10, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `skin_type`
--

DROP TABLE IF EXISTS `skin_type`;
CREATE TABLE IF NOT EXISTS `skin_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SkinTypeName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `skin_type`
--

INSERT INTO `skin_type` (`id`, `SkinTypeName`) VALUES
(1, 'NORMAL'),
(2, 'OILED'),
(3, 'MIXED'),
(4, 'SEC'),
(5, 'SENSITIVE');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `allergy`
--
ALTER TABLE `allergy`
  ADD CONSTRAINT `FK_2938ccfb01aafc7a4cb873733d6` FOREIGN KEY (`clientId`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `client_favoris`
--
ALTER TABLE `client_favoris`
  ADD CONSTRAINT `FK_3c8830d36dbad089cfce5e47333` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_bdc7e8edd75a40badfd09268019` FOREIGN KEY (`clientId`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `FK_e99f8e5bcbccaec7b0b7ed65526` FOREIGN KEY (`clientId`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `FK_82a25a3a3cca8f81d3ee504950e` FOREIGN KEY (`clientId`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_91cbaf9b336a0ceeddeea41e18b` FOREIGN KEY (`consultedProductId`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `history_consulted`
--
ALTER TABLE `history_consulted`
  ADD CONSTRAINT `FK_aa6b562581938f6877f0da9ed00` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_eff96273d9ff6d25bb8ecf55e6c` FOREIGN KEY (`historyId`) REFERENCES `history` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ingredient_trigered_allergy`
--
ALTER TABLE `ingredient_trigered_allergy`
  ADD CONSTRAINT `FK_3cd89b9df91acbd18282c069310` FOREIGN KEY (`ingredientId`) REFERENCES `ingredient` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_caec7456092b03523b9e59c90dd` FOREIGN KEY (`allergyId`) REFERENCES `allergy` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `FK_d9bd2aaeb3d9540983be4ca9e7b` FOREIGN KEY (`clientId`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `FK_6156a79599e274ee9d83b1de139` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_fdef3adba0c284fd103d0fd3697` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_ingredients`
--
ALTER TABLE `product_ingredients`
  ADD CONSTRAINT `FK_0c47e7d54540edb8171ebe4e775` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_b40728e717eb031baa2e85371ea` FOREIGN KEY (`ingredientId`) REFERENCES `ingredient` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_skin_types`
--
ALTER TABLE `product_skin_types`
  ADD CONSTRAINT `FK_55d58aeaae7b4e97a1c6cfbfdef` FOREIGN KEY (`skinTypeId`) REFERENCES `skin_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_fd51b2a8be5a143ef5ea8741aa6` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_types`
--
ALTER TABLE `product_types`
  ADD CONSTRAINT `FK_55f9f57084243c545466ea7ffa1` FOREIGN KEY (`productTypeId`) REFERENCES `product_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_6ee30c7f441b25c115652193272` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `skin`
--
ALTER TABLE `skin`
  ADD CONSTRAINT `FK_2f6dd0a991d4c92bb116d872884` FOREIGN KEY (`clientId`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
