-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2014 at 11:40 PM
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
  `name` varchar(30) DEFAULT NULL,
  `hero` int(11) DEFAULT NULL,
  `rarity` varchar(10) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `attack` int(11) DEFAULT NULL,
  `hp` int(11) DEFAULT NULL,
  `picture` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `card`
--

INSERT INTO `card` (`id`, `name`, `hero`, `rarity`, `type`, `cost`, `attack`, `hp`, `picture`) VALUES
(1, 'Heroic Strike', 2, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/794/1.png'),
(3, 'Edwin VanCleef', 4, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/800/3.png'),
(4, 'Sorcerer^s Apprentice', 3, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/785/4.png'),
(7, 'Blessed Champion', 8, 'Rare', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/513/7.png'),
(8, 'Darkspear Hunter', 7, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/632/8.png'),
(10, 'Lightning Bolt', 9, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/344/10.png'),
(14, 'Patient Assassin', 4, 'Epic', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/623/14.png'),
(15, 'Oasis Snapjaw', 0, 'Free', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/815/15.png'),
(18, 'Gruul', 0, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/128/479/18.png'),
(19, 'Nat Pagle', 0, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/671/19.png'),
(22, 'Hunter^s Mark', 7, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/752/22.png'),
(23, 'Aldor Peacekeeper', 8, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/538/23.png'),
(24, 'Shieldbearer', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/581/24.png'),
(25, 'Wild Pyromancer', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/128/428/25.png'),
(26, 'Cone of Cold', 3, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/387/26.png'),
(27, 'Booty Bay Bodyguard', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/897/27.png'),
(28, 'Ice Block', 3, 'Epic', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/414/28.png'),
(29, 'Blessing of Kings', 8, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/767/29.png'),
(30, 'Mirror Image', 3, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/641/30.png'),
(31, 'Chillwind Yeti', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/891/31.png'),
(33, 'Sylvanas Windrunner', 0, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/63/33.png'),
(34, 'Ancient of Lore', 5, 'Epic', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/128/391/34.png'),
(36, 'Dread Infernal', 6, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/719/36.png'),
(38, 'Circle of Healing', 1, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/821/38.png'),
(39, 'Hogger', 0, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/128/482/39.png'),
(41, 'Ironforge Rifleman', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/839/41.png'),
(42, 'Spellbreaker', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/113/42.png'),
(43, 'Death Coil', 6, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/423/43.png'),
(44, 'Flamestrike', 3, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/655/44.png'),
(47, 'Razorfen Hunter', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/906/47.png'),
(49, 'Frost Nova', 3, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/638/49.png'),
(50, 'Death Wish', 2, 'Epic', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/596/50.png'),
(51, 'Unbound Elemental', 9, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/378/51.png'),
(54, 'Pint-Sized Summoner', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/143/54.png'),
(55, 'Murloc Raider', 0, 'Free', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/869/55.png'),
(56, 'Arcane Explosion', 3, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/635/56.png'),
(57, 'Angry Chicken', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/39/57.png'),
(60, 'Boulderfist Ogre', 0, 'Free', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/912/60.png'),
(62, 'Thoughtsteal', 1, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/491/62.png'),
(67, 'Mana Addict', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/122/67.png'),
(69, 'Frothing Berserker', 2, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/776/69.png'),
(73, 'Big Game Hunter', 0, 'Epic', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/27/73.png'),
(74, 'Acidic Swamp Ooze', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/137/74.png'),
(75, 'Blood Knight', 0, 'Epic', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/749/75.png'),
(76, 'Stonetusk Boar', 0, 'Free', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/875/76.png'),
(77, 'Earth Shock', 9, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/356/77.png'),
(80, 'Mad Bomber', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/149/80.png'),
(81, 'Cleave', 2, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/806/81.png'),
(82, 'Perdition^s Blade', 4, 'Rare', 'Weapon', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/233/82.png'),
(84, 'Darkscale Healer', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/983/84.png'),
(85, 'Flame Imp', 6, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/467/85.png'),
(86, 'Timber Wolf', 7, 'Free', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/989/86.png'),
(87, 'Deadly Poison', 4, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/731/87.png'),
(88, 'Coldlight Oracle', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/119/88.png'),
(90, 'Sprint', 4, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/740/90.png'),
(92, 'Cold Blood', 4, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/728/92.png'),
(94, 'Molten Giant', 0, 'Epic', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/818/94.png'),
(95, 'Raging Worgen', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/602/95.png'),
(96, 'Gorehowl', 2, 'Epic', 'Weapon', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/599/96.png'),
(97, 'Arcane Golem', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/161/97.png'),
(99, 'Freezing Trap', 7, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/794/99.png'),
(100, 'Blessing of Wisdom', 8, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/522/100.png'),
(101, 'Starving Buzzard', 7, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/955/101.png'),
(103, 'Southsea Deckhand', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/845/103.png'),
(107, 'Mana Spring Totem', 9, 'Epic', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/697/107.png'),
(108, 'Holy Light', 8, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/761/108.png'),
(112, 'Worgen Infiltrator', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/42/112.png'),
(114, 'Explosive Shot', 7, 'Rare', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/641/114.png'),
(117, 'Lightwell', 1, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/495/117.png'),
(119, 'Void Terror', 6, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/429/119.png'),
(120, 'Nourish', 5, 'Rare', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/293/120.png'),
(123, 'Young Priestess', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/22/123.png'),
(124, 'Earth Elemental', 9, 'Epic', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/372/124.png'),
(125, 'Ethereal Arcanist', 3, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/384/125.png'),
(127, 'Master of Disguise', 4, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/128/412/127.png'),
(128, 'Dark Iron Dwarf', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/110/128.png'),
(129, 'Dust Devil', 9, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/350/129.png'),
(130, 'Kor^kron Elite', 2, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/128/406/130.png'),
(131, 'Gadgetzan Auctioneer', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/141/575/131.png'),
(135, 'Headcrack', 4, 'Rare', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/242/135.png'),
(138, 'Priestess of Elune', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/737/138.png'),
(140, 'Cult Master', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/761/140.png'),
(142, 'Avenging Wrath', 8, 'Epic', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/547/142.png'),
(146, 'Windfury', 9, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/670/146.png'),
(147, 'Cabal Shadow Priest', 1, 'Epic', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/164/147.png'),
(148, 'Savagery', 5, 'Rare', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/728/148.png'),
(149, 'Mark of Nature', 5, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/260/149.png'),
(151, 'Windspeaker', 9, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/746/151.png'),
(152, 'Stormforged Axe', 9, 'Common', 'Weapon', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/363/152.png'),
(153, 'Ancient Watcher', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/106/153.png'),
(154, 'Naturalize', 5, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/287/154.png'),
(157, 'Questing Adventurer', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/103/157.png'),
(158, 'Noble Sacrifice', 8, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/218/158.png'),
(160, 'Vaporize', 3, 'Rare', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/758/160.png'),
(161, 'Whirlwind', 2, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/575/161.png'),
(162, 'Tundra Rhino', 7, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/992/162.png'),
(163, 'Tracking', 7, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/998/163.png'),
(164, 'Shiv', 4, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/393/164.png'),
(165, 'Power of the Wild', 5, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/275/165.png'),
(167, 'Arcane Shot', 7, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/1/167.png'),
(170, 'Power Overwhelming', 6, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/456/170.png'),
(172, 'Doomhammer', 9, 'Epic', 'Weapon', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/698/172.png'),
(173, 'Core Hound', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/915/173.png'),
(174, 'Wolfrider', 0, 'Free', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/827/174.png'),
(176, 'Ancient Mage', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/740/176.png'),
(177, 'Frost Bolt', 3, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/632/177.png'),
(178, 'Imp Master', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/767/178.png'),
(179, 'The Beast', 0, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/725/179.png'),
(182, 'Arcanite Reaper', 2, 'Common', 'Weapon', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/803/182.png'),
(184, 'Nightblade', 0, 'Free', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/755/184.png'),
(188, 'Ice Lance', 3, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/651/188.png'),
(189, 'Humility', 8, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/516/189.png'),
(191, 'Argent Protector', 8, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/519/191.png'),
(192, 'Mental Collapse', 1, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/488/192.png'),
(193, 'Warsong Commander', 2, 'Free', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/155/193.png'),
(194, 'King Krush', 7, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/653/194.png'),
(196, 'Blood Imp', 6, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/706/196.png'),
(197, 'Mana Wraith', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/809/197.png'),
(198, 'Betrayal', 4, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/209/198.png'),
(203, 'Illidan Stormrage', 0, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/803/203.png'),
(205, 'Sinister Strike', 4, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/734/205.png'),
(206, 'Eye for an Eye', 8, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/230/206.png'),
(207, 'Prayer of Fortitude', 1, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/582/207.png'),
(208, 'Succubus', 6, 'Free', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/432/208.png'),
(209, 'Injured Blademaster', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/888/209.png'),
(210, 'Snake Trap', 7, 'Epic', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/662/210.png'),
(212, 'Demolisher', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/182/212.png'),
(213, 'Faerie Dragon', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/128/437/213.png'),
(214, 'Feral Spirit', 9, 'Rare', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/366/214.png'),
(215, 'Slam', 2, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/553/215.png'),
(216, 'Ancestral Healing', 9, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/673/216.png'),
(217, 'Old Murk-Eye', 0, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/134/217.png'),
(220, 'Archmage Antonidas', 3, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/677/220.png'),
(221, 'Sunwalker', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/94/221.png'),
(222, 'Murloc Warleader', 0, 'Epic', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/614/222.png'),
(225, 'Houndmaster', 7, 'Free', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/986/225.png'),
(227, 'Execute', 2, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/800/227.png'),
(228, 'Prophet Velen', 1, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/507/228.png'),
(232, 'Penance', 1, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/827/232.png'),
(233, 'Frost Shock', 9, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/664/233.png'),
(236, 'Felguard', 6, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/420/236.png'),
(237, 'Force of Nature', 5, 'Epic', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/704/237.png'),
(238, 'Ironbark Protector', 5, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/940/238.png'),
(239, 'Deadly Shot', 7, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/812/239.png'),
(241, 'Malygos', 0, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/689/241.png'),
(242, 'Ancient of War', 5, 'Epic', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/335/242.png'),
(244, 'Blade Flurry', 4, 'Rare', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/943/244.png'),
(245, 'Tinkmaster Overspark', 0, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/152/245.png'),
(246, 'Gnomish Inventor', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/848/246.png'),
(247, 'Youthful Brewmaster', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/116/247.png'),
(249, 'Mass Dispel', 1, 'Rare', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/845/249.png'),
(250, 'Light^s Justice', 8, 'Free', 'Weapon', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/764/250.png'),
(251, 'Gelbin Mekkatorque', 0, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/197/251.png'),
(252, 'Corruption', 6, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/716/252.png'),
(256, 'Bloodlust', 9, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/682/256.png'),
(258, 'Healing Touch', 5, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/600/258.png'),
(260, 'Consecration', 8, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/770/260.png'),
(261, 'Dread Corsair', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/128/434/261.png'),
(263, 'Mana Wyrm', 3, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/128/409/263.png'),
(264, 'Mountain Giant', 0, 'Epic', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/188/264.png'),
(265, 'Thrallmar Farseer', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/75/265.png'),
(266, 'Bite', 5, 'Rare', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/701/266.png'),
(267, 'Captain Greenskin', 0, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/128/440/267.png'),
(270, 'Hex', 9, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/360/270.png'),
(273, 'Wisp', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/937/273.png'),
(274, 'Water Elemental', 3, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/658/274.png'),
(276, 'Blizzard', 3, 'Rare', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/644/276.png'),
(278, 'Gladiator^s Longbow', 7, 'Epic', 'Weapon', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/4/278.png'),
(279, 'Scavenging Hyena', 7, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/626/279.png'),
(280, 'Azure Drake', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/402/280.png'),
(282, 'Wild Growth', 5, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/615/282.png'),
(283, 'Guardian of Kings', 8, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/758/283.png'),
(284, 'Conceal', 4, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/212/284.png'),
(285, 'Nozdormu', 0, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/680/285.png'),
(286, 'SI:7 Agent', 4, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/236/286.png'),
(289, 'Bluegill Warrior', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/881/289.png'),
(293, 'Truesilver Champion', 8, 'Common', 'Weapon', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/776/293.png'),
(297, 'Brawl', 2, 'Epic', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/584/297.png'),
(301, 'Mindgames', 1, 'Epic', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/498/301.png'),
(303, 'Alexstrasza', 0, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/683/303.png'),
(304, 'Bestial Wrath', 7, 'Epic', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/659/304.png'),
(305, 'Dire Wolf Alpha', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/290/305.png'),
(309, 'Spellbender', 3, 'Epic', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/128/512/309.png'),
(310, 'Stormwind Champion', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/928/310.png'),
(311, 'Soul of the Forest', 5, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/269/311.png'),
(315, 'Shadow Word: Pain', 1, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/946/315.png'),
(317, 'Unleash the Hounds', 7, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/644/317.png'),
(323, 'War Golem', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/894/323.png'),
(324, 'Southsea Captain', 0, 'Epic', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/128/452/324.png'),
(325, 'Stormpike Commando', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/851/325.png'),
(326, 'Sen^jin Shieldmasta', 0, 'Free', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/884/326.png'),
(327, 'Sense Demons', 6, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/459/327.png'),
(328, 'Cruel Taskmaster', 2, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/773/328.png'),
(329, 'Savage Roar', 5, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/609/329.png'),
(332, 'Drain Life', 6, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/710/332.png'),
(335, 'Al^Akir the Windlord', 9, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/128/403/335.png'),
(338, 'Jadefire Satyr', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/88/338.png'),
(339, 'Millhouse Manastorm', 0, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/128/455/339.png'),
(340, 'Voidwalker', 6, 'Free', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/722/340.png'),
(344, 'Explosive Trap', 7, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/791/344.png'),
(345, 'Mortal Strike', 2, 'Rare', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/587/345.png'),
(346, 'Mogu^shan Warden', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/563/346.png'),
(348, 'Grimoire of Sacrifice', 6, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/128/368/348.png'),
(350, 'Hammer of Wrath', 8, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/773/350.png'),
(355, 'Holy Wrath', 8, 'Rare', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/526/355.png'),
(356, 'Elven Archer', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/903/356.png'),
(357, 'Murloc Tidehunter', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/608/357.png'),
(360, 'Twilight Drake', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/100/360.png'),
(362, 'Magma Rager', 0, 'Free', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/812/362.png'),
(363, 'Eaglehorn Bow', 7, 'Rare', 'Weapon', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/638/363.png'),
(364, 'Preparation', 4, 'Epic', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/248/364.png'),
(366, 'Inner Rage', 2, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/782/366.png'),
(367, 'Totemic Might', 9, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/353/367.png'),
(368, 'Mind Control Tech', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/158/368.png'),
(372, 'Sunfury Protector', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/128/372.png'),
(373, 'King Mukla', 0, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/52/373.png'),
(378, 'Fan of Knives', 4, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/215/378.png'),
(382, 'Eviscerate', 4, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/206/382.png'),
(383, 'Equality', 8, 'Rare', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/815/383.png'),
(385, 'Sap', 4, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/731/385.png'),
(386, 'Harvest Golem', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/668/386.png'),
(388, 'Dalaran Mage', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/734/388.png'),
(389, 'Stampeding Kodo', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/128/488/389.png'),
(390, 'Flametongue Totem', 9, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/695/390.png'),
(391, 'Tirion Fordring', 8, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/541/391.png'),
(392, 'Jungle Panther', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/66/392.png'),
(394, 'Blessing of Might', 8, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/755/394.png'),
(395, 'Loot Hoarder', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/173/395.png'),
(396, 'The Black Knight', 0, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/19/396.png'),
(398, 'Twisting Nether', 6, 'Epic', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/447/398.png'),
(401, 'Mind Control', 1, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/579/401.png'),
(402, 'Pit Lord', 6, 'Epic', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/450/402.png'),
(407, 'Multi-Shot', 7, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/995/407.png'),
(409, 'Holy Smite', 1, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/585/409.png'),
(410, 'Voodoo Doctor', 0, 'Free', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/45/410.png'),
(411, 'Kirin Tor Mage', 3, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/797/411.png'),
(414, 'Lord of the Arena', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/866/414.png'),
(415, 'Mind Blast', 1, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/7/415.png'),
(417, 'Defias Ringleader', 4, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/224/417.png'),
(420, 'Murloc Tidecaller', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/620/420.png'),
(421, 'Shadowform', 1, 'Epic', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/836/421.png'),
(422, 'Knife Juggler', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/128/425/422.png'),
(424, 'Coldlight Seer', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/185/424.png'),
(425, 'Alarm-o-Bot', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/30/425.png'),
(428, 'Acolyte of Pain', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/33/428.png'),
(431, 'Power Word: Shield', 1, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/594/431.png'),
(432, 'Onyxia', 0, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/686/432.png'),
(433, 'Assassin^s Blade', 4, 'Common', 'Weapon', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/743/433.png'),
(434, 'Shattered Sun Cleric', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/69/434.png'),
(435, 'Novice Engineer', 0, 'Free', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/60/435.png'),
(436, 'Lightwarden', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/16/436.png'),
(438, 'Mind Vision', 1, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/591/438.png'),
(442, 'Dark Command', 1, 'Rare', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/485/442.png'),
(447, 'Misdirection', 7, 'Rare', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/629/447.png'),
(450, 'Faceless Manipulator', 0, 'Epic', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/692/450.png'),
(452, 'Demonfire', 6, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/764/452.png'),
(453, 'Bloodsail Corsair', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/128/443/453.png'),
(454, 'Rampage', 2, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/791/454.png'),
(456, 'Lorewalker Cho', 0, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/179/456.png'),
(457, 'Greater Heal', 1, 'Rare', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/833/457.png'),
(459, 'Keeper of the Grove', 5, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/317/459.png'),
(463, 'Argent Commander', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/140/463.png'),
(464, 'Starfall', 5, 'Rare', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/128/380/464.png'),
(467, 'Doomsayer', 0, 'Epic', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/128/431/467.png'),
(471, 'Backstab', 4, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/725/471.png'),
(472, 'Dragonling Mechanic', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/82/472.png'),
(473, 'Argent Squire', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/36/473.png'),
(474, 'Deathwing', 0, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/128/458/474.png'),
(475, 'Scarlet Crusader', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/72/475.png'),
(476, 'Fen Creeper', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/573/476.png'),
(477, 'Tauren Warrior', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/550/477.png'),
(479, 'Kobold Geomancer', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/842/479.png'),
(480, 'Mark of the Wild', 5, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/606/480.png'),
(482, 'Lord Jaraxxus', 6, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/473/482.png'),
(483, 'Secretkeeper', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/146/483.png'),
(488, 'Kill Command', 7, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/650/488.png'),
(489, 'Arcane Intellect', 3, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/629/489.png'),
(491, 'Rockbiter Weapon', 9, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/679/491.png'),
(493, 'Shield Block', 2, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/779/493.png'),
(495, 'Ysera', 0, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/707/495.png'),
(496, 'Pyroblast', 3, 'Epic', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/396/496.png'),
(498, 'Cairne Bloodhoof', 0, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/191/498.png'),
(499, 'Hand of Protection', 8, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/532/499.png'),
(500, 'Ironbeak Owl', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/919/500.png'),
(502, 'Raid Leader', 0, 'Free', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/824/502.png'),
(503, 'Ragnaros the Firelord', 0, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/417/503.png'),
(504, 'Arathi Weaponsmith', 2, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/566/504.png'),
(506, 'Lay on Hands', 8, 'Epic', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/510/506.png'),
(507, 'Doomguard', 6, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/444/507.png'),
(509, 'Venture Co. Mercenary', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/934/509.png'),
(510, 'Grimscale Oracle', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/617/510.png'),
(513, 'Leper Gnome', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/91/513.png'),
(518, 'Ravenholdt Assassin', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/863/518.png'),
(519, 'Ironfur Grizzly', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/830/519.png'),
(522, 'Fireball', 3, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/647/522.png'),
(523, 'Violet Teacher', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/128/446/523.png'),
(525, 'Bloodmage Thalnos', 0, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/48/525.png'),
(526, 'Ancestral Spirit', 9, 'Rare', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/667/526.png'),
(529, 'Soulfire', 6, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/141/579/529.png'),
(530, 'Forked Lightning', 9, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/375/530.png'),
(531, 'Counterspell', 3, 'Rare', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/405/531.png'),
(532, 'Claw', 5, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/597/532.png'),
(535, 'River Crocolisk', 0, 'Free', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/818/535.png'),
(539, 'Baron Geddon', 0, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/369/539.png'),
(542, 'Defender of Argus', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/167/542.png'),
(544, 'Silence', 1, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/482/544.png'),
(545, 'Archmage', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/860/545.png'),
(547, 'Fade', 1, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/824/547.png'),
(548, 'Innervate', 5, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/326/548.png'),
(550, 'Shadowstep', 4, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/245/550.png'),
(553, 'Snipe', 7, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/788/553.png'),
(554, 'Divine Spirit', 1, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/952/554.png'),
(557, 'Earthen Ring Farseer', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/809/557.png'),
(559, 'Captain^s Parrot', 0, 'Epic', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/128/416/559.png'),
(560, 'Reckless Rocketeer', 0, 'Free', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/922/560.png'),
(562, 'Kidnapper', 4, 'Epic', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/128/374/562.png'),
(564, 'Goldshire Footman', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/570/564.png'),
(566, 'Summoning Portal', 6, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/453/566.png'),
(567, 'Sword of Justice', 8, 'Epic', 'Weapon', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/529/567.png'),
(568, 'Assassinate', 4, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/737/568.png'),
(569, 'Mirror Entity', 3, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/411/569.png'),
(572, 'Ancient Brewmaster', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/125/572.png'),
(573, 'Siphon Soul', 6, 'Rare', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/441/573.png'),
(576, 'Bloodfen Raptor', 0, 'Free', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/878/576.png'),
(577, 'Abusive Sergeant', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/900/577.png'),
(578, 'Animal Companion', 7, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/128/461/578.png'),
(581, 'Divine Favor', 8, 'Rare', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/504/581.png'),
(584, 'Master Swordsmith', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/128/476/584.png'),
(587, 'Druid of the Claw', 5, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/302/587.png'),
(589, 'Arcane Missiles', 3, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/390/589.png'),
(595, 'Polymorph', 3, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/624/595.png'),
(597, 'Abomination', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/176/597.png'),
(598, 'Frost Elemental', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/399/598.png'),
(600, 'Northshire Cleric', 1, 'Free', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/949/600.png'),
(602, 'Harrison Jones', 0, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/674/602.png'),
(603, 'Stormwind Knight', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/836/603.png'),
(604, 'Frostwolf Warlord', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/931/604.png'),
(605, 'Cenarius', 5, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/710/605.png'),
(610, 'Flesheating Ghoul', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/128/509/610.png'),
(611, 'Silverback Patriarch', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/833/611.png'),
(612, 'Crazed Alchemist', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/131/612.png'),
(613, 'Mana Tide Totem', 9, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/722/613.png'),
(614, 'Sea Giant', 0, 'Epic', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/743/614.png'),
(619, 'Moonfire', 5, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/603/619.png'),
(620, 'Swipe', 5, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/612/620.png'),
(624, 'Gurubashi Berserker', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/572/624.png'),
(625, 'Emperor Cobra', 0, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/329/625.png'),
(627, 'Dark Summoner', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/925/627.png'),
(629, 'Young Dragonhawk', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/872/629.png'),
(630, 'Flare', 7, 'Rare', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/141/582/630.png'),
(632, 'Fiery War Axe', 2, 'Free', 'Weapon', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/797/632.png'),
(633, 'Wrath', 5, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/251/633.png'),
(634, 'Silvermoon Guardian', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/78/634.png'),
(636, 'Fire Elemental', 9, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/676/636.png'),
(637, 'Bloodsail Raider', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/128/422/637.png'),
(638, 'Upgrade!', 2, 'Rare', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/590/638.png'),
(641, 'Amani Berserker', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/560/641.png'),
(642, 'Repentance', 8, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/535/642.png'),
(643, 'Grom Hellscream', 2, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/605/643.png'),
(644, 'Armorsmith', 2, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/578/644.png'),
(646, 'Charge', 2, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/788/646.png'),
(647, 'Shadow Bolt', 6, 'Free', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/703/647.png'),
(648, 'Silver Hand Knight', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/854/648.png'),
(656, 'Auchenai Soulpriest', 1, 'Rare', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/752/656.png'),
(657, 'Redemption', 8, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/239/657.png'),
(658, 'Vanish', 4, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/128/371/658.png'),
(659, 'Ogre Magi', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/909/659.png'),
(660, 'Hungry Crab', 0, 'Epic', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/128/419/660.png'),
(663, 'Frostwolf Grunt', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/821/663.png'),
(664, 'Battle Rage', 2, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/557/664.png'),
(667, 'Starfire', 5, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/332/667.png'),
(670, 'Bane of Doom', 6, 'Epic', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/470/670.png'),
(671, 'Holy Nova', 1, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/126/576/671.png'),
(672, 'Ice Barrier', 3, 'Common', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/408/672.png'),
(673, 'Shadowflame', 6, 'Rare', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/426/673.png'),
(674, 'Leeroy Jenkins', 0, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/200/674.png'),
(675, 'Windfury Harpy', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/97/675.png'),
(676, 'Lightning Storm', 9, 'Rare', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/381/676.png'),
(679, 'Lava Burst', 9, 'Rare', 'Ability', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/347/679.png'),
(682, '', 0, 'Legendary', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/128/491/682.png'),
(683, 'Zombie Chow', 0, 'Common', 'Minion', 0, 0, 0, 'http://media-Hearth.cursecdn.com/avatars/127/871/683.png');

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
