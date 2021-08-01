-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Dim 30 Juillet 2017 à 13:27
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `magasin_pro`
--

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
  `idArticles` int(11) NOT NULL AUTO_INCREMENT,
  `CategorieArticles` varchar(20) NOT NULL,
  `DescriptionArticles` varchar(80) NOT NULL,
  `PrixunitaireArticles` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idArticles`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `articles`
--

INSERT INTO `articles` (`idArticles`, `CategorieArticles`, `DescriptionArticles`, `PrixunitaireArticles`) VALUES
(1, 'Consommables', 'Papier pour photographies numériques, paquet de 50 feuilles', '34.90'),
(2, 'Informatique', 'Disque dur amovible 1 To', '98.50'),
(3, 'Informatique', 'Ecran plat 21 pouces', '345.00'),
(4, 'Informatique', 'Imprimante laser couleur', '255.00'),
(5, 'Informatique', 'Ordinateur de bureau DD 500 Go RAM 4 Go', '1543.00'),
(6, 'Informatique', 'Routeur EasyConnect B678', '75.00'),
(7, 'Multimédia', 'Appareil de photographie numérique', '120.80'),
(8, 'Multimédia', 'Hauts-parleur Home Cinema', '889.00'),
(9, 'Multimédia', 'Imprimante pour photographies numériques', '100.00'),
(10, 'Multimédia', 'Téléviseur écrant plat 106 cm', '1000.00');

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `idClients` int(11) NOT NULL AUTO_INCREMENT,
  `NomClients` varchar(20) NOT NULL,
  `PrenomClients` varchar(20) NOT NULL,
  `AdresseClients` varchar(80) NOT NULL,
  `CodepostalClients` varchar(4) NOT NULL,
  `LocaliteClients` varchar(20) NOT NULL,
  `DatedenaissanceClients` date NOT NULL,
  `CourrielClients` varchar(40) NOT NULL,
  `MotdepasseClients` varchar(60) NOT NULL,
  `FixeClients` varchar(20) NOT NULL,
  `PortableClients` varchar(20) NOT NULL,
  PRIMARY KEY (`idClients`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `clients`
--

INSERT INTO `clients` (`idClients`, `NomClients`, `PrenomClients`, `AdresseClients`, `CodepostalClients`, `LocaliteClients`, `DatedenaissanceClients`, `CourrielClients`, `MotdepasseClients`, `FixeClients`, `PortableClients`) VALUES
(1, 'Fontaine', 'Luc-André', 'Chemin de Luchepelet 13', '1233', 'Bernex', '1965-05-10', 'fontluca@bluewin.ch', 'kangourou', '+41 22 757 08 03', '+41 79 306 39 62'),
(2, 'Janvier', 'Marie-France', 'Chemin des Libellules 2', '1227', 'Carouge', '1952-02-02', 'mfj@gmail.com', 'mfj1952', '+41 22 708 88 32', '+41 76 636 19 45'),
(3, 'Abdel Razek', 'Mohamed', 'Avenue des Bois 12', '1290', 'Versoix', '1970-11-17', 'abdel1970@gmail.com', 'AbDeLrAZeKM', '+41 22 755 82 07', '+41 79 362 21 72'),
(4, 'Blier', 'Bernard', 'Avenue de France 54', '1227', 'Carouge', '1953-07-15', 'Bernard_Blier@hotmail.fr', '1234BB5678', '+41 22 708 55 55', '+41 79 380 92 07'),
(5, 'Bridou', 'Justin', 'Rue des Auvergnats 10B', '1290', 'Versoix', '1968-01-05', 'BridouJ@bluewin.ch', 'justinB1968', '+41 22 755 28 13', '+41 78 926 08 98');

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE IF NOT EXISTS `commandes` (
  `idCommandes` int(11) NOT NULL AUTO_INCREMENT,
  `Clients_idClients` int(4) NOT NULL,
  PRIMARY KEY (`idCommandes`),
  KEY `Clients_idClients` (`Clients_idClients`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `commandes`
--

INSERT INTO `commandes` (`idCommandes`, `Clients_idClients`) VALUES
(2, 1),
(5, 2),
(3, 3),
(4, 3),
(6, 3),
(1, 4);

-- --------------------------------------------------------

--
-- Structure de la table `commandes_has_articles`
--

CREATE TABLE IF NOT EXISTS `commandes_has_articles` (
  `commandes_idCommandes` int(11) NOT NULL,
  `articles_idArticles` int(11) NOT NULL,
  `quantitearticleCommandes_has_articles` int(11) NOT NULL,
  PRIMARY KEY (`commandes_idCommandes`,`articles_idArticles`),
  KEY `fk_commandes_has_articles1_articles1_idx` (`articles_idArticles`),
  KEY `fk_commandes_has_articles1_commandes1_idx` (`commandes_idCommandes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `commandes_has_articles`
--

INSERT INTO `commandes_has_articles` (`commandes_idCommandes`, `articles_idArticles`, `quantitearticleCommandes_has_articles`) VALUES
(1, 3, 1),
(1, 4, 1),
(1, 5, 1),
(2, 6, 1),
(3, 7, 1),
(3, 9, 1),
(4, 2, 1),
(5, 8, 1),
(5, 10, 1),
(6, 1, 3);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `commandes_ibfk_1` FOREIGN KEY (`Clients_idClients`) REFERENCES `clients` (`idClients`);

--
-- Contraintes pour la table `commandes_has_articles`
--
ALTER TABLE `commandes_has_articles`
  ADD CONSTRAINT `fk_commandes_has_articles1_commandes1` FOREIGN KEY (`commandes_idCommandes`) REFERENCES `commandes` (`idCommandes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_commandes_has_articles1_articles1` FOREIGN KEY (`articles_idArticles`) REFERENCES `articles` (`idArticles`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
