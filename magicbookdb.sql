-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2014 at 02:25 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `magicbookdb`
--
CREATE DATABASE IF NOT EXISTS `magicbookdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `magicbookdb`;

-- --------------------------------------------------------

--
-- Table structure for table `admininfo`
--

DROP TABLE IF EXISTS `admininfo`;
CREATE TABLE IF NOT EXISTS `admininfo` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admininfo`
--

INSERT INTO `admininfo` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
CREATE TABLE IF NOT EXISTS `card` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `hero` int(11) DEFAULT NULL,
  `rarity` varchar(10) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `subtype` varchar(20) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `attack` int(11) DEFAULT NULL,
  `hp` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `picture` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `card`
--

INSERT INTO `card` (`id`, `name`, `hero`, `rarity`, `type`, `subtype`, `cost`, `attack`, `hp`, `description`, `picture`) VALUES
(1, 'testna karta 1', 3, 'rare', 'spell', NULL, 3, NULL, NULL, 'opis testne karte 1', NULL),
(2, 'testna karta 2', NULL, 'common', 'minion', 'general', 5, 5, 6, 'opis testne karte 2', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cardindeck`
--

DROP TABLE IF EXISTS `cardindeck`;
CREATE TABLE IF NOT EXISTS `cardindeck` (
  `id` int(11) NOT NULL,
  `deck` int(11) DEFAULT NULL,
  `card` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cardindeck_card_idx` (`card`),
  KEY `cardindeck_deck_idx` (`deck`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deck`
--

DROP TABLE IF EXISTS `deck`;
CREATE TABLE IF NOT EXISTS `deck` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `hero` int(11) DEFAULT NULL,
  `player` int(11) DEFAULT NULL,
  `number_of_wins` int(11) DEFAULT NULL,
  `number_of_losses` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hero_idx` (`hero`),
  KEY `player_idx` (`player`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hero`
--

DROP TABLE IF EXISTS `hero`;
CREATE TABLE IF NOT EXISTS `hero` (
  `id` int(11) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hero`
--

INSERT INTO `hero` (`id`, `name`) VALUES
(1, 'Priest'),
(2, 'Warrior'),
(3, 'Mage'),
(4, 'Rogue'),
(5, 'Druid'),
(6, 'Warlock'),
(7, 'Hunter'),
(8, 'Paladin'),
(9, 'Shaman');

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
CREATE TABLE IF NOT EXISTS `player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `level` int(11) DEFAULT '0',
  `password` varchar(45) DEFAULT NULL,
  `number_of_wins` int(11) DEFAULT NULL,
  `number_of_losses` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`id`, `username`, `email`, `level`, `password`, `number_of_wins`, `number_of_losses`) VALUES
(1, 'kekinovic', 'kekinovic1@etf.unsa.ba', 1, 'pass', 0, 0),
(2, 'lfazlagic', 'lfazlagic@etf.unsa.ba', 1, 'pass', 0, 0),
(3, 'bmuratovic', 'bmuratovic1@etf.unsa.ba', 1, 'pass', 3, 5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `players in ladder`
--
DROP VIEW IF EXISTS `players in ladder`;
CREATE TABLE IF NOT EXISTS `players in ladder` (
`Username` varchar(45)
,`Number of wins` int(11)
);
-- --------------------------------------------------------

--
-- Structure for view `players in ladder`
--
DROP TABLE IF EXISTS `players in ladder`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `players in ladder` AS select `player`.`username` AS `Username`,`player`.`number_of_wins` AS `Number of wins` from `player` order by `player`.`number_of_wins` desc;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cardindeck`
--
ALTER TABLE `cardindeck`
  ADD CONSTRAINT `cardindeck_card` FOREIGN KEY (`card`) REFERENCES `card` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `cardindeck_deck` FOREIGN KEY (`deck`) REFERENCES `deck` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `deck`
--
ALTER TABLE `deck`
  ADD CONSTRAINT `deck_hero` FOREIGN KEY (`hero`) REFERENCES `hero` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `deck_player` FOREIGN KEY (`player`) REFERENCES `player` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
