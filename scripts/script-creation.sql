-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jul 24, 2019 at 10:50 AM
-- Server version: 5.7.25
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `mysongdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE `artist` (
  `id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`id`, `first_name`, `last_name`) VALUES
(1, 'Ed', 'Sheeran'),
(2, 'Ariana', 'Grande'),
(3, 'Sam', 'Smith'),
(4, 'Lady', 'Gaga'),
(5, 'Demi', 'Lovato');

-- --------------------------------------------------------

--
-- Table structure for table `song`
--

CREATE TABLE `song` (
  `id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `genre` varchar(45) NOT NULL,
  `price` float NOT NULL,
  `artist_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `song`
--

INSERT INTO `song` (`id`, `title`, `genre`, `price`, `artist_id`) VALUES
(1, 'Photographs', 'Latin', 10, 1),
(2, 'Perfect', 'Blues', 10, 1),
(3, 'Thank You, Next', 'Latin', 10, 2),
(4, '7 rings', 'Blues', 10, 2),
(5, 'Too Good at Goodbyes', 'Jazz', 10, 3),
(6, 'Dancing With A Stranger', 'Hip Hop', 10, 3),
(7, 'Shallow', 'Country', 10, 4),
(8, 'Poker Face', 'Pop', 10, 4),
(9, 'Sorry Not Sorry', 'Hip Hop', 10, 5),
(10, 'Sober', 'Pop', 10, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `song`
--
ALTER TABLE `song`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_artist_id` (`artist_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artist`
--
ALTER TABLE `artist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `song`
--
ALTER TABLE `song`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `song`
--
ALTER TABLE `song`
  ADD CONSTRAINT `fk_artist_id` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`);