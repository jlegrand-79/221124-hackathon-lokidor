-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Jeu 26 Octobre 2017 à 13:53
-- Version du serveur :  5.7.19-0ubuntu0.16.04.1
-- Version de PHP :  7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `lokidor`
--

-- --------------------------------------------------------

DROP DATABASE IF EXISTS lokidor;
CREATE DATABASE lokidor;
USE lokidor;

CREATE TABLE destination (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  type VARCHAR(255) NOT NULL,
  distance FLOAT NOT NULL,
  min_temperature INT NOT NULL,
  max_temperature INT NOT NULL,
  image VARCHAR(255) NOT NULL
);

CREATE TABLE shuttle (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  type VARCHAR(255) NOT NULL,
  seats INT NOT NULL,
  speed FLOAT NOT NULL,
  picture VARCHAR(255) NOT NULL
);

INSERT INTO shuttle (
name,
type,
seats,
speed,
picture
)
VALUES
('SC-lightning-00','lightning',10,300000,'lightning.png'),
('SC-starship-00','starship',60,60000,'starship.png'),
('SC-cargo-00','cargo',500,20000,'cargo.png'),
('SC-lightning-01','lightning',15,350000,'lightning.png'),
('SC-starship-01','starship',70,62000,'starship.png'),
('SC-cargo-01','cargo',600,21000,'cargo.png'),
('SC-lightning-02','lightning',12,280000,'lightning.png'),
('SC-starship-02','starship',65,56000,'starship.png'),
('SC-cargo-02','cargo',550,18000,'cargo.png'),
('SC-lightning-03','lightning',18,305000,'lightning.png'),
('SC-starship-03','starship',75,61000,'starship.png'),
('SC-cargo-03','cargo',700,20200,'cargo.png'),
('SC-lightning-04','lightning',20,292500,'lightning.png'),
('SC-starship-04','starship',80,58500,'starship.png'),
('SC-cargo-04','cargo',800,19500,'cargo.png');


-- Distances à la terre
-- Lune : 384 400 km
-- Venus : MIN 40 Millions km / MAX 260 Millions km / MOY 150 000 000 km
-- Mars : MIN 56 Millions km / MAX 405 Millions km / MOY 230 500 000 km

-- On choisit de ne garder que la valeur MIN pour nos calculs de vitesse et durée

-- Note : vitesse de la lumière 300 000 m / s

-- Vittesse éclair : 300 000 km/h
-- Vitesse normale : 60 000 km/h
-- Vitesse croisière : 20 000 km/h

CREATE TABLE expedition (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  date DATE NOT NULL,
  time INT NOT NULL,
  price FLOAT NOT NULL,
  shuttle_id INT NOT NULL,
  destination_id INT NOT NULL,
  CONSTRAINT fk_expedition_shuttle
    FOREIGN KEY (shuttle_id)
    REFERENCES shuttle(id),
  CONSTRAINT fk_expedition_destination
    FOREIGN KEY (destination_id)
    REFERENCES destination(id)
);

CREATE TABLE user (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  firstname VARCHAR(255) NOT NULL,
  lastname VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  expedition_id INT NOT NULL,
  CONSTRAINT fk_user_expedition
    FOREIGN KEY (expedition_id)
    REFERENCES expedition(id)
);

INSERT INTO destination (
  `name`,
  `type`,
  distance,
  min_temperature,
  max_temperature,
  `image`
  )

VALUES
  ('Mars', 'Planète', 56, -153, 20, 'mars.png'),
  ('La Lune', 'Satellite', 0.384, -150, 150, 'moon.png'),
  ('Venus', 'Planète', 40, 446, 490, 'venus.png');