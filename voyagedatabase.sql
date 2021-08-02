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
  `FK_idPRE` varchar(25) NOT NULL,
  `FK_idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`ranking`, `FK_idPRE`, `FK_idUser`) VALUES
(1, 'tt0080684', 9)
;

-- --------------------------------------------------------

--
-- Table structure for table `prestation`
--

CREATE TABLE `prestation` (
  `idPRE` varchar(25) NOT NULL,
  `pays` varchar(100) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `lieu` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idPRE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prestation`
--

INSERT INTO `prestation` (`idPRE`, `pays`, `rating`,`image`, `description`, `lieu`) VALUES
('tt0080684', 'The Empire Strikes Back', 1980, 8.2, './movies/6u1fYtxG5eqjhtCPDx04pJphQRW.jpg', 124, 'The epic saga continues as Luke Skywalker, in hopes of defeating the evil Galactic Empire, learns the ways of the Jedi from aging master Yoda. But Darth Vader is more determined than ever to capture Luke. Meanwhile, rebel leader Princess Leia, cocky Han Solo, Chewbacca, and droids C-3PO and R2-D2 are thrown into various stages of capture, betrayal and despair.'),


-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `idHOT` varchar(25) NOT NULL,
  `FK_idPRE` varchar(25) NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `periode` int(11) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `addresse` varchar(100) DEFAULT NULL,
  `activites` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idHOT`),
  KEY `prestation_idPRES` (`prestation_idPRES`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`idHOT`, `FK_idPRE`,`nom`, `periode`, `rating`,`image`, `description`, `addresse`, `activites`) VALUES
('tt0080684', 'The Empire Strikes Back', 1980, 8.2, './movies/6u1fYtxG5eqjhtCPDx04pJphQRW.jpg', 124, 'The epic saga continues as Luke Skywalker, in hopes of defeating the evil Galactic Empire, learns the ways of the Jedi from aging master Yoda. But Darth Vader is more determined than ever to capture Luke. Meanwhile, rebel leader Princess Leia, cocky Han Solo, Chewbacca, and droids C-3PO and R2-D2 are thrown into various stages of capture, betrayal and despair.'),

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
(9, 'me@gmail.com', 'dc76e9f0c0006e8f919e0c515c66dbba3982f785'),
(10, 'fontaine@gmail.com', 'dc76e9f0c0006e8f919e0c515c66dbba3982f785'),
(11, 'batard@gmail.com', 'dc76e9f0c0006e8f919e0c515c66dbba3982f785'),
(12, 'quilan@gmail.com', 'dc76e9f0c0006e8f919e0c515c66dbba3982f785'),
(13, 'ramos@gmail.com', 'dc76e9f0c0006e8f919e0c515c66dbba3982f785'),
(14, 'blanvill@gmail.com', 'dc76e9f0c0006e8f919e0c515c66dbba3982f785'),
(19, 'toto@gmail.com', '0b9c2625dc21ef05f6ad4ddf47c5f203837aa32c'),
(22, 'titi@gmail.com', 'f7e79ca8eb0b31ee4d5d6c181416667ffee528ed'),
(23, 'asdf@gmail.com', 'f55627ebc3997247413a4972baa5525d6d730370');


-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `idRES` varchar(25) NOT NULL,
  `FK_idPRE` varchar(25) NOT NULL,
  `FK_idUSER` varchar(25) NOT NULL,
  `pays` varchar(100) DEFAULT NULL,
  `periode` int(11) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `lieu` varchar(100) DEFAULT NULL,
  `nb_personne` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FK_idUSER`,`FK_idPRE`),
  KEY `fk_reservation_user1` (`FK_idPRE`),
  KEY `fk_reservation_prestation1` (`FK_idUSER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`idRES`,`FK_idPRE`,`FK_idUSER`, `pays`, `periode`, `rating`,`image`, `description`, `lieu`, `nb_personne`) VALUES
('tt0080684', 'The Empire Strikes Back', 1980, 8.2, './movies/6u1fYtxG5eqjhtCPDx04pJphQRW.jpg', 124, 'The epic saga continues as Luke Skywalker, in hopes of defeating the evil Galactic Empire, learns the ways of the Jedi from aging master Yoda. But Darth Vader is more determined than ever to capture Luke. Meanwhile, rebel leader Princess Leia, cocky Han Solo, Chewbacca, and droids C-3PO and R2-D2 are thrown into various stages of capture, betrayal and despair.'),


-- --------------------------------------------------------

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`FK_idPRE`,`FK_idUser`),
  ADD KEY `FK_feedback_idUser` (`FK_idUser`);




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
  ADD CONSTRAINT `FK_feedback_idPRE` FOREIGN KEY (`FK_idPRE`) REFERENCES `prestation` (`idPRE`),
  ADD CONSTRAINT `FK_feedback_idUser` FOREIGN KEY (`FK_idUser`) REFERENCES `users` (`idUser`);
