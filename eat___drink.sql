-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 02 août 2022 à 10:21
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `eat & drink`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorieproduit`
--

CREATE TABLE `categorieproduit` (
  `id_type_produit` int(11) NOT NULL,
  `nom_type_produit` varchar(50) NOT NULL,
  `description_type_produit_1` varchar(50) NOT NULL,
  `id_gestionnaire` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `nom_client` varchar(50) NOT NULL,
  `email_client` varchar(50) NOT NULL,
  `telephone` int(11) DEFAULT NULL,
  `password_client` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE `commandes` (
  `id_commande` int(11) NOT NULL,
  `date_commande` datetime NOT NULL,
  `id_client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `fairepartie`
--

CREATE TABLE `fairepartie` (
  `id_produit` int(11) NOT NULL,
  `id_commande` int(11) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `gestionnaires`
--

CREATE TABLE `gestionnaires` (
  `id_gestionnaire` int(11) NOT NULL,
  `nom_gestionnaire` varchar(50) NOT NULL,
  `prenom_gestionnaire` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id_produit` int(11) NOT NULL,
  `nom_produit` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `prix` int(11) NOT NULL,
  `chemin` varchar(50) NOT NULL,
  `actif` tinyint(1) NOT NULL,
  `id_gestionnaire` int(11) NOT NULL,
  `id_type_produit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorieproduit`
--
ALTER TABLE `categorieproduit`
  ADD PRIMARY KEY (`id_type_produit`),
  ADD KEY `id_gestionnaire` (`id_gestionnaire`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Index pour la table ``
--
ALTER TABLE `commandes`
  ADD PRIMARY KEY (`id_commande`),
  ADD KEY `id_client` (`id_client`);

--
-- Index pour la table `fairepartie`
--
ALTER TABLE `fairepartie`
  ADD PRIMARY KEY (`id_produit`,`id_commande`),
  ADD KEY `id_commande` (`id_commande`);

--
-- Index pour la table `gestionnaires`
--
ALTER TABLE `gestionnaires`
  ADD PRIMARY KEY (`id_gestionnaire`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id_produit`),
  ADD KEY `id_gestionnaire` (`id_gestionnaire`),
  ADD KEY `id_type_produit` (`id_type_produit`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `categorieproduit`
--
ALTER TABLE `categorieproduit`
  ADD CONSTRAINT `categorieproduit_ibfk_1` FOREIGN KEY (`id_gestionnaire`) REFERENCES `gestionnaires` (`id_gestionnaire`);

--
-- Contraintes pour la table `commanes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `commandes_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

--
-- Contraintes pour la table `fairepartie`
--
ALTER TABLE `fairepartie`
  ADD CONSTRAINT `fairepartie_ibfk_1` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id_produit`),
  ADD CONSTRAINT `fairepartie_ibfk_2` FOREIGN KEY (`id_commande`) REFERENCES `commandes` (`id_commande`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`id_gestionnaire`) REFERENCES `gestionnaires` (`id_gestionnaire`),
  ADD CONSTRAINT `produit_ibfk_2` FOREIGN KEY (`id_type_produit`) REFERENCES `categorieproduit` (`id_type_produit`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
