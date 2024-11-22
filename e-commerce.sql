-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 03 nov. 2024 à 13:48
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `e-commerce`
--

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  `country` varchar(100) NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `address`
--

INSERT INTO `address` (`address_id`, `user_id`, `address`, `city`, `postal_code`, `country`) VALUES
(1, 1, '302, rue Franck Leger', 'Ruiz', '70 052', 'Guatemala'),
(2, 2, '49, avenue Devaux', 'Lambert', '42 240', 'Soudan'),
(3, 3, '562, chemin de Roche', 'Pascal-sur-Pages', '24252', 'Sainte Hélène'),
(4, 4, '1, impasse de Laporte', 'Leroux-sur-Mercier', '29048', 'Burundi'),
(5, 5, 'place Matthieu Marques', 'Le Goff-sur-Pierre', '98 280', 'Vietnam'),
(6, 6, '72, rue Vidal', 'Garnier', '92195', 'Turkménistan'),
(7, 7, '69, place de Vidal', 'Laine', '16 369', 'Tadjikistan'),
(8, 8, '85, rue de Pierre', 'Boulay', '71 493', 'Papouasie-Nouvelle-Guinée'),
(9, 9, '41, boulevard Lefort', 'Martinez', '78 716', 'Micronésie (États fédérés de)'),
(10, 10, '39, rue de Blondel', 'Guillon-la-Forêt', '79632', 'Mariannes du Nord (Îles)');

-- --------------------------------------------------------

--
-- Structure de la table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `created_at`) VALUES
(1, 1, '2024-11-03 12:27:45'),
(2, 2, '2024-11-03 12:27:45'),
(3, 3, '2024-11-03 12:27:45'),
(4, 4, '2024-11-03 12:27:45'),
(5, 5, '2024-11-03 12:27:45'),
(6, 6, '2024-11-03 12:27:45'),
(7, 7, '2024-11-03 12:27:45'),
(8, 8, '2024-11-03 12:27:45'),
(9, 9, '2024-11-03 12:27:45'),
(10, 10, '2024-11-03 12:27:45');

-- --------------------------------------------------------

--
-- Structure de la table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
CREATE TABLE IF NOT EXISTS `cart_item` (
  `cart_item_id` int NOT NULL AUTO_INCREMENT,
  `cart_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`cart_item_id`),
  KEY `cart_id` (`cart_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `cart_item`
--

INSERT INTO `cart_item` (`cart_item_id`, `cart_id`, `product_id`, `quantity`) VALUES
(1, 8, 36, 1),
(2, 10, 46, 3),
(3, 6, 50, 5),
(4, 8, 39, 3),
(5, 9, 30, 4),
(6, 7, 3, 3),
(7, 5, 5, 5),
(8, 10, 15, 1),
(9, 8, 26, 5),
(10, 4, 7, 5);

-- --------------------------------------------------------

--
-- Structure de la table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE IF NOT EXISTS `invoice` (
  `invoice_id` int NOT NULL AUTO_INCREMENT,
  `cart_id` int NOT NULL,
  `total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `cart_id` (`cart_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `cart_id`, `total`) VALUES
(1, 1, 127.81),
(2, 2, 333.48),
(3, 3, 36.15),
(4, 4, 243.23),
(5, 5, 192.22),
(6, 6, 184.32),
(7, 7, 428.16),
(8, 8, 427.33),
(9, 9, 18.30),
(10, 10, 211.78);

-- --------------------------------------------------------

--
-- Structure de la table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `iban` varchar(34) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  PRIMARY KEY (`payment_id`),
  UNIQUE KEY `iban` (`iban`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `payment`
--

INSERT INTO `payment` (`payment_id`, `user_id`, `iban`, `first_name`, `last_name`) VALUES
(1, 1, 'FR5319250590444L4676I8A9K12', 'Jean', 'Ollivier'),
(2, 2, 'FR934417691772W7050Y8YO3U42', 'Marcel', 'Blin'),
(3, 3, 'FR1169583916330349283OM4W94', 'Philippe', 'Letellier'),
(4, 4, 'FR8891437058290TQ9Q027ZMY61', 'Antoine', 'Charles'),
(5, 5, 'FR8631842504687OG025Y885848', 'Bertrand', 'Dupuis'),
(6, 6, 'FR5650936862104LFGMXYF72881', 'Lorraine', 'Benoit'),
(7, 7, 'FR916489786812SG4979436Y845', 'Renée', 'Reynaud'),
(8, 8, 'FR704877065562M9HW12U1K6E49', 'David', 'Pottier'),
(9, 9, 'FR2591058744341EM7QU9728284', 'Georges', 'Duval'),
(10, 10, 'FR350379023549T63994BTPCX22', 'Isabelle', 'Charles');

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`product_id`, `name`, `description`, `price`, `stock_quantity`) VALUES
(1, 'debitis', 'Dolores et vel nostrum ut aperiam repellat.', 65.71, 22),
(2, 'ipsam', 'Omnis et similique magnam odit.', 93.07, 28),
(3, 'eius', 'Distinctio natus sequi unde temporibus tempore non.', 17.11, 32),
(4, 'amet', 'Quasi explicabo distinctio sunt.', 36.72, 37),
(5, 'mollitia', 'Dolorem dolorum ducimus porro facilis eaque quae.', 86.14, 78),
(6, 'officia', 'Ullam est nobis et.', 64.09, 59),
(7, 'omnis', 'Laudantium sunt dignissimos consectetur voluptates ut.', 57.98, 38),
(8, 'aut', 'Sequi ea aut quia vitae consectetur modi repellendus.', 18.47, 88),
(9, 'soluta', 'Impedit atque voluptatem quisquam quo porro dolores.', 23.57, 29),
(10, 'neque', 'Debitis eos ducimus sapiente rem blanditiis.', 75.56, 29),
(11, 'voluptatem', 'Ex laudantium qui voluptas voluptatibus.', 12.42, 65),
(12, 'non', 'Quis optio dolor fugiat voluptatem reiciendis quo sed.', 75.94, 75),
(13, 'illo', 'Repudiandae eligendi animi doloremque officiis adipisci debitis ut.', 47.02, 65),
(14, 'magni', 'Iusto est consequatur laboriosam quia labore.', 30.49, 78),
(15, 'dolor', 'Rerum a maxime atque voluptatem consequatur.', 83.34, 0),
(16, 'quidem', 'Maiores officiis aut omnis aut.', 86.04, 63),
(17, 'nobis', 'Exercitationem nobis iste nobis atque repudiandae eum.', 35.74, 82),
(18, 'porro', 'Illo est officiis doloremque unde.', 48.60, 77),
(19, 'rerum', 'Ex qui sunt quisquam consectetur iusto sunt non.', 63.98, 99),
(20, 'perferendis', 'Ut assumenda quod accusantium veniam non enim numquam occaecati.', 27.50, 29);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(191) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone_number` (`phone_number`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password_hash`, `first_name`, `last_name`, `phone_number`, `created_at`) VALUES
(1, 'ypottier@yahoo.fr', '$2y$10$B7qgjurlW.UdUeaG8dnyOuog0MhRsSA9bSKkliP2qyXxiGOyovnku', 'Claude', 'Duval', '+33 (0)4 53 01 62 38', '2024-03-03 18:52:41'),
(2, 'frederique01@sfr.fr', '$2y$10$2kAzF43fgahhjZ.QX7zRWuwrS/fTa2TVQc3b6UI6JfY9uDhO8gyfm', 'Louis', 'Guillaume', '05 99 03 10 12', '2024-08-22 16:03:10'),
(3, 'marianne.herve@hotmail.fr', '$2y$10$2sAHq/GfS4c6d4HcrfebYOaPAHNlLdVHCxR4Ic6T8z5KW7oTZG.2C', 'Émilie', 'Faivre', '0603921693', '2024-06-24 19:01:30'),
(4, 'lecoq.margot@tiscali.fr', '$2y$10$5o4bU7wtYwC.9w.f1ujkK.ZhMoJeXiw7AIUCm9GfyzZCIGKjyC1Ju', 'Benoît', 'Diallo', '+33 4 47 82 98 42', '2024-01-02 02:41:59'),
(5, 'etienne45@laposte.net', '$2y$10$4Xv3cdMDLNv0i2gdOTBcf.r1Da1lWFFFKorIXvmVMCkY1xmH8dECa', 'Marguerite', 'Blanc', '+33 (0)1 19 24 61 41', '2024-05-28 00:37:43'),
(6, 'lbrun@dbmail.com', '$2y$10$5wON1lGHyIXJYxwxnH7rWe76on.GA/v917mxroO1SU9cKa/w.4ZAK', 'Pierre', 'Guerin', '+33 (0)3 58 22 76 59', '2024-10-11 15:27:50'),
(7, 'edouard.julien@chevalier.com', '$2y$10$4A68S1kAMUR5UifgSwEnTuB15ecSMp5BPdY7cDT/vSgtsCTKtuj6i', 'Madeleine', 'Dos Santos', '+33 6 68 14 53 20', '2024-07-03 08:07:30'),
(8, 'kjoubert@vallee.org', '$2y$10$aDLR/UGMxe.fT0V.hCZjTeP7BzfcuWUngDPZ.zQRfsXVXNUaynpei', 'Hugues', 'Nicolas', '+33 (0)6 03 44 73 61', '2024-07-02 10:01:39'),
(9, 'chevalier.susan@sfr.fr', '$2y$10$1ADT/UESywdT08C3ViKXs.I9fIHhtfE3k6CSrC0NYu.FbpXwy.9K.', 'Martin', 'Chevalier', '+33 1 52 54 55 76', '2024-02-21 05:03:50'),
(10, 'dominique.thibault@voila.fr', '$2y$10$vEsp8G9LO6jk367zt3X/oO4EG2sRqOJ1r1pbNPJx7aK8DMxZDf4rS', 'Henriette', 'Lombard', '0943204700', '2023-12-19 01:01:24');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
