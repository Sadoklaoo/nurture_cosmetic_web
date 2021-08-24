-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 24 août 2021 à 00:07
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `nurturecosmeticdb`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
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
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id`, `firstName`, `lastName`, `email`, `phoneNumber`, `birthDate`, `password`, `verified`, `createdAt`, `updatedAt`, `role`, `sexe`) VALUES
(1, 'Sadok', 'Laouissi', 'Sadok.laouissi.sl@gmail.com', 22525791, NULL, '$2a$08$dS3TdjjtBz8hDPIYaFM5NuVzknIqz1Avx.oDhluiUwRzBfVZ6xYma', 0, '2021-06-09 11:34:56.489978', '2021-07-13 09:59:32.084196', 'ADMIN', 'Homme');

-- --------------------------------------------------------

--
-- Structure de la table `allergy`
--

DROP TABLE IF EXISTS `allergy`;
CREATE TABLE IF NOT EXISTS `allergy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AllergyName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `clientId` int(11) DEFAULT NULL,
  `Image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2938ccfb01aafc7a4cb873733d6` (`clientId`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `allergy`
--

INSERT INTO `allergy` (`id`, `AllergyName`, `clientId`, `Image`) VALUES
(30, 'Antioxydants', NULL, 'antioxydants.png'),
(31, 'Biocides', NULL, 'biocides.png'),
(32, 'Glycérines', NULL, 'glycerine.png'),
(33, 'Honey', NULL, 'honey.png'),
(34, 'Sheep', NULL, 'sheep.png'),
(35, 'Ultra-violet', NULL, 'uv.png'),
(42, 'Fragences', NULL, 'fragences.png'),
(43, 'Fragences', 1, 'fragences.png'),
(44, 'Botox', NULL, '940830_1705958393023849_4112646484217962005_n.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_ca5ac91f23ecb0530eaeb5dcd9` (`CategoryName`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `CategoryName`, `Image`) VALUES
(1, 'Soins de la peau', 'skin_logo.png'),
(2, 'Makeup', 'cosmetics.png');

-- --------------------------------------------------------

--
-- Structure de la table `client`
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `firstName`, `lastName`, `email`, `phoneNumber`, `birthDate`, `password`, `verified`, `createdAt`, `updatedAt`, `role`, `sexe`, `requestCode`, `requestCodeEndDate`, `notificationToken`) VALUES
(1, 'Sadok', 'Laouissi', 'Sadok.laouissi@esprit.tn', 55535858, '2021-08-20 00:00:00', '$2a$08$RUpetS5xIhE4j0Vflp4gKOdexHgAlfy4eex2VzAlAhsbUxfOdBMTK', 1, '2021-06-08 16:07:59.597393', '2021-08-20 17:09:41.000000', 'CLIENT', 'HOMME', NULL, '2021-06-08 17:57:40', '7996'),
(4, 'Sadok', 'Laouissi', 'Sadok@esprit.tn', 22525791, '1996-09-19 00:00:00', '$2a$08$oLASs.UAglmugE7gdvpRIuK/J9t0OR5zXAnGbLWrTN08.dfLNlZx6', 0, '2021-07-13 10:10:32.851046', '2021-07-15 18:23:45.171112', 'CLIENT', 'HOMME', NULL, NULL, NULL),
(6, 'Laouissi', 'Sadok', 'sadokl@esprit.tn', NULL, '2021-08-08 00:00:00', '$2a$08$BFPAyhbp3UTtwNlp3Ye08O6leKaqv1yKdujrpJx6H71BPIZB/60sW', 0, '2021-08-22 05:01:39.357425', '2021-08-22 05:01:39.357425', 'CLIENT', 'HOMME', NULL, NULL, NULL),
(8, 'laouissi', 'sadok', 'saduyo@test.tn', NULL, '2021-08-09 00:00:00', '$2a$08$OMHsrf35dE72YHaiG2qFTePK6oiVSzBbDvd3Kb1MHpy/dv2BIyh5m', 0, '2021-08-22 05:03:30.963058', '2021-08-22 05:03:30.963058', 'CLIENT', 'HOMME', NULL, NULL, NULL),
(44, 'laouissi', 'sadok', 'sadok.sl@gmail.com', 55555555, '2021-05-03 00:00:00', '$2a$08$88wZUAXs7bu0nP/z9UgKNumZBf7.l4BwFoqo.xljYxH.vQrjec6jq', 1, '2021-08-22 08:22:02.046796', '2021-08-22 08:23:25.000000', 'CLIENT', 'HOMME', NULL, '2021-08-22 09:23:13', NULL),
(45, 'sadok', 'sadok', 'sadoksadok@sadok.tn', 55535858, '2021-08-02 00:00:00', '$2a$08$SGmvtHSR3bP0b.Ne6XKsyurGSaI8vNlhmdseXZjx0QDybrp72QPQG', 1, '2021-08-22 08:31:21.002936', '2021-08-22 08:31:50.000000', 'CLIENT', 'HOMME', NULL, '2021-08-22 09:31:34', NULL),
(46, 'sadok', 'sadok', 'sadok@espriiiiit.tn', 55555555, '2016-08-01 00:00:00', '$2a$08$2bNtH2BGPHqqT4oGEwf1C..mhDb0NTE7iemkbg1NyYYmwg8TEw3NK', 1, '2021-08-22 08:36:26.480031', '2021-08-22 08:36:44.000000', 'CLIENT', 'HOMME', NULL, '2021-08-22 09:36:32', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `client_favoris`
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
-- Déchargement des données de la table `client_favoris`
--

INSERT INTO `client_favoris` (`clientId`, `productId`) VALUES
(1, 17),
(1, 18);

-- --------------------------------------------------------

--
-- Structure de la table `contact`
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`id`, `message`, `date`, `clientId`, `type`, `rate`, `status`) VALUES
(1, 'Probleme de connection', '2021-07-13 11:40:40.680558', 1, 'Bug', 10, 'RESOLVED'),
(2, 'Allergy Manquante', '2021-07-13 11:40:40.680558', 4, 'Bug', 10, 'RESOLVED');

-- --------------------------------------------------------

--
-- Structure de la table `history`
--

DROP TABLE IF EXISTS `history`;
CREATE TABLE IF NOT EXISTS `history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SearchString` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `clientId` int(11) DEFAULT NULL,
  `consultedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `FK_82a25a3a3cca8f81d3ee504950e` (`clientId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `history`
--

INSERT INTO `history` (`id`, `SearchString`, `clientId`, `consultedAt`) VALUES
(5, 'Test', 1, '2021-07-13 09:52:22.231697'),
(6, 'sss', 1, '2021-07-13 09:53:00.899267'),
(7, 'cream', 1, '2021-07-13 09:53:52.775741');

-- --------------------------------------------------------

--
-- Structure de la table `history_consulted`
--

DROP TABLE IF EXISTS `history_consulted`;
CREATE TABLE IF NOT EXISTS `history_consulted` (
  `historyId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  PRIMARY KEY (`historyId`,`productId`),
  KEY `IDX_eff96273d9ff6d25bb8ecf55e6` (`historyId`),
  KEY `IDX_aa6b562581938f6877f0da9ed0` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `history_consulted`
--

INSERT INTO `history_consulted` (`historyId`, `productId`) VALUES
(5, 18),
(7, 17),
(7, 18);

-- --------------------------------------------------------

--
-- Structure de la table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
CREATE TABLE IF NOT EXISTS `ingredient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `IngredientName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `IngredientType` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `ingredient`
--

INSERT INTO `ingredient` (`id`, `IngredientName`, `IngredientType`) VALUES
(2, 'Ingredient 1', 'NORMAL'),
(4, 'Ingredient 2', 'LOW'),
(5, 'Ingredient 3', 'HIGH'),
(6, 'Ingredient 4', 'LOW'),
(7, 'Ingredient 5', 'HIGH');

-- --------------------------------------------------------

--
-- Structure de la table `ingredient_trigered_allergy`
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
-- Déchargement des données de la table `ingredient_trigered_allergy`
--

INSERT INTO `ingredient_trigered_allergy` (`ingredientId`, `allergyId`) VALUES
(2, 31),
(2, 33),
(2, 34),
(2, 44),
(4, 30),
(4, 31),
(4, 32),
(4, 33),
(4, 34),
(4, 35),
(4, 44),
(5, 30),
(5, 31),
(5, 32),
(5, 35),
(5, 42),
(5, 44),
(6, 30),
(6, 31),
(6, 32),
(6, 33);

-- --------------------------------------------------------

--
-- Structure de la table `notification`
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
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Price` float NOT NULL,
  `Rank` float NOT NULL,
  `Image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ProductDimensions` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PreferedSkinType` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `ProductDescription` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ProductSecondDescription` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_3e6ab09ae0f5e9d98fec19e63e` (`Reference`),
  KEY `FK_ff0c0301a95e517153df97f6812` (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `ProductName`, `Reference`, `Price`, `Rank`, `Image`, `ProductDimensions`, `PreferedSkinType`, `categoryId`, `ProductDescription`, `ProductSecondDescription`) VALUES
(9, 'SCANDAL', 'RFR-035', 150, 18, 'scandal.jpg', '10x2x3', 'NORMAL', NULL, 'L\'au de parfum Scandal, c\'est l’incarnation de la fémininité Jean Paul Gaultier ; une parisienne élégante, festive et sexy qui s\'encanaille dans les quartiers sulfureux de Paris.\r\nLe parfum Scandal, c’est un flacon de verre très chic. Le jus est rose, féminin, intime et poudré.', 'Mais surtout : ça fait 20 ans que les parfums Jean Paul Gaultier n\'ont que des bustes. Pour ceux qui se demandaient où étaient passées les jambes…Eh bien les voici ! Jean Paul Gaultier sait faire scandale en restant lui-même.\r\nEncore et toujours la boite de conserve la plus culte du monde. Mais cette fois-ci, recouverte d\'un velours rose qui l’habille d’élégance.'),
(17, 'ICON ROSES', 'RFR-043', 120, 18, 'icon_roses.png', '10x2x3', 'NORMAL', 1, 'Icon Roses de Ga-De est un parfum pour femme. Les notes de tête sont Baie rose, Pamplemousse, Tangerine et Bergamote; les notes de coeur sont Rose, Feuille de violette, Grenade et Jasmin; les notes de fond sont Musc, Patchouli, Fève de tonka, Vanille, Ambre et Vétiver.', 'Icon Roses de Ga-De est un parfum pour femme. Les notes de tête sont Baie rose, Pamplemousse, Tangerine et Bergamote; les notes de coeur sont Rose, Feuille de violette, Grenade et Jasmin; les notes de fond sont Musc, Patchouli, Fève de tonka, Vanille, Ambre et Vétiver.'),
(18, 'Dior SAUVAGE', 'RFR-044', 330, 20, 'dior.jpg', 'sdfsdfsdf', 'NORMAL', 1, 'Pour créer Sauvage Eau de Parfum, François Demachy, Parfumeur-Créateur Dior, s\'est inspiré du désert à l\'heure magique du crépuscule : croisant la fraîcheur de la nuit, l’air brûlant du désert exhale des odeurs profondes.\r\n\r\nL\'eau de parfum Sauvage est ainsi l\'interprétation olfactive d\'un instant teinté d\'un bleu dense qui libère les instincts les plus sauvages. À l’heure où les loups sortent et le ciel s’embrase, une nouvelle magie se déploie.', 'Sauvage Eau de Parfum associe à la fraîcheur d\'une note bergamote de Calabre juteuse et épicée la sensualité d\'un accord d\'absolu vanille de Papouasie-Nouvelle-Guinée, mystérieux et enveloppant. La fragrance déploie ainsi un sillage puissant et noble.');

-- --------------------------------------------------------

--
-- Structure de la table `product_ingredients`
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
-- Déchargement des données de la table `product_ingredients`
--

INSERT INTO `product_ingredients` (`productId`, `ingredientId`) VALUES
(9, 4),
(9, 5),
(9, 6),
(17, 2),
(17, 4),
(18, 2),
(18, 4);

-- --------------------------------------------------------

--
-- Structure de la table `product_type`
--

DROP TABLE IF EXISTS `product_type`;
CREATE TABLE IF NOT EXISTS `product_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TypeName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `product_type`
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
-- Structure de la table `product_types`
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
-- Déchargement des données de la table `product_types`
--

INSERT INTO `product_types` (`productId`, `productTypeId`) VALUES
(17, 1),
(17, 2),
(17, 3),
(17, 4),
(17, 5),
(17, 6);

-- --------------------------------------------------------

--
-- Structure de la table `skin`
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
-- Déchargement des données de la table `skin`
--

INSERT INTO `skin` (`id`, `SkinDescription`, `SkinType`, `Nature`, `Hydratation`, `Imperfection`, `Sensitivity`, `Eclat`, `AntiAge`, `clientId`) VALUES
(2, 'Text SkinDescription', 'NORMAL', 10, 10, 10, 10, 10, 10, 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `allergy`
--
ALTER TABLE `allergy`
  ADD CONSTRAINT `FK_2938ccfb01aafc7a4cb873733d6` FOREIGN KEY (`clientId`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `client_favoris`
--
ALTER TABLE `client_favoris`
  ADD CONSTRAINT `FK_3c8830d36dbad089cfce5e47333` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_bdc7e8edd75a40badfd09268019` FOREIGN KEY (`clientId`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `FK_e99f8e5bcbccaec7b0b7ed65526` FOREIGN KEY (`clientId`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `FK_82a25a3a3cca8f81d3ee504950e` FOREIGN KEY (`clientId`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `history_consulted`
--
ALTER TABLE `history_consulted`
  ADD CONSTRAINT `FK_aa6b562581938f6877f0da9ed00` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_eff96273d9ff6d25bb8ecf55e6c` FOREIGN KEY (`historyId`) REFERENCES `history` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `ingredient_trigered_allergy`
--
ALTER TABLE `ingredient_trigered_allergy`
  ADD CONSTRAINT `FK_3cd89b9df91acbd18282c069310` FOREIGN KEY (`ingredientId`) REFERENCES `ingredient` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_caec7456092b03523b9e59c90dd` FOREIGN KEY (`allergyId`) REFERENCES `allergy` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `FK_d9bd2aaeb3d9540983be4ca9e7b` FOREIGN KEY (`clientId`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_ff0c0301a95e517153df97f6812` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `product_ingredients`
--
ALTER TABLE `product_ingredients`
  ADD CONSTRAINT `FK_0c47e7d54540edb8171ebe4e775` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_b40728e717eb031baa2e85371ea` FOREIGN KEY (`ingredientId`) REFERENCES `ingredient` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `product_types`
--
ALTER TABLE `product_types`
  ADD CONSTRAINT `FK_55f9f57084243c545466ea7ffa1` FOREIGN KEY (`productTypeId`) REFERENCES `product_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_6ee30c7f441b25c115652193272` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `skin`
--
ALTER TABLE `skin`
  ADD CONSTRAINT `FK_2f6dd0a991d4c92bb116d872884` FOREIGN KEY (`clientId`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
