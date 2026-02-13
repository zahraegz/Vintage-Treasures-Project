-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 08 fév. 2026 à 15:48
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `db_vintages`
--

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE `commandes` (
  `id` int(11) NOT NULL,
  `acheteur_id` int(11) DEFAULT NULL,
  `montant_total` decimal(10,2) DEFAULT NULL,
  `date_commande` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commandes`
--

INSERT INTO `commandes` (`id`, `acheteur_id`, `montant_total`, `date_commande`) VALUES
(1, 2, 170.00, '2026-02-08 15:21:18');

-- --------------------------------------------------------

--
-- Structure de la table `details_commande`
--

CREATE TABLE `details_commande` (
  `id` int(11) NOT NULL,
  `commande_id` int(11) DEFAULT NULL,
  `produit_id` int(11) DEFAULT NULL,
  `quantité` int(11) DEFAULT NULL,
  `prix_unitaire` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `details_commande`
--

INSERT INTO `details_commande` (`id`, `commande_id`, `produit_id`, `quantité`, `prix_unitaire`) VALUES
(1, 1, 2, 1, 170.00);

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

CREATE TABLE `panier` (
  `id` int(11) NOT NULL,
  `utilisateur_id` int(11) DEFAULT NULL,
  `produit_id` int(11) DEFAULT NULL,
  `quantité` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE `produits` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `prix` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `vendeur_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`id`, `nom`, `description`, `prix`, `image`, `vendeur_id`) VALUES
(2, 'FIREBIRD TRACK TOP', 'midium size - the ADICOLOR CLASSICS TOP\r\n', 170.00, 'the ADICOLOR CLASSICS FIREBIRD TRACK TOP.jpeg', 1),
(7, ' McBee top', 'small-size-a cute top ', 120.00, '@_butterlys_cub on Instagram ????.jpeg', 1);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `role` enum('vendeur','acheteur') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `nom`, `email`, `mot_de_passe`, `role`) VALUES
(1, 'Fatima Zahrae', 'fatimazohra@vintage.com', '$2y$10$8fM.H8A4p.XvG7uB3L2TGeB.tV.uQ3X8Y5k.K5W2.Z1.Y1.Y1.Y1.', 'vendeur'),
(2, 'Client Test', 'client@test.com', '$2y$10$8fM.H8A4p.XvG7uB3L2TGeB.tV.uQ3X8Y5k.K5W2.Z1.Y1.Y1.Y1.', 'acheteur'),
(3, 'fatimazahra', 'fatimazohraelguezary@gmail.com', '$2y$10$M92r/uJWJ2hoj5q7WgkQGe00s7HyJtbKlL09mHmtKAMO3L3VvG8pa', 'acheteur'),
(5, 'Client', 'client2@test.com', '$2y$10$Ocsgl0P8143eK9Hx.sT/puaZHjEDOANzTMc.Cvuv4SAyUoFwA1mXK', 'acheteur');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `details_commande`
--
ALTER TABLE `details_commande`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `panier`
--
ALTER TABLE `panier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `utilisateur_id` (`utilisateur_id`),
  ADD KEY `produit_id` (`produit_id`);

--
-- Index pour la table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendeur_id` (`vendeur_id`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `commandes`
--
ALTER TABLE `commandes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `details_commande`
--
ALTER TABLE `details_commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `panier`
--
ALTER TABLE `panier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `produits`
--
ALTER TABLE `produits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `panier`
--
ALTER TABLE `panier`
  ADD CONSTRAINT `panier_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `panier_ibfk_2` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `produits_ibfk_1` FOREIGN KEY (`vendeur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
