-- phpMyAdmin SQL Dump
-- version 0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jui 25, 2021 at 12:01 PM


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `voyagedatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `ranking` tinyint(1) DEFAULT NULL,
  `prestation_idPRE` varchar(25) NOT NULL,
  `user_idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`ranking`, `prestation_idPRE`, `user_idUser`) VALUES
(1, '1', 1)
;

-- --------------------------------------------------------

--
-- Table structure for table `prestation`
--

CREATE TABLE `prestation` (
  `idPRE` varchar(25) NOT NULL,
  `pays` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idPRE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prestation`
--

INSERT INTO `prestation` (`idPRE`, `pays`,`image`, `description`) VALUES
('1', 'Iles Canaries', './images/destination/Canaries.webp', 'Les Canaries, archipel espagnol au large de la côte nord-ouest d Afrique, sont des îles volcaniques au relief escarpé connues pour leurs plages de sable noir et de sable blanc.'),
('2', 'Egypte', './images/destination/Egypte.webp', 'L Égypte est un pont entre l Afrique du Nord-Est et le Moyen-Orient et son histoire remonte à l époque des pharaons. Des monuments millénaires bordent les berges de la fertile vallée du Nil, notamment le sphinx et les pyramides colossales de Gizeh. '),
('3', 'Grece', './images/destination/Grece.webp', 'La Grèce est un pays du sud-est de l Europe, composé de milliers d îles parsemant les mers Égée et Ionienne. Influente pendant l Antiquité, elle est souvent surnommée le berceau de la civilisation occidentale.'),
('4', 'Turquie', './images/destination/Turquie.webp', 'La Turquie s étend de l Europe de l Est à l Asie Mineure. Culturellement, elle est liée aux anciens empires grec, perse, romain, byzantin et ottoman.');
-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `idHOT` varchar(25) NOT NULL,
  `prestation_idPRE` varchar(25) NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idHOT`),
  KEY `prestation_idPRES` (`prestation_idPRE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`idHOT`, `prestation_idPRE`,`nom`, `rating`,`image`, `description`) VALUES
('0.1','1', 'Riu Calypso', 4.5, '.\images\hotels\Canaries\Riu Calypso.jpg','Surplombant la plage de Jandía, cet hôtel contemporain est réservé aux adultes. Il se trouve à 2 km de la plage Playa del Matorral et à 4 km du parcours de golf de Jandía.'),
('0.2','1', 'Riu Palace Meloneras', 4.7, '.\images\hotels\Canaries\Riu Palace Meloneras.jpg','Offrant une vue sur les dunes de Maspalomas, sur la côte atlantique, ce complexe balnéaire élégant se trouve à 10 minutes à pied du phare de Maspalomas et à 6 km d Aqualand Maspalomas.'),
('0.3','1', 'Servatur Waikiki', 4.2, '.\images\hotels\Canaries\Servatur Waikiki.jpg','Cet hôtel tout compris à l atmosphère détendue se trouve à 12 minutes à pied de la Playa del Inglés, à 6 km du phare de Maspalomas et à 3 km des dunes de Maspalomas.'),
('1.1','2', 'Beach Albatros Resort', 4.5, '.\images\hotels\Egypte\Beach Albatros Resort.jpg','Situé au bord de la mer Rouge, ce vaste complexe tout compris se trouve à 2 km de l Hurghada Grand Aquarium et à 4 km du musée de sculptures Sand City Hurghada.'),
('1.2','2', 'Dana Beach Resort', 4.6, '.\images\hotels\Egypte\Dana Beach Resort.jpg','Situé au bord d une plage de la mer Rouge, ce vaste complexe haut de gamme se trouve à 5 km du Grand aquarium de Hurghada et à 14 km de l aéroport international de Hurghada.'),
('1.3','2', 'Steigenberger Aqua Magic', 4.5, '.\images\hotels\Egypte\Steigenberger Aqua Magic.jpg','Situé à 6 minutes à pied de la plage, ce complexe luxueux se trouve aussi à 6 km du Grand Aquarium et à 13 km du centre-ville de Hurghada.'),
('2.1','3', 'Hotel Pilot Beach Resort', 4.7, '.\images\hotels\Grece\Hotel Pilot Beach Resort.jpg','Situé dans une station balnéaire en bord de mer, ce complexe au style raffiné se trouve à 4,2 km du lac de Kournas et à 12 km du chai Dourakis Winery.'),
('2.2','3', 'Mitsis Grand Hotel Beach', 4.6, '.\images\hotels\Grece\Mitsis Grand Hotel Beach.jpg','Le Mitsis Grand Hotel Beach Hotel, un hôtel familial qui vous apporte le meilleur de Rhodes (ville) à votre portée.'),
('2.3','3', 'Neptune Hotels Resort', 4.8, '.\images\hotels\Grece\Neptune Hotels Resort.jpg','Situé sur la plage Bravo Beach, ce vaste complexe haut de gamme se trouve à 1,6 km du parc aquatique Lido et à 12 km du château d Antimachia.'),
('3.1','4', 'Kaya Belek', 4.5, '.\images\hotels\Turquie\Kaya Belek.jpg','Installé dans un jardin tropical au bord de la mer Méditerranée, ce complexe tout compris à l ambiance décontractée se trouve face à la plage, à 2 km du club de golf d Antalya et à 27 km de l aéroport d Antalya.'),
('3.2','4', 'Melas Lara Resort', 4.5, '.\images\hotels\Turquie\Melas Lara Resort.jpg','Installé sur la plage de Lara, cet élégant hôtel tout compris associe une décoration moderne avec des éléments traditionnels. Il se trouve à 12 km des chutes d eau panoramiques de Düden et à 9 km des sculptures de sable présentées à Sandland.'),
('3.3','4', 'Voyage Belek Golf Spa', 4.7, '.\images\hotels\Turquie\Voyage Belek Golf Spa.jpg','Situé au bord d une plage de sable de la mer Méditerranée, ce complexe haut de gamme se trouve à 37 km de l aéroport d Antalya et à 2 km de Belek Beach Park.');

-- --------------------------------------------------------


--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `idUSER` int(11) NOT NULL,
  `eMail` varchar(256) NOT NULL,
  `password` varchar(64) NOT NULL,
  `nom` varchar(64) NOT NULL,
  `prenom` varchar(64) NOT NULL,
  PRIMARY KEY (`idUSER`)

) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`idUSER`, `eMail`, `password`,`nom`, `prenom`) VALUES
(1, 'me@gmail.com', 'dc76e9f0c0006e8f919e0c515c66dbba3982f785','me','me'),
(2, 'buffalo@gmail.com', 'dc76e9f0c0006e8f919e0c515c66dbba3982f785','Buffalo','Bill'),
(3, 'lucky@gmail.com', 'dc76e9f0c0006e8f919e0c515c66dbba3982f785','Lucky','Luke'),
(4, 'jesse@gmail.com', 'dc76e9f0c0006e8f919e0c515c66dbba3982f785','Jessie','James');



-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--`FK_idHOT` varchar(25) NOT NULL,
 -- `FK_idUSER` varchar(25) NOT NULL,
--

CREATE TABLE `reservation` (
  `idRES` varchar(25) NOT NULL,
  `nb_personne` varchar(100) NOT NULL,
  PRIMARY KEY (`user_idUSER`,`hotel_idHOT`),
  KEY `fk_reservation_user1` (`hotel_idPRE`),
  KEY `fk_reservation_prestation1` (`user_idUSER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`idRES`,`hotel_idHOT`, `user_idUSER`, `nb_personne`) VALUES
('1', '1', '2', '2');


-- --------------------------------------------------------

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`prestation_idPRE`,`user_idUser`),
  ADD KEY `FK_feedback_idUser` (`user_idUser`);




--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `eMail` (`eMail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `FK_feedback_idPRE` FOREIGN KEY (`prestation_idPRE`) REFERENCES `prestation` (`idPRE`),
  ADD CONSTRAINT `FK_feedback_idUser` FOREIGN KEY (`user_idUser`) REFERENCES `users` (`idUser`);
