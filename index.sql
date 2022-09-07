CREATE DATABASE ecommerce;

USE ecommerce

CREATE USER 'joel'@'localhost' IDENTIFIED BY 'nacteur';

SELECT User, Host FROM mysql.user;

CREATE TABLE `clients` (
  `id_Client` int PRIMARY KEY  NOT NULL AUTO_INCREMENT,
  `nom` varchar(150) NOT NULL,
  `prenom` varchar(75) NOT NULL,
  `adresse` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
) ENGINE=Innodb DEFAULT CHARSET=utf8;


CREATE TABLE `commandes` (
  `id_Commande` int PRIMARY KEY AUTO_INCREMENT,
  `id_Client` int(9) NOT NULL,
  `date_commande` varchar(10) NOT NULL,
  INDEX par_ind (`id_Client`),
  FOREIGN KEY (`id_Client`)
  REFERENCES clients(`id_Client`)
  ON DELETE CASCADE
) ENGINE=Innodb DEFAULT CHARSET=utf8;


CREATE TABLE `marque` (
  `id_marque` int PRIMARY KEY AUTO_INCREMENT,
  `marque` varchar(25) NOT NULL,
  `logo` varchar(10) NOT NULL,
) ENGINE=Innodb DEFAULT CHARSET=utf8;


CREATE TABLE `chaussures` (
  `id_Chaussures` int PRIMARY KEY AUTO_INCREMENT,
  `marque` int(9) NOT NULL,
  `pointure` int(2) NOT NULL,
  `couleur` varchar(20) NOT NULL,
  `prix` float NOT NULL,
  `nom_chaussure` varchar(25) NOT NULL,  
  INDEX par_ind (marque),
  FOREIGN KEY (marque`)
  REFERENCES marques(marque`)
  ON DELETE CASCADE
) ENGINE=Innodb DEFAULT CHARSET=utf8;


CREATE TABLE `liste_produit` (
  `id_Commande` int PRIMARY KEY  AUTO_INCREMENT,
  `id_Chaussures` int(9) NOT NULL,
  `quantite` int(2) NOT NULL,
  INDEX par_ind (`id_Chaussures`),
  FOREIGN KEY (`id_Chaussures`)
  REFERENCES chaussures(`id_Chaussures`)
  ON DELETE CASCADE
  
) ENGINE=Innodb DEFAULT CHARSET=utf8;


INSERT INTO `marque` (`id_marque`, `marque`, `logo`) VALUES
(1, 'Nike', 'LogoNike'),
(2, 'Polo', 'LogoPolo');
(3, 'Adidas', 'LogoAdidas'),


INSERT INTO `chaussures` (`id_Chaussures`, `marque`, `pointure`, `couleur`, `prix`, `nom_chaussure`) VALUES
(1, 'Nike', 35, 'Rose', 15000, 'Nike aire'),
(2, 'Adidas', 20, 'Bleu', 30000, 'Adidas force'),
(3, 'Polo', 50, 'Noir', 45000, 'Polo news');


//Liste les marques contenues dans la table marques
SELECT * FROM marques;

//Supprime la chaussure de marque Nike
DELETE FROM chaussures WHERE id_Chaussures = 1;  

//Mise à jour du prix de la chaussure de marque Nike
UPDATE chaussures SET prix = '50000' WHERE id_Chaussures = 1;