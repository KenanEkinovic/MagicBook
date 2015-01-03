-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2015 at 06:57 AM
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

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `availible_cards`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `availible_cards`(IN `p0` INT)
    NO SQL
select card.id, card.name, card.hero, card.rarity, card.type, card.subtype, card.cost, card.attack, card.hp, card.picture
from card left join hero on card.hero = hero.id 
where hero.id is null or hero.id = @p0 ORDER BY `hero`.`id` DESC$$

--
-- Functions
--
DROP FUNCTION IF EXISTS `login`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `login`(`p0` VARCHAR(45), `p1` VARCHAR(45)) RETURNS int(11) unsigned
if EXISTS(select * from player where username = @p0 and password = @p1)
   then
      return 1;
   else
      return 0; 
   end if$$

DELIMITER ;

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
  `subtype` varchar(20) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `attack` int(11) DEFAULT NULL,
  `hp` int(11) DEFAULT NULL,
  `picture` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_2` (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `card`
--

INSERT INTO `card` (`id`, `name`, `hero`, `rarity`, `type`, `subtype`, `cost`, `attack`, `hp`, `picture`) VALUES
(1, 'Abomination', NULL, 'Rare', 'Minion', NULL, 5, 4, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/3/37/Abomination%28597%29.png/184px-Abomination%28597%29.png?version=9e47af5b792479ac6617cb30bf7da8a4'),
(2, 'Ancestor''s Call', 9, 'Epic', 'Spell', NULL, 4, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/6/6e/Ancestor%27s_Call.png/184px-Ancestor%27s_Call.png?version=ae188bba25bd8c053bcdf078cb7a4741'),
(3, 'Abusive Sergeant', NULL, 'Common', 'Minion', NULL, 1, 2, 1, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/d6/Abusive_Sergeant%28577%29.png/184px-Abusive_Sergeant%28577%29.png?version=e4bc1b0498c3c5b342b7e51ffa147a33'),
(4, 'Ancient of Lore', 5, 'Epic', 'Minion', NULL, 7, 5, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/f4/Ancient_of_Lore%2834%29.png/184px-Ancient_of_Lore%2834%29.png?version=929103e800f0021a4ced946cf5660dd0'),
(5, 'Ancestral Healing', 9, 'Free', 'Spell', NULL, 0, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/88/Ancestral_Healing%28216%29.png/184px-Ancestral_Healing%28216%29.png?version=6a30e4e158eaa459696ed8a0215f74e2'),
(6, 'Alarm-o-Bot', NULL, 'Rare', 'Minion', 'Mech', 3, 0, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/b/b4/Alarm-o-Bot%28425%29.png/184px-Alarm-o-Bot%28425%29.png?version=5fb47e05edb3118670a6adea2919afb5'),
(7, 'Acidic Swamp Ooze', NULL, 'Common', 'Minion', NULL, 2, 3, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/4/48/Acidic_Swamp_Ooze%2874%29.png/184px-Acidic_Swamp_Ooze%2874%29.png?version=cb7ae9454b33e9e6f2b0a15c33b316e3'),
(8, 'Al''Akir the Windlord', 9, 'Legendary', 'Minion', NULL, 8, 3, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/e3/Al%27Akir_the_Windlord%28335%29.png/184px-Al%27Akir_the_Windlord%28335%29.png?version=92609b02e460eaf7f06ee6039341e3e4'),
(9, 'Aldor Peacekeeper', 8, 'Rare', 'Minion', NULL, 3, 3, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/d7/Aldor_Peacekeeper%2823%29.png/184px-Aldor_Peacekeeper%2823%29.png?version=c7483a585a3d25cc285b9873cf0d226b'),
(10, 'Alexstrasza', NULL, 'Legendary', 'Minion', 'Dragon', 9, 8, 8, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/b/b4/Alexstrasza%28303%29.png/184px-Alexstrasza%28303%29.png?version=211f647474e7f84b8bb18a2c1daab250'),
(11, 'Acolyte of Pain', NULL, 'Common', 'Minion', NULL, 3, 1, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/82/Acolyte_of_Pain%28428%29.png/184px-Acolyte_of_Pain%28428%29.png?version=a1345547a487065de9df6896de5dae00'),
(12, 'Arcane Explosion', 3, 'Free', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/d7/Arcane_Explosion%2856%29.png/184px-Arcane_Explosion%2856%29.png?version=77c715bf91907081b2e0ea51be25b3d8'),
(13, 'Ancient of War', 5, 'Epic', 'Minion', NULL, 7, 5, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/c0/Ancient_of_War%28242%29.png/184px-Ancient_of_War%28242%29.png?version=febfebbddfa27678dabbc27ef8d3c681'),
(14, 'Arcane Intellect', 3, 'Free', 'Spell', NULL, 3, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/6/65/Arcane_Intellect%28489%29.png/184px-Arcane_Intellect%28489%29.png?version=9a8f7924f4a245cfbb19417e83871ad1'),
(15, 'Amani Berserker', NULL, 'Common', 'Minion', NULL, 2, 2, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/5/5c/Amani_Berserker%28641%29.png/184px-Amani_Berserker%28641%29.png?version=65e957e57cdb6f27285534ca91eeaaa1'),
(16, 'Arcane Missiles', 3, 'Free', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/4/47/Arcane_Missiles%28589%29.png/184px-Arcane_Missiles%28589%29.png?version=a2b2ba58c36f10c8552b0a7027b186e0'),
(17, 'Archmage Antonidas', 3, 'Legendary', 'Minion', NULL, 7, 5, 7, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/6/65/Archmage_Antonidas%28220%29.png/184px-Archmage_Antonidas%28220%29.png?version=adce6b6eae2e223d53957b4436a62a06'),
(18, 'Ancestral Spirit', 9, 'Rare', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/ef/Ancestral_Spirit%28526%29.png/184px-Ancestral_Spirit%28526%29.png?version=2c2e4d0fdbb569cc6e8715128c1b27b7'),
(19, 'Arcane Shot', 7, 'Free', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/7/77/Arcane_Shot%28167%29.png/184px-Arcane_Shot%28167%29.png?version=7cbde2b5f82504146206dab4c130d8e3'),
(20, 'Anima Golem', 6, 'Epic', 'Minion', 'Mech', 6, 9, 9, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/b/b2/Anima_Golem.png/184px-Anima_Golem.png?version=b95066dd20e2fb26bdef34c5b472ed38'),
(21, 'Ancient Brewmaster', NULL, 'Common', 'Minion', NULL, 4, 5, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/2/28/Ancient_Brewmaster%28572%29.png/184px-Ancient_Brewmaster%28572%29.png?version=eb5f7ee9af74c9b244c8032c42bdb3c2'),
(22, 'Avenging Wrath', 8, 'Epic', 'Spell', NULL, 6, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/f7/Avenging_Wrath%28142%29.png/184px-Avenging_Wrath%28142%29.png?version=8753e58eb31f2e7197e4b936c749497e'),
(23, 'Assassinate', 4, 'Free', 'Spell', NULL, 5, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/9d/Assassinate%28568%29.png/184px-Assassinate%28568%29.png?version=f0e3357b8fa6bd542c77202e0e43255d'),
(24, 'Ancient Mage', NULL, 'Rare', 'Minion', NULL, 4, 2, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/94/Ancient_Mage%28176%29.png/184px-Ancient_Mage%28176%29.png?version=ea01b3919ddee9d8783648fb47666ce5'),
(25, 'Ancient Watcher', NULL, 'Rare', 'Minion', NULL, 2, 4, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/4/49/Ancient_Watcher%28153%29.png/184px-Ancient_Watcher%28153%29.png?version=3e0f5cf658b2ca375ffd044b42f2a14f'),
(26, 'Bane of Doom', 6, 'Epic', 'Spell', NULL, 5, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/f1/Bane_of_Doom%28670%29.png/184px-Bane_of_Doom%28670%29.png?version=46057976da926e4ba77a9b4cd787c609'),
(27, 'Animal Companion', 7, 'Common', 'Spell', NULL, 3, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/e1/Animal_Companion%28578%29.png/184px-Animal_Companion%28578%29.png?version=9d413a5c1dd0b65ead6a295c5d9bd574'),
(28, 'Baron Geddon', NULL, 'Legendary', 'Minion', NULL, 7, 7, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/f1/Baron_Geddon%28539%29.png/184px-Baron_Geddon%28539%29.png?version=210119b6791905d67a62d6b4a084e299'),
(29, 'Baron Rivendare', NULL, 'Legendary', 'Minion', NULL, 4, 1, 7, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/db/Baron_Rivendare.png/184px-Baron_Rivendare.png?version=605eba76fcf315e8017f31d6fa2b42a1'),
(30, 'Backstab', 4, 'Free', 'Spell', NULL, 0, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/4/45/Backstab%28471%29.png/184px-Backstab%28471%29.png?version=e24fc8be36779cc95fba14f2dd3290d3'),
(31, 'Blessing of Might', 8, 'Free', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/4/42/Blessing_of_Might%28394%29.png/184px-Blessing_of_Might%28394%29.png?version=03bff4e75f023ccd6eacc9be146efa0e'),
(32, 'Annoy-o-Tron', NULL, 'Common', 'Minion', 'Mech', 2, 1, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/d6/Annoy-o-Tron.png/184px-Annoy-o-Tron.png?version=be0db99622a14e51ef603fbb332704a0'),
(33, 'Bloodfen Raptor', NULL, 'Free', 'Minion', 'Beast', 2, 3, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/2/2c/Bloodfen_Raptor%28576%29.png/184px-Bloodfen_Raptor%28576%29.png?version=327897086c9899b62df124e9a93a78b2'),
(34, 'Boulderfist Ogre', NULL, 'Free', 'Minion', NULL, 6, 6, 7, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/fd/Boulderfist_Ogre%2860%29.png/184px-Boulderfist_Ogre%2860%29.png?version=c3185423b91e6dd05671df845f87021d'),
(35, 'Charge', 2, 'Free', 'Spell', NULL, 3, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/a/ab/Charge%28646%29.png/184px-Charge%28646%29.png?version=38fd96e5d57a7879794c3ecb997d8032'),
(36, 'Anodized Robo Cub', 5, 'Common', 'Minion', 'Mech', 2, 2, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/cf/Anodized_Robo_Cub.png/184px-Anodized_Robo_Cub.png?version=87cc1e14700addce8a5f51955b74a429'),
(37, 'Angry Chicken', NULL, 'Rare', 'Minion', 'Beast', 1, 1, 1, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/c3/Angry_Chicken%2857%29.png/184px-Angry_Chicken%2857%29.png?version=1800fd9c6674d3bce27af961f0edfd8b'),
(38, 'Bloodmage Thalnos', NULL, 'Legendary', 'Minion', NULL, 2, 1, 1, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/cd/Bloodmage_Thalnos%28525%29.png/184px-Bloodmage_Thalnos%28525%29.png?version=9847b4696564b39e47ad89cd952ddf75'),
(39, 'Bestial Wrath', 7, 'Epic', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/4/4d/Bestial_Wrath%28304%29.png/184px-Bestial_Wrath%28304%29.png?version=163e607ddafaa67351495a522a9138ea'),
(40, 'Arcane Golem', NULL, 'Rare', 'Minion', NULL, 3, 4, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/6/65/Arcane_Golem%2897%29.png/184px-Arcane_Golem%2897%29.png?version=91c42ecc9cdfbb0a540d757a019c780e'),
(41, 'Antique Healbot', NULL, 'Common', 'Minion', 'Mech', 5, 3, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/2/2d/Antique_Healbot.png/184px-Antique_Healbot.png?version=efaa8dacf8cd64fd95de814319b28a0e'),
(42, 'Claw', 5, 'Free', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/2/2c/Claw%28532%29.png/184px-Claw%28532%29.png?version=d3167b223a1685b2aa7e9ef5b62efb26'),
(43, 'Bolvar Fordragon', 8, 'Legendary', 'Minion', NULL, 5, 1, 7, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/7/7c/Bolvar_Fordragon.png/184px-Bolvar_Fordragon.png?version=26ed3786bce2b76d5d58ebc2862f4258'),
(44, 'Deadly Poison', 4, 'Free', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/96/Deadly_Poison%2887%29.png/184px-Deadly_Poison%2887%29.png?version=05a5590f45a53895524e57ac99e740d3'),
(45, 'Arcane Nullifier X-21', NULL, 'Rare', 'Minion', 'Mech', 4, 2, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/5/50/Arcane_Nullifier_X-21.png/184px-Arcane_Nullifier_X-21.png?version=8de990117670c1ff9d072ade315a23d9'),
(46, 'Big Game Hunter', NULL, 'Epic', 'Minion', NULL, 3, 4, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/5/56/Big_Game_Hunter%2873%29.png/184px-Big_Game_Hunter%2873%29.png?version=fdea738d8449537aae40b1427d5b6c55'),
(47, 'Anub''ar Ambusher', 4, 'Common', 'Minion', NULL, 4, 5, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/da/Anub%27ar_Ambusher.png/184px-Anub%27ar_Ambusher.png?version=527e454256e8adf5280abdb0cf29a59e'),
(48, 'Drain Life', 6, 'Free', 'Spell', NULL, 3, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/5/50/Drain_Life%28332%29.png/184px-Drain_Life%28332%29.png?version=427ec1dbd391b7e1d5fa3396d0b50f54'),
(49, 'Argent Commander', NULL, 'Rare', 'Minion', NULL, 6, 4, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/b/b5/Argent_Commander%28463%29.png/184px-Argent_Commander%28463%29.png?version=c3eb3ab2ee4ec9f854e7ec25b37459df'),
(50, 'Cairne Bloodhoof', NULL, 'Legendary', 'Minion', NULL, 6, 4, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/5/54/Cairne_Bloodhoof%28498%29.png/184px-Cairne_Bloodhoof%28498%29.png?version=fa3ce18f274117f22c13ba27afc82583'),
(51, 'Blood Knight', NULL, 'Epic', 'Minion', NULL, 3, 3, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/5/51/Blood_Knight%2875%29.png/184px-Blood_Knight%2875%29.png?version=85624b1417eec02e9bc28b85de603bd7'),
(52, 'Arathi Weaponsmith', 2, 'Common', 'Minion', NULL, 4, 3, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/5/5f/Arathi_Weaponsmith%28504%29.png/184px-Arathi_Weaponsmith%28504%29.png?version=04e0652d2e8dcd651ff92ae86cfc3983'),
(53, 'Armorsmith', 2, 'Rare', 'Minion', NULL, 2, 1, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/b/b5/Armorsmith%28644%29.png/184px-Armorsmith%28644%29.png?version=e1ca2c62a4752ee14fdd6ed64b788142'),
(54, 'Captain Greenskin', NULL, 'Legendary', 'Minion', 'Pirate', 5, 5, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/b/ba/Captain_Greenskin%28267%29.png/184px-Captain_Greenskin%28267%29.png?version=0937c1af2be30457c44bf510fe570572'),
(55, 'Arcanite Reaper', 2, 'Common', 'Weapon', NULL, 5, 5, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/de/Arcanite_Reaper%28182%29.png/184px-Arcanite_Reaper%28182%29.png?version=e67b5fca6e00033c734190ef03da81d6'),
(56, 'Execute', 2, 'Free', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/1/1f/Execute%28227%29.png/184px-Execute%28227%29.png?version=3129a85c03e4a5121c70a9556ad882c8'),
(57, 'Bouncing Blade', 2, 'Epic', 'Spell', NULL, 3, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/eb/Bouncing_Blade.png/184px-Bouncing_Blade.png?version=10dfdd5845fc6844024848c5c5f51762'),
(58, 'Auchenai Soulpriest', 1, 'Rare', 'Minion', NULL, 4, 3, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/ed/Auchenai_Soulpriest%28656%29.png/184px-Auchenai_Soulpriest%28656%29.png?version=0f503bdc3740c73448f73ee9fdb3a385'),
(59, 'Fiery War Axe', 2, 'Free', 'Weapon', NULL, 2, 3, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/84/Fiery_War_Axe%28632%29.png/184px-Fiery_War_Axe%28632%29.png?version=fb2a36d11e5e1b4e24269f2a4f3494ab'),
(60, 'Azure Drake', NULL, 'Rare', 'Minion', 'Dragon', 5, 4, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/b/b3/Azure_Drake%28280%29.png/184px-Azure_Drake%28280%29.png?version=b9fce3aaad91b06e19962643b2fc1130'),
(61, 'Cenarius', 5, 'Legendary', 'Minion', NULL, 9, 5, 8, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/5/55/Cenarius%28605%29.png/184px-Cenarius%28605%29.png?version=e26bae2b4b774c0fc663ce0e79dc910b'),
(62, 'Archmage', NULL, 'Common', 'Minion', NULL, 6, 4, 7, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/3/3e/Archmage%28545%29.png/184px-Archmage%28545%29.png?version=9ffd0ce998c00ba28942c66baf255b9e'),
(63, 'Brawl', 2, 'Epic', 'Spell', NULL, 5, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/6/6a/Brawl%28297%29.png/184px-Brawl%28297%29.png?version=d48eccfb6b8307f9084292a04fed1169'),
(64, 'Cabal Shadow Priest', 1, 'Epic', 'Minion', NULL, 6, 4, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/6/6d/Cabal_Shadow_Priest%28147%29.png/184px-Cabal_Shadow_Priest%28147%29.png?version=1255390513f66b72f0a87925e3035f7a'),
(65, 'Deathwing', NULL, 'Legendary', 'Minion', 'Dragon', 10, 12, 12, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/df/Deathwing%28474%29.png/184px-Deathwing%28474%29.png?version=1743f6ca234cd10ba8367a51140ed378'),
(66, 'Bite', 5, 'Rare', 'Spell', NULL, 4, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/5/5e/Bite%28266%29.png/184px-Bite%28266%29.png?version=2bb2f876015d53a2d35cee05617ca481'),
(67, 'Argent Protector', 8, 'Common', 'Minion', NULL, 2, 2, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/b/b6/Argent_Protector%28191%29.png/184px-Argent_Protector%28191%29.png?version=b6b76e2b9e0de6d5c89c66d9f16bdcf0'),
(68, 'Fireball', 3, 'Free', 'Spell', NULL, 4, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/d5/Fireball%28522%29.png/184px-Fireball%28522%29.png?version=b2f90afa9ae9286e6669606b12c23b3d'),
(69, 'Captain''s Parrot', NULL, 'Epic', 'Minion', 'Beast', 2, 1, 1, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/8b/Captain%27s_Parrot%28559%29.png/184px-Captain%27s_Parrot%28559%29.png?version=6664b0ae744f5c60fd06c5e7391785ba'),
(70, 'Argent Squire', NULL, 'Common', 'Minion', NULL, 1, 1, 1, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/a/a3/Argent_Squire%28473%29.png/184px-Argent_Squire%28473%29.png?version=ec2076663d093bb3410140e01c2e5dfc'),
(71, 'Dr. Boom', NULL, 'Legendary', 'Minion', NULL, 7, 7, 7, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/3/35/Dr._Boom.png/184px-Dr._Boom.png?version=c0be1723c54219400f20d3c1a494bb01'),
(72, 'Frost Shock', 9, 'Free', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/4/46/Frost_Shock%28233%29.png/184px-Frost_Shock%28233%29.png?version=98f0826dea4f60273d72e883f9b2f3c7'),
(73, 'Blade Flurry', 4, 'Rare', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/6/69/Blade_Flurry%28244%29.png/184px-Blade_Flurry%28244%29.png?version=c0c56f4f0ac41ac0b91706296ac4f4c8'),
(74, 'Edwin VanCleef', 4, 'Legendary', 'Minion', NULL, 3, 2, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/df/Edwin_VanCleef%283%29.png/184px-Edwin_VanCleef%283%29.png?version=071448ef81f7774b73d3ebe2bf21b6ff'),
(75, 'Assassin''s Blade', 4, 'Common', 'Weapon', NULL, 5, 3, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/c4/Assassin%27s_Blade%28433%29.png/184px-Assassin%27s_Blade%28433%29.png?version=0e97ca6a642312728a3675dac69d8aee'),
(76, 'Clockwork Giant', NULL, 'Epic', 'Minion', 'Mech', 12, 8, 8, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/4/4a/Clockwork_Giant.png/184px-Clockwork_Giant.png?version=a364609fde8ced7ed5e99d254315e6ca'),
(77, 'Hammer of Wrath', 8, 'Free', 'Spell', NULL, 4, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/0/0e/Hammer_of_Wrath%28350%29.png/184px-Hammer_of_Wrath%28350%29.png?version=160fff9356dfe8e43304a09d2aa1f76a'),
(78, 'Elite Tauren Chieftain', NULL, 'Legendary', 'Minion', NULL, 5, 5, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/cc/Elite_Tauren_Chieftain%28682%29.png/184px-Elite_Tauren_Chieftain%28682%29.png?version=7428603f47d078eca0297429449c27e5'),
(79, 'Avenge', 8, 'Common', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/92/Avenge.png/184px-Avenge.png?version=86aeb5ce7fdcf37605b1e441e4b16c8a'),
(80, 'Hand of Protection', 8, 'Free', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/6/67/Hand_of_Protection%28499%29.png/184px-Hand_of_Protection%28499%29.png?version=cd711da81521d9fb1d70287419299569'),
(81, 'Feugen', NULL, 'Legendary', 'Minion', NULL, 5, 4, 7, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/86/Feugen.png/184px-Feugen.png?version=2913485cc8bd5f08d0f985c85f14732a'),
(82, 'Blessed Champion', 8, 'Rare', 'Spell', NULL, 5, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/ca/Blessed_Champion%287%29.png/184px-Blessed_Champion%287%29.png?version=1036efc197159a1bb5f93674c8275a52'),
(83, 'Coghammer', 8, 'Epic', 'Weapon', NULL, 3, 2, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/3/36/Coghammer.png/184px-Coghammer.png?version=059824e64730e2d47aca762f1f676fda'),
(84, 'Blizzard', 3, 'Rare', 'Spell', NULL, 6, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/e6/Blizzard%28276%29.png/184px-Blizzard%28276%29.png?version=7033e20317248b2c6c4a97307cd6dc45'),
(85, 'Flame Leviathan', 3, 'Legendary', 'Minion', 'Mech', 7, 7, 7, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/98/Flame_Leviathan.png/184px-Flame_Leviathan.png?version=30e324081073c0e3f1afad32697543f8'),
(86, 'Healing Touch', 5, 'Free', 'Spell', NULL, 3, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/5/5f/Healing_Touch%28258%29.png/184px-Healing_Touch%28258%29.png?version=c09f44ec4e7a5285b2d20abd27afc987'),
(87, 'Cogmaster''s Wrench', 4, 'Epic', 'Weapon', NULL, 3, 1, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/8a/Cogmaster%27s_Wrench.png/184px-Cogmaster%27s_Wrench.png?version=58a56179a62731e74f0e7764e2cfbeb2'),
(88, 'Bloodsail Corsair', NULL, 'Rare', 'Minion', 'Pirate', 1, 1, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/d8/Bloodsail_Corsair%28453%29.png/184px-Bloodsail_Corsair%28453%29.png?version=4fa8a8e1722dcf2d799a3c39e201b526'),
(89, 'Battle Rage', 2, 'Common', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/5/57/Battle_Rage%28664%29.png/184px-Battle_Rage%28664%29.png?version=b9b04825481923e99d07acfea5a64988'),
(90, 'Foe Reaper 4000', NULL, 'Legendary', 'Minion', 'Mech', 8, 6, 9, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/3/39/Foe_Reaper_4000.png/184px-Foe_Reaper_4000.png?version=7128c821831803451cb0a8476d344857'),
(91, 'Crush', 2, 'Epic', 'Spell', NULL, 7, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/1/15/Crush.png/184px-Crush.png?version=926f3626b06c304c4e334e1394746840'),
(92, 'Bomb Lobber', NULL, 'Rare', 'Minion', NULL, 5, 3, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/96/Bomb_Lobber.png/184px-Bomb_Lobber.png?version=29f53c20dca81c8081298f75ff73f66f'),
(93, 'Hellfire', 6, 'Free', 'Spell', NULL, 4, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/7/71/Hellfire%28122%29.png/184px-Hellfire%28122%29.png?version=ed9ba73bc5eabc4779b6d5fc608eed6a'),
(94, 'Betrayal', 4, 'Common', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/85/Betrayal%28198%29.png/184px-Betrayal%28198%29.png?version=556a1cc957007f824b06150a128535c5'),
(95, 'Call Pet', 7, 'Rare', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/86/Call_Pet.png/184px-Call_Pet.png?version=5a1982beb35a368294ae087243e21945'),
(96, 'Gahz''rilla', 7, 'Legendary', 'Minion', 'Beast', 7, 6, 9, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/cf/Gahz%27rilla.png/184px-Gahz%27rilla.png?version=3a88a1177d9061c67e5392d6a59db397'),
(97, 'Dark Wispers', 5, 'Epic', 'Spell', NULL, 6, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/b/b4/Dark_Wispers.png/184px-Dark_Wispers.png?version=488cdf9dc66fd299535fd72fb19404a5'),
(98, 'Heroic Strike', 2, 'Free', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/8c/Heroic_Strike%281%29.png/184px-Heroic_Strike%281%29.png?version=ffc880a434b42ca57fe756697ca1d55d'),
(99, 'Cobalt Guardian', 8, 'Rare', 'Minion', 'Mech', 5, 6, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/f9/Cobalt_Guardian.png/184px-Cobalt_Guardian.png?version=ba1bdd9a0bead4195d81bca96296514b'),
(100, 'Blessing of Kings', 8, 'Common', 'Spell', NULL, 4, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/3/35/Blessing_of_Kings%2829%29.png/184px-Blessing_of_Kings%2829%29.png?version=959215ef7692b454bd30295aa9f53277'),
(101, 'Demonheart', 6, 'Epic', 'Spell', NULL, 5, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/5/57/Demonheart.png/184px-Demonheart.png?version=7cdab0767a896135b8cdb71b5ad81159'),
(102, 'Coldlight Oracle', NULL, 'Rare', 'Minion', 'Murloc', 3, 2, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/2/21/Coldlight_Oracle%2888%29.png/184px-Coldlight_Oracle%2888%29.png?version=85f582ec718f51961a69178f071d9b87'),
(103, 'Gelbin Mekkatorque', NULL, 'Legendary', 'Minion', NULL, 6, 6, 6, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/f2/Gelbin_Mekkatorque%28251%29.png/184px-Gelbin_Mekkatorque%28251%29.png?version=bbbad1b84a92335b8cc84de6f6571b33'),
(104, 'Blessing of Wisdom', 8, 'Common', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/6/63/Blessing_of_Wisdom%28100%29.png/184px-Blessing_of_Wisdom%28100%29.png?version=a2d8b57d290256c38ee754dc1dd42277'),
(105, 'Hex', 9, 'Free', 'Spell', NULL, 3, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/5/50/Hex%28270%29.png/184px-Hex%28270%29.png?version=45fa1fe2a9ec1f4ffc109aff8a2ea191'),
(106, 'Grommash Hellscream', 2, 'Legendary', 'Minion', NULL, 8, 4, 9, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/f5/Grommash_Hellscream%28643%29.png/184px-Grommash_Hellscream%28643%29.png?version=e5e08c69f415c5a9d55ac279883e0fa8'),
(107, 'Doomhammer', 9, 'Epic', 'Weapon', NULL, 5, 2, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/0/07/Doomhammer%28172%29.png/184px-Doomhammer%28172%29.png?version=4ad24860a82807ee76c0a2132d10a8de'),
(108, 'Gruul', NULL, 'Legendary', 'Minion', NULL, 8, 7, 7, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/9d/Gruul%2818%29.png/184px-Gruul%2818%29.png?version=8e39296a419b4918ff9b92ecaad6a96a'),
(109, 'Holy Light', 8, 'Free', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/0/07/Holy_Light%28108%29.png/184px-Holy_Light%28108%29.png?version=2c9474eba270656ab7510b36d30333d2'),
(110, 'Earth Elemental', 9, 'Epic', 'Minion', NULL, 5, 7, 8, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/5/57/Earth_Elemental%28124%29.png/184px-Earth_Elemental%28124%29.png?version=1fc731cf14654c53f713dfb4df31397b'),
(111, 'Holy Smite', 1, 'Free', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/ea/Holy_Smite%28409%29.png/184px-Holy_Smite%28409%29.png?version=98e438c00034b88296ae24f1bd524796'),
(112, 'Harrison Jones', NULL, 'Legendary', 'Minion', NULL, 5, 5, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/3/31/Harrison_Jones%28602%29.png/184px-Harrison_Jones%28602%29.png?version=0eca0b41b85af61d9379fd01fb260eed'),
(113, 'Blood Imp', 6, 'Common', 'Minion', 'Demon', 1, 0, 1, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/c4/Blood_Imp%28196%29.png/184px-Blood_Imp%28196%29.png?version=fbd631a86d30ccc98af437eb4f616221'),
(114, 'Houndmaster', 7, 'Free', 'Minion', NULL, 4, 4, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/2/20/Houndmaster%28225%29.png/184px-Houndmaster%28225%29.png?version=3745f3aca8f7d8c686d28f6b8f1eb587'),
(115, 'Bloodlust', 9, 'Common', 'Spell', NULL, 5, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/6/67/Bloodlust%28256%29.png/184px-Bloodlust%28256%29.png?version=79ed7b2fb2cb8a77afe32d9fbe09415a'),
(116, 'Echo of Medivh', 3, 'Epic', 'Spell', NULL, 4, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/0/00/Echo_of_Medivh.png/184px-Echo_of_Medivh.png?version=eee0b33b6d9873f7f9d81e748c8aede6'),
(117, 'Coldlight Seer', NULL, 'Rare', 'Minion', 'Murloc', 3, 2, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/4/49/Coldlight_Seer%28424%29.png/184px-Coldlight_Seer%28424%29.png?version=67e848ddd784e02e6ca4321f22d248e3'),
(118, 'Hemet Nesingwary', NULL, 'Legendary', 'Minion', NULL, 5, 6, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/d4/Hemet_Nesingwary.png/184px-Hemet_Nesingwary.png?version=0d5c47d6274e9e9b7d2a24dfa6d6ca41'),
(119, 'Bloodsail Raider', NULL, 'Common', 'Minion', 'Pirate', 2, 2, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/f1/Bloodsail_Raider%28637%29.png/184px-Bloodsail_Raider%28637%29.png?version=65503c9694c496c0b9440842b58123e0'),
(120, 'Hogger', NULL, 'Legendary', 'Minion', NULL, 6, 4, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/df/Hogger%2839%29.png/184px-Hogger%2839%29.png?version=569c2c5012df1d66e5b9fb04b9c9982e'),
(121, 'Bluegill Warrior', NULL, 'Common', 'Minion', 'Murloc', 2, 2, 1, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/9c/Bluegill_Warrior%28289%29.png/184px-Bluegill_Warrior%28289%29.png?version=262684779393c7183d9695d150472c4f'),
(122, 'Commanding Shout', 2, 'Rare', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/91/Commanding_Shout%28166%29.png/184px-Commanding_Shout%28166%29.png?version=7f18b27ac7128d22c0dc6624a9873c63'),
(123, 'Echoing Ooze', NULL, 'Epic', 'Minion', NULL, 2, 1, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/de/Echoing_Ooze.png/184px-Echoing_Ooze.png?version=91dd03e1c1e15878378e154dc5ac4c65'),
(124, 'Innervate', 5, 'Free', 'Spell', NULL, 0, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/5/5b/Innervate%28548%29.png/184px-Innervate%28548%29.png?version=9dfed79c9a1d0403638ee0c254b66dd5'),
(125, 'Illidan Stormrage', NULL, 'Legendary', 'Minion', 'Demon', 6, 7, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/d6/Illidan_Stormrage%28203%29.png/184px-Illidan_Stormrage%28203%29.png?version=3029ca8601cb0bc45b3b5a19f24a1c69'),
(126, 'Light''s Justice', 8, 'Free', 'Weapon', NULL, 1, 1, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/9a/Light%27s_Justice%28250%29.png/184px-Light%27s_Justice%28250%29.png?version=f237c103225915c1211d81caceb48ba2'),
(127, 'Iron Juggernaut', 2, 'Legendary', 'Minion', 'Mech', 6, 6, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/5/56/Iron_Juggernaut.png/184px-Iron_Juggernaut.png?version=1e068007df372d3287ea4509a2e3ed89'),
(128, 'Counterspell', 3, 'Rare', 'Spell', NULL, 3, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/4/40/Counterspell%28531%29.png/184px-Counterspell%28531%29.png?version=e1f500c8c33d8323d72ab41a179b61a4'),
(129, 'Enhance-o Mechano', NULL, 'Epic', 'Minion', 'Mech', 4, 3, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/b/bb/Enhance-o_Mechano.png/184px-Enhance-o_Mechano.png?version=e1e0a2ce2aa666bd90b8a74650306bf7'),
(130, 'Magma Rager', NULL, 'Free', 'Minion', NULL, 3, 5, 1, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/d5/Magma_Rager%28362%29.png/184px-Magma_Rager%28362%29.png?version=afc31c09811f7b1bc3b8a7edb97532b4'),
(131, 'Crazed Alchemist', NULL, 'Rare', 'Minion', NULL, 2, 2, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/0/03/Crazed_Alchemist%28612%29.png/184px-Crazed_Alchemist%28612%29.png?version=701fd1288498bb483d795a13a48d1f0f'),
(132, 'Deathlord', NULL, 'Rare', 'Minion', NULL, 3, 2, 8, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/6/67/Deathlord.png/184px-Deathlord.png?version=1fc482cd896874dc1215c9e49e6a9a51'),
(133, 'Booty Bay Bodyguard', NULL, 'Common', 'Minion', NULL, 5, 5, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/a/ad/Booty_Bay_Bodyguard%2827%29.png/184px-Booty_Bay_Bodyguard%2827%29.png?version=e03f342d83cb35126a7b00fb9d52714d'),
(134, 'Mark of the Wild', 5, 'Free', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/e8/Mark_of_the_Wild%28480%29.png/184px-Mark_of_the_Wild%28480%29.png?version=718f9e82ea5cc616a5a39d156479cae3'),
(135, 'Kel''Thuzad', NULL, 'Legendary', 'Minion', NULL, 8, 6, 8, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/a/a0/Kel%27Thuzad.png/184px-Kel%27Thuzad.png?version=408806390ac89ae5e70f72d9b7436dbb'),
(136, 'Faceless Manipulator', NULL, 'Epic', 'Minion', NULL, 5, 3, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/85/Faceless_Manipulator%28450%29.png/184px-Faceless_Manipulator%28450%29.png?version=8f86ed7554021936679a41d487511d35'),
(137, 'Burly Rockjaw Trogg', NULL, 'Common', 'Minion', NULL, 4, 3, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/2/2c/Burly_Rockjaw_Trogg.png/184px-Burly_Rockjaw_Trogg.png?version=b9a60662984ea60cb2cccb12bb668821'),
(138, 'Mind Blast', 1, 'Free', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/0/09/Mind_Blast%28415%29.png/184px-Mind_Blast%28415%29.png?version=194fd22f2b61f5f4b75b5d45f555cc98'),
(139, 'Multi-Shot', 7, 'Free', 'Spell', NULL, 4, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/96/Multi-Shot%28407%29.png/184px-Multi-Shot%28407%29.png?version=5b821b3ed95145be89384b79f89a67d1'),
(140, 'Defender of Argus', NULL, 'Rare', 'Minion', NULL, 4, 2, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/7/76/Defender_of_Argus%28542%29.png/184px-Defender_of_Argus%28542%29.png?version=d68b1a27194118445dacee2614b9035c'),
(141, 'Far Sight', 9, 'Epic', 'Spell', NULL, 3, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/3/30/Far_Sight%28107%29.png/184px-Far_Sight%28107%29.png?version=34a23d4e1e9236a01c2962123820e842'),
(142, 'King Krush', 7, 'Legendary', 'Minion', 'Beast', 9, 8, 8, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/7/72/King_Krush%28194%29.png/184px-King_Krush%28194%29.png?version=39a1c2b5143cb1836168f594fdfff335'),
(143, 'Murloc Raider', NULL, 'Free', 'Minion', 'Murloc', 1, 2, 1, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/e4/Murloc_Raider%2855%29.png/184px-Murloc_Raider%2855%29.png?version=99551d0f53a7be1579c82b22807d9118'),
(144, 'Demolisher', NULL, 'Rare', 'Minion', 'Mech', 3, 1, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/3/3c/Demolisher%28212%29.png/184px-Demolisher%28212%29.png?version=7d45f72b2b43264104aeef95e829479a'),
(145, 'King Mukla', NULL, 'Legendary', 'Minion', 'Beast', 3, 5, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/fe/King_Mukla%28373%29.png/184px-King_Mukla%28373%29.png?version=34289bfda2092b4395fd7e7e49177df4'),
(146, 'Divine Favor', 8, 'Rare', 'Spell', NULL, 3, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/85/Divine_Favor%28581%29.png/184px-Divine_Favor%28581%29.png?version=581018f34960315c9ca9460faf6414d3'),
(147, 'Feign Death', 7, 'Epic', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/fd/Feign_Death.png/184px-Feign_Death.png?version=0da4b7ba3b0f0a19c942cbfeeaef2471'),
(148, 'Nightblade', NULL, 'Free', 'Minion', NULL, 5, 4, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/b/b1/Nightblade%28184%29.png/184px-Nightblade%28184%29.png?version=99203cdcafa1e49ff2e5ea69c98c8cca'),
(149, 'Leeroy Jenkins', NULL, 'Legendary', 'Minion', NULL, 5, 6, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/5/5f/Leeroy_Jenkins%28674%29.png/184px-Leeroy_Jenkins%28674%29.png?version=9357155bee806000dc918e83ec5120da'),
(150, 'Doomguard', 6, 'Rare', 'Minion', 'Demon', 5, 5, 7, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/e8/Doomguard%28507%29.png/184px-Doomguard%28507%29.png?version=b09602bc894585a2ce24e41781bb06d2'),
(151, 'Fel Reaver', NULL, 'Epic', 'Minion', 'Mech', 5, 8, 8, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/e3/Fel_Reaver.png/184px-Fel_Reaver.png?version=31d672cb9ca14cc328603dda64fb6e9e'),
(152, 'Chillwind Yeti', NULL, 'Common', 'Minion', NULL, 4, 4, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/ea/Chillwind_Yeti%2831%29.png/184px-Chillwind_Yeti%2831%29.png?version=e99c1aee454fd9dd68a7eb961a286ed4'),
(153, 'Loatheb', NULL, 'Legendary', 'Minion', NULL, 5, 5, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/0/03/Loatheb.png/184px-Loatheb.png?version=2496ba7cde98f4426ed577ec5884c612'),
(154, 'Force of Nature', 5, 'Epic', 'Spell', NULL, 6, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/c3/Force_of_Nature%28237%29.png/184px-Force_of_Nature%28237%29.png?version=ca94ef246169c8e059ed797a95175c96'),
(155, 'Dunemaul Shaman', 9, 'Rare', 'Minion', NULL, 4, 5, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/3/38/Dunemaul_Shaman.png/184px-Dunemaul_Shaman.png?version=3a664c30978ae74575f005eaa43084dc'),
(156, 'Circle of Healing', 1, 'Common', 'Spell', NULL, 0, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/f5/Circle_of_Healing%2838%29.png/184px-Circle_of_Healing%2838%29.png?version=30f1f2f0da1a8bb10b55ebca297549d2'),
(157, 'Northshire Cleric', 1, 'Free', 'Minion', NULL, 1, 1, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/fc/Northshire_Cleric%28600%29.png/184px-Northshire_Cleric%28600%29.png?version=dd3e32f585dfaffb56424319a64bdcec'),
(158, 'Lord Jaraxxus', 6, 'Legendary', 'Minion', 'Demon', 9, 3, 15, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/1/17/Lord_Jaraxxus%28482%29.png/184px-Lord_Jaraxxus%28482%29.png?version=18856ecae2e8193edee26a619a7b636c'),
(159, 'Eaglehorn Bow', 7, 'Rare', 'Weapon', NULL, 3, 3, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/d4/Eaglehorn_Bow%28363%29.png/184px-Eaglehorn_Bow%28363%29.png?version=c67b0fc730739ab8d610f0bcd9e1890f'),
(160, 'Gladiator''s Longbow', 7, 'Epic', 'Weapon', NULL, 7, 5, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/e2/Gladiator%27s_Longbow%28278%29.png/184px-Gladiator%27s_Longbow%28278%29.png?version=14157a59f7c81a46c2501bfc344b4be6'),
(161, 'Lorewalker Cho', NULL, 'Legendary', 'Minion', NULL, 2, 0, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/e5/Lorewalker_Cho%28456%29.png/184px-Lorewalker_Cho%28456%29.png?version=142dfe0ef588fca15e08be26215f464a'),
(162, 'Cleave', 2, 'Common', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/0/0f/Cleave%2881%29.png/184px-Cleave%2881%29.png?version=863db4f8bc9e2e4bd3f2c827344308ef'),
(163, 'Novice Engineer', NULL, 'Free', 'Minion', NULL, 2, 1, 1, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/d9/Novice_Engineer%28435%29.png/184px-Novice_Engineer%28435%29.png?version=14a10a64a51b824ebaa1042c9f82ae42'),
(164, 'Emperor Cobra', NULL, 'Rare', 'Minion', 'Beast', 3, 2, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/7/7f/Emperor_Cobra%28625%29.png/184px-Emperor_Cobra%28625%29.png?version=b16f8e34dffb53af751589d77e776fa6'),
(165, 'Gorehowl', 2, 'Epic', 'Weapon', NULL, 7, 7, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/7/70/Gorehowl%2896%29.png/184px-Gorehowl%2896%29.png?version=16253978d8e5792861622aff5fc38008'),
(166, 'Maexxna', NULL, 'Legendary', 'Minion', 'Beast', 6, 2, 8, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/d0/Maexxna.png/184px-Maexxna.png?version=0986f5fe1f5271eb553590615ca682bc'),
(167, 'Equality', 8, 'Rare', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/fa/Equality%28383%29.png/184px-Equality%28383%29.png?version=c3f1f6790886d4a500329d42d4783c69'),
(168, 'Clockwork Gnome', NULL, 'Common', 'Minion', 'Mech', 1, 2, 1, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/5/50/Clockwork_Gnome.png/184px-Clockwork_Gnome.png?version=ff367da5a5b2148fa8d339f0f42f2ed3'),
(169, 'Oasis Snapjaw', NULL, 'Free', 'Minion', 'Beast', 4, 2, 7, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/ea/Oasis_Snapjaw%2815%29.png/184px-Oasis_Snapjaw%2815%29.png?version=093e3dddf20542ee7334244a71c7283d'),
(170, 'Mal''Ganis', 6, 'Legendary', 'Minion', 'Demon', 9, 9, 7, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/cc/Mal%27Ganis.png/184px-Mal%27Ganis.png?version=479fbe6bc6ecc32e727a79aeb1c5b4c9'),
(171, 'Cobra Shot', 7, 'Common', 'Spell', NULL, 5, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/6/63/Cobra_Shot.png/184px-Cobra_Shot.png?version=d74a93a23f7c4239862f8ed80364a3d9'),
(172, 'Polymorph', 3, 'Free', 'Spell', NULL, 4, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/1/13/Polymorph%28595%29.png/184px-Polymorph%28595%29.png?version=e43623dfbd45c72a644912d0375999da'),
(173, 'Cogmaster', NULL, 'Common', 'Minion', NULL, 1, 1, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/c5/Cogmaster.png/184px-Cogmaster.png?version=1d034e6864a0fc9d27434d9e5795eb69'),
(174, 'Malorne', 5, 'Legendary', 'Minion', 'Beast', 7, 9, 7, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/ff/Malorne.png/184px-Malorne.png?version=4654588a1bc53b7d9e60c0f15e1588a9'),
(175, 'Hungry Crab', NULL, 'Epic', 'Minion', 'Beast', 1, 1, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/0/0f/Hungry_Crab%28660%29.png/184px-Hungry_Crab%28660%29.png?version=38ede08067387ebf8e91e0bf9ce20ba2'),
(176, 'Power Word: Shield', 1, 'Free', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/87/Power_Word-_Shield%28431%29.png/184px-Power_Word-_Shield%28431%29.png?version=338774144a3581f8384284f47c514ea6'),
(177, 'Malygos', NULL, 'Legendary', 'Minion', 'Dragon', 9, 4, 12, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/7/7c/Malygos%28241%29.png/184px-Malygos%28241%29.png?version=96c6ac77a610a974126784fe1847b3ee'),
(178, 'Cold Blood', 4, 'Common', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/d0/Cold_Blood%2892%29.png/184px-Cold_Blood%2892%29.png?version=3b3c95ecaab33afc4893b4195bed9900'),
(179, 'Raid Leader', NULL, 'Free', 'Minion', NULL, 3, 2, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/4/43/Raid_Leader%28502%29.png/184px-Raid_Leader%28502%29.png?version=ce00dbc621879cb9e287c86135b1ce71'),
(180, 'Ice Block', 3, 'Epic', 'Spell', NULL, 3, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/80/Ice_Block%2828%29.png/184px-Ice_Block%2828%29.png?version=bdc14dd5f399bcf199478b55da361387'),
(181, 'Mekgineer Thermaplugg', NULL, 'Legendary', 'Minion', 'Mech', 9, 9, 7, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/d8/Mekgineer_Thermaplugg.png/184px-Mekgineer_Thermaplugg.png?version=0d4eaba1a23e7021e32a05bb2a7cd73a'),
(182, 'Ethereal Arcanist', 3, 'Rare', 'Minion', NULL, 4, 3, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/4/49/Ethereal_Arcanist%28125%29.png/184px-Ethereal_Arcanist%28125%29.png?version=e75f2ad13527891e863773dcec03ff9f'),
(183, 'Conceal', 4, 'Common', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/3/3f/Conceal%28284%29.png/184px-Conceal%28284%29.png?version=8e7be8b769739cb9be5f7f1588ba82c8'),
(184, 'Reckless Rocketeer', NULL, 'Free', 'Minion', NULL, 6, 5, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/0/05/Reckless_Rocketeer%28560%29.png/184px-Reckless_Rocketeer%28560%29.png?version=49ff84c79822ef499aa903d94e37032e'),
(185, 'River Crocolisk', NULL, 'Free', 'Minion', 'Beast', 2, 2, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/4/42/River_Crocolisk%28535%29.png/184px-River_Crocolisk%28535%29.png?version=449c057eec2ea54cad3558dd71c61da5'),
(186, 'Junkbot', NULL, 'Epic', 'Minion', 'Mech', 5, 1, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/f4/Junkbot.png/184px-Junkbot.png?version=8dc382649ddddf816798aa96b8fbfd47'),
(187, 'Millhouse Manastorm', NULL, 'Legendary', 'Minion', NULL, 2, 4, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/3/33/Millhouse_Manastorm%28339%29.png/184px-Millhouse_Manastorm%28339%29.png?version=85a843252aee881b9155c9d0696696c9'),
(188, 'Cone of Cold', 3, 'Common', 'Spell', NULL, 4, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/dc/Cone_of_Cold%2826%29.png/184px-Cone_of_Cold%2826%29.png?version=a325c2cef6d2a3a857d24fa0b97eb1f6'),
(189, 'Explosive Shot', 7, 'Rare', 'Spell', NULL, 5, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/5/5a/Explosive_Shot%28114%29.png/184px-Explosive_Shot%28114%29.png?version=535749a004b7e8e676f426f9777926a6'),
(190, 'Rockbiter Weapon', 9, 'Free', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/84/Rockbiter_Weapon%28491%29.png/184px-Rockbiter_Weapon%28491%29.png?version=e87ac8679ebc75ef75021a07350e6f9f'),
(191, 'Mimiron''s Head', NULL, 'Legendary', 'Minion', 'Mech', 5, 4, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/84/Mimiron%27s_Head.png/184px-Mimiron%27s_Head.png?version=d4071650c2027737b766c7ae9b6dcad1'),
(192, 'Consecration', 8, 'Common', 'Spell', NULL, 4, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/f6/Consecration%28260%29.png/184px-Consecration%28260%29.png?version=6a0100d72047b4ed66df16c7be831fe1'),
(193, 'Fel Cannon', 6, 'Rare', 'Minion', 'Mech', 4, 3, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/da/Fel_Cannon.png/184px-Fel_Cannon.png?version=8375e3e2956d1e5dc0887960bc75111d'),
(194, 'Kidnapper', 4, 'Epic', 'Minion', NULL, 6, 5, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/2/28/Kidnapper%28562%29.png/184px-Kidnapper%28562%29.png?version=e01c4ddbdb8423abaaf976c4fe223591'),
(195, 'Mogor the Ogre', NULL, 'Legendary', 'Minion', NULL, 6, 7, 6, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/9d/Mogor_the_Ogre.png/184px-Mogor_the_Ogre.png?version=f8a3ce734544a7079dc64166ec33c6aa'),
(196, 'Felguard', 6, 'Rare', 'Minion', 'Demon', 3, 3, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/c0/Felguard%28236%29.png/184px-Felguard%28236%29.png?version=557bfd4a89c775886677ae9ee4e7c665'),
(197, 'Core Hound', NULL, 'Common', 'Minion', 'Beast', 7, 9, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/9e/Core_Hound%28173%29.png/184px-Core_Hound%28173%29.png?version=5d8e2dcce734ef065ab2125e4cba29f1'),
(198, 'Lay on Hands', 8, 'Epic', 'Spell', NULL, 8, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/5/52/Lay_on_Hands%28506%29.png/184px-Lay_on_Hands%28506%29.png?version=7984d8e2b8f706a2c75f40ad7aa29603'),
(199, 'Sap', 4, 'Free', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/a/a2/Sap%28385%29.png/184px-Sap%28385%29.png?version=52ebb85c5c2ac5a44b4f124fe5be3bbf'),
(200, 'Feral Spirit', 9, 'Rare', 'Spell', NULL, 3, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/81/Feral_Spirit%28214%29.png/184px-Feral_Spirit%28214%29.png?version=735cd1430c38192a96ea769cbdf3c5a3'),
(201, 'Nat Pagle', NULL, 'Legendary', 'Minion', NULL, 2, 0, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/3/3a/Nat_Pagle%2819%29.png/184px-Nat_Pagle%2819%29.png?version=f85abea64e434cca13d28aa86f6e81e1'),
(202, 'Lightbomb', 1, 'Epic', 'Spell', NULL, 6, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/7/71/Lightbomb.png/184px-Lightbomb.png?version=23e418dea5873b32c5e7a9d8a777bc90'),
(203, 'Flare', 7, 'Rare', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/7/70/Flare%28630%29.png/184px-Flare%28630%29.png?version=7a6b4832b9591c4cd40d4a0e43915954'),
(204, 'Corruption', 6, 'Common', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/ec/Corruption%28252%29.png/184px-Corruption%28252%29.png?version=deae51743b773bce9a94a3a7409a1d55'),
(205, 'Mindgames', 1, 'Epic', 'Spell', NULL, 4, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/4/4d/Mindgames%28301%29.png/184px-Mindgames%28301%29.png?version=f03f36de1c42545334c490ea565b6fcc'),
(206, 'Neptulon', 9, 'Legendary', 'Minion', NULL, 7, 7, 7, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/b/bd/Neptulon.png/184px-Neptulon.png?version=6cd6c4abf74b188edfe01188b3605cb6'),
(207, 'Frothing Berserker', 2, 'Rare', 'Minion', NULL, 3, 2, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/4/43/Frothing_Berserker%2869%29.png/184px-Frothing_Berserker%2869%29.png?version=5c60599686f0c2f7dd5b524007062642'),
(208, 'Crackle', 9, 'Common', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/80/Crackle.png/184px-Crackle.png?version=869273dd673149264a7f6ca3c4cf4617'),
(209, 'Mini-Mage', NULL, 'Epic', 'Minion', NULL, 4, 4, 1, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/8b/Mini-Mage.png/184px-Mini-Mage.png?version=e6ab2ccdadf3b17bb9ec45384abf62b5'),
(210, 'Sen''jin Shieldmasta', NULL, 'Free', 'Minion', NULL, 4, 3, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/a/aa/Sen%27jin_Shieldmasta%28326%29.png/184px-Sen%27jin_Shieldmasta%28326%29.png?version=994cae481c6f42a55dd81cc83e3a85a9'),
(211, 'Nozdormu', NULL, 'Legendary', 'Minion', 'Dragon', 9, 8, 8, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/da/Nozdormu%28285%29.png/184px-Nozdormu%28285%29.png?version=3f3006d6a6668aa9483925a4edc19dd1'),
(212, 'Molten Giant', NULL, 'Epic', 'Minion', NULL, 20, 8, 8, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/a/aa/Molten_Giant%2894%29.png/184px-Molten_Giant%2894%29.png?version=6dd047ddfb92da9c885a704cf9657618'),
(213, 'Cruel Taskmaster', 2, 'Common', 'Minion', NULL, 2, 2, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/b/bf/Cruel_Taskmaster%28328%29.png/184px-Cruel_Taskmaster%28328%29.png?version=5fc5070a0f75affd116710e9778eb6fc'),
(214, 'Gadgetzan Auctioneer', NULL, 'Rare', 'Minion', NULL, 6, 4, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/0/0e/Gadgetzan_Auctioneer%28131%29.png/184px-Gadgetzan_Auctioneer%28131%29.png?version=50e75a01260f763ed93a5188c525dec6'),
(215, 'Shadow Bolt', 6, 'Free', 'Spell', NULL, 3, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/3/34/Shadow_Bolt%28647%29.png/184px-Shadow_Bolt%28647%29.png?version=1b6c73c949fa9392c2c652c93213fd65'),
(216, 'Mountain Giant', NULL, 'Epic', 'Minion', NULL, 12, 8, 8, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/7/7f/Mountain_Giant%28264%29.png/184px-Mountain_Giant%28264%29.png?version=63dacfc11a9469dda7d7dfe22601a807'),
(217, 'Old Murk-Eye', NULL, 'Legendary', 'Minion', 'Murloc', 4, 2, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/0/0a/Old_Murk-Eye%28217%29.png/184px-Old_Murk-Eye%28217%29.png?version=62c3d70a1c2603c578366a090be08755'),
(218, 'Shadow Word: Pain', 1, 'Free', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/f1/Shadow_Word-_Pain%28315%29.png/184px-Shadow_Word-_Pain%28315%29.png?version=9240ffc2a1100efa05db3208a7a7688a');
INSERT INTO `card` (`id`, `name`, `hero`, `rarity`, `type`, `subtype`, `cost`, `attack`, `hp`, `picture`) VALUES
(219, 'Gnomish Experimenter', NULL, 'Rare', 'Minion', NULL, 3, 3, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/e3/Gnomish_Experimenter.png/184px-Gnomish_Experimenter.png?version=4c77ce8d12a8484a29d966bd04398d2d'),
(220, 'Dalaran Mage', NULL, 'Common', 'Minion', NULL, 3, 1, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/e3/Dalaran_Mage%28388%29.png/184px-Dalaran_Mage%28388%29.png?version=590a7254a9d99284ac3af3362369a1ea'),
(221, 'Murloc Warleader', NULL, 'Epic', 'Minion', 'Murloc', 3, 3, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/93/Murloc_Warleader%28222%29.png/184px-Murloc_Warleader%28222%29.png?version=62a33679f0e3498e674e73089abac534'),
(222, 'Onyxia', NULL, 'Legendary', 'Minion', 'Dragon', 9, 8, 8, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/6/63/Onyxia%28432%29.png/184px-Onyxia%28432%29.png?version=65ac106a510acae2390d3ea257d991d7'),
(223, 'Patient Assassin', 4, 'Epic', 'Minion', NULL, 2, 1, 1, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/7/71/Patient_Assassin%2814%29.png/184px-Patient_Assassin%2814%29.png?version=87d046b57a5798e2c8a22bee64e89237'),
(224, 'Prophet Velen', 1, 'Legendary', 'Minion', NULL, 7, 7, 7, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/f7/Prophet_Velen%28228%29.png/184px-Prophet_Velen%28228%29.png?version=6733af1e5c74331c168200957520a268'),
(225, 'Goblin Blastmage', 3, 'Rare', 'Minion', NULL, 4, 5, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/9f/Goblin_Blastmage.png/184px-Goblin_Blastmage.png?version=4a672074f99596a80d0e37259dfb4990'),
(226, 'Sinister Strike', 4, 'Free', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/1/1e/Sinister_Strike%28205%29.png/184px-Sinister_Strike%28205%29.png?version=a6ae15623d96209d27d855d593d8c94e'),
(227, 'Goblin Sapper', NULL, 'Rare', 'Minion', NULL, 3, 3, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/d4/Goblin_Sapper.png/184px-Goblin_Sapper.png?version=b8eedf962a5a85d45aaa3d0fca039190'),
(228, 'Dancing Swords', NULL, 'Common', 'Minion', NULL, 3, 4, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/d4/Dancing_Swords.png/184px-Dancing_Swords.png?version=d817e41398de0453b342d9caeee92901'),
(229, 'Piloted Sky Golem', NULL, 'Epic', 'Minion', 'Mech', 6, 6, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/cd/Piloted_Sky_Golem.png/184px-Piloted_Sky_Golem.png?version=0a2785db5172c6fdcc629a40a0a7dae9'),
(230, 'Ragnaros the Firelord', NULL, 'Legendary', 'Minion', NULL, 8, 8, 8, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/4/47/Ragnaros_the_Firelord%28503%29.png/184px-Ragnaros_the_Firelord%28503%29.png?version=bc8f480097c3ec4686be27f93bf93c27'),
(231, 'Dark Cultist', 1, 'Common', 'Minion', NULL, 3, 3, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/b/b6/Dark_Cultist.png/184px-Dark_Cultist.png?version=16ab5f753f29d26e172b3779744854b3'),
(232, 'Grove Tender', 5, 'Rare', 'Minion', NULL, 3, 2, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/a/a5/Grove_Tender.png/184px-Grove_Tender.png?version=89f030493d2079202516524e1aad26b3'),
(233, 'Sneed''s Old Shredder', NULL, 'Legendary', 'Minion', 'Mech', 8, 5, 7, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/5/56/Sneed%27s_Old_Shredder.png/184px-Sneed%27s_Old_Shredder.png?version=6b0a3ac408eec9d4dea50ef1147a7ed1'),
(234, 'Darkbomb', 6, 'Common', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/0/0f/Darkbomb.png/184px-Darkbomb.png?version=a96d46389f401d193bc633bfb8daebb6'),
(235, 'Stalagg', NULL, 'Legendary', 'Minion', NULL, 5, 7, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/b/b1/Stalagg.png/184px-Stalagg.png?version=285269e6d4d73c5c5ff1c009cce8edbc'),
(236, 'Headcrack', 4, 'Rare', 'Spell', NULL, 3, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/4/43/Headcrack%28135%29.png/184px-Headcrack%28135%29.png?version=7c24c7262ce9dc96f05a610de137ef8c'),
(237, 'Darkscale Healer', NULL, 'Common', 'Minion', NULL, 5, 4, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/7/72/Darkscale_Healer%2884%29.png/184px-Darkscale_Healer%2884%29.png?version=86926be01a662dd33632e9fd760e2e1e'),
(238, 'Sylvanas Windrunner', NULL, 'Legendary', 'Minion', NULL, 6, 5, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/8b/Sylvanas_Windrunner%2833%29.png/184px-Sylvanas_Windrunner%2833%29.png?version=7bcb787f410dc3ecbda9b12297309122'),
(239, 'Holy Fire', 1, 'Rare', 'Spell', NULL, 6, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/a/a6/Holy_Fire%28457%29.png/184px-Holy_Fire%28457%29.png?version=e697eaebaa39fae048628ee800bfc34f'),
(240, 'Deadly Shot', 7, 'Common', 'Spell', NULL, 3, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/ef/Deadly_Shot%28239%29.png/184px-Deadly_Shot%28239%29.png?version=db9f31ab0567b411aab68247fd85666c'),
(242, 'Pit Lord', 6, 'Epic', 'Minion', 'Demon', 4, 5, 6, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/8f/Pit_Lord%28402%29.png/184px-Pit_Lord%28402%29.png?version=7a7f82ff047bcfd00f5c4622d6bd49c9'),
(243, 'Holy Wrath', 8, 'Rare', 'Spell', NULL, 5, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/4/4f/Holy_Wrath%28355%29.png/184px-Holy_Wrath%28355%29.png?version=ef7e2252f0614830f4e7bbf0f1e78b6b'),
(244, 'Hyena', 7, 'Rare', 'Minion', 'Beast', 2, 2, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/1/1c/Hyena%28689%29.png/184px-Hyena%28689%29.png?version=0f9ffe15c75f673d99a4bb64f0aad5f1'),
(245, 'Death''s Bite', 2, 'Common', 'Weapon', NULL, 4, 4, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/f7/Death%27s_Bite.png/184px-Death%27s_Bite.png?version=3608fbd71bedbf653e4785f37c4c6873'),
(246, 'Stonetusk Boar', NULL, 'Free', 'Minion', 'Beast', 1, 1, 1, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/c8/Stonetusk_Boar%2876%29.png/184px-Stonetusk_Boar%2876%29.png?version=49456d84a6ee68d3f6ced1d76ea7173e'),
(247, 'Preparation', 4, 'Epic', 'Spell', NULL, 0, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/5/5b/Preparation%28364%29.png/184px-Preparation%28364%29.png?version=698534001df929c2117e5491e86b3ef6'),
(248, 'Illuminator', NULL, 'Rare', 'Minion', NULL, 3, 2, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/cf/Illuminator.png/184px-Illuminator.png?version=2d81abaf67c32d9c385525a13ad6504b'),
(249, 'Pyroblast', 3, 'Epic', 'Spell', NULL, 10, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/7/73/Pyroblast%28496%29.png/184px-Pyroblast%28496%29.png?version=b419789308e474fce09fd1bb980a937d'),
(250, 'The Beast', NULL, 'Legendary', 'Minion', 'Beast', 6, 9, 7, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/2/29/The_Beast%28179%29.png/184px-The_Beast%28179%29.png?version=85b8c6284dadd9feabe092592b787ff8'),
(251, 'Quartermaster', 8, 'Epic', 'Minion', NULL, 5, 2, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/9b/Quartermaster.png/184px-Quartermaster.png?version=d35d0cbaa107af730037a1be5a9646a5'),
(252, 'Succubus', 6, 'Free', 'Minion', 'Demon', 2, 4, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/f3/Succubus%28208%29.png/184px-Succubus%28208%29.png?version=924d98dbb64b56cb1321dc5231d1f349'),
(253, 'The Black Knight', NULL, 'Legendary', 'Minion', NULL, 6, 4, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/e7/The_Black_Knight%28396%29.png/184px-The_Black_Knight%28396%29.png?version=dce6707918ae28063fa595335ed145c4'),
(254, 'Timber Wolf', 7, 'Free', 'Minion', 'Beast', 1, 1, 1, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/fe/Timber_Wolf%2886%29.png/184px-Timber_Wolf%2886%29.png?version=495cf187809d5ca8988b53e1a3f840b6'),
(255, 'Imp Master', NULL, 'Rare', 'Minion', NULL, 3, 1, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/1/14/Imp_Master%28178%29.png/184px-Imp_Master%28178%29.png?version=3ddfa90a0dce40842475a19a383f1f74'),
(256, 'Defias Ringleader', 4, 'Common', 'Minion', NULL, 2, 2, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/a/a6/Defias_Ringleader%28417%29.png/184px-Defias_Ringleader%28417%29.png?version=8d36a250795168bd0f1f43ff32fd3a8b'),
(257, 'Imp-losion', 6, 'Rare', 'Spell', NULL, 4, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/f4/Imp-losion.png/184px-Imp-losion.png?version=9a2f29c225b75ab01ae4d129d263d776'),
(258, 'Tracking', 7, 'Free', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/fc/Tracking%28163%29.png/184px-Tracking%28163%29.png?version=008bd8bb483d74289a75fa94fd701139'),
(259, 'Tinkmaster Overspark', NULL, 'Legendary', 'Minion', NULL, 3, 3, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/3/30/Tinkmaster_Overspark%28245%29.png/184px-Tinkmaster_Overspark%28245%29.png?version=9c4991b3e7b50aa4c98c4c9137dd7c56'),
(260, 'Demonfire', 6, 'Common', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/1/19/Demonfire%28452%29.png/184px-Demonfire%28452%29.png?version=648dcaf993a0ca194de232f1519ca59b'),
(261, 'Injured Blademaster', NULL, 'Rare', 'Minion', NULL, 3, 4, 7, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/2/27/Injured_Blademaster%28209%29.png/184px-Injured_Blademaster%28209%29.png?version=9a4c7d39107a12fe51a96bfbd11aa92b'),
(262, 'Recombobulator', NULL, 'Epic', 'Minion', NULL, 2, 3, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/0/02/Recombobulator.png/184px-Recombobulator.png?version=2d294e7ce0c36ce0ae70289ab344722b'),
(263, 'Tirion Fordring', 8, 'Legendary', 'Minion', NULL, 8, 6, 6, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/2/21/Tirion_Fordring%28391%29.png/184px-Tirion_Fordring%28391%29.png?version=a7ec2c89957174cdd99832b5f7fd47c9'),
(264, 'Iron Sensei', 4, 'Rare', 'Minion', 'Mech', 3, 2, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/0/0f/Iron_Sensei.png/184px-Iron_Sensei.png?version=f27517113669ddbfad054e1584e1f7b6'),
(265, 'Dire Wolf Alpha', NULL, 'Common', 'Minion', 'Beast', 2, 2, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/e3/Dire_Wolf_Alpha%28305%29.png/184px-Dire_Wolf_Alpha%28305%29.png?version=d7d95e2a09b53a19eb8e22bc0a136414'),
(266, 'Toshley', NULL, 'Legendary', 'Minion', NULL, 6, 5, 7, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/f3/Toshley.png/184px-Toshley.png?version=98a61316cec1e2b1bacd5facd201009e'),
(267, 'Sabotage', 4, 'Epic', 'Spell', NULL, 4, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/f3/Sabotage.png/184px-Sabotage.png?version=826c3fbd1721c1fbb725fd55168bd2be'),
(268, 'Voidwalker', 6, 'Free', 'Minion', 'Demon', 1, 1, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/d6/Voidwalker%28340%29.png/184px-Voidwalker%28340%29.png?version=f1faf8f55f54c3f2c8825bce04649cda'),
(269, 'Divine Spirit', 1, 'Common', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/95/Divine_Spirit%28554%29.png/184px-Divine_Spirit%28554%29.png?version=52a78079403180f752f99c83b3d69931'),
(270, 'Trade Prince Gallywix', 4, 'Legendary', 'Minion', NULL, 6, 5, 8, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/fc/Trade_Prince_Gallywix.png/184px-Trade_Prince_Gallywix.png?version=e6237cb5b44953842f73889bd02f611c'),
(271, 'Voodoo Doctor', NULL, 'Free', 'Minion', NULL, 1, 2, 1, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/7/7d/Voodoo_Doctor%28410%29.png/184px-Voodoo_Doctor%28410%29.png?version=6e1cf095645b39d0efafcf07788b2e7d'),
(272, 'Jeeves', NULL, 'Rare', 'Minion', 'Mech', 4, 1, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/6/63/Jeeves.png/184px-Jeeves.png?version=decd64ea76e558c10e8827a15a1b77a6'),
(273, 'Sea Giant', NULL, 'Epic', 'Minion', NULL, 10, 8, 8, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/ee/Sea_Giant%28614%29.png/184px-Sea_Giant%28614%29.png?version=26594fa1a9def8379d5201314318f8ae'),
(274, 'Dragonling Mechanic', NULL, 'Common', 'Minion', NULL, 4, 2, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/1/18/Dragonling_Mechanic%28472%29.png/184px-Dragonling_Mechanic%28472%29.png?version=07a6c29b4ffa4169d450d116d616df86'),
(275, 'Keeper of the Grove', 5, 'Rare', 'Minion', NULL, 4, 2, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/e7/Keeper_of_the_Grove%28459%29.png/184px-Keeper_of_the_Grove%28459%29.png?version=0f99c8f4647174671b653647f615010b'),
(276, 'Troggzor the Earthinator', NULL, 'Legendary', 'Minion', NULL, 7, 6, 6, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/fb/Troggzor_the_Earthinator.png/184px-Troggzor_the_Earthinator.png?version=340a24e56c4e0eb4d60699ed42990f8a'),
(277, 'Warsong Commander', 2, 'Free', 'Minion', NULL, 3, 2, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/3/34/Warsong_Commander%28193%29.png/184px-Warsong_Commander%28193%29.png?version=64529064d9d40904fa35ff9cf709d8c5'),
(278, 'Dread Corsair', NULL, 'Common', 'Minion', 'Pirate', 4, 3, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/7/74/Dread_Corsair%28261%29.png/184px-Dread_Corsair%28261%29.png?version=0bb23aaebb8e53f0577717cac998164a'),
(279, 'Shade of Naxxramas', NULL, 'Epic', 'Minion', NULL, 3, 2, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/f4/Shade_of_Naxxramas.png/184px-Shade_of_Naxxramas.png?version=2afc7f7768f39211e1aff073dec3a2fb'),
(280, 'Kezan Mystic', NULL, 'Rare', 'Minion', NULL, 4, 4, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/b/be/Kezan_Mystic.png/184px-Kezan_Mystic.png?version=8b02f21b1c83178fcc9134c06db7d30b'),
(281, 'Dread Infernal', 6, 'Common', 'Minion', 'Demon', 6, 6, 6, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/a/a4/Dread_Infernal%2836%29.png/184px-Dread_Infernal%2836%29.png?version=7092868152ddc4d17a683dd686d03fea'),
(282, 'King of Beasts', 7, 'Rare', 'Minion', 'Beast', 5, 2, 6, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/3/3f/King_of_Beasts.png/184px-King_of_Beasts.png?version=7e74d8d93bffe77c5752f50892d53805'),
(283, 'Shadowbomber', 1, 'Epic', 'Minion', NULL, 1, 2, 1, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/1/19/Shadowbomber.png/184px-Shadowbomber.png?version=1f6d58bf7995d9000d381ed3ceff8cfa'),
(284, 'Kirin Tor Mage', 3, 'Rare', 'Minion', NULL, 3, 4, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/7/7e/Kirin_Tor_Mage%28411%29.png/184px-Kirin_Tor_Mage%28411%29.png?version=32c721a646b88274cbda29e08b49f97f'),
(285, 'Vol''jin', 1, 'Legendary', 'Minion', NULL, 5, 6, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/6/69/Vol%27jin.png/184px-Vol%27jin.png?version=94b893c9aebe0d2746bd1b241b78831a'),
(286, 'Druid of the Claw', 5, 'Common', 'Minion', NULL, 5, 4, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/e3/Druid_of_the_Claw%28587%29.png/184px-Druid_of_the_Claw%28587%29.png?version=7263f91fa787bc86ed17ad7a6af5de03'),
(287, 'Wild Growth', 5, 'Free', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/e2/Wild_Growth%28282%29.png/184px-Wild_Growth%28282%29.png?version=d352aeac3613be8cea79ff4b7e62af02'),
(288, 'Ysera', NULL, 'Legendary', 'Minion', 'Dragon', 9, 4, 12, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/6/6d/Ysera%28495%29.png/184px-Ysera%28495%29.png?version=eb968dec17930fe1a765a04707e83d41'),
(289, 'Knife Juggler', NULL, 'Rare', 'Minion', NULL, 2, 3, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/b/b1/Knife_Juggler%28422%29.png/184px-Knife_Juggler%28422%29.png?version=4a1d8dca7acc05db4ac0c447e9d13669'),
(290, 'Shadowform', 1, 'Epic', 'Spell', NULL, 3, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/b/b0/Shadowform%28421%29.png/184px-Shadowform%28421%29.png?version=02f256151e094f1e92eab643c4515bc3'),
(291, 'Windfury', 9, 'Free', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/e8/Windfury%28146%29.png/184px-Windfury%28146%29.png?version=3c064590fb2b807d28436e2454f3b5c9'),
(292, 'Shield Slam', 2, 'Epic', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/2/29/Shield_Slam%2850%29.png/184px-Shield_Slam%2850%29.png?version=7e3ecf5c2c6c7ad95ccefa6940454430'),
(293, 'Lava Burst', 9, 'Rare', 'Spell', NULL, 3, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/6/6e/Lava_Burst%28679%29.png/184px-Lava_Burst%28679%29.png?version=6df7e3702346b6404b0a8f71fdd228ef'),
(294, 'Wolfrider', NULL, 'Free', 'Minion', NULL, 3, 3, 1, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/6/6e/Wolfrider%28174%29.png/184px-Wolfrider%28174%29.png?version=346d6346d4a313478c33cb1c6f79b0eb'),
(295, 'Light of the Naaru', 1, 'Rare', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/ca/Light_of_the_Naaru.png/184px-Light_of_the_Naaru.png?version=45179d9661eb09be6b6acfceabd1272c'),
(296, 'Siltfin Spiritwalker', 9, 'Epic', 'Minion', 'Murloc', 4, 2, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/3/33/Siltfin_Spiritwalker.png/184px-Siltfin_Spiritwalker.png?version=2d587895ad8c278070f018f23bb67798'),
(297, 'Duplicate', 3, 'Common', 'Spell', NULL, 3, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/eb/Duplicate.png/184px-Duplicate.png?version=110610441751324ca90975ad8a11353c'),
(298, 'Dust Devil', 9, 'Common', 'Minion', NULL, 1, 3, 1, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/84/Dust_Devil%28129%29.png/184px-Dust_Devil%28129%29.png?version=b33864c365bcf77a5af0583e78df63e1'),
(299, 'Lightning Storm', 9, 'Rare', 'Spell', NULL, 3, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/9b/Lightning_Storm%28676%29.png/184px-Lightning_Storm%28676%29.png?version=eaf71d626f2c9dcae9592d743356455d'),
(300, 'Snake Trap', 7, 'Epic', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/0/0e/Snake_Trap%28210%29.png/184px-Snake_Trap%28210%29.png?version=45e53a058fbc98813f8530ee6e21db7f'),
(301, 'Lightwarden', NULL, 'Rare', 'Minion', NULL, 1, 1, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/c6/Lightwarden%28436%29.png/184px-Lightwarden%28436%29.png?version=cf27aeba55f9704680bf746a86af3174'),
(302, 'Southsea Captain', NULL, 'Epic', 'Minion', 'Pirate', 3, 3, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/d4/Southsea_Captain%28324%29.png/184px-Southsea_Captain%28324%29.png?version=0f9eb3eb932f393b27dd1a969838df54'),
(303, 'Earth Shock', 9, 'Common', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/85/Earth_Shock%2877%29.png/184px-Earth_Shock%2877%29.png?version=b3ad5c1b3b41e62e17e1cca426b8d5c2'),
(304, 'Lightwell', 1, 'Rare', 'Minion', NULL, 2, 0, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/d7/Lightwell%28117%29.png/184px-Lightwell%28117%29.png?version=6592935ba67c3ad7f7f81e0b15c5cd6e'),
(305, 'Earthen Ring Farseer', NULL, 'Common', 'Minion', NULL, 3, 3, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/7/7c/Earthen_Ring_Farseer%28557%29.png/184px-Earthen_Ring_Farseer%28557%29.png?version=ba4ec87118a904c6c9a495191bba4634'),
(306, 'Lil'' Exorcist', NULL, 'Rare', 'Minion', NULL, 3, 2, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/3/30/Lil%27_Exorcist.png/184px-Lil%27_Exorcist.png?version=f21b7a81c945ab6f27dd60e15fc32c8e'),
(307, 'Elven Archer', NULL, 'Common', 'Minion', NULL, 1, 1, 1, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/a/aa/Elven_Archer%28356%29.png/184px-Elven_Archer%28356%29.png?version=20f45da6cdaae17dfde58f8d22432ef1'),
(308, 'Spellbender', 3, 'Epic', 'Spell', NULL, 3, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/f6/Spellbender%28309%29.png/184px-Spellbender%28309%29.png?version=46acd9242a3aa8ce71cbda815736d33c'),
(309, 'Steamwheedle Sniper', 7, 'Epic', 'Minion', NULL, 2, 2, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/ec/Steamwheedle_Sniper.png/184px-Steamwheedle_Sniper.png?version=3b20b793f1594e2aef3fa0ce01c31da2'),
(310, 'Madder Bomber', NULL, 'Rare', 'Minion', NULL, 5, 5, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/4/4f/Madder_Bomber.png/184px-Madder_Bomber.png?version=0913b349e168a94d662e5dbb7228a6c6'),
(311, 'Sword of Justice', 8, 'Epic', 'Weapon', NULL, 3, 1, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/e8/Sword_of_Justice%28567%29.png/184px-Sword_of_Justice%28567%29.png?version=b0e92e59aa14a6f1fca883ae9d9499b9'),
(312, 'Mana Addict', NULL, 'Rare', 'Minion', NULL, 2, 1, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/92/Mana_Addict%2867%29.png/184px-Mana_Addict%2867%29.png?version=477c60c320718887ea0b6ca300d62df0'),
(313, 'Mana Tide Totem', 9, 'Rare', 'Minion', 'Totem', 3, 0, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/f4/Mana_Tide_Totem%28613%29.png/184px-Mana_Tide_Totem%28613%29.png?version=6e737890fdec3633e6663ed5c0a681a0'),
(314, 'Tree of Life', 5, 'Epic', 'Spell', NULL, 9, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/1/1c/Tree_of_Life.png/184px-Tree_of_Life.png?version=03dc960afa4b0909e4a013d0c715c0cb'),
(315, 'Mana Wraith', NULL, 'Rare', 'Minion', NULL, 2, 2, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/fe/Mana_Wraith%28197%29.png/184px-Mana_Wraith%28197%29.png?version=fa2081bf8cf14354a3b84c1544eed0ec'),
(316, 'Twisting Nether', 6, 'Epic', 'Spell', NULL, 8, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/ca/Twisting_Nether%28398%29.png/184px-Twisting_Nether%28398%29.png?version=b3cbf691880a837e6ee00bee5e54ae5b'),
(317, 'Wee Spellstopper', 3, 'Epic', 'Minion', NULL, 4, 2, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/6/6d/Wee_Spellstopper.png/184px-Wee_Spellstopper.png?version=42124b0a045589fa3d671fe98cdba5c7'),
(318, 'Eviscerate', 4, 'Common', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/5/57/Eviscerate%28382%29.png/184px-Eviscerate%28382%29.png?version=ce37ae5917f96dcb1286e8c1b9469cee'),
(319, 'Mass Dispel', 1, 'Rare', 'Spell', NULL, 4, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/4/4a/Mass_Dispel%28249%29.png/184px-Mass_Dispel%28249%29.png?version=f1985dab51d02f8398db4da61db9eb51'),
(320, 'Explosive Sheep', NULL, 'Common', 'Minion', 'Mech', 2, 1, 1, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/ca/Explosive_Sheep.png/184px-Explosive_Sheep.png?version=d9e69b5f17aba363c25ac9f2846916e7'),
(321, 'Master Swordsmith', NULL, 'Rare', 'Minion', NULL, 2, 1, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/2/2f/Master_Swordsmith%28584%29.png/184px-Master_Swordsmith%28584%29.png?version=b31296cb91b75a2ddce8d84c2f1bb87c'),
(322, 'Explosive Trap', 7, 'Common', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/9a/Explosive_Trap%28344%29.png/184px-Explosive_Trap%28344%29.png?version=7a7eb84412552f34c26bcf22f3942177'),
(323, 'Master of Disguise', 4, 'Rare', 'Minion', NULL, 4, 4, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/f1/Master_of_Disguise%28127%29.png/184px-Master_of_Disguise%28127%29.png?version=b3484ae084cd67ccd32814f78fe0f93f'),
(324, 'Eye for an Eye', 8, 'Common', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/a/a4/Eye_for_an_Eye%28206%29.png/184px-Eye_for_an_Eye%28206%29.png?version=4e801a185b0dcee922fef674e974d03e'),
(325, 'Mech-Bear-Cat', 5, 'Rare', 'Minion', 'Mech', 6, 7, 6, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/fa/Mech-Bear-Cat.png/184px-Mech-Bear-Cat.png?version=a6d7139fc949de6b9eaea9ae7cbb9e41'),
(326, 'Metaltooth Leaper', 7, 'Rare', 'Minion', 'Mech', 3, 3, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/7/73/Metaltooth_Leaper.png/184px-Metaltooth_Leaper.png?version=f22f6d81c51019731d6e2e9ee4b61680'),
(327, 'Faerie Dragon', NULL, 'Common', 'Minion', 'Dragon', 2, 3, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/f6/Faerie_Dragon%28213%29.png/184px-Faerie_Dragon%28213%29.png?version=faf83a3402cb0ebac1344cf4e3e73881'),
(328, 'Fan of Knives', 4, 'Common', 'Spell', NULL, 3, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/2/29/Fan_of_Knives%28378%29.png/184px-Fan_of_Knives%28378%29.png?version=dab2e217e570f1bac84c7336d0b40ead'),
(329, 'Mind Control Tech', NULL, 'Rare', 'Minion', NULL, 3, 3, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/2/2d/Mind_Control_Tech%28368%29.png/184px-Mind_Control_Tech%28368%29.png?version=d80f3801ccadd87d3a07fa5811746d1d'),
(330, 'Fen Creeper', NULL, 'Common', 'Minion', NULL, 5, 3, 6, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/7/7a/Fen_Creeper%28476%29.png/184px-Fen_Creeper%28476%29.png?version=2fa1878a6e24711098a2adc4ae869b3c'),
(331, 'Misdirection', 7, 'Rare', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/94/Misdirection%28447%29.png/184px-Misdirection%28447%29.png?version=5e2eedc689ebc26043df2c1623b1ec94'),
(332, 'Mistress of Pain', 6, 'Rare', 'Minion', 'Demon', 2, 1, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/c6/Mistress_of_Pain.png/184px-Mistress_of_Pain.png?version=3a39fadc967825b79c58a766e8065285'),
(333, 'Fire Elemental', 9, 'Common', 'Minion', NULL, 6, 6, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/e8/Fire_Elemental%28636%29.png/184px-Fire_Elemental%28636%29.png?version=afbbae96abe6b31fbab8f08bb5fe214a'),
(334, 'Mortal Strike', 2, 'Rare', 'Spell', NULL, 4, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/b/b0/Mortal_Strike%28345%29.png/184px-Mortal_Strike%28345%29.png?version=f016bcb1173c74f179709e4426f87d1b'),
(335, 'Flame Imp', 6, 'Common', 'Minion', 'Demon', 1, 3, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/82/Flame_Imp%2885%29.png/184px-Flame_Imp%2885%29.png?version=d18d6a745d97263a6e669a37990bf6fe'),
(336, 'Murloc Tidecaller', NULL, 'Rare', 'Minion', 'Murloc', 1, 1, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/3/36/Murloc_Tidecaller%28420%29.png/184px-Murloc_Tidecaller%28420%29.png?version=374f699a58a91baffb9745743fb24d8c'),
(337, 'Muster for Battle', 8, 'Rare', 'Spell', NULL, 3, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/7/78/Muster_for_Battle.png/184px-Muster_for_Battle.png?version=9ac0410ee8672f9d61550a51e90be96b'),
(338, 'Flamecannon', 3, 'Common', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/b/be/Flamecannon.png/184px-Flamecannon.png?version=fd8575078944305bff4efe0333dcac5e'),
(339, 'Flamestrike', 3, 'Common', 'Spell', NULL, 7, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/94/Flamestrike%2844%29.png/184px-Flamestrike%2844%29.png?version=e644ba613acda41f42bab9504dcdaf8c'),
(340, 'Nerubian Egg', NULL, 'Rare', 'Minion', NULL, 2, 0, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/f2/Nerubian_Egg.png/184px-Nerubian_Egg.png?version=a21ab3679db9cb7ae70f1cfc48c52b26'),
(341, 'Nourish', 5, 'Rare', 'Spell', NULL, 5, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/91/Nourish%28120%29.png/184px-Nourish%28120%29.png?version=6272dc09ad2d7bb7a2e441774c3b6d55'),
(342, 'Flametongue Totem', 9, 'Common', 'Minion', 'Totem', 2, 0, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/6/60/Flametongue_Totem%28390%29.png/184px-Flametongue_Totem%28390%29.png?version=fe05e780d491ecc8ea52fe39a680e4e5'),
(343, 'Flesheating Ghoul', NULL, 'Common', 'Minion', NULL, 3, 2, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/0/07/Flesheating_Ghoul%28610%29.png/184px-Flesheating_Ghoul%28610%29.png?version=5990227928a02259186c3a6a5302ef9a'),
(344, 'Floating Watcher', 6, 'Common', 'Minion', 'Demon', 5, 4, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/c7/Floating_Watcher.png/184px-Floating_Watcher.png?version=dfaad2105e6202105badc07d77d91eba'),
(345, 'Ogre Ninja', 4, 'Rare', 'Minion', NULL, 5, 6, 6, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/0/0a/Ogre_Ninja.png/184px-Ogre_Ninja.png?version=6b0d43cb4833e7c0efcd7d0a27014896'),
(346, 'One-eyed Cheat', 4, 'Rare', 'Minion', 'Pirate', 2, 4, 1, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/c3/One-eyed_Cheat.png/184px-One-eyed_Cheat.png?version=7e918bdeeab8c43fe0eb2e2d55efe4ae'),
(347, 'Flying Machine', NULL, 'Common', 'Minion', 'Mech', 3, 1, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/5/5f/Flying_Machine.png/184px-Flying_Machine.png?version=0d010d78e724b843896d7c5a7e65f131'),
(348, 'Perdition''s Blade', 4, 'Rare', 'Weapon', NULL, 3, 2, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/de/Perdition%27s_Blade%2882%29.png/184px-Perdition%27s_Blade%2882%29.png?version=2d723d9b3aed932103810a15c8bbd313'),
(349, 'Force-Tank MAX', NULL, 'Common', 'Minion', 'Mech', 8, 7, 7, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/1/17/Force-Tank_MAX.png/184px-Force-Tank_MAX.png?version=57fe103a98d7fa6636962851232fa7a6'),
(350, 'Forked Lightning', 9, 'Common', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/e0/Forked_Lightning%28530%29.png/184px-Forked_Lightning%28530%29.png?version=a6096f24f25f4d0258b0e46684666d5d'),
(351, 'Pint-Sized Summoner', NULL, 'Rare', 'Minion', NULL, 2, 2, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/c1/Pint-Sized_Summoner%2854%29.png/184px-Pint-Sized_Summoner%2854%29.png?version=1f0ee8eacbad0a6b34c5c71a93c7ae4e'),
(352, 'Powermace', 9, 'Rare', 'Weapon', NULL, 3, 3, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/7/7f/Powermace.png/184px-Powermace.png?version=68e55243a5e1b418bad5c36771f9b713'),
(353, 'Freezing Trap', 7, 'Common', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/83/Freezing_Trap%2899%29.png/184px-Freezing_Trap%2899%29.png?version=5ba6062d83f917722e3a160c009d8733'),
(354, 'Questing Adventurer', NULL, 'Rare', 'Minion', NULL, 3, 2, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/a/a9/Questing_Adventurer%28157%29.png/184px-Questing_Adventurer%28157%29.png?version=4e5f8fdd8b93097875f173e3cfbc9d68'),
(355, 'Ravenholdt Assassin', NULL, 'Rare', 'Minion', NULL, 7, 7, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/3/3a/Ravenholdt_Assassin%28518%29.png/184px-Ravenholdt_Assassin%28518%29.png?version=de1c14a01d654f89212a8e37c327d752'),
(356, 'Frost Elemental', NULL, 'Common', 'Minion', NULL, 6, 5, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/93/Frost_Elemental%28598%29.png/184px-Frost_Elemental%28598%29.png?version=8fc9f3822d847b27a3981fcec944fc95'),
(357, 'Recycle', 5, 'Rare', 'Spell', NULL, 6, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/7/70/Recycle.png/184px-Recycle.png?version=d1bad5d071016c348005ff564dbdc2db'),
(358, 'Frost Nova', 3, 'Common', 'Spell', NULL, 3, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/0/00/Frost_Nova%2849%29.png/184px-Frost_Nova%2849%29.png?version=cd68a95cfc2ae9d4d62be43d6e4d50d8'),
(359, 'SI:7 Agent', 4, 'Rare', 'Minion', NULL, 3, 3, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/c3/SI-7_Agent%28286%29.png/184px-SI-7_Agent%28286%29.png?version=c49f29f2fb6a711e16b8b9b048f94ad4'),
(360, 'Frostbolt', 3, 'Common', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/b/b1/Frostbolt%28177%29.png/184px-Frostbolt%28177%29.png?version=a36eb8bdda31314e01024ab05bedb21c'),
(361, 'Savagery', 5, 'Rare', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/1/1c/Savagery%28148%29.png/184px-Savagery%28148%29.png?version=57812e4b80b9db644c54512c1e06139f'),
(362, 'Frostwolf Grunt', NULL, 'Common', 'Minion', NULL, 2, 2, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/0/02/Frostwolf_Grunt%28663%29.png/184px-Frostwolf_Grunt%28663%29.png?version=a70619c65a6c7e9fed90457aa737f0ca'),
(363, 'Frostwolf Warlord', NULL, 'Common', 'Minion', NULL, 5, 4, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/c9/Frostwolf_Warlord%28604%29.png/184px-Frostwolf_Warlord%28604%29.png?version=bfa0ea71fa570bcd0e35ae5529e691cf'),
(364, 'Savannah Highmane', 7, 'Rare', 'Minion', 'Beast', 6, 6, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/1/1f/Savannah_Highmane%288%29.png/184px-Savannah_Highmane%288%29.png?version=fb13448f194386f9ae4843484f88efc4'),
(365, 'Scarlet Purifier', 8, 'Rare', 'Minion', NULL, 3, 4, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/7/77/Scarlet_Purifier.png/184px-Scarlet_Purifier.png?version=263b96d59f341550301abb2b89fc2ac2'),
(366, 'Gilblin Stalker', NULL, 'Common', 'Minion', NULL, 2, 2, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/0/05/Gilblin_Stalker.png/184px-Gilblin_Stalker.png?version=03fdcf4e249255c6de08064c6b4b3ee8'),
(367, 'Screwjank Clunker', 2, 'Rare', 'Minion', 'Mech', 4, 2, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/82/Screwjank_Clunker.png/184px-Screwjank_Clunker.png?version=9484a04a86d48e0540b702ade4dcf7e1'),
(368, 'Secretkeeper', NULL, 'Rare', 'Minion', NULL, 1, 1, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/7/79/Secretkeeper%28483%29.png/184px-Secretkeeper%28483%29.png?version=6f76739b07d0b74d9630e3850b72c218'),
(369, 'Glaivezooka', 7, 'Common', 'Weapon', NULL, 2, 2, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/4/4c/Glaivezooka.png/184px-Glaivezooka.png?version=ecbaf1e77777795b79d110263b38b1a6'),
(370, 'Shadow Madness', 1, 'Rare', 'Spell', NULL, 4, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/4/43/Shadow_Madness%28442%29.png/184px-Shadow_Madness%28442%29.png?version=4a4742deaf1d22b7d4fb2f41a6ae6e45'),
(371, 'Shadowboxer', 1, 'Rare', 'Minion', 'Mech', 2, 2, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/5/56/Shadowboxer.png/184px-Shadowboxer.png?version=f81181c5c9b77de803814ac87c9b4fdb'),
(372, 'Gnomeregan Infantry', NULL, 'Common', 'Minion', NULL, 3, 1, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/3/31/Gnomeregan_Infantry.png/184px-Gnomeregan_Infantry.png?version=0ecc9e8d3805451c4b61a28fef748d63'),
(373, 'Gnomish Inventor', NULL, 'Common', 'Minion', NULL, 4, 2, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/1/13/Gnomish_Inventor%28246%29.png/184px-Gnomish_Inventor%28246%29.png?version=6279a6a19fd3304053ab54863531d904'),
(374, 'Shadowflame', 6, 'Rare', 'Spell', NULL, 4, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/89/Shadowflame%28673%29.png/184px-Shadowflame%28673%29.png?version=72c55f444da9793068c64d4f4f6b0905'),
(375, 'Goblin Auto-Barber', 4, 'Common', 'Minion', 'Mech', 2, 3, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/5/52/Goblin_Auto-Barber.png/184px-Goblin_Auto-Barber.png?version=f185642bb93805bc44c5d3ea7b677a4d'),
(376, 'Shieldmaiden', 2, 'Rare', 'Minion', NULL, 6, 5, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/4/40/Shieldmaiden.png/184px-Shieldmaiden.png?version=606f372ab4fbbeef357e1c4a9ca1a0ac'),
(377, 'Goldshire Footman', NULL, 'Common', 'Minion', NULL, 1, 1, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/9b/Goldshire_Footman%28564%29.png/184px-Goldshire_Footman%28564%29.png?version=fc8af2e51688d3e20187c3772b9ee984'),
(378, 'Siege Engine', 2, 'Rare', 'Minion', 'Mech', 5, 5, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/92/Siege_Engine.png/184px-Siege_Engine.png?version=a7ca82092f4ffc93570765b5ee0f0d3d'),
(379, 'Grimscale Oracle', NULL, 'Common', 'Minion', 'Murloc', 1, 1, 1, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/87/Grimscale_Oracle%28510%29.png/184px-Grimscale_Oracle%28510%29.png?version=4c6d93d7df48c03b28e422eb368a7900'),
(380, 'Siphon Soul', 6, 'Rare', 'Spell', NULL, 6, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/1/16/Siphon_Soul%28573%29.png/184px-Siphon_Soul%28573%29.png?version=c7c399cd7061e84627bac10a3715b90e'),
(381, 'Sludge Belcher', NULL, 'Rare', 'Minion', NULL, 5, 3, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/2/28/Sludge_Belcher.png/184px-Sludge_Belcher.png?version=4a91214afc493def5e3ee5e01baf2651'),
(382, 'Guardian of Kings', 8, 'Common', 'Minion', NULL, 7, 5, 6, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/d1/Guardian_of_Kings%28283%29.png/184px-Guardian_of_Kings%28283%29.png?version=3a1f9095c697047ce535c5104dd83945'),
(383, 'Soot Spewer', 3, 'Rare', 'Minion', 'Mech', 3, 3, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/4/4d/Soot_Spewer.png/184px-Soot_Spewer.png?version=dc48c629322c5f2ddd0ead4a60e7f70f'),
(384, 'Gurubashi Berserker', NULL, 'Common', 'Minion', NULL, 5, 2, 7, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/6/62/Gurubashi_Berserker%28624%29.png/184px-Gurubashi_Berserker%28624%29.png?version=00307024cd39f666b50370e0a5737286'),
(385, 'Harvest Golem', NULL, 'Common', 'Minion', 'Mech', 3, 2, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/6/63/Harvest_Golem%28386%29.png/184px-Harvest_Golem%28386%29.png?version=53b652e1a9be9dba69c98b432363074f'),
(386, 'Haunted Creeper', NULL, 'Common', 'Minion', 'Beast', 2, 1, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/89/Haunted_Creeper.png/184px-Haunted_Creeper.png?version=381fecbdb81cae850a85e8864f52eeca'),
(387, 'Holy Nova', 1, 'Common', 'Spell', NULL, 5, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/4/4b/Holy_Nova%28671%29.png/184px-Holy_Nova%28671%29.png?version=bba6dcf6b981cc1cd03f75dbd437143d'),
(388, 'Stampeding Kodo', NULL, 'Rare', 'Minion', 'Beast', 5, 3, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/8c/Stampeding_Kodo%28389%29.png/184px-Stampeding_Kodo%28389%29.png?version=faabb7f5d9df24086cda227bce10be32'),
(389, 'Starfall', 5, 'Rare', 'Spell', NULL, 5, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/cd/Starfall%28464%29.png/184px-Starfall%28464%29.png?version=1b0d77852fffae6c6d7a1f39f68a0b92'),
(390, 'Sunfury Protector', NULL, 'Rare', 'Minion', NULL, 2, 2, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/c4/Sunfury_Protector%28372%29.png/184px-Sunfury_Protector%28372%29.png?version=507dee0b12f3d8c371eeceaf46d6ed3e'),
(391, 'Sunwalker', NULL, 'Rare', 'Minion', NULL, 6, 4, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/b/b8/Sunwalker%28221%29.png/184px-Sunwalker%28221%29.png?version=fd781ee7bce8996a6e3333e329828ee9'),
(392, 'Humility', 8, 'Common', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/cd/Humility%28189%29.png/184px-Humility%28189%29.png?version=1b2bf5e81e09e222c8694518be1fa631'),
(393, 'Target Dummy', NULL, 'Rare', 'Minion', 'Mech', 0, 0, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/94/Target_Dummy.png/184px-Target_Dummy.png?version=3ce80c58c04328274496c56c37962848'),
(394, 'Hunter''s Mark', 7, 'Common', 'Spell', NULL, 0, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/d6/Hunter%27s_Mark%2822%29.png/184px-Hunter%27s_Mark%2822%29.png?version=aefebbeb205503d6e6c0beb129767db5'),
(395, 'Twilight Drake', NULL, 'Rare', 'Minion', 'Dragon', 4, 4, 1, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/b/b9/Twilight_Drake%28360%29.png/184px-Twilight_Drake%28360%29.png?version=27d57a7e66fcf0b02a1b31c423af604e'),
(396, 'Unstable Portal', 3, 'Rare', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/86/Unstable_Portal.png/184px-Unstable_Portal.png?version=a20687da16b517709cda526787d52d44'),
(397, 'Ice Barrier', 3, 'Common', 'Spell', NULL, 3, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/4/45/Ice_Barrier%28672%29.png/184px-Ice_Barrier%28672%29.png?version=8be99d9ec101b644ade3e18ce636ccac'),
(398, 'Ice Lance', 3, 'Common', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/c8/Ice_Lance%28188%29.png/184px-Ice_Lance%28188%29.png?version=135d0baa1f9e1a496efc0324bcd21834'),
(399, 'Upgrade!', 2, 'Rare', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/ea/Upgrade%21%28638%29.png/184px-Upgrade%21%28638%29.png?version=68d0efb97b2e24d79cf9efa00513ec30'),
(400, 'Upgraded Repair Bot', 1, 'Rare', 'Minion', 'Mech', 5, 5, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/b/bf/Upgraded_Repair_Bot.png/184px-Upgraded_Repair_Bot.png?version=5f4353094a6828b379c0d1ef194213b7'),
(401, 'Vaporize', 3, 'Rare', 'Spell', NULL, 3, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/1/13/Vaporize%28160%29.png/184px-Vaporize%28160%29.png?version=0fa31829b5125e94c29182d36438df10'),
(402, 'Inner Fire', 1, 'Common', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/4/46/Inner_Fire%28207%29.png/184px-Inner_Fire%28207%29.png?version=d6eb8c85ec5f7bd614007c5704d42e3a'),
(403, 'Inner Rage', 2, 'Common', 'Spell', NULL, 0, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/2/21/Inner_Rage%28366%29.png/184px-Inner_Rage%28366%29.png?version=696a9cd9bbe27d92871a174a69840d93'),
(404, 'Ironbark Protector', 5, 'Common', 'Minion', NULL, 8, 8, 8, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/6/63/Ironbark_Protector%28238%29.png/184px-Ironbark_Protector%28238%29.png?version=7f973e6056c6dddbe04dfb76b674d3a1'),
(405, 'Violet Teacher', NULL, 'Rare', 'Minion', NULL, 4, 3, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/5/5c/Violet_Teacher%28523%29.png/184px-Violet_Teacher%28523%29.png?version=2b7646cf23a0ac8f1ec8fec62305fd03'),
(406, 'Ironbeak Owl', NULL, 'Common', 'Minion', 'Beast', 2, 2, 1, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/6/68/Ironbeak_Owl%28500%29.png/184px-Ironbeak_Owl%28500%29.png?version=bbfa4c6e7ac99155f90ab7c673a36e23'),
(407, 'Ironforge Rifleman', NULL, 'Common', 'Minion', NULL, 3, 2, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/e9/Ironforge_Rifleman%2841%29.png/184px-Ironforge_Rifleman%2841%29.png?version=3aeae99fa9f8b88c25539c8017cc803c'),
(408, 'Void Terror', 6, 'Rare', 'Minion', 'Demon', 3, 3, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/9d/Void_Terror%28119%29.png/184px-Void_Terror%28119%29.png?version=4b80cca18481050882054a4b16a8b587'),
(409, 'Wailing Soul', NULL, 'Rare', 'Minion', NULL, 4, 3, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/5/5c/Wailing_Soul.png/184px-Wailing_Soul.png?version=0a90af2e6e99c7c2b50d2599fc4ff2b2'),
(410, 'Wild Pyromancer', NULL, 'Rare', 'Minion', NULL, 2, 3, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/f0/Wild_Pyromancer%2825%29.png/184px-Wild_Pyromancer%2825%29.png?version=fabb1683541534709fd35f79ce127483'),
(411, 'Ironfur Grizzly', NULL, 'Common', 'Minion', 'Beast', 3, 3, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/a/ad/Ironfur_Grizzly%28519%29.png/184px-Ironfur_Grizzly%28519%29.png?version=2eba27a7294dd3138584cbe00578bdcd'),
(412, 'Young Priestess', NULL, 'Rare', 'Minion', NULL, 1, 2, 1, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/6/63/Young_Priestess%28123%29.png/184px-Young_Priestess%28123%29.png?version=cb50cdd49663ee654e1491423b6934c1'),
(413, 'Jungle Panther', NULL, 'Common', 'Minion', 'Beast', 3, 4, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/5/5d/Jungle_Panther%28392%29.png/184px-Jungle_Panther%28392%29.png?version=a0a70c29bbd0d5e1797d807afbe9336a'),
(414, 'Kill Command', 7, 'Common', 'Spell', NULL, 3, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/0/0c/Kill_Command%28488%29.png/184px-Kill_Command%28488%29.png?version=8636a9ffe9043d48ee1efcc5952932dd'),
(415, 'Kobold Geomancer', NULL, 'Common', 'Minion', NULL, 2, 2, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/ca/Kobold_Geomancer%28479%29.png/184px-Kobold_Geomancer%28479%29.png?version=3a5f317e49a642ca30666840f4e65984'),
(416, 'Kor''kron Elite', 2, 'Common', 'Minion', NULL, 4, 4, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/c7/Kor%27kron_Elite%28130%29.png/184px-Kor%27kron_Elite%28130%29.png?version=e3b992043e64d9bd4381b225eff5da81'),
(417, 'Leper Gnome', NULL, 'Common', 'Minion', NULL, 1, 2, 1, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/1/1d/Leper_Gnome%28513%29.png/184px-Leper_Gnome%28513%29.png?version=96b9e413674de566271f6649242bb0d3'),
(418, 'Lightning Bolt', 9, 'Common', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/ee/Lightning_Bolt%2810%29.png/184px-Lightning_Bolt%2810%29.png?version=291727db27014830f0d3ac3c824304a9'),
(419, 'Lightspawn', 1, 'Common', 'Minion', NULL, 4, 0, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/c3/Lightspawn%28192%29.png/184px-Lightspawn%28192%29.png?version=77b22aa5f4172da93e2bc2faf7543016'),
(420, 'Loot Hoarder', NULL, 'Common', 'Minion', NULL, 2, 2, 1, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/a/a4/Loot_Hoarder%28395%29.png/184px-Loot_Hoarder%28395%29.png?version=9d8d1a013816345d89b31aa7587fc159'),
(421, 'Lord of the Arena', NULL, 'Common', 'Minion', NULL, 6, 6, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/0/0a/Lord_of_the_Arena%28414%29.png/184px-Lord_of_the_Arena%28414%29.png?version=7cb4db697ec5243c3839b0031f0e992c'),
(422, 'Lost Tallstrider', NULL, 'Common', 'Minion', 'Beast', 4, 5, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/82/Lost_Tallstrider.png/184px-Lost_Tallstrider.png?version=567b42bc059f160e9e434749b1519de2'),
(423, 'Mad Bomber', NULL, 'Common', 'Minion', NULL, 2, 3, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/87/Mad_Bomber%2880%29.png/184px-Mad_Bomber%2880%29.png?version=61599d2c43ab8342743ac994f51af4db'),
(424, 'Mad Scientist', NULL, 'Common', 'Minion', NULL, 2, 2, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/1/1a/Mad_Scientist.png/184px-Mad_Scientist.png?version=b4ca6852752f83c75a9062be15709124'),
(425, 'Mana Wyrm', 3, 'Common', 'Minion', NULL, 1, 1, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/6/6f/Mana_Wyrm%28263%29.png/184px-Mana_Wyrm%28263%29.png?version=0bbbb848504cc9d6b433b0eaae266907'),
(426, 'Mark of Nature', 5, 'Common', 'Spell', NULL, 3, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/5/53/Mark_of_Nature%28149%29.png/184px-Mark_of_Nature%28149%29.png?version=7e47f856fdaddcbe5ab6f0fb99bd624e'),
(427, 'Mechanical Yeti', NULL, 'Common', 'Minion', 'Mech', 4, 4, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/5/5e/Mechanical_Yeti.png/184px-Mechanical_Yeti.png?version=53a59cf9d2c8f52cd706a29ea5962855'),
(428, 'Mechwarper', NULL, 'Common', 'Minion', 'Mech', 2, 2, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/5/55/Mechwarper.png/184px-Mechwarper.png?version=0ec582b35b3e654a2cbb7dd42ec84028'),
(429, 'Micro Machine', NULL, 'Common', 'Minion', 'Mech', 2, 1, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/9a/Micro_Machine.png/184px-Micro_Machine.png?version=82a1b1773406096f44b03437324e3bb8'),
(430, 'Mind Control', 1, 'Common', 'Spell', NULL, 10, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/6/67/Mind_Control%28401%29.png/184px-Mind_Control%28401%29.png?version=a49c777e57ddffbb34b01c20859f7a54'),
(431, 'Mind Vision', 1, 'Common', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/db/Mind_Vision%28438%29.png/184px-Mind_Vision%28438%29.png?version=dc97926da3361377419a32f342c6ac74'),
(432, 'Mirror Entity', 3, 'Common', 'Spell', NULL, 3, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/0/0f/Mirror_Entity%28569%29.png/184px-Mirror_Entity%28569%29.png?version=28f80c7c312aff5642079d66c65ebcf2'),
(433, 'Mirror Image', 3, 'Common', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/e5/Mirror_Image%2830%29.png/184px-Mirror_Image%2830%29.png?version=d8085c26e5e06899f9bb69f1dbede3c6'),
(434, 'Mogu''shan Warden', NULL, 'Common', 'Minion', NULL, 4, 1, 7, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/c1/Mogu%27shan_Warden%28346%29.png/184px-Mogu%27shan_Warden%28346%29.png?version=33fc958405e3f661ffd64bbe44dd0a39'),
(435, 'Moonfire', 5, 'Common', 'Spell', NULL, 0, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/6/62/Moonfire%28619%29.png/184px-Moonfire%28619%29.png?version=b048bc64abd283a070fadd8e00ad78c3'),
(436, 'Mortal Coil', 6, 'Common', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/a/a8/Mortal_Coil%2843%29.png/184px-Mortal_Coil%2843%29.png?version=729dd6ded003db0196771a55f95b8a38'),
(437, 'Murloc Tidehunter', NULL, 'Common', 'Minion', 'Murloc', 2, 2, 1, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/ca/Murloc_Tidehunter%28357%29.png/184px-Murloc_Tidehunter%28357%29.png?version=361361a311381fac0518de7046549abd');
INSERT INTO `card` (`id`, `name`, `hero`, `rarity`, `type`, `subtype`, `cost`, `attack`, `hp`, `picture`) VALUES
(438, 'Naturalize', 5, 'Common', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/4/47/Naturalize%28154%29.png/184px-Naturalize%28154%29.png?version=ead3c45abd0a63bbc3b0ab6f80106b4f'),
(439, 'Nerub''ar Weblord', NULL, 'Common', 'Minion', NULL, 2, 1, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/2/26/Nerub%27ar_Weblord.png/184px-Nerub%27ar_Weblord.png?version=102b4086e27564aef003a55409f5f1c6'),
(440, 'Noble Sacrifice', 8, 'Common', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/f2/Noble_Sacrifice%28158%29.png/184px-Noble_Sacrifice%28158%29.png?version=5d845fd0778eb49e12ce5fb08d3ba8b1'),
(441, 'Ogre Brute', NULL, 'Common', 'Minion', NULL, 3, 4, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/7/75/Ogre_Brute.png/184px-Ogre_Brute.png?version=69d13f4d98b3b64045d262798464eb00'),
(442, 'Ogre Magi', NULL, 'Common', 'Minion', NULL, 4, 4, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/7/73/Ogre_Magi%28659%29.png/184px-Ogre_Magi%28659%29.png?version=c3e5d104bccb4c99a94b616156c2b6a9'),
(443, 'Ogre Warmaul', 2, 'Common', 'Weapon', NULL, 3, 4, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/5/5c/Ogre_Warmaul.png/184px-Ogre_Warmaul.png?version=4b2ffdc53f7daa5d7005c5a209537303'),
(444, 'Piloted Shredder', NULL, 'Common', 'Minion', 'Mech', 4, 4, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/ee/Piloted_Shredder.png/184px-Piloted_Shredder.png?version=fe369ce6134dcfa966e5a54c256171bc'),
(445, 'Poison Seeds', 5, 'Common', 'Spell', NULL, 4, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/a/ac/Poison_Seeds.png/184px-Poison_Seeds.png?version=1c5eec6578cb3c29fe9d426a7bc62385'),
(446, 'Power Overwhelming', 6, 'Common', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/4/49/Power_Overwhelming%28170%29.png/184px-Power_Overwhelming%28170%29.png?version=f5ecd6611d34f66e210d4425a33963cc'),
(447, 'Power of the Wild', 5, 'Common', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/8e/Power_of_the_Wild%28165%29.png/184px-Power_of_the_Wild%28165%29.png?version=7c04ce34fca1945af7c1770f07d41cbe'),
(448, 'Priestess of Elune', NULL, 'Common', 'Minion', NULL, 6, 5, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/e7/Priestess_of_Elune%28138%29.png/184px-Priestess_of_Elune%28138%29.png?version=06382b75bb9150a86c888ac545407c78'),
(449, 'Puddlestomper', NULL, 'Common', 'Minion', 'Murloc', 2, 3, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/b/bf/Puddlestomper.png/184px-Puddlestomper.png?version=6bfeeda4780c5c0eafce1f5c2abfbf78'),
(450, 'Raging Worgen', NULL, 'Common', 'Minion', NULL, 3, 3, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/fb/Raging_Worgen%2895%29.png/184px-Raging_Worgen%2895%29.png?version=5ff6d875575e2d72d3ba01a68265d4bc'),
(451, 'Rampage', 2, 'Common', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/2/2c/Rampage%28454%29.png/184px-Rampage%28454%29.png?version=7658f769a31e61198b174ae834e1df6a'),
(452, 'Razorfen Hunter', NULL, 'Common', 'Minion', NULL, 3, 2, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/a/a6/Razorfen_Hunter%2847%29.png/184px-Razorfen_Hunter%2847%29.png?version=25a260c57ad746ea121cc629411384a5'),
(453, 'Redemption', 8, 'Common', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/5/5c/Redemption%28657%29.png/184px-Redemption%28657%29.png?version=81f2d946ca5d0620117e620b5c216635'),
(454, 'Reincarnate', 9, 'Common', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/f6/Reincarnate.png/184px-Reincarnate.png?version=e2c6ca4f95c6eb7a21c4fed28beecc40'),
(455, 'Repentance', 8, 'Common', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/7/7e/Repentance%28642%29.png/184px-Repentance%28642%29.png?version=b607be8e42f03c8216ed8605eb05faaf'),
(456, 'Sacrificial Pact', 6, 'Common', 'Spell', NULL, 0, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/7/74/Sacrificial_Pact%28348%29.png/184px-Sacrificial_Pact%28348%29.png?version=9b331f6f0bacf9a815c77ed5c05e7ed8'),
(457, 'Salty Dog', NULL, 'Common', 'Minion', 'Pirate', 5, 7, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/2/26/Salty_Dog.png/184px-Salty_Dog.png?version=f7c30f56ac1070e32b2e6a84ffbba18e'),
(458, 'Savage Roar', 5, 'Common', 'Spell', NULL, 3, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/0/0a/Savage_Roar%28329%29.png/184px-Savage_Roar%28329%29.png?version=ab7b9c6977793f7de1ee0a3c01d04812'),
(459, 'Scarlet Crusader', NULL, 'Common', 'Minion', NULL, 3, 3, 1, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/6/67/Scarlet_Crusader%28475%29.png/184px-Scarlet_Crusader%28475%29.png?version=15276101b4c6a398112421d01b09f58a'),
(460, 'Scavenging Hyena', 7, 'Common', 'Minion', 'Beast', 2, 2, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/3/35/Scavenging_Hyena%28279%29.png/184px-Scavenging_Hyena%28279%29.png?version=9e18014614018e892a6d511eeb5cc106'),
(461, 'Seal of Light', 8, 'Common', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/92/Seal_of_Light.png/184px-Seal_of_Light.png?version=ef012bf9ca1e18a79830ec1016f40e16'),
(462, 'Sense Demons', 6, 'Common', 'Spell', NULL, 3, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/7/73/Sense_Demons%28327%29.png/184px-Sense_Demons%28327%29.png?version=521506d37adfffa0851d0c4c6cbf747f'),
(463, 'Shadow Word: Death', 1, 'Common', 'Spell', NULL, 3, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/ca/Shadow_Word-_Death%28547%29.png/184px-Shadow_Word-_Death%28547%29.png?version=83d79d11b7d54fe539fee21cb35f7355'),
(464, 'Shadowstep', 4, 'Common', 'Spell', NULL, 0, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/3/35/Shadowstep%28550%29.png/184px-Shadowstep%28550%29.png?version=335cfb6465d0989a01aa835d38ee6701'),
(465, 'Shattered Sun Cleric', NULL, 'Common', 'Minion', NULL, 3, 3, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/4/46/Shattered_Sun_Cleric%28434%29.png/184px-Shattered_Sun_Cleric%28434%29.png?version=a8098611e4da22c34bfcb9f81009d501'),
(466, 'Shield Block', 2, 'Common', 'Spell', NULL, 3, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/2/20/Shield_Block%28493%29.png/184px-Shield_Block%28493%29.png?version=9fdd7b189fa34f57002065d6de1cbd0f'),
(467, 'Shieldbearer', NULL, 'Common', 'Minion', NULL, 1, 0, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/0/06/Shieldbearer%2824%29.png/184px-Shieldbearer%2824%29.png?version=fd0403c468da54b2cde46f8bdd56b5a6'),
(468, 'Shielded Minibot', 8, 'Common', 'Minion', 'Mech', 2, 2, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/f7/Shielded_Minibot.png/184px-Shielded_Minibot.png?version=316186ca1682d3e59d04b0b76df535a5'),
(469, 'Ship''s Cannon', NULL, 'Common', 'Minion', NULL, 2, 2, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/f8/Ship%27s_Cannon.png/184px-Ship%27s_Cannon.png?version=0f8d257edc411445f137449c2ac09ffb'),
(470, 'Shiv', 4, 'Common', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/e9/Shiv%28164%29.png/184px-Shiv%28164%29.png?version=36884b32651a669f23bcfa79fb0d7eb1'),
(471, 'Shrinkmeister', 1, 'Common', 'Minion', NULL, 2, 3, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/6/6d/Shrinkmeister.png/184px-Shrinkmeister.png?version=665482fbcb3967097036bcccc9021551'),
(472, 'Silence', 1, 'Common', 'Spell', NULL, 0, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/a/af/Silence%28544%29.png/184px-Silence%28544%29.png?version=aa4af9944982b2b9d82b793925f76bf3'),
(473, 'Silver Hand Knight', NULL, 'Common', 'Minion', NULL, 5, 4, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/da/Silver_Hand_Knight%28648%29.png/184px-Silver_Hand_Knight%28648%29.png?version=01670acb08b1b911fa009d178719e4c8'),
(474, 'Silverback Patriarch', NULL, 'Common', 'Minion', 'Beast', 3, 1, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/e2/Silverback_Patriarch%28611%29.png/184px-Silverback_Patriarch%28611%29.png?version=ee3e18ca19f05be78d8f65c59153be00'),
(475, 'Silvermoon Guardian', NULL, 'Common', 'Minion', NULL, 4, 3, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/84/Silvermoon_Guardian%28634%29.png/184px-Silvermoon_Guardian%28634%29.png?version=e091c4163f1b203e4c17eb46a8182607'),
(476, 'Slam', 2, 'Common', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/b/bb/Slam%28215%29.png/184px-Slam%28215%29.png?version=d22d8c497e2d95d4918ee0d479c3be9c'),
(477, 'Snipe', 7, 'Common', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/81/Snipe%28553%29.png/184px-Snipe%28553%29.png?version=b9d594ce319641ecf15be315a759e35a'),
(478, 'Snowchugger', 3, 'Common', 'Minion', 'Mech', 2, 2, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/99/Snowchugger.png/184px-Snowchugger.png?version=c8d8e4988da3810aa1b232f8aab07b09'),
(479, 'Sorcerer''s Apprentice', 3, 'Common', 'Minion', NULL, 2, 3, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/8b/Sorcerer%27s_Apprentice%284%29.png/184px-Sorcerer%27s_Apprentice%284%29.png?version=f3f5ef7dfce460bb73553b0a0e6868a3'),
(480, 'Soul of the Forest', 5, 'Common', 'Spell', NULL, 4, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/f0/Soul_of_the_Forest%28311%29.png/184px-Soul_of_the_Forest%28311%29.png?version=0462f5903717a90947a894465058941d'),
(481, 'Soulfire', 6, 'Common', 'Spell', NULL, 0, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/1/1b/Soulfire%28529%29.png/184px-Soulfire%28529%29.png?version=c99bb8dfbe7d8f9a376f8bd7f6b0ab39'),
(482, 'Southsea Deckhand', NULL, 'Common', 'Minion', 'Pirate', 1, 2, 1, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/b/bd/Southsea_Deckhand%28103%29.png/184px-Southsea_Deckhand%28103%29.png?version=552f901b3871d0db0fb4b94508fb5439'),
(483, 'Spectral Knight', NULL, 'Common', 'Minion', NULL, 5, 4, 6, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/a/a9/Spectral_Knight.png/184px-Spectral_Knight.png?version=9afb9e0ba7e5f7454b17535e22132ca6'),
(484, 'Spellbreaker', NULL, 'Common', 'Minion', NULL, 4, 4, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/86/Spellbreaker%2842%29.png/184px-Spellbreaker%2842%29.png?version=308edfb5c17276e01bc78e509ae936fe'),
(485, 'Spider Tank', NULL, 'Common', 'Minion', 'Mech', 3, 3, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/b/b2/Spider_Tank.png/184px-Spider_Tank.png?version=31f2fdeb389eff4f9288a960621c6b12'),
(486, 'Spiteful Smith', NULL, 'Common', 'Minion', NULL, 5, 4, 6, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/e1/Spiteful_Smith%28627%29.png/184px-Spiteful_Smith%28627%29.png?version=72f6b3c6fa4ac87735cd9495e51866ae'),
(487, 'Sprint', 4, 'Common', 'Spell', NULL, 7, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/d2/Sprint%2890%29.png/184px-Sprint%2890%29.png?version=05a8be115019f41c20d407e1f680b66f'),
(488, 'Starfire', 5, 'Common', 'Spell', NULL, 6, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/98/Starfire%28667%29.png/184px-Starfire%28667%29.png?version=08968640d1135699c09b09fcf0e5e69b'),
(489, 'Starving Buzzard', 7, 'Common', 'Minion', 'Beast', 5, 3, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/6/6d/Starving_Buzzard%28101%29.png/184px-Starving_Buzzard%28101%29.png?version=b26eb06a030b86fb98788ed8d375a334'),
(490, 'Stoneskin Gargoyle', NULL, 'Common', 'Minion', NULL, 3, 1, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/3/31/Stoneskin_Gargoyle.png/184px-Stoneskin_Gargoyle.png?version=0636802bcbb0e91c1075828a76b361ec'),
(491, 'Stonesplinter Trogg', NULL, 'Common', 'Minion', NULL, 2, 2, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/83/Stonesplinter_Trogg.png/184px-Stonesplinter_Trogg.png?version=0264c80fa5c971bf478760e583c61e0a'),
(492, 'Stormforged Axe', 9, 'Common', 'Weapon', NULL, 2, 2, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/4/47/Stormforged_Axe%28152%29.png/184px-Stormforged_Axe%28152%29.png?version=c3fa2f364c3cc0710f9c484c30f3b32d'),
(493, 'Stormpike Commando', NULL, 'Common', 'Minion', NULL, 5, 4, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/b/b7/Stormpike_Commando%28325%29.png/184px-Stormpike_Commando%28325%29.png?version=d2841b99210b9f64966905c4ee9019be'),
(494, 'Stormwind Champion', NULL, 'Common', 'Minion', NULL, 7, 6, 6, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/2/27/Stormwind_Champion%28310%29.png/184px-Stormwind_Champion%28310%29.png?version=772efb3e03b99714c6ecf9d9e830adea'),
(495, 'Stormwind Knight', NULL, 'Common', 'Minion', NULL, 4, 2, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/f0/Stormwind_Knight%28603%29.png/184px-Stormwind_Knight%28603%29.png?version=b733e8165aaa0fa2df069c1ae3b774e8'),
(496, 'Stranglethorn Tiger', NULL, 'Common', 'Minion', 'Beast', 5, 5, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/96/Stranglethorn_Tiger%28338%29.png/184px-Stranglethorn_Tiger%28338%29.png?version=597cd54ba63757b8ae14202dfc720de9'),
(497, 'Summoning Portal', 6, 'Common', 'Minion', NULL, 4, 0, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/7/7b/Summoning_Portal%28566%29.png/184px-Summoning_Portal%28566%29.png?version=fd627c2d758e240f1c09db507a335242'),
(498, 'Swipe', 5, 'Common', 'Spell', NULL, 4, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/91/Swipe%28620%29.png/184px-Swipe%28620%29.png?version=034e7723ae981638e20ec450e1ffd554'),
(499, 'Tauren Warrior', NULL, 'Common', 'Minion', NULL, 3, 2, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/2/2b/Tauren_Warrior%28477%29.png/184px-Tauren_Warrior%28477%29.png?version=a2b95f2565105ec2405392bbb68d07ba'),
(500, 'Temple Enforcer', 1, 'Common', 'Minion', NULL, 6, 6, 6, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/a/aa/Temple_Enforcer%28232%29.png/184px-Temple_Enforcer%28232%29.png?version=c2020ea71f0f1a4d3f4cc2bd8c40b802'),
(501, 'Thoughtsteal', 1, 'Common', 'Spell', NULL, 3, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/c0/Thoughtsteal%2862%29.png/184px-Thoughtsteal%2862%29.png?version=5fccd9693ba98ad50ef0109ef9daa2cf'),
(502, 'Thrallmar Farseer', NULL, 'Common', 'Minion', NULL, 3, 2, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/1/18/Thrallmar_Farseer%28265%29.png/184px-Thrallmar_Farseer%28265%29.png?version=d9990cfc87eae0588b0c40a803801612'),
(503, 'Tinker''s Sharpsword Oil', 4, 'Common', 'Spell', NULL, 4, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/b/b7/Tinker%27s_Sharpsword_Oil.png/184px-Tinker%27s_Sharpsword_Oil.png?version=1578b3c6025f9fb5e3a76b75a1ec7abe'),
(504, 'Tinkertown Technician', NULL, 'Common', 'Minion', NULL, 3, 3, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/e8/Tinkertown_Technician.png/184px-Tinkertown_Technician.png?version=9c57abb14a2823b61605f014f755adf5'),
(505, 'Totemic Might', 9, 'Common', 'Spell', NULL, 0, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/9a/Totemic_Might%28367%29.png/184px-Totemic_Might%28367%29.png?version=21fc0c34556680b56e6f4b50ef051fb7'),
(506, 'Truesilver Champion', 8, 'Common', 'Weapon', NULL, 4, 4, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/fd/Truesilver_Champion%28293%29.png/184px-Truesilver_Champion%28293%29.png?version=49ef6f54b0dcc3d7f7dbd70bbb73bc27'),
(507, 'Tundra Rhino', 7, 'Common', 'Minion', 'Beast', 5, 2, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/1/15/Tundra_Rhino%28162%29.png/184px-Tundra_Rhino%28162%29.png?version=072bca41aa20be193a42e153526440a6'),
(508, 'Unbound Elemental', 9, 'Common', 'Minion', NULL, 3, 2, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/1/1f/Unbound_Elemental%2851%29.png/184px-Unbound_Elemental%2851%29.png?version=bef5c8d0e2a9656e5efa213449be5aba'),
(509, 'Undertaker', NULL, 'Common', 'Minion', NULL, 1, 1, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/c7/Undertaker.png/184px-Undertaker.png?version=507abffc0256b1208bff26a49e582064'),
(510, 'Unleash the Hounds', 7, 'Common', 'Spell', NULL, 3, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/e/e0/Unleash_the_Hounds%28317%29.png/184px-Unleash_the_Hounds%28317%29.png?version=ecb76713d0812145860f85871ea3e456'),
(511, 'Unstable Ghoul', NULL, 'Common', 'Minion', NULL, 2, 1, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/9a/Unstable_Ghoul.png/184px-Unstable_Ghoul.png?version=f9ff71e2b4cbfe3d087f37263a7a385b'),
(512, 'Vanish', 4, 'Common', 'Spell', NULL, 6, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/3/33/Vanish%28658%29.png/184px-Vanish%28658%29.png?version=2dfdbfb9a6ec9e8cc9d9a6d53c0f71cf'),
(513, 'Velen''s Chosen', 1, 'Common', 'Spell', NULL, 3, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/82/Velen%27s_Chosen.png/184px-Velen%27s_Chosen.png?version=8bcc7718c15ba60fd82660adf41370e3'),
(514, 'Venture Co. Mercenary', NULL, 'Common', 'Minion', NULL, 5, 7, 6, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/a/af/Venture_Co._Mercenary%28509%29.png/184px-Venture_Co._Mercenary%28509%29.png?version=e72e867443f3ba8d97ceb8b506d4eb54'),
(515, 'Vitality Totem', 9, 'Common', 'Minion', 'Totem', 2, 0, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/b/b2/Vitality_Totem.png/184px-Vitality_Totem.png?version=41a40c0bfe21e60d190b1b2f88fa9531'),
(516, 'Voidcaller', 6, 'Common', 'Minion', 'Demon', 4, 3, 4, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/9d/Voidcaller.png/184px-Voidcaller.png?version=b9c4e823dc135bb65f2d740a3cff432d'),
(517, 'War Golem', NULL, 'Common', 'Minion', NULL, 7, 7, 7, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/7/71/War_Golem%28323%29.png/184px-War_Golem%28323%29.png?version=b7333b6d0965382e9e05d36a244d2d3c'),
(518, 'Warbot', 2, 'Common', 'Minion', 'Mech', 1, 1, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/5/59/Warbot.png/184px-Warbot.png?version=95205a5e1cb506f54c2bb62aac4cc116'),
(519, 'Water Elemental', 3, 'Common', 'Minion', NULL, 4, 3, 6, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/8/84/Water_Elemental%28274%29.png/184px-Water_Elemental%28274%29.png?version=91774795702cc70b47140e3d20bb249f'),
(520, 'Webspinner', 7, 'Common', 'Minion', 'Beast', 1, 1, 1, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/cb/Webspinner.png/184px-Webspinner.png?version=ef46efe4998a6b44d002a4bd9df4e5ea'),
(521, 'Whirling Zap-o-matic', 9, 'Common', 'Minion', 'Mech', 2, 3, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/c/ca/Whirling_Zap-o-matic.png/184px-Whirling_Zap-o-matic.png?version=c4da5f082d341426b9449a6527aca568'),
(522, 'Whirlwind', 2, 'Common', 'Spell', NULL, 1, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/0/01/Whirlwind%28161%29.png/184px-Whirlwind%28161%29.png?version=45d8fc3ba09b2e7e60d96cd061f279e4'),
(523, 'Windfury Harpy', NULL, 'Common', 'Minion', NULL, 6, 4, 5, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/3/3f/Windfury_Harpy%28675%29.png/184px-Windfury_Harpy%28675%29.png?version=d4a65b6fc246656d2d2f6d338e57ae5e'),
(524, 'Windspeaker', 9, 'Common', 'Minion', NULL, 4, 3, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/f4/Windspeaker%28151%29.png/184px-Windspeaker%28151%29.png?version=3ad6aaea1395b16de2347b635c95a4be'),
(525, 'Wisp', NULL, 'Common', 'Minion', NULL, 0, 1, 1, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/6/67/Wisp%28273%29.png/184px-Wisp%28273%29.png?version=6a26299a11f595b155140def7769972f'),
(526, 'Worgen Infiltrator', NULL, 'Common', 'Minion', NULL, 1, 2, 1, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/f/f2/Worgen_Infiltrator%28112%29.png/184px-Worgen_Infiltrator%28112%29.png?version=6ea4caaddb43f5288a4367433bc52c35'),
(527, 'Wrath', 5, 'Common', 'Spell', NULL, 2, 0, 0, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/9/9b/Wrath%28633%29.png/184px-Wrath%28633%29.png?version=d8641663a68a53b327739e52a250a78f'),
(528, 'Young Dragonhawk', NULL, 'Common', 'Minion', 'Beast', 1, 1, 1, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/b/b4/Young_Dragonhawk%28629%29.png/184px-Young_Dragonhawk%28629%29.png?version=752ff43298d4db94f641a6e45bf2e777'),
(529, 'Youthful Brewmaster', NULL, 'Common', 'Minion', NULL, 2, 3, 2, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/d/df/Youthful_Brewmaster%28247%29.png/184px-Youthful_Brewmaster%28247%29.png?version=a5c25d919ee3355ffe7c9faa1808fc40'),
(530, 'Zombie Chow', NULL, 'Common', 'Minion', NULL, 1, 2, 3, 'http://hydra-media.cursecdn.com/hearthstone.gamepedia.com/thumb/3/32/Zombie_Chow.png/184px-Zombie_Chow.png?version=7355431568cb43e18addcc8c22a6a749');

-- --------------------------------------------------------

--
-- Table structure for table `cardindeck`
--

DROP TABLE IF EXISTS `cardindeck`;
CREATE TABLE IF NOT EXISTS `cardindeck` (
  `player` int(11) NOT NULL,
  `deck` int(11) DEFAULT NULL,
  `card` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cardindeck`
--

INSERT INTO `cardindeck` (`player`, `deck`, `card`) VALUES
(22, 2, 256),
(22, 2, 256),
(22, 1, 285),
(22, 1, 138);

-- --------------------------------------------------------

--
-- Table structure for table `db_version`
--

DROP TABLE IF EXISTS `db_version`;
CREATE TABLE IF NOT EXISTS `db_version` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `db_version`
--

INSERT INTO `db_version` (`id`, `version`) VALUES
(1, 1);

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
  KEY `hero_idx` (`hero`),
  KEY `player_idx` (`player`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deck`
--

INSERT INTO `deck` (`id`, `name`, `hero`, `player`, `number_of_wins`, `number_of_losses`) VALUES
(1, 'ttt', 1, 22, 0, 0),
(2, 'bbb', 4, 22, 0, 0),
(3, 'heh', 2, 22, 0, 0),
(1, 'gegege', 5, 24, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `hero`
--

DROP TABLE IF EXISTS `hero`;
CREATE TABLE IF NOT EXISTS `hero` (
  `id` int(11) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
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
  `username` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `level` int(11) DEFAULT '1',
  `password` varchar(45) NOT NULL,
  `number_of_wins` int(11) DEFAULT '0',
  `number_of_losses` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `id_2` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`id`, `username`, `email`, `level`, `password`, `number_of_wins`, `number_of_losses`) VALUES
(22, 'Kenan', 'nanekinovic@gmail.com', 4, 'kenan', 153, 104),
(23, 'Berina', 'bmuratovic1@gmail.com', 2, 'berina', 72, 43),
(24, 'Lejla', 'lejlaa.fazlagic@gmail.com', 1, 'lejla', 23, 86);

--
-- Triggers `player`
--
DROP TRIGGER IF EXISTS `level_up`;
DELIMITER //
CREATE TRIGGER `level_up` BEFORE UPDATE ON `player`
 FOR EACH ROW set new.level = floor(new.number_of_wins / 50) + 1
//
DELIMITER ;
DROP TRIGGER IF EXISTS `new_player`;
DELIMITER //
CREATE TRIGGER `new_player` BEFORE INSERT ON `player`
 FOR EACH ROW set new.number_of_wins = 0, new.number_of_losses = 0, new.level = 1
//
DELIMITER ;

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
-- Constraints for table `deck`
--
ALTER TABLE `deck`
  ADD CONSTRAINT `deck_hero` FOREIGN KEY (`hero`) REFERENCES `hero` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `deck_player` FOREIGN KEY (`player`) REFERENCES `player` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
