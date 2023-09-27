-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Hôte : db5014366314.hosting-data.io
-- Généré le : lun. 25 sep. 2023 à 10:15
-- Version du serveur : 10.6.15-MariaDB-1:10.6.15+maria~deb11-log
-- Version de PHP : 7.0.33-0+deb9u12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `dbs11948901`
--
CREATE DATABASE IF NOT EXISTS `dbs11948901` DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci;
USE `dbs11948901`;

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

CREATE TABLE `adresse` (
  `id` int(11) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `complement` varchar(255) DEFAULT NULL,
  `code_postal` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`id`, `adresse`, `complement`, `code_postal`, `ville`, `user_id`) VALUES
(1, '84, rue de versailles', NULL, '945000', 'créteil', 1),
(2, '5, rue de paris', '10, avenue de versailles', '75013', 'paris', 1),
(5, '11, residence plein sud', '83, avenue de versailles', '94320', 'thiais', 6),
(8, '55, rue de paris', '10 avenue de france', '75001', 'paris', 4),
(9, '23, rue de paris', '10, avenue de loupe', '78123', 'conflan', 5),
(10, '5 voie des meuniers', NULL, '94550', 'chevilly-larue', 7),
(11, '10, rue de lappe', NULL, '75011', 'paris', 8),
(12, '52 avenue de choisy', NULL, '94000', 'choisy', 1),
(13, '25 avenue de pascal', NULL, '75011', 'paris', 9),
(16, '5 voie des meuniers', '5 voie des meuniers', '94550', 'chevilly-larue', 0),
(17, '25 avenue de pascal', '25 avenue de pascal', '75011', 'paris', 0);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `image_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `nom`, `description`, `image_name`) VALUES
(2, 'Boucles d\'oreilles', 'Portez des boucles d\'oreilles pierres pour libérer toutes leurs vertus.\r\n Une sélection des plus belles Boucles d\'Oreilles en Pierres semi-précieuses et Argent 925.', 'bo-long-649f2ae97d588619927760.jpg'),
(3, 'Colliers', 'Offrir un collier en argent avec pendentif pierre naturel et argent massif, vous lui offrez un cadeau qui signifie beaucoup.', 'spinel-649f260b9ad8f158669056.jpg'),
(4, 'Bagues', 'Like vous propose des bagues en argent 925 fabriquées par des artisans indiens ou thaïlandais au savoir-faire ancestral. Montées avec des pierres fines et argent massif.', 'bague-category-649f25e599699781605735.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` int(11) NOT NULL,
  `numero` varchar(255) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `adresse_id` int(11) NOT NULL,
  `statut` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `numero`, `datetime`, `user_id`, `adresse_id`, `statut`) VALUES
(24, NULL, '2023-07-11 16:22:55', 6, 5, 'not_paid'),
(25, NULL, '2023-07-11 16:24:38', 6, 5, 'not_paid'),
(26, NULL, '2023-07-11 16:28:37', 6, 5, 'not_paid'),
(27, NULL, '2023-07-11 16:33:07', 6, 5, 'not_paid'),
(28, NULL, '2023-07-11 16:37:50', 6, 5, 'not_paid'),
(29, NULL, '2023-07-11 16:41:05', 6, 5, 'not_paid'),
(30, NULL, '2023-07-11 16:41:40', 6, 5, 'not_paid'),
(31, NULL, '2023-07-11 16:43:22', 6, 5, 'not_paid'),
(32, NULL, '2023-07-11 16:43:53', 6, 5, 'not_paid'),
(33, NULL, '2023-07-11 16:52:10', 6, 5, 'not_paid'),
(34, NULL, '2023-07-18 23:04:49', 5, 9, 'paid'),
(35, NULL, '2023-07-18 23:19:11', 5, 9, 'paid'),
(36, NULL, '2023-07-19 00:36:15', 4, 8, 'paid'),
(37, NULL, '2023-07-20 23:14:54', 7, 10, 'paid'),
(38, NULL, '2023-07-21 18:19:31', 5, 9, 'not_paid'),
(39, NULL, '2023-07-21 18:22:45', 5, 9, 'not_paid'),
(40, NULL, '2023-07-21 19:09:18', 5, 9, 'paid'),
(41, NULL, '2023-07-21 19:22:47', 5, 9, 'not_paid'),
(42, NULL, '2023-07-21 20:37:10', 5, 9, 'not_paid'),
(43, NULL, '2023-07-21 20:38:04', 5, 9, 'not_paid'),
(44, NULL, '2023-07-21 20:38:17', 5, 9, 'not_paid'),
(45, NULL, '2023-07-21 21:54:17', 6, 5, 'not_paid'),
(46, NULL, '2023-07-24 21:57:07', 5, 9, 'not_paid'),
(47, NULL, '2023-07-26 01:32:31', 8, 11, 'not_paid'),
(48, NULL, '2023-07-26 01:45:12', 1, 2, 'paid'),
(49, NULL, '2023-07-26 11:52:13', 9, 13, 'paid'),
(50, NULL, '2023-09-04 11:35:20', 5, 9, 'paid'),
(51, NULL, '2023-09-04 16:28:24', 5, 9, 'paid'),
(52, NULL, '2023-09-05 14:06:56', 5, 9, 'paid'),
(53, NULL, '2023-09-05 16:06:45', 5, 9, 'paid'),
(54, NULL, '2023-09-22 22:20:55', 6, 5, 'not_paid'),
(55, NULL, '2023-09-22 23:10:48', 6, 5, 'not_paid'),
(56, NULL, '2023-09-25 00:28:01', 6, 5, 'not_paid');

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `sujet` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `message` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`id`, `sujet`, `email`, `message`) VALUES
(1, 'demande prix', 'joe@gmail.com', 'demande prix de bo préhnite'),
(2, 'demande catalogue', 'joe@gmail.com', 'demande catalogue'),
(3, 'demande catalogue', 'joe@gmail.com', 'demande catalogue'),
(4, 'demande contact', 'joe@gmail.com', 'demande contact'),
(5, 'demande contact', 'joe@gmail.com', 'demande contact'),
(6, 'demande contact', 'joe@gmail.com', 'demande contact'),
(7, 'demande contact', 'joe@gmail.com', 'demande contact'),
(8, 'demande adresse', 'jane@gmail.com', 'demande adresse'),
(9, 'demande prix', 'joe@gmail.com', 'bonjour'),
(10, 'demande prix', 'joe@gmail.com', 'demande le prix'),
(11, 'demande prix', 'joe@gmail.com', 'prix'),
(12, 'Hku Ye d Achoo', 'monaarch.mkt@gmail.com', 'Hello there,likebijoux.com\r\n\r\nI was going through your website & I personally see a lot of potential in your website & business.\r\n\r\nWe can increase targeted traffic to your website so that it appears on Google\'s first page. Bing, Yahoo, AOL, etc.\r\n\r\nDo you want to appear on the front page, then?\r\n\r\nPlease provide your name, contact information, and email.\r\n\r\nRegards,\r\nMonarch  ! Business Development Executive'),
(13, 'Question About Your Websites', 'dennissandrews135@gmail.com', '\"Hey,\r\n\r\nI visited your website, I discovered a few issues with the recently launched site that were affecting sales, visitors, and conversions.\r\n\r\nPlease provide me your phone number. I\'ll go into more depth about it.\r\n\"'),
(14, 'Gwodvq', 'monaarch.mkt@gmail.com', 'Hi, \r\n\r\nI came across your Website, when searching on Google and noticed that you do not show in the organic listings.  likebijoux.com\r\n\r\nSo I decided to send with you SEO audit report and keywords recommendation report, so that you can have a clear picture of what can be done to optimize your website further.\r\n\r\nAre you the right person to send this report??\r\n\r\nIf you are, please reply to this email and I will send it to you, otherwise just let me know.\r\n\r\nHave a great day!\r\n\r\nThanks & Regards,\r\nMonarch Business Development Executive'),
(15, 'Ikp Pu ojbd', 'monaarch.mkt@gmail.com', 'Hi, \r\n\r\nI came across your Website, when searching on Google and noticed that you do not show in the organic listings.  likebijoux.com\r\n\r\nSo I decided to send with you SEO audit report and keywords recommendation report, so that you can have a clear picture of what can be done to optimize your website further.\r\n\r\nAre you the right person to send this report??\r\n\r\nIf you are, please reply to this email and I will send it to you, otherwise just let me know.\r\n\r\nHave a great day!\r\n\r\nThanks & Regards,\r\nMonarch Business Development Executive');

-- --------------------------------------------------------

--
-- Structure de la table `detail_commande`
--

CREATE TABLE `detail_commande` (
  `id` int(11) NOT NULL,
  `commande_id` int(11) NOT NULL,
  `produit_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `prix` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `detail_commande`
--

INSERT INTO `detail_commande` (`id`, `commande_id`, `produit_id`, `quantite`, `total`, `prix`) VALUES
(1, 24, 6, 1, 80, 80),
(2, 24, 9, 1, 180, 180),
(3, 25, 6, 1, 80, 80),
(4, 25, 9, 1, 180, 180),
(5, 26, 6, 1, 80, 80),
(6, 26, 9, 1, 180, 180),
(7, 27, 6, 1, 80, 80),
(8, 27, 9, 1, 180, 180),
(9, 28, 6, 1, 80, 80),
(10, 28, 9, 1, 180, 180),
(11, 29, 6, 1, 80, 80),
(12, 29, 9, 1, 180, 180),
(13, 30, 6, 1, 80, 80),
(14, 30, 9, 1, 180, 180),
(15, 31, 6, 1, 80, 80),
(16, 31, 9, 1, 180, 180),
(17, 32, 6, 1, 80, 80),
(18, 32, 9, 1, 180, 180),
(19, 33, 6, 1, 80, 80),
(20, 33, 9, 1, 180, 180),
(21, 34, 2, 2, 200, 100),
(22, 34, 11, 1, 120, 120),
(23, 35, 9, 1, 180, 180),
(24, 36, 15, 1, 150, 150),
(25, 37, 13, 1, 150, 150),
(26, 38, 15, 1, 150, 150),
(27, 38, 6, 1, 80, 80),
(28, 39, 15, 1, 150, 150),
(29, 39, 6, 1, 80, 80),
(30, 40, 15, 1, 150, 150),
(31, 40, 6, 1, 80, 80),
(32, 41, 15, 1, 150, 150),
(33, 41, 6, 1, 80, 80),
(34, 42, 15, 1, 150, 150),
(35, 42, 6, 1, 80, 80),
(36, 43, 15, 1, 150, 150),
(37, 43, 6, 1, 80, 80),
(38, 44, 15, 1, 150, 150),
(39, 44, 6, 1, 80, 80),
(40, 45, 5, 1, 150, 150),
(41, 46, 5, 2, 300, 150),
(42, 46, 9, 1, 180, 180),
(43, 46, 2, 1, 100, 100),
(44, 47, 13, 3, 450, 150),
(45, 48, 6, 1, 80, 80),
(46, 49, 13, 2, 300, 150),
(47, 50, 16, 2, 360, 180),
(48, 51, 9, 1, 180, 180),
(49, 52, 9, 1, 180, 180),
(50, 52, 16, 2, 360, 180),
(51, 53, 6, 3, 240, 80),
(52, 53, 13, 1, 150, 150),
(53, 53, 9, 1, 180, 180),
(54, 54, 15, 1, 150, 150),
(55, 55, 5, 1, 150, 150),
(56, 56, 6, 1, 80, 80);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230521224152', '2023-09-04 14:11:31', 78),
('DoctrineMigrations\\Version20230521224559', '2023-09-04 14:11:31', 161),
('DoctrineMigrations\\Version20230522184158', '2023-09-04 14:11:31', 10),
('DoctrineMigrations\\Version20230522184628', '2023-09-04 14:11:31', 119),
('DoctrineMigrations\\Version20230522202141', '2023-09-04 14:11:31', 12),
('DoctrineMigrations\\Version20230523085948', '2023-09-04 14:11:31', 7),
('DoctrineMigrations\\Version20230523120256', '2023-09-04 14:11:31', 35),
('DoctrineMigrations\\Version20230523121430', '2023-09-04 14:11:31', 57),
('DoctrineMigrations\\Version20230630212629', '2023-09-04 14:11:31', 18),
('DoctrineMigrations\\Version20230706074818', '2023-09-04 14:11:31', 9),
('DoctrineMigrations\\Version20230709222422', '2023-09-04 14:11:31', 49),
('DoctrineMigrations\\Version20230709222824', '2023-09-04 14:11:32', 14),
('DoctrineMigrations\\Version20230720210830', '2023-09-04 14:11:32', 100);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `prix` int(11) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `nom`, `description`, `prix`, `stock`, `image_name`, `category_id`, `created_at`) VALUES
(2, 'collier labis', 'Le lapis-lazuli, une pierre qui donne confiance et ouvrira notre esprit à de nouvelles solutions nous conduisant à la résolution .', 100, 2, 'lapis-colier-640-646bedc28d2aa627864971.jpg', 3, NULL),
(5, 'Grosse bague pierre ruby émeraude argent doré', 'Cette magnifique bague est sertie avec des émeraudes et rubis aux couleurs éclatantes; les deux pierres sont très précieuses et ils sont des symboles de l\'amour et de la passion.', 150, 4, 'maxres-grosse-bague-6484fbf54703d830869837.jpg', 4, NULL),
(6, 'Bague diamant laboratoire', 'Le diamant synthétique est un diamant dont les caractéristiques sont identiques aux diamants extraits des mines. Ils sont aussi beaux que les diamants naturels mais beaucoup moins chers et plus écologiques.', 80, 4, 'maxresgrossebague-6484fdc683e9f100571410.jpg', 4, NULL),
(9, 'Collier Spinelle en Argent Doré', 'La Spinelle est une pierre de protection, qui chasse les ondes négatives, mais aussi les cauchemars pour un sommeil plus apaisé.', 180, 2, 'spinel-64850556d46f3734281779.jpg', 3, '2023-06-30 23:53:40'),
(10, 'Bague Fleur Améthyste', 'Grosse bague artisanale sertie améthyste et émeraude en argent 925.', 180, 2, 'sila-amethyste-bague-64850eb711e7f361622458.jpg', 4, NULL),
(11, 'Bague Royale Spinelle Péridot', 'Bague sertie d\'une grosse pierre de péridot et spinelle rose monté sur argent massif 925.', 120, 6, 'bague-peridot-tourmaline-649f309bcd3a7233019949.jpg', 4, NULL),
(12, 'Bague Serpent Saphir Spinelle Rose', 'Bague ouverte en saphir et spinelle rose montée sur argent 925.', 150, 6, 'bague-double-ouverte-649f3190abb2c482427185.jpg', 4, NULL),
(13, 'Boucles d\'oreilles Ruby', 'Boucles d\'oreilles en ruby et argent 925.', 150, 6, 'bo-ruby-649f323522552703236199.jpg', 2, NULL),
(14, 'Boucles d\'oreilles Tourmaline', 'Boucles d\'oreilles tourmaline jaune et argent 925.', 200, 6, 'bo-tourmaline-jaune-649f32766f018724677217.jpg', 2, '2023-06-30 23:54:24'),
(15, 'Boucles d\'oreilles Péridot', 'Boucles d\'oreilles en  pierre péridot et tourmaline rose montées sur argent doré.', 150, 6, 'bo-peridot-649f32d50e22b421611273.jpg', 2, NULL),
(16, 'Collier Grosse Perle', 'Collier avec une grosse perle de l\'eau douce et des petits saphirs;\r\nla monture et la chaine sont en argent façon ancienne.', 180, 6, 'collier-perle-649f336f1213c710033319.jpg', 3, NULL),
(17, 'Bague Améthyste Citrine', 'Bague ouverte avec pierres améthyste et citrine, montée sur argent doré.', 150, 6, 'bague-ame-citrine-649f33c329b4d129361712.jpg', 4, NULL),
(18, 'Boucles d\'oreilles Tourmaline Rose', 'Boucles d\'oreilles longues en tourmaline rose et perles d\'eau douce.', 200, 6, 'bo-long-649f34256a7e2806636642.jpg', 2, NULL),
(19, 'Bague Ruby Améthyste', 'Bague ouverte en ruby et améthyste monture argent massif 925.', 150, 6, 'bague-double-violet-649f3474115d5313650259.jpg', 4, NULL),
(20, 'Bague Petit Ruby', 'Bague en ruby monté sur argent façon oxydée.', 20, 10, 'bague-ruby-petit-649f34be22695226412881.jpg', 4, NULL),
(21, 'Collier Tourmaline Rose', 'Collier tourmaline rose et argent 925.\r\nLongueur 42 cm.', 120, 6, 'colier-tourmaline-rose-649f352f6e824432844921.jpg', 3, '2023-06-30 23:55:00');

-- --------------------------------------------------------

--
-- Structure de la table `reset_password_request`
--

CREATE TABLE `reset_password_request` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `selector` varchar(20) NOT NULL,
  `hashed_token` varchar(100) NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `nom`, `prenom`) VALUES
(1, 'lili@gmail.com', '[\"ROLE_USER\"]', '$2y$13$apxVU36feNB0VQOKu8ITr.UEBADHIB.IunDYPYgffKNcCYYy50UTW', 'li', 'li'),
(2, 'gao@gmail.com', '[\"ROLE_USER\"]', '$2y$13$C2GuKFiNL5r52afqFklCpu547WSMFo.h/dATGtyyCQPLWwnLS.O/K', 'gao', 'sylvie'),
(3, 'zhang@gmail.com', '[\"ROLE_USER\"]', '$2y$13$Iwy5ETa4BdHWb5Hv3jKSY.D9tJh0qz1NkKxMnqnkb7U6fZ/FDpk/W', 'zhang', 'san'),
(4, 'lisi@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$szhsji7w6P1TFEzS.DQMHOzHyH6CLvP.pcLxc2DMq4GVLBAwnRzPG', 'li', 'si'),
(5, 'lucy@gmail.com', '[\"ROLE_USER\"]', '$2y$13$ASlLkSX4.TGzG6IjE1xJnuFV2.ZoGmbvp8aSeYCePq1zn47DlQJQ2', 'ma', 'lucy'),
(6, 'gaoleon@gmail.com', '[\"ROLE_USER\"]', '$2y$13$2BnIAwnByo3Acyg/tKNbnu9P9C.dENgbiIIxxhZRuxFESgXbgikpW', 'gao', 'leon'),
(7, 'gaomingqiao@gmail.Com', '[\"ROLE_USER\"]', '$2y$13$GoeRVCIbPlnBxUHcOUfQMOPIFfW3SlJ/KxSls7Ccm3YZVwH/8ky96', 'gao', 'mingqiao'),
(8, 'dupont@gmail.com', '[]', '$2y$13$Z4GawAb6VyXiaD2Nf/fIM.YvEbEdYWGq9pRN1qxkLUj/3XTFgWRcC', 'dupont', 'eric'),
(9, 'pascal@gmail.com', '[]', '$2y$13$JfugdtowKR8Q7fCy7P6u8.yNs.tIupkjQOjWrEQI88AxF01fiu/ye', 'dupont', 'pascal'),
(10, 'tranquocan@gmail.com', '[]', '$2y$13$94hcjWk8RVsJepFdYQ14vO.gZtAHV/P13BRP1eWiP7T1XUJEJDmh6', 'gao', 'mingqiao'),
(11, 'xiaoming@gmail.com', '[]', '$2y$13$XckCZNRelfcAzQxQwzv37.jKxFXCig8aQd9dCvgh/bzdJ9SGDjTGu', 'xiao', 'ming'),
(12, 'xiao@gmail.com', '[]', '$2y$13$aFAUvlcOzoE5FWl4R.CTcOwzzqO1OL4aOvZZBztxEV6n1j668PiBW', 'xiao', 'xiao');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C35F0816A76ED395` (`user_id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6EEAA67DA76ED395` (`user_id`),
  ADD KEY `IDX_6EEAA67D4DE7DC5C` (`adresse_id`);

--
-- Index pour la table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `detail_commande`
--
ALTER TABLE `detail_commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_98344FA682EA2E54` (`commande_id`),
  ADD KEY `IDX_98344FA6F347EFB` (`produit_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_29A5EC2712469DE2` (`category_id`);

--
-- Index pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7CE748AA76ED395` (`user_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `adresse`
--
ALTER TABLE `adresse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT pour la table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `detail_commande`
--
ALTER TABLE `detail_commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD CONSTRAINT `FK_C35F0816A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `FK_6EEAA67D4DE7DC5C` FOREIGN KEY (`adresse_id`) REFERENCES `adresse` (`id`),
  ADD CONSTRAINT `FK_6EEAA67DA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `detail_commande`
--
ALTER TABLE `detail_commande`
  ADD CONSTRAINT `FK_98344FA682EA2E54` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`),
  ADD CONSTRAINT `FK_98344FA6F347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `FK_29A5EC2712469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Contraintes pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
