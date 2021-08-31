-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 31 août 2021 à 09:12
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
(43, 'Fragences', 1, 'fragences.png');

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `category`
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
(1, 19);

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

-- --------------------------------------------------------

--
-- Structure de la table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
CREATE TABLE IF NOT EXISTS `ingredient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `IngredientName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `IngredientType` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_2991db847769730f3ec8355ad7` (`IngredientName`)
) ENGINE=InnoDB AUTO_INCREMENT=64241 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `ingredient`
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
(63550, 'Huile de Fruit de Juniperus Communis (Genévrier)*', 'NORMAL'),
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
(64236, 'Geraniol', 'LOW');

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
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_3e6ab09ae0f5e9d98fec19e63e` (`Reference`),
  KEY `FK_ff0c0301a95e517153df97f6812` (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `ProductName`, `Reference`, `Price`, `Rank`, `Image`, `ProductDimensions`, `PreferedSkinType`, `categoryId`, `ProductDescription`, `ProductSecondDescription`, `createdAt`, `updatedAt`) VALUES
(19, 'Gel Purifiant - Visage', 'RFR-APIVITA-001', 13, 10, 'image_2021-08-26_190908.png', '1x3x5', 'MIXED', 6, 'Un gel nettoyant pour peaux grasses à mixtes.', 'Nettoie efficacement la peau sans irriter \nRégule l’excès de sébum et procure une action antiseptique\nPrévient l\'acné et tonifie la peau \nAvec 3 Huiles essentielles procure une action antibactérienne, tout en stimulant l’humeur et en apai', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(20, 'Mousse Onctueuse Nettoyante - Visage et Yeux', 'RFR-APIVITA-002', 13, 10, 'image_2021-08-27_220612.png', '1x3x5', 'NORMAL', 6, 'Une crème moussante nettoyante onctueuse pour le visage et les yeux.', 'Nettoie en douceur les impuretés et le maquillage sans déshydrater la peau.\nElimine les impuretés et le maquillage sans dessécher la peau.\nL’olive hydrate, la propolis fournit une action antioxydante, la lavande apaise.', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(22, 'Eau Micellaire Nettoyante - Visage & Yeux', 'RFR-APIVITA-003', 13, 10, 'image_2021-08-27_220830.png', '1x3x5', 'NORMAL', 6, 'L’eau micellaire est un grand nettoyant quotidien. Il nettoie et hydrate en même temps, laissant la peau confortable et protégée contre la pollution.\n', 'Pour le visage et les yeux.\nFacile à utiliser .\nÉlimine le maquillage et les impuretés en un seul geste. \nApaise et laisse la peau propre et confortable avec le miel de thym grec et l’infusion de fruits de rose sauvages. \nOffre une action anti-pollution supplémentaire.\n', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(23, 'Gel Nettoyant Noir– Visage & Yeux', 'RFR-APIVITA-004', 12, 10, 'image_2021-08-27_220937.png', '1x3x5', 'NORMAL', 6, 'Détoxifiant • Nettoyant • Antipollution\n', 'Détoxifie avec du charbon activé et de l’extrait de propolis breveté.\nLaisse la peau fraîche et confortable avec le panthénol.\nOffre une action anti-pollution supplémentaire\n', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(24, 'Lait Nettoyant Doux - Yeux', 'RFR-APIVITA-005', 12, 10, 'image_2021-08-27_221028.png', '1x3x5', 'NORMAL', 6, 'Un Démaquillant doux pour les yeux et les lèvres Sans parfum et testé sous contrôle ophtalmologique\n', 'Élimine en douceur le maquillage des yeux sans frotter.\nProtège des irritations et apaise la peau sensible du contour des yeux .\nHydrate et adoucit le contour des yeux.\nFournit une protection antioxydante avec une infusion de 3 espèces de thé bio  des montagnes grecques.', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(26, 'Crème Mains Peaux Sèches et Abîmées - Texture Concentrée', 'RFR-APIVITA-007', 8, 10, 'image_2021-08-27_230549.png', '1x3x5', 'NORMAL', 16, 'HYPERICUM ET CIRE D’ABEILLE\nAide à réparer les mains sèches et gercées / Soigne les fissures \net améliore la texture de la peau / Soulage instantanément la \nsensation d\'inconfort\nRestaure l\'hydratation perdue, hydrate intensément\nOffre une protection antioxydante\nLaisse les mains douces et confortables\nTESTÉ SOUS CONTRÔLE DERMATOLOGIQUE\n', 'Répare les mains sèches et soigne les gerçures grâce à l\'extrait d\'hypericum bio et à la cire d\'abeille bio\nAméliore la texture de la peau et soulage instantanément la sensation d\'inconfort grâce à l\'extrait de lavande, au beurre de karité, à la vitamine E et A.\nOffre une protection antioxydante grâce à l\'infusion brevetée d’une combinaison de 3 espèces de sidérite et de propolis\nRestaure l\'hydratation de la peau, laisse les mains douces et souples grâce à l\'huile d\'olive grecque bio, la glycérine et le panthénol.\nIdéal pour les mains fréquemment exposées au froid, au travail manuel et aux détergents.', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(27, 'Crème Mains Hydratation Intense - Texture Riche', 'RFR-APIVITA-008', 18, 10, 'image_2021-08-27_230643.png', '1x3x5', 'NORMAL', 16, 'La Crème Hydratation Intense préserve les mains naturellement hydratées, tout en nourrissant et en protégeant la peau.\nHydrate et nourrit intensément \nProtège la peau - Aide à prévenir les irritations\nOffre une protection antioxydante\nLaisse les mains douces et souples\n', 'Hydrate la peau grâce à un complexe à base d\'acide hyaluronique, de jus d\'aloe vera bio, d\'huile d\'olive grecque bio et de panthénol\nProtège la peau et aide à prévenir les irritations grâce à la cire d\'abeille bio et au beurre de karité\nOffre une protection antioxydante grâce à l\'infusion brevetée d’une combinaison de 3 espèces de sidérite et de propolis\nLaisse les mains douces et veloutées grâce au miel de thym, à l\'huile d\'avocat et à l\'huile essentielle d\'orange\nSa texture riche est facilement absorbée\n', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(28, 'Crème Mains Hydratante - Texture Légère', 'RFR-APIVITA-009', 8, 10, 'image_2021-08-27_230704.png', '1x3x5', 'NORMAL', 16, 'Crème hydratante qui préserve l\'hydratation naturelle des mains et des ongles, tout en laissant la peau douce et légèrement parfumée aux notes de jasmin.\nNourrit et renforce la peau et les ongles\nOffre une protection antioxydante\nLaisse les mains douces et légèrement  parfumées', 'Hydrate la peau, tout en préservant l\'hydratation naturelle des mains grâce au jus d\'aloe vera bio et à l\'huile d\'olive bio\nNourrit et fortifie la peau et les ongles grâce au beurre de cacao, à l\'huile d\'avocat, à la biotine, à la vitamine E et au panthénol.\nOffre une protection antioxydante grâce à l\'infusion brevetée d\'une combinaison de 3 espèces de sidérite et de propolis \nLaisse les mains douces, légèrement parfumées grâce au miel de thym et à l\'huile essentielle de jasmin\nTexture légère facilement absorbée, sans laisser de traces de gras.\n', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(31, 'Après-shampoing Hydratant', 'RFR-APIVITA-010', 12, 10, 'image_2021-08-27_230909.png', '1x3x5', 'NORMAL', 17, 'Conditionneur hydratant pour tous les types de cheveux avec l’acide hyaluronique - aloès \n• Hommes et femmes \n• Tous les types de cheveux\n• Ceux qui ont besoin d’un traitement intensif d’hydratation\n• Cheveux crépus\nMode :\n• Hydratation profonde\n• Hydratation intensive\n• Cheveux doux, brillants et élastiques\nCe qu’il fait et comment :\n• Offre une hydratation intensive en profondeur, attire et lie l’humidité à l’intérieur des cheveux, avec de l’acide hyaluronique \nhydrolysé (attire et retient jusqu’à 1000 fois son poids en humidité), l’aloès organique, les protéines d’avoine et le miel de thym\n• Rend les cheveux faciles à peigner, réduit l’effet frisottis, laissant les cheveux légers, élastiques et disciplinés avec la vitamine E, \nl’huile d’olive grecque biologique \n• Offre une protection antioxydant, revitalise et tonifie avec infusion de romarin biologique grec au lieu de l’eau', 'Hydrate intensément en rétablissant les niveaux d\'hydratation à l\'intérieur de la fibre capillaire, grâce à l\'acide hyaluronique, à l\'extrait d\'aloès, au miel de thym et aux protéines d\'avoine.\nApporte une protection antioxydante et laisse les cheveux pleins de vitalité  grâce aux extraits de romarin, de sauge et de propolis.\nPrévient la casse et les pointes fourchues, tout en protégeant des agressions extérieures (pollution de l\'air et coiffage), grâce au Complexe APISHIELD HS.\nFacilite le coiffage et réduit les frisottis, tout en laissant les cheveux extrêmement doux et souples.\n', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(32, 'Huile Capillaire Rescue ', 'RFR-APIVITA-011', 22, 10, 'image_2021-08-27_231127.png', '1x3x5', 'NORMAL', 18, 'TRAITEMENT SPÉCIAL\nNourrit et répare les cheveux abîmés, tout en  protégeant des cassures et des pointes fourchues.\nProtège les cheveux des traitements thermiques  (sèche-cheveux).\nIdéal pour les cheveux abîmés, bouclés et  indisciplinés, les pointes sèches.', '• Nourrit en profondeur et aide à réparer les dommages grâce aux huiles d\'argan, d\'olive, d\'amande, de tournesol et d\'avoine.\n\n• Empêche la casse et les pointes fourchues, tout en aidant à protéger les cheveux du coiffage à la chaleur grâce à l\'huile de graines de Plukenetia Volubilis.\n\n• Restaure la douceur et la souplesse, réduit les frisottis et discipline les cheveux, les laissant sains et brillants avec un parfum agréable.\n\n• Détend et revitalise grâce aux huiles essentielles de géranium bio, de bergamote, de lavande et de bois de santal et de la cire d\'abeille absolue.\n\n• Il peut être utilisé soit comme traitement de pré-shampooing intensif, soit après le shampooing sur cheveux humides.', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(33, 'Après-shampoing Nourrissant et Réparateur ', 'RFR-APIVITA-012', 12, 10, 'image_2021-08-27_231304.png', '1x3x5', 'SEC', 17, 'Nourrit et répare, laissant les cheveux \nbrillants, élastiques et faciles à coiffer. \nPrévient les frisottis. avec de l\'huile d\'olive et d\'amande, de la  protéines de blé, 4 vitamines, de l’huile de \nPlukenetia, de l’aloès, du miel\n', 'Nourrit, restaure et reconstruit les cheveux en profondeur grâce aux huiles d\'olive, d\'amande et de blé bio ainsi qu\'aux protéines et vitamines de blé.\nHydrate, augmente l\'élasticité et réduit les frisottis grâce à l\'huile de graines de Plukenetia Volubilis, à l\'aloe et au miel de thym.\nPrévient la casse et les pointes fourchues, tout en protégeant des agressions extérieures (pollution de l\'air et coiffage), grâce au complexe APISHIELD HS.\nLaisse les cheveux doux, souples et faciles à coiffer.\n\n', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(34, 'Après-shampoing Brillance & Vitalité ', 'RFR-APIVITA-013', 12, 10, 'image_2021-08-30_002858.png', '1x3x5', 'NORMAL', 17, 'Hydrate en offrant brillance et vitalité aux \ncheveux sans les alourdir. \nProtège les cheveux du vieillissement  prématuré et des agressions environnementales.\nAvec de l\'huile d\'olive, 5 vitamines, des huiles  essentielles d\'orange, de citron, de  pamplemousse, de l’extrait de sidérite et de  lavande.\n', 'Hydrate et laisse les cheveux éclatants de brillance et de vitalité grâce aux vitamines et aux huiles essentielles revitalisantes d\'orange, de citron et de pamplemousse.\nPrévient la casse et les pointes fourchues, tout en protégeant des agressions extérieures (pollution de l\'air et coiffage) grâce à l\'extrait antioxydant de thé de montagne et au Complexe APISHIELD HS.\nLaisse les cheveux doux et faciles à coiffer, grâce à l\'huile d\'olive biologique et au miel de thym grec.\n', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(35, 'Après-shampoing pour Racines Grasses et Pointes Sèches', 'RFR-APIVITA-014', 12, 10, 'image_2021-08-30_003506.png', '1x3x5', 'NORMAL', 17, 'Après-shampooing aux propriétés équilibrantes \nde sébum.\nLes cheveux deviennent doux et faciles à  coiffer sans \nperdre de volume.\nAux orties, miel de thym grec, protéines de blé hydrolysées, plukenetia volubilis, huiles essentielles de sauge sclarée et  de pamplemousse.\nConsignes d\'utilisation :\nAppliquer sur cheveux mouillés (après le \nshampooing).\nPasser vos doigts entre les cheveux jusqu\'à ce \nqu\'ils soient démêlés et rincer abondamment.', 'Nourrit et équilibre les cheveux aux racines grasses, grâce aux extraits d\'ortie et de propolis.\nHydrate intensément et répare les pointes sèches et abîmées, grâce au miel de thym et aux protéines de blé. \nEmpêche la casse et les pointes fourchues, tout en protégeant des agressions extérieures (pollution de l\'air et coiffage), grâce au complexe APISHIELD HS.\nLaisse les cheveux doux, pleins de volume et faciles à coiffer.', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(36, 'Après-shampoing pour Cheveux Clairsemés', 'RFR-APIVITA-015', 12, 10, 'image_2021-08-30_003540.png', '1x3x5', 'NORMAL', 17, 'L\'après shampooing tonique pour des cheveux\nlisses et faciles à coiffer avec du volume et de la résistance\n', 'Revigore et aide à rendre les cheveux plus forts et plus sains, grâce au Complexe Hippophae TC et aux protéines de lupin.\nHydrate et nourrit en offrant brillance et douceur grâce au laurier, au miel de thym et à l\'huile d\'olive grecque.\nProtège des dommages externes (pollution et coiffage), prévient les cassures et les pointes fourchues, grâce à l\'APISHIELD HS.\nApporte du volume aux cheveux et les rend faciles à coiffer.\nN\'alourdit pas les cheveux.\nRevitalise les cheveux et ravive l\'humeur grâce à une combinaison spéciale d\'huiles essentielles bio de laurier, romarin, lavande, sauge et néroli.', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(37, 'Shampoing Hydratant', 'RFR-APIVITA-016', 10, 10, 'image_2021-08-30_003620.png', '1x3x5', 'NORMAL', 19, 'Pour tous les types de cheveux - idéalement recommandé aux clients avec les cheveux crépus \n• Hydratant\n• Contrôle des cheveux crépus\nOffre une hydratation intensive, attire et lie l’hydratation à l’intérieur des cheveux, avec de l’acide hyaluronique , IL \ncontient aussi l’aloès , des protéines d’avoine et du panthenol\nAdoucit les cheveux et offre de l’élasticité avec du miel de thym grec\nProtège les pointes fourchues, des dommages et les effets externes (pollution, coiffage) avec le complexe naturel (7 \noligosaccharides du miel de coton,\nStimule et revitalise les cheveux et le cuir chevelu offrant une protection antioxydant, avec infusion de romarin biologique \ngrec au lieu de l’eau\ncontient des huiles essentielles de géranium et de rose', 'Nettoie en douceur les cheveux et respecte la flore naturelle du cuir chevelu.\nOffre une hydratation intense en rétablissant les niveaux d\'hydratation à l\'intérieur de la fibre capillaire, grâce à l\'acide hyaluronique, l\'extrait d\'aloès, le miel de thym et les protéines d\'avoine.\nOffre une protection antioxydante et laisse les cheveux pleins de vitalité grâce aux extraits de romarin et de propolis.\nEmpêche les pointes fourchues et protège des agressions extérieures (pollution de l\'air et coiffage) avec le Complexe APISHIELD HS.\nLaisse les cheveux légers et lisses, tout en éliminant les frisottis.', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(38, 'Shampoing Nourrissant & Réparateur', 'RFR-APIVITA-017', 10, 10, 'image_2021-08-30_010311.png', '1x3x5', 'NORMAL', 19, 'Pour tous les types de cheveux - idéalement recommandé aux clients avec les cheveux crépus \n• Hydratant\n• Contrôle des cheveux crépus\nOffre une hydratation intensive, attire et lie l’hydratation à l’intérieur des cheveux, avec de l’acide hyaluronique , IL \ncontient aussi l’aloès , des protéines d’avoine et du panthenol\nAdoucit les cheveux et offre de l’élasticité avec du miel de thym grec\nProtège les pointes fourchues, des dommages et les effets externes (pollution, coiffage) avec le complexe naturel (7 \noligosaccharides du miel de coton,\nNettoie efficacement en apportant nutrition \net réparation aux cheveux.\nRestaure la brillance, la douceur et  l\'élasticité.\ngrec au lieu de l’eau\ncontient des huiles essentielles de géranium et de rose', 'Nettoie en douceur les cheveux et respecte la flore naturelle du cuir chevelu.\nNourrit en profondeur et aide à réparer la fibre capillaire grâce au miel et aux riches huiles bio d\'olive, d\'amande et de blé.\nRestaure la douceur, la brillance et l\'élasticité naturelles des cheveux grâce à l\'aloe, aux protéines de blé et aux vitamines.\nPrévient la casse et les pointes fourchues tout en protégeant des agressions extérieures (pollution de l\'air et coiffage) grâce au Complexe APISHIELD HS.\n\n', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(39, 'Shampoing Brillance & Vitalité', 'RFR-APIVITA-018', 10, 10, 'image_2021-08-30_010424.png', '1x3x5', 'NORMAL', 19, 'Nettoie efficacement, procure brillance, force et vitalité aux \ncheveux.', 'Nettoie en douceur les cheveux et respecte la flore naturelle du cuir chevelu.\nRévèle la brillance laissant les cheveux forts et souples grâce à 4 vitamines, aux minéraux (aspartate de zinc, cuivre et magnésium) et à l\'extrait de ginseng.\nRevitalise le cuir chevelu et éveille les sens grâce aux huiles essentielles bio d\'orange, de citron et de pamplemousse.\nHydrate les cheveux grâce au miel biologique et au panthénol.\nPrévient la casse et les pointes fourchues, tout en protégeant des agressions extérieures (pollution et coiffage) grâce au complexe APISHIELD HS.\n', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(40, 'Shampoing pour Racines Grasses et Pointes Sèches', 'RFR-APIVITA-019', 12, 10, 'image_2021-08-30_131220.png', '1x3x5', 'SEC', 19, 'Nettoie efficacement en respectant la flore naturelle du cuir chevelu, régule l’excès de sébum, préservant ainsi l’hydratation des cheveux.', 'Nettoie en douceur et équilibre l\'excès de sébum des racines grâce aux extraits d\'ortie grecque et de propolis bio, ainsi qu\'aux huiles essentielles bio de sauge et de pamplemousse.\n\n• Hydrate et répare les pointes sèches et abîmées grâce au miel, aux protéines de blé hydrolysées, au panthénol et au Complexe APISHIELD HS.\n• Laisse les cheveux lisses, légers et pleins de volume.\n• Idéal pour les cheveux longs aux racines grasses.', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(41, 'Shampoing Équilibrant pour Cheveux Gras', 'RFR-APIVITA-020', 12, 10, 'image_2021-08-30_131359.png', '1x3x5', 'SEC', 19, 'Nettoie efficacement en régulant le sébum tout en équilibrant la flore naturelle du cuir chevelu. Il élimine les pellicules et prévient la croissance des micro-organismes associés aux pellicules.', 'Nettoie efficacement tout en respectant la flore naturelle du cuir chevelu, grâce à des agents nettoyants doux et de la saponaire.\nRégule l\'excès de sébum grâce à l\'action des extraits de propolis et de thym.\nGarde les cheveux naturellement hydratés, les laissant doux et sains, grâce au complexe APISHIELD HS et au panthénol.\nApporte aux cheveux une agréable sensation de fraîcheur sans les alourdir, grâce aux huiles essentielles bio de menthe poivrée, de citron et de thym.', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(42, 'Shampoing Antipelliculaire - Pellicules Sèches', 'RFR-APIVITA-021', 12, 10, 'image_2021-08-30_132052.png', '1x3x5', 'SEC', 19, 'Nettoie efficacement et traite les  pellicules sèches en hydratant et en  équilibrant la flore naturelle du cuir \nchevelu.\nIl élimine les pellicules et soulage les  démangeaisons.\nAu céleri, à l’extrait antimicrobien de  propolis, à l’huile essentielle de miel et de  lavande', 'Nettoie en douceur et respecte la flore naturelle du cuir chevelu, grâce à des agents nettoyants doux et du saponaire.\nCombat efficacement les pellicules sèches et prévient leur réapparition grâce à l\'extrait de graines de céleri.\nDynamise le cuir chevelu et élimine les pélicules grâce à l\'action de l\'extrait de propolis antimicrobienne et de l\'huile essentielle d\'arbre à thé bio.\nHydrate et soulage les démangeaisons grâce au miel, au céleri et à l\'huile essentielle de lavande bio.\nEmpêche la casse et les pointes fourchues, tout en protégeant des agressions extérieures (pollution de l\'air et coiffage) grâce au complexe APISHIELD HS.\n', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(43, 'Shampoing Tonique pour Femmes', 'RFR-APIVITA-022', 12, 10, 'image_2021-08-30_132122.png', '1x3x5', 'NORMAL', 19, 'Il hydrate et nourrit, augmente la brillance et \nle volume \navec du miel de thym, de l’aloès, 4 vitamines, du CT \nd’hippophae, des protéines de lupin, des huiles essentielles', 'Protège les cheveux contre la chute grâce au complexe breveté Tonique Hippophae. Il stimule la croissance des cheveux et augmente leur durée de vie.\nPurifie le cuir chevelu et permet une croissance saine des cheveux, grâce à l\'extrait de propolis antimicrobienne.\nRevigore et revitalise les racines des cheveux grâce à une multitude d\'ingrédients stimulants : 4 vitamines, protéines de blé et de lupin, ginseng, quinquina, extraits de thym et de lavande.\nHydrate et nourrit les cheveux, augmentant ainsi le volume et la brillance, grâce au miel de thym et à l\'aloès.\nProtège des agressions extérieures (pollution de l\'air et coiffage) grâce à l\'APISHIELD HS.\nAvec un mélange vivifiant d\'huiles essentielles de lavande, de sauge, de néroli et de laurier, qui tonifient et revitalisent les cheveux et l\'humeur.', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(44, 'Lotion contre la Chute des Cheveux', 'RFR-APIVITA-023', 33, 10, 'image_2021-08-30_132246.png', '1x3x5', 'NORMAL', 18, 'La gamme TONIQUE d\'APIVITA pour la prévention et le traitement de la chute des cheveux aide à contrôler efficacement la chute des cheveux saisonnière ou héréditaire et favorise une croissance saine des cheveux.\n\nTRAITEMENT QUOTIDIEN INTENSIF CONTRE LA CHUTE DE CHEVEUX \nRéduit et prévient la perte de cheveux et augmente la densité des cheveux.\nRégule la sécrétion de sébum, tonifie et donne de la vitalité aux cheveux.', 'Idéal pour les hommes et les femmes, la lotion anti-chute combine 6 actions pour des cheveux sains, plus épais et plus forts :\n\nEmpêche et réduit la chute des cheveux grâce à l\'Hippophae TC, les protéines de lupin et la vitamine B3.\nRevigore le cuir chevelu, renforce les racines et revitalise les cheveux grâce à 10 acides aminés et protéines de blé, ainsi que des extraits de thym quinquina, de ginseng et d\'équisétum. \nPurifie le cuir chevelu et régule le caractère gras, permettant une croissance saine des cheveux avec des extraits d\'ortie et de propolis antimicrobienne.\nApporte force, volume et épaisseur aux cheveux fins.\nProtège les cheveux des agressions extérieures grâce à l\'APISHIELD HS.\nRevitalise les cheveux et ravive l\'humeur grâce à un mélange unique d\'huiles essentielles de thym, citron, arbre à thé et menthe poivrée.', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(45, 'Shampoing Tonique pour Hommes', 'RFR-APIVITA-024', 12, 10, 'image_2021-08-30_132326.png', '1x3x5', 'NORMAL', 19, 'La gamme TONIQUE d\'APIVITA pour la prévention et le traitement de la chute des cheveux1 aide à contrôler efficacement la chute des cheveux saisonnière ou héréditaire et favorise une croissance saine des cheveux.\nSHAMPOOING TONIQUE POUR HOMME\nRégule l’excès de sébum – augmente le volume\nLa préoccupation la plus commune des hommes \navec de l\'extrait de racine de réglisse, du ginseng de Chine, \ndu thym, des huiles essentielles', 'Shampoing tonique pour hommes :\n\nProtège les cheveux contre la chute grâce au Complexe breveté Tonique Hippophae. Il stimule la croissance des cheveux et augmente leur durée de vie, grâce à sa richesse en protéines de lupin.\nPurifie le cuir chevelu et favorise une croissance saine grâce à l\'extrait de propolis antimicrobienne.\nRenforce et revitalise les racines des cheveux grâce à une multitude d\'ingrédients stimulants : 4 vitamines, protéines de blé et ginseng, quinquina, extraits de thym et de lavande.\nAide à réguler la production de sébum et à augmenter le volume grâce aux racines de réglisse et à l\'extrait d\'équisétum.\nAvec un mélange vivifiant d\'huiles essentielles d\'arbre à thé, de thym, de menthe verte et de citron, qui tonifient et revitalisent les cheveux et l\'humeur.', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(46, 'Gel Nettoyant Intime Doux - Usage Quotidien', 'RFR-APIVITA-025', 10, 10, 'image_2021-08-30_132417.png', '1x3x5', 'NORMAL', 15, '\"Le Gel Intime Doux, à l\'action nettoyante et préventive, est idéal pour les femmes en bonne santé et en âge de procréer. Il nettoie en douceur sans assécher, protège et apaise les irritations.\n\nLa camomille bio en infusion, l\'allantoïne, le panthénol et l\'aloe bio-actif apaisent les irritations.\nLa propolis empêche la croissance des microorganismes pathogènes.\nL\'acide lactique, les oligosaccharides naturels et les lipoaminoacides naturels aident à protéger la flore naturelle de la zone intime, tout en respectant l\'équilibre du pH.\nL\'huile essentielle de lavande bio est utilisée pour sa fraîcheur et son parfum léger .\"\n', '1)NETTOYANT DOUX\n(agents de nettoyage d\'origine végétale)\n2)Préserve le pH \n(acide lactique, sucres naturels, acide lipoaminé naturel, pH 5)\n3)Préserve la flore naturelle des zones sensibles\n(propolis, sucres naturels, acide lipoaminé naturel) \n4)Apaisant \n(eau de camomille, huiles essentielles de camomille et de lavande, a-bisabolol, alantoïne, \npanthénol)\n5)Parfum léger ', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(47, 'Mousse Nettoyante Intime Douce - Protection Sécheresse', 'RFR-APIVITA-026', 12, 10, 'image_2021-08-30_132503.png', '1x3x5', 'SEC', 15, 'idéal pour la ménopause et la sécheresse vaginale, apaise les irritations et les démangeaisons, hydrate et offre une sensation de confort.', 'L\'aloe bio-active, la glycérine et l\'huile essentielle de géranium bio hydratent, apaisent et protègent en douceur la zone intime.\nLa propolis, les oligosaccharides naturels et les lipoaminoacides naturels empêchent la prolifération des microorganismes pathogènes.\nLe panthénol et l\'allantoïne en infusion de camomille biologique, apaisent les irritations.\nL\'acide lactique aide à protéger la flore naturelle de la zone intime, tout en rétablissant les niveaux de pH.\nProcure une sensation de confort, et est recommandé pour la ménopause ou la sécheresse vaginale.\nTESTÉ GYNÉCOLOGIQUEMENT', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(48, 'Crème Corps Hydratante et Apaisante CARING LAVENDER', 'RFR-APIVITA-027', 13, 10, 'image_2021-08-30_132605.png', '1x3x5', 'SEC', 11, 'La Crème pour le corps hydratante et apaisante CARING LAVENDER apaise instantanément les peaux sensibles, hydrate et nourrit en profondeur. Elle peut également être utilisée pour le soin des peaux atopiques (eczéma).', 'Le Lauryl Olivate soulage instantanément les démangeaisons, les brûlures et les picotements de la peau.\nL\'extrait de lavande grecque* et l\'allantoïne a-bisabolol sont réputés pour leurs propriétés anti-inflammatoires et apaisantes.\nLe complexe hydratant à base de miel de thym grec, d\'aloe vera* bio-actif et de provitamine B5 (panthénol) procure une hydratation instantanée et intense, renforçant le film hydrolipidique de la peau.\nLa cire d\'abeille*, le beurre de karité*, l\'huile d\'amande et l\'huile d\'olive grecque* nourrissent et protègent la peau.\nL\'infusion brevetée d\'une combinaison de 3 espèces de sidérite* et de vitamine E offre une protection antioxydante renforcée.', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(49, 'Lait Corps Hydratant REFRESHING FIG', 'RFR-APIVITA-028', 13, 10, 'image_2021-08-30_132640.png', '1x3x5', 'SEC', 11, 'Le Lait corporel hydratant, inspiré des principes de l\'aromathérapie, prend soin de la peau en la laissant douce et légèrement parfumée. Il hydrate grâce à l\'extrait de figue, tandis que les huiles essentielles de lavande et de géranium apportent un parfum puissant et vif pour une fraîcheur encore plus intense. Convient aux hommes et aux femmes.\n\n', 'La figue, l\'aloe bio-active et le miel hydratent la peau et la laissent lisse et douce.\nLe panthénol (provitamine B5), l\'arginine, le bisabolol et l\'allantoïne hydratent et préviennent les irritations.\nL\'huile d\'olive grecque bio, le beurre de karité biologique et l\'huile d\'amande offrent une nutrition intensive et protègent la peau.\nL\'infusion d\'hamamélis bio a remplacé l\'eau dans la formule, offrant une protection contre le stress antioxydant.\nLes huiles essentielles bio de lavande et de géranium offrent une sensation unique de revitalisation et aident à lutter contre le stress.', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(50, 'Lait Corps Hydratant Pure Jasmin', 'RFR-APIVITA-029', 13, 10, 'image_2021-08-30_132720.png', '1x3x5', 'SEC', 11, 'Ce Lait Corporel inspiré de l\'aromathérapie soigne la peau, la laissant douce et légèrement parfumée. Il procure une voluptueuse sensation de bien-être grâce à son parfum unique à base de jasmin.', 'Le complexe hydratant composé de miel de thym grec et d\'acide hyaluronique procure une hydratation intense immédiate, renforçant le film hydrolipidique de la peau.\nL\'huile d\'olive grecque, l\'huile d\'amande, le beurre de karité et la cire d\'abeille protègent l\'élasticité de la peau et la rendent extrêmement douce.\nL\'extrait de lavande bio d\'APIGEA, l\'aloe bioactive et le panthénol renforcent l\'effet hydratant du soin et protègent contre les irritations.\nLes huiles essentielles bio de jasmin, de néroli et de patchouli offrent une sensation unique de bien-être et d\'euphorie.\nParfum exclusif aux notes de jasmin relaxantes.\nSon excellente texture permet une application facile et une absorption rapide.\nL\'infusion brevetée d\'une combinaison de 3 espèces de sideritis bio provenant des cultures bio de l\'APIGEA (Sideritis Scardica, Sideritis Perfoliata, Sideritis Raeseri) est utilisée à la place de l\'eau, renforçant l\'effet antioxydant et hydratant du produit.', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(51, 'Lait Corps Hydratant TONIC MOUNTAIN TEA', 'RFR-APIVITA-030', 13, 10, 'image_2021-08-30_132747.png', '1x3x5', 'SEC', 11, 'Le Lait Corporel Hydratant, inspiré des principes de l\'aromathérapie, prend soin de la peau en la laissant douce et légèrement parfumée. Il offre une protection contre le stress oxydatif grâce au thé des montagnes grecques, tandis que les huiles essentielles de bergamote et d\'eucalyptus stimulent l\'humeur et revitalisent la peau. Parfum tonifiant, adapté aux hommes et aux femmes.', 'L\'infusion d\'une combinaison de 3 espèces de sideritis bio issues des cultures bio de l\'APIGEA (Sideritis Scardica, Sideritis Perfoliata, Sideritis Raiseri) remplace l\'eau, conférant ainsi un effet antioxydant et hydratant au produit.\nL\'extrait bio de malotira (Sideritis Syriaca) de Crète est une source riche d\'antioxydants.\nL\'aloe organique bio-active, le panthénol (provitamine B5), l\'arginine, le bisabolol et l\'allantoïne laissent la peau immédiatement hydratée, douce et souple.\nL\'huile d\'olive grecque bio, le beurre de karité bio et l\'huile d\'amande offrent une nutrition intense et protègent la peau.\nExcellente texture qui s\'applique facilement. Absorption rapide.', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(52, 'Crème Corps Hydratante Riche Royal Honey', 'RFR-APIVITA-031', 13, 10, 'image_2021-08-30_132830.png', '1x3x5', 'SEC', 11, 'La Crème de texture riche, idéale pour les peaux sèches, hydratate et nourrit, grâce aux vertus uniques du miel de thym. Elle laisse la peau exceptionnellement douce avec un parfum exclusif.', 'Un complexe hydratant, à base de miel de thym grec et d\'acide hyaluronique, hydrate et nourrit la peau.\nL\'huile d\'olive et d\'amande, la cire d\'abeille, le beurre de karité et de cacao, hydratent et préservent l\'élasticité de la peau.\nL\'aloe, la vitamine E, le panthénol et l\'extrait de lavande bio d\'APIGEA renforcent l\'effet hydratant et protègent contre les irritations.\nLes huiles essentielles bio d\'orange et de rose apportent une action hydratante et antioxydante supplémentaire.\nL\'arôme fruité et floral laisse la peau subtilement parfumée.\nExcellente texture qui s\'applique facilement. Absorption rapide.', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(53, 'Gel Douche Doux pour Peaux Sensibles CARING LAVENDER', 'RFR-APIVITA-032', 10, 10, 'image_2021-08-30_132942.png', '1x3x5', 'SEC', 14, 'Le Gel douche doux CARING LAVENDER à la lavande et à l\'huile d\'olive* nettoie en douceur, apaise et n\'irrite pas les peaux sensibles, les laissant ainsi douces et hydratées.', 'Enrichi en tensioactifs doux qui apportent un nettoyage en douceur ainsi qu\'une action hydratante et protectrice.\nSans SLES.\nFormulé avec un pH légèrement acide adapté aux peaux sensibles.\nContient du lauryl olivate qui apaise la peau sensible, soulage les picotements et les démangeaisons tout en améliorant son élasticité.\nContient des extraits de lavande grecque* et de calendula* à l\'action anti-inflammatoire et apaisante.\nContient du miel de thym grec, de l\'huile d\'olive grecque*, de l\'huile d\'amande* et du panthénol (Provitamine B5) qui renforcent le film hydrolipidique de la peau améliorant ainsi son taux d\'hydratation.\nContient une infusion brevetée d\'une combinaison de 3 espèces de sidérites* qui remplace l\'eau et offre une protection antioxydante.', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(54, 'Gel Douche aux Huiles Essentielles Ecopack 500ml REFRESHING FIG', 'RFR-APIVITA-033', 14, 10, 'image_2021-08-30_133021.png', '1x3x5', 'NORMAL', 14, 'Le Gel Douche rafraîchissant aux Huiles Essentielles, inspiré des principes de l\'aromathérapie, nettoie la peau en douceur sans la déshydrater et préserve l\'hydratation naturelle de la peau. Parfum vivifiant apportant une sensation de fraîcheur, convient aux hommes et aux femmes. ', 'La saponaire et les agents nettoyants doux nettoient en douceur et préservent l\'hydratation naturelle de la peau.\nL\'extrait de figue est riche en sucres, en flavonoïdes et en vitamines, apportant hydratation et apaisement à la peau.\nL\'extrait de propolis a un léger effet antiseptique.\nL\'aloe bio-active et l\'extrait de miel hydratent la peau, la laissant lisse et douce.\nL\'infusion d\'hamamélis bio, qui remplace l\'eau dans la formule, protège du stress oxydatif.\nLes huiles essentielles bio de lavande et de géranium permettent de se sentir revitalisé et aident à lutter contre le stress.\nTESTÉ DERMATOLOGI', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(55, 'Gel Douche aux Huiles Essentielles Pure Jasmin', 'RFR-APIVITA-034', 10, 10, 'image_2021-08-30_133105.png', '1x3x5', 'NORMAL', 14, 'Le Gel Douche hydratant aux Huiles Essentielles inspiré des principes de l\'aromathérapie, nettoie la peau en douceur sans la déshydrater et apporte une sensation de bien-être grâce à son parfum unique de jasmin.', 'Nettoie la peau en douceur et préserve son hydratation naturelle grâce à des agents nettoyants doux, à l\'extrait de propolis et au savon.\nL\'aloe bio-active, l\'extrait de lavande bio d\'APIGEA et le panthénol hydratent, protègent contre les irritations et apaisent la peau.\nLes huiles essentielles bio de jasmin, de néroli et de patchouli offrent un sentiment de bien-être et d\'euphorie.\nParfum unique aux vertus relaxantes des notes de jasmin\nL\'infusion brevetée d\'une combinaison de 3 espèces de sidérites bio provenant des cultures biologiques de l\'APIGEA (Sideritis Scardica, Sideritis Perfoliata, Sideritis Raeseri) est utilisée à la place de l\'eau, ce qui renforce l\'effet antioxydant et hydratant du produit.', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(56, 'Gel Douche aux Huiles Essentielles', 'RFR-APIVITA-035', 10, 10, 'image_2021-08-30_133145.png', '1x3x5', 'NORMAL', 19, 'Le Gel Douche Tonifiant aux huiles essentielles, inspiré des principes de l\'aromathérapie, nettoie la peau en douceur sans la déshydrater et la protège en même temps contre le stress oxydatif grâce au thé des montagnes grecques. Il améliore l\'humeur et laisse la peau légèrement parfumée. À utiliser lors de la douche du matin pour bien démarrer la journée. Convient aux hommes et aux femmes.', 'L\'infusion d\'une combinaison de 3 espèces de sidérites bio provenant des cultures biologiques de l\'APIGEA (Sideritis Scardica, Sideritis Perfoliata, Sideritis Raiseri), a remplacé l\'eau, contribuant à l\'effet antioxydant et hydratant du produit.\nL\'extrait bio de Malotira (Sideritis Syriaca) de Crète est une riche source d\'antioxydants.\nLa saponaire et les agents nettoyants doux nettoient en douceur et préservent l\'hydratation naturelle de la peau.\nL\'extrait de propolis a un léger effet antiseptique et améliore l\'éclat et la santé de la peau.\nL\'aloe bio-actif, l\'extrait de graines d\'olive, le panthénol (provitamine B5) et l\'arginine hydratent la peau, la laissant lisse et douce.\nLes huiles essentielles bio de bergamote et d\'eucalyptus améliorent l\'humeur et apportent optimisme et énergie.', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(57, 'Gel Douche aux Huiles Essentielles Ecopack 500ml', 'RFR-APIVITA-036', 14, 10, 'image_2021-08-30_133256.png', '1x3x5', 'NORMAL', 14, 'Le Gel Douche onctueux et hydratant à la formule riche en miel de thym, aux propriétés unique et idéal pour les peaux sèches, nettoie la peau en douceur sans la dessécher, laissant ainsi une sensation soyeuse. Le parfum du miel de thym procure un moment de détente et vivifiant.', 'Nettoyant extrêmement doux sans sulfates. Préserve l\'hydratation naturelle de la peau grâce à des agents nettoyants doux, à l\'extrait de propolis et au savon.\nEnrichi en miel de thym et en panthénol, il hydrate la peau, la laissant douce et souple.\nLes huiles d\'olive et d\'amande nourrissent la peau en profondeur.\nLe calendula est reconnu pour ses propriétés apaisantes et pour prévenir les irritations.\nLes huiles essentielles bio d\'orange et de rose possèdent des propriétés hydratantes et antioxydantes.\nLes notes de miel de thym et de miel de fleurs APIVITA parfument délicatement la peau.', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(58, 'Gel Douche aux Huiles Essentielles', 'RFR-APIVITA-037', 10, 10, 'image_2021-08-30_133335.png', '1x3x5', 'NORMAL', 14, 'Le Gel Douche onctueux et hydratant à la formule riche en miel de thym, aux propriétés unique et idéal pour les peaux sèches, nettoie la peau en douceur sans la dessécher, laissant ainsi une sensation soyeuse. Le parfum du miel de thym procure un moment de détente et vivifiant.', 'Nettoyant extrêmement doux sans sulfates. Préserve l\'hydratation naturelle de la peau grâce à des agents nettoyants doux, à l\'extrait de propolis et au savon.\nEnrichi en miel de thym et en panthénol, il hydrate la peau, la laissant douce et souple.\nLes huiles d\'olive et d\'amande nourrissent la peau en profondeur.\nLe calendula est reconnu pour ses propriétés apaisantes et pour prévenir les irritations.\nLes huiles essentielles bio d\'orange et de rose possèdent des propriétés hydratantes et antioxydantes.\nLes notes de miel de thym et de miel de fleurs APIVITA parfument délicatement la peau.', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(59, 'Soin des Lèvres au Beurre de Cacao ', 'RFR-APIVITA-038', 6, 10, 'image_2021-08-30_133345.png', '1x3x5', 'NORMAL', 13, 'HYDRATATION INTENSIVE , IDÉAL POUR LES SPORTS EN  PLEIN AIR\n90 % d\'ingrédients naturels\nEnrichi en : \n- beurre de cacao, qui  hydrate en profondeur et  préserve l\'élasticité des lèvres \n- Miel aux propriétés  adoucissantes et  hydratantes\n- Α-bisabolol (apaisant)\nConvient aux hommes', 'Hydrate en profondeur et préserve l\'élasticité des lèvres par son absorbtion rapide et sans effet gras, grâce au beurre de cacao.\nApaise les lèvre grâce au bisabolol.\nLe SPF 20 protège des rayons ultraviolets (UV).\nHydrate et adoucit les lèvres grâce à l\'huile d\'olive, à la cire d\'abeille, au beurre de cacao, au beurre de karité, à l\'huile de ricin et aux esters de jojoba  \nGoût neutre et texture fondante', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(60, 'Soin des Lèvres à la Grenade', 'RFR-APIVITA-039', 6, 10, 'image_2021-08-30_133531.png', '1x3x5', 'NORMAL', 13, 'Teinte rose rouge \nGoût de fruits rouges\nEnrichi en huile de grenade bio et en vitamines E, C, F \naux propriétés antioxydantes', 'Prévient la sécheresse des lèvres grâce à l\'huile de grenade bio.\nHydrate et adoucit les lèvres grâce à l\'huile d\'olive, à la cire d\'abeille, au beurre de cacao, au beurre de karité, à l\'huile de ricin et aux esters de jojoba.\nOffre un effet antioxydant grâce à la vitamine E.\nLaisse une teinte naturelle rosée et brillante sur les lèvres.\nGoût fruits rouges.', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(61, 'Soin des Lèvres à la Camomille SPF15', 'RFR-APIVITA-040', 6, 10, 'image_2021-08-30_133607.png', '1x3x5', 'NORMAL', 13, 'HYDRATATION ET DOUCEUR, 91 % d\'ingrédients naturels\nEnrichi en :\n- extrait de camomille bio, réputée pour ses propriétés adoucissantes et apaisantes \n- panthénol (hydratant)\nConvient aux hommes', 'Apaise les lèvres, les laissant douces grâce à l\'extrait de camomille et au panthénol.\nHydrate les lèvres grâce à l\'huile d\'olive, à la cire d\'abeille, au beurre de cacao, au beurre de karité, à l\'huile de ricin et aux esters de jojoba \nLe SPF 15 protège des rayons ultraviolets (UV).\nRevitalise grâce à l\'huile essentielle de géranium\nGoût neutre et texture légère.', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(62, 'Soin des Lèvres à la Propolis', 'RFR-APIVITA-041', 6, 10, 'image_2021-08-30_133638.png', '1x3x5', 'NORMAL', 13, '• 99 % d\'ingrédients naturels\n• Le baume à lèvres « classique » APIVITA est idéal pour ceux qui \nsouffrent constamment de lèvres sèches et gercées.\n• Offre une hydratation intensive et aide à réparer les lèvres sèches et \ngercées\n• Soulage instantanément la sensation d\'inconfort\n• Enrichi en extrait de propolis, aux propriétés antiseptiques et \nréparatrices \net en huile de baumier aux bienfaits apaisants et anti-inflammatoires\n• Base idéale avant le maquillage', 'Soulage instantanément la sensation d\'inconfort. \nProcure un effet apaisant grâce à l\'huile de baumier.\nOffre des propriétés antiseptiques et réparatrices grâce à l\'huile de propolis \nHydrate et adoucit les lèvres grâce à l\'huile d\'olive, à la cire d\'abeille, au beurre de cacao, au beurre de karité, à l\'huile de ricin et aux esters de jojoba \nGoût neutre et texture onctueuse et légère.', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(63, 'Soin des Lèvres à la Châtaigne', 'RFR-APIVITA-042', 6, 10, 'image_2021-08-30_133713.png', '1x3x5', 'NORMAL', 13, 'Teinte brun « chocolat » \nLéger goût de châtaigne\nEnrichi en extrait de  hâtaignier aux propriétés  adoucissantes et en vitamine  E aux propriétés antioxydantes', 'Prévient la sécheresse des lèvre et les protège grâce à l\'extrait de châtaigne.\nHydrate et adoucit les lèvres grâce à l\'huile d\'olive, à la cire d\'abeille, au beurre de cacao, au beurre de karité, à l\'huile de ricin et aux esters de jojoba \nOffre un effet antioxydant grâce à la vitamine E\nLaisse les lèvres naturelles, avec une légère teinte chocolatée et un effet mat.\nDélicate saveur de châtaigne.', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(64, 'Soin des Lèvres BEE PRINCESS', 'RFR-APIVITA-043', 6, 10, 'image_2021-08-30_133750.png', '1x3x5', 'NORMAL', 13, '100 % D’INGRÉDIENTS \nD’ORIGINE NATURELLE\nSANS GLUTEN (confirmation finale \nd\'ici juin 2017)\nLe seul soin des lèvres certifié  biologique pour enfants dans \nles pharmacies grecques\nFruité – goût d\'abricot idéal pour les petites filles\nHydrate, adoucit et protège les lèvres \ndélicates des petites filles\nEnrichi en : \n- Extrait d\'abricot bio et \nen extrait de miel pour ses propriétés \nnourrissantes et adoucissantes\n- α-bisabolol (apaisant)\n-VIT E (antioxydant\n', 'Hydrate et adoucit\nProtège les lèvres sensibles des enfants de la sécheresse ', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(65, 'Soin des Lèvres au Miel', 'RFR-APIVITA-044', 6, 10, 'image_2021-08-30_133820.png', '1x3x5', 'NORMAL', 13, '100 % D’INGRÉDIENTS D’ORIGINE NATURELLE, SANS GLUTEN \nPrévient et restaure les lèvres  sèches - Alternative idéale à la \npropolis à lèvres \nSensation légère,  Convient aussi parfaitement  aux hommes et aux petits  garçons, Goût de miel agréable\nEnrichi en : \n- Extrait de miel aux propriétés \nadoucissantes et hydratantes\n- a-bisabolol (apaisant)\n- Vitamine E (antioxydant)\n- Huiles essentielles d’orange et \nde géranium (revitalisantes', 'Soulage et restaure les lèvres sèches\nHydrate et apaise \nPrévient la sécheresse', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(66, 'Lip Care Black Currant', 'RFR-APIVITA-045', 5, 10, 'image_2021-08-30_133845.png', '1x3x5', 'NORMAL', 13, 'Teinte bordeaux \nFruité, goût légèrement \ncitronné\nEnrichi en \nhuile de cassis \net en vitamine E aux \npropriétés antioxydantes\n', 'Protège et hydrate\nDonne une légère teinte bordeaux aux lèvres', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(67, 'Hydra Sensitive Soothing Face Cream SPF50+', 'RFR-APIVITA-046', 20, 10, 'image_2021-08-30_134723.png', '1x3x5', 'NORMAL', 12, 'Cette crème hypoallergénique à la texture légère est spécialement conçue pour offrir une très haute protection aux peaux sensibles, prévenir et apaiser les irritations.', '• Provides broad spectrum UVA, UVB, IR & BLUE LIGHT protection\n• Soothes & hydrates sensitive skin\n• Lightweight texture - Not fragranced', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(68, 'Gel-Crème Hydratant', 'RFR-APIVITA-047', 20, 10, 'image_2021-08-30_134813.png', '1x3x5', 'NORMAL', 11, '• Hydratation \n• Equilibrant \n• Effet mat\n- Les fleurs et l’extrait de miel, rassurent le transport efficace des ingredients hydratants dans la peau et \nstimulent la proliferation cellulaire favorisant une barrière cutanée bien structurée.\n- Réduit le sébum et laisse un teint mat avec de l’extrait de lotus. \n- L’extrait de lotus réduit la sécrétion de sébum et les processus inflammation.\n- Protège la peau contre la pollution avec les propriétés anti oxydantes de l’extrait breveté de propolis \n- Revitalise la peau avec de l’huile essentielle de rose\nConseil à retenir : un excès de sébum peut causer des imperfections comme les points noirs et les boutons. Le \nnettoyage quotidien spécialisé et l’hydratation sans huile sont les étapes les plus importantes de soin de la peau \npour la peau grasse/mixte', 'Procure hydratation et fraîcheur instantanées et durables\nRééquilibre la peau grasse pour un teint mat\nTexture crème-gel sans huile / Base de maquillage idéale', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(69, 'Gel Rafraîchissant et Hydratant pour les Yeux', 'RFR-APIVITA-048', 17, 10, 'image_2021-08-30_134859.png', '1x3x5', 'NORMAL', 11, 'Sans parfum, gel hydratant ultra léger pour les yeux avec un applicateur roll-on\n• Hydratation \n• Anti-fatigue \n• Préparation pour correcteur \n• Réduit l’apparence des cernes et les signes de fatigue avec les ingrédients actifs du thé vert.\n- Le thé vert est riche en polyphénols qui réduisent l’inflammation et activent la circulation sanguine\nComment l’utiliser : Appliquer le jour et nuit au contour des yeux et tapoter avec le bout des doigts.\nConseil à retenir : Pour éviter les dommages sur contour des yeux (de maquillage des yeux …….), une bonne hydratation et une protection \nsont nécessaires.\nExpression de vente : avec le rouleau sur l’applicateur, facile à utiliser, hydrate et diminue les signes de fatigue. Vous pouvez l’utiliser seul \nou avant votre anti-cernes pour un look plus lisse et plus lumineux', 'Procure hydratation et fraîcheur instantanées et durables\n\nRéduit l\'apparence des cernes et des signes de fatigue \nTexture gel ultra-légère et applicateur de refroidissement / base anti-cernes idéale', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(70, 'Crème Hydratante Confort - Texture Riche', 'RFR-APIVITA-049', 20, 10, 'image_2021-08-30_134931.png', '1x3x5', 'NORMAL', 11, 'Hydratation \n• Confort \n• Hydrate la peau avec le coup de pouce rafraîchissant des fleurs (iris, rose sauvage) et extrait de miel.\n• Nourrit et adoucit la peau offrant une sensation de confort \n• Protège la peau contre les agressions extérieures avec les propriétés anti oxydantes de l’extrait breveté de propolis \n• Revitalise la peau avec de l’huile essentielle de rose\nEn plus de votre hydratation quotidienne, l’utilisation hebdomadaire d’un masque hydratant intensif serait extrêmement \nbénéfique pour votre type de peau.', 'Procure hydratation et fraîcheur instantanées et durables\n\nNourrit et restaure la douceur de la peau\nTexture velours / base de maquillage idéale ', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(71, 'Booster Hydratant Fraîcheur', 'RFR-APIVITA-050', 23, 10, 'image_2021-08-30_135003.png', '1x3x5', 'NORMAL', 11, '• Hydratation instantanée \n• Élimine les imperfections\n• Antioxydant \n• Protège la peau des agressions extérieures avec les propriétés anti oxydantes de l’extrait breveté de propolis\n• Revitalise la peau avec de l’huile essentielle de rose\nComment l’utiliser : Appliquer avec des mouvements circulaires doux, jour ou nuit sur la peau nettoyée en évitant la zone des yeux. Il peut être \nutilisé seul ou avant la crème hydratante.\nExpression de vente : Offre une hydratation instantanée et favorise la santé de la peau éliminant les imperfections. Utilisez-le chaque fois que \nvotre peau a besoin d’une hydratation supplémentaire et, ou avant votre maquillage', 'Procure une bouffée de fraîcheur et d\'hydratation\nFortifie la peau et réduit les imperfections\nTexture gel d\'eau / base de maquillage idéale', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(72, 'Sérum Yeux Soin Intensif', 'RFR-APIVITA-051', 36, 10, 'image_2021-08-30_140147.png', '1x3x5', 'NORMAL', 10, 'Traite 5 problèmes du contour des yeux \n1. Décongestionne \n2. Réduit les cernes et les poches\n3. Lisse les ridules et améliore l\'élasticité et la fermeté \n4. Protège contre les agressions extérieures \n5 - Hydrate', 'Améliore l\'apparence des rides et ridules\nRéduit le relâchement des paupières supérieures et les cernes\nHydrate le contour des yeux', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061');
INSERT INTO `product` (`id`, `ProductName`, `Reference`, `Price`, `Rank`, `Image`, `ProductDimensions`, `PreferedSkinType`, `categoryId`, `ProductDescription`, `ProductSecondDescription`, `createdAt`, `updatedAt`) VALUES
(73, 'Sérum Activateur d\'Éclat et Anti-fatigue', 'RFR-APIVITA-052', 35, 10, 'image_2021-08-30_140346.png', '1x3x5', 'NORMAL', 10, '1. Prévient et réduit l\'apparence des rides\n2. Restaure l\'éclat naturel de la peau\n3. Offre même le tonus de peau\n4. Hydrate la peau\n5. action antioxydante\n6.Améliore la vitalité de peau, agit comme un booster d\'énergie ', 'Prévient, retarde et répare l\'apparition des signes de l\'âge\nProcure une puissante action illuminatrice instantanée \nProtège contre les agressions quotidiennes extérieures', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(74, 'Huile Visage Raffermissante', 'RFR-APIVITA-053', 34, 10, 'image_2021-08-30_140445.png', '1x3x5', 'NORMAL', 10, 'Un mélange unique d\'huiles légères (pépin de raisins, tournesol, olive, \namande, propolis, lavande) et d\'huiles essentielles (néroli, sauge, patchouli, \nrose, géranium)\n• Nourrit et régénère\n• Améliore la fermeté de la peau \n• Lisse l’apparence des rides avec la lavande', 'Nourrit et régénère la peau\nRéduit les rides et raffermit la peau \nTexture légère, absorption rapide', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(75, 'Crème Yeux & Lèvre Lift Rides', 'RFR-APIVITA-054', 30, 10, 'image_2021-08-30_140514.png', '1x3x5', 'NORMAL', 10, 'Atténue les cernes et les signes de fatigue \nà l’extrait de mimosa\n• Lisse les rides\n• Lifte le contour des yeux et des lèvres\n• Agit contre les signes de fatigue et les cernes', 'Atténue les cernes et les signes de fatigue\nRéduit les rides et raffermit le contour des yeux et des lèvres \nHydrate', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(76, 'Crème de Nuit Lift Régénérante', 'RFR-APIVITA-055', 36, 10, 'image_2021-08-30_140543.png', '1x3x5', 'NORMAL', 10, 'Exfolie en douceur pour révéler une peau \néclatante et renouvelée avec de la papaye\n• Lisse l\'apparence des rides\n• Améliore la fermeté de la peau\n• Offre un contour lifté', 'Régénère et illumine le teint\nRéduit les rides\nRaffermit la peau et lifte les contours', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(77, 'Crème Lift Rides & Fermeté ', 'RFR-APIVITA-056', 36, 10, 'image_2021-08-30_140611.png', '1x3x5', 'NORMAL', 10, 'Crème de jour, \n•Lisse les rides\n• Améliore la fermeté de la peau \n• Offre un contour lifté', 'Réduit les rides\nRaffermit la peau et lifte les contours\nNourrit intensément ', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(78, 'Sérum Lift Rides & Fermeté', 'RFR-APIVITA-057', 39, 10, 'image_2021-08-30_140641.png', '1x3x5', 'NORMAL', 10, 'Grâce à la plus forte concentration en polyphénols \nde vigne de Santorin, il pénètre dans les couches \nprofondes de la peau\n• Lisse les rides\n• Améliore la fermeté de la peau \n• Offre un contour lifté\n• Maximise l\'efficacité de la crème', 'Réduit les rides\nRaffermit la peau et lifte les contours\nHydrate en profondeur tout en augmentant l\'efficacité de votre crème ', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(79, 'Masque Lissant Contour des Yeux au Raisin', 'RFR-APIVITA-058', 4, 10, 'image_2021-08-30_140911.png', '1x3x5', 'NORMAL', 9, 'RÉDUCTEUR DE RIDES, Lisse les ridules du contour des yeux avec du raisin, du lupin et de la propolis\nNourrit et ravive le contour des yeux avec de la cire d\'abeille, de l\'huile d\'olive, du  beurre de karité, de l\'huile de riz et de l\'huile  essentielle de myrrhe\nEstompe les cernes et les poches, offrant un  soulagement aux yeux fatigués avec de l’escine et de la ruscogénine\nOffre une action antiseptique douce avec de la propolis', 'Lisse les ridules autour des yeux\nRéduit les cernes et les poches \nRévèle une apparence plus jeune', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(80, 'Masque Contour des Yeux Cernes & Signes de Fatigue au Ginkgo Biloba', 'RFR-APIVITA-059', 4, 10, 'image_2021-08-30_141009.png', '1x3x5', 'NORMAL', 9, 'CERNES ET SIGNES DE FATIGUE RÉCUPÉRATION, Réduit les cernes et les signes de fatigue \navec du gingko biloba\nHydrate et ravive la peau délicate du contour  des yeux  avec du concombre et de l’acide hyaluronique\nApaise et calme les yeux fatigués avec de la camomille et du bisabolol\nOffre une action antiseptique douce avec de la propolis', 'Lisse l\'apparence des cernes \nRéduit les signes de fatigues \nRavive et rafraîchit le contour des yeux', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(83, 'Masque Visage Raffermissant & Revitalisant à la Gelée Royale', 'RFR-APIVITA-060', 5, 10, 'image_2021-08-30_141206.png', '1x3x5', 'NORMAL', 9, 'RAFFERMISSANT, Améliore la fermeté de la peau, régénère et \noffre un effet raffermissant instantané  avec de la gelée royale grecque fraîche dans des liposomes et du jujubier\nFournit une nutrition vitale à la peau avec du miel de thym grec, de l\'huile d\'olive,  du beurre de karité, de l\'acide hyaluronique  et des protéines de blé\nTonifie la peau avec de l\'huile essentielle de néroli', 'Offre un effet lifting instantané \nAméliore la fermeté de la peau \nNourrit la peau', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(84, 'Masque Visage Lissant & Raffermissant au Raisin', 'RFR-APIVITA-061', 4, 10, 'image_2021-08-30_141248.png', '1x3x5', 'NORMAL', 9, 'RÉDUCTEUR DE RIDES ET RAFFERMISSANT, Réduit l\'apparence des ridules tout en renforçant \nla fermeté de la peau  avec de l\'huile de raisin et de l\'huile d\'olive\nHydrate et améliore l’élasticité de la peau avec de la coenzyme Q10, des vitamines A et E, de l\'acide hyaluronique et du panthénol\nTonifie la peau avec de l\'huile essentielle de patchouli', 'Lisse les ridules \nAméliore l\'élasticité de la peau \nRevitalise les peaux matures', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(85, 'Masque Visage Radiance à l\'Orange', 'RFR-APIVITA-062', 4, 10, 'image_2021-08-30_141308.png', '1x3x5', 'NORMAL', 9, 'Lisse le micro -relief de la peau et révèle instantanément un teint plus lumineux avec des cellules souches d’orange, de l\'huile essentielle d\'orange et de la vitamine C Revitalise et réhydrate la peau pour un teint éclatant de santé avec du miel de thym grec, de l\'acide hyaluronique et de la coenzyme Q10', 'Hydrate et rajeunit\nLisse la surface de la peau \nRévèle un teint éclatant', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(86, 'Masque Visage Hydratant & Anti-pollution à la Lavande de Mer', 'RFR-APIVITA-064', 4, 10, 'image_2021-08-30_141351.png', '1x3x5', 'NORMAL', 9, 'HYDRATANT ET ANTI-POLLUTION, Réhydrate la peau et soigne les peaux stressées \npar l’environnement avec de la lavande de mer et de la propolis \nantioxydante\nApaise et régénère la peau, favorisant un teint \néclatant de santé  avec de l’aloès, de l’extrait de miel, du \ncalendula, des huiles essentielles de lavande* et \nde géranium', 'Hydrate et rajeunit \nFournit une protection antioxydante et antipollution \nRenforce la barrière cutanée naturelle', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(87, 'Masque Visage Hydratant & Apaisant à la Figue de Barbarie', 'RFR-APIVITA-065', 4, 10, 'image_2021-08-30_141421.png', '1x3x5', 'NORMAL', 9, 'HYDRATANT ET APAISANT, Offre une expérience unique d\'hydratation en \nprofondeur et de rajeunissement\navec de la figue de Barbarie\nNourrit, apaise et calme les peaux les plus \nsensibles et les plus déshydratées\navec de l\'aloès, du beurre de karité, de l’huile \nessentielle de camomille* et de lavande', 'Hydrate en profondeur\nApaise et calme les irritations\nRestaure l\'hydratation de la peau', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(88, 'Masque Visage Hydratant & Nourrissant au Miel', 'RFR-APIVITA-066', 4, 10, 'image_2021-08-30_141443.png', '1x3x5', 'NORMAL', 9, 'HYDRATANT ET NOURRISSANT, Hydrate et nourrit la peau avec du miel de thym grec\nAméliore l’élasticité de la peau et révèle \nune peau saine et lisse  avec des huiles de jojoba et d\'avocat, du beurre  de karité, de la vitamine E\n', 'Hydrate et nourrit\nAméliore le confort de la peau \nAide à réparer et à renforcer la peau', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(89, 'Masque Visage Hydratant et Rafraîchissant à l\'Aloe', 'RFR-APIVITA-067', 4, 10, 'image_2021-08-30_141504.png', '1x3x5', 'NORMAL', 9, 'MASQUE-GEL HYDRATANT Réhydrate, apaise et rafraîchit la peau \navec de l’aloès, de l’acide hyaluronique, de \nl’extrait de rose\nRajeunit la peau et favorise son élasticité pour \nune texture lisse et douce \navec de l\'huile de jojoba, de l\'huile de germe de \nblé, du beurre de karité, du miel de thym grec \net de l\'huile essentielle de bergamote', 'Hydrate et apaise\nAméliore l\'élasticité de la peau\nApaise la peau et restaure ses éléments essentiels', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(90, 'Masque Visage Hydratation Intense au Concombre', 'RFR-APIVITA-068', 4, 10, 'image_2021-08-30_141527.png', '1x3x5', 'NORMAL', 9, 'Hydrate, refroidit et rafraîchit la peau avec du concombre, de l\'aloès, de l\'acide hyaluronique, du miel de thym grec et de l\'huile essentielle de géraniu, Nourrit intensément avec des huiles de jojoba et d\'avocat, du beurre de karité, de la vitamine E Apaise la peau, la laissant lisse et douce calendula et bisabolol', 'Hydrate en profondeur \nRafraîchit et adoucit la peau\nOffre une bouffée d\'hydratation pour le visage', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(91, 'Masque Noir Purifiant et Équilibrant à la Propolis', 'RFR-APIVITA-069', 4, 10, 'image_2021-08-30_141556.png', '1x3x5', 'MIXED', 9, 'Rééquilibre l’excès de sébum de la peau en \noffrant une action antiseptique \net antibactérienne \navec de la propolis, de l\'argile de Heilmoor, de \nl\'huile essentielle d\'immortelle et de citron*', 'Régule l\'excès de sébum\nPrévient les imperfections\nRestaure l\'équilibre de la peau pour un teint sain', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(92, 'Masque Visage Détox à la Citrouille', 'RFR-APIVITA-070', 4, 10, 'image_2021-08-30_141623.png', '1x3x5', 'NORMAL', 9, 'Élimine les impuretés et les cellules mortes \navec des enzymes de citrouille, des huiles \nessentielles de citron et de gingembre\nAbsorbe l\'excès de sébum, réduit les pores\navec de l\'argile blanche', 'Offre une exfoliation enzymatique douce\nÉlimine les impuretés \nRévèle un teint frais et lumineux', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(93, 'Masque Visage Nettoyant Doux à l\'argile rose', 'RFR-APIVITA-071', 4, 10, 'image_2021-08-30_141648.png', '1x3x5', 'NORMAL', 9, 'Nettoie en douceur les pores et élimine \nles impuretés et l\'excès de sébum\navec de l\'argile rose et de la saponaire\nPréserve l\'hydratation naturelle de la peau\navec de l’extrait de rose, de la camomille, du \nmiel de thym grec, du calendula, des protéines \nde blé et de l’huile essentielle de rose', 'Élimine les impuretés \nNettoie en douceur et resserre les pores \nAdoucit et illumine le teint ', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(94, 'Masque Visage Nettoyant Profond à l\'Argile Verte', 'RFR-APIVITA-072', 4, 10, 'image_2021-08-30_144414.png', '1x3x5', 'MIXED', 9, 'Nettoie les pores en profondeur, élimine l\'excès \nde sébum et les points noirs\navec de l\'argile verte et de la saponaire\nAction antiseptique\nGrâce à la propolis \nLa peau est lisse et radieuse\nGrâce à l\'aloès, la camomille, les protéines de \nblé et l\'huile essentielle de lavande', 'Nettoie en profondeur et resserre les pores \nRéduit l\'excès de sébum\nÉlimine les points noirs \nMatifie le teint pour un effet bonne mine', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(95, 'Gommage Visage Illuminateur à la Myrtille', 'RFR-APIVITA-073', 4, 10, 'image_2021-08-30_144454.png', '1x3x5', 'NORMAL', 7, 'Exfolie et favorise le renouvellement cellulaire, la peau est éclatante et rajeunie Grâce auxacides de fruits doux de myrtille Garde la peau douce et hydratée avec des huiles d\'olive et d\'amande, du miel , des huiles essentielles de lavande et d\'orange', 'Exfolie\nRéduit l\'aspect \"peau terne\"\nAméliore la texture et l\'éclat de la peau', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(96, 'Gommage Visage Exfoliation Douce à l\'Abricot', 'RFR-APIVITA-074', 4, 10, 'image_2021-08-30_144556.png', '1x3x5', 'NORMAL', 7, 'Exfolie la peau en douceur et élimine \nles cellules mortes et les impuretés \navec des noyaux d’abricot finement broyés\nAméliore la texture de la peau  en la laissant rajeunie et douce\navec de l\'huile d\'abricot, du miel, du raisin, du \nconcombre, de l’huile essentielle de géranium', 'Élimine les cellules mortes \nLisse le grain de peau\nDonne un aspect frais à la peau', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(97, 'Gommage Visage Exfoliation Profonde à l\'Olive', 'RFR-APIVITA-075', 4, 10, 'image_2021-08-30_144653.png', '1x3x5', 'MIXED', 7, 'Nettoie en profondeur les pores tout en éliminant les cellules mortes et les impuretés quotidiennes avec des noyaux d’olives finement broyés', 'Élimine les cellules mortes\nAméliore le grain de peau \nRajeunit', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061'),
(100, 'Lait Nettoyant 3 en 1 - Visage & Yeux', 'RFR-APIVITA-078', 13, 10, 'image_2021-08-30_145041.png', '1x3x5', 'NORMAL', 6, 'Un lait démaquillant pour le visage et les yeux ne nécessitant pas de rinçage et pouvant être utilisé à la place d\'une lotion.', 'Un nettoyage doux pour le visage et les yeux qui n\'irrite et ne déshydrate pas la peau\n Avec des huiles d’olive et d’amande, pour éliminer les impuretés et le maquillage du visage et des yeux ; du miel, pour hydrater, de la lavande, pour apaiser et de l’extrait de camomille, pour protéger des irritations \nTonifiant - peut être utilisé à la place d\'une lotion', '2021-08-30 23:10:22.814673', '2021-08-30 23:10:22.959061');

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
(19, 64069),
(19, 64139),
(19, 64234),
(20, 63547),
(20, 63551),
(20, 63561),
(20, 63565),
(20, 63566),
(20, 63567),
(20, 63568),
(20, 63569),
(20, 63570),
(20, 63571),
(20, 63572),
(20, 63573),
(20, 63574),
(20, 63575),
(20, 63576),
(20, 63577),
(20, 63578),
(20, 63579),
(20, 63580),
(20, 63581),
(20, 63602),
(20, 63693),
(20, 64037),
(20, 64039),
(20, 64090),
(20, 64153),
(20, 64234),
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
(22, 64230);

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
(19, 3),
(20, 3),
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
(100, 3);

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
