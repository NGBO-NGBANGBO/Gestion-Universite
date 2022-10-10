-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 19 jan. 2022 à 18:38
-- Version du serveur : 10.4.21-MariaDB
-- Version de PHP : 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `enaproject`
--
CREATE DATABASE IF NOT EXISTS `enaproject` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `enaproject`;

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

CREATE TABLE `classe` (
  `Code_Classe` varchar(5) NOT NULL,
  `Annee_Universitaire` text NOT NULL,
  `Semestre` int(11) NOT NULL,
  `Niveau` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `classe`
--

INSERT INTO `classe` (`Code_Classe`, `Annee_Universitaire`, `Semestre`, `Niveau`) VALUES
('A0011', '2020/2021', 1, 'S1'),
('A0013', '2020/2021', 1, 'S3'),
('A0015', '2020/2021', 1, 'S5'),
('A0017', '2020/2021', 1, 'S7'),
('A0019', '2020/2021', 1, 'S9'),
('A0020', '2020/2021', 2, 'S10'),
('A0022', '2020/2021', 2, 'S2'),
('A0024', '2020/2021', 2, 'S4'),
('A0026', '2020/2021', 2, 'S6'),
('A0028', '2020/2021', 2, 'S8');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `id` int(11) NOT NULL,
  `CIN` text NOT NULL,
  `CNM` text NOT NULL,
  `CNE` text NOT NULL,
  `Nom` text NOT NULL,
  `Prenom` text NOT NULL,
  `Email` text NOT NULL,
  `Boursier` text NOT NULL,
  `DatedeNaissance` date NOT NULL,
  `LieudeNaissance` text NOT NULL,
  `Num_Tel` text NOT NULL,
  `DateInscription` date NOT NULL,
  `Code_Classe` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id`, `CIN`, `CNM`, `CNE`, `Nom`, `Prenom`, `Email`, `Boursier`, `DatedeNaissance`, `LieudeNaissance`, `Num_Tel`, `DateInscription`, `Code_Classe`) VALUES
(1, 'A 02510918', 'B 4729555', 'C 376793', 'Dione', 'Ousseynou', 'dioneousseynou03@gmail.com', 'Oui', '2013-09-03', 'Rabat', '+212705443903', '1970-01-01', 'A0011'),
(15, 'A 8749092', 'AEY46729', 'SUEU78939', 'Ndiaye', 'bamba', 'weuzinho96@gmail.com', 'Oui', '1998-07-06', 'Casablanca', '+21270544356', '2022-01-08', 'A0024'),
(16, 'AD7829', 'A EY46729', 'ZE3782037', 'mbengue', 'sonhai', 'sonhai@mail.com', 'Non', '1998-05-06', 'EL Jadida', '+212776443998', '2022-01-04', 'A0022'),
(17, 'DKDK300', 'A EY46729', 'C 376793', 'sarr', 'yacine', 'yacine@gmail.com', 'Non', '2022-01-01', 'EL Jadida', '+21270544323', '2022-01-29', 'A0028'),
(20, 'A 8749000', 'A BY51729', 'D ZJE0901', 'Benzia', 'yassime', 'benzia@gmail.com', 'Oui', '2022-01-15', 'Casablanca', '+21277744323', '2022-01-23', 'A0013'),
(21, 'A 000576', 'B 0009555', 'Z 0002037', 'Edan', 'Emmanuel', 'edan@gmail.com', 'Oui', '1998-01-06', 'Abidjan', '+212709453903', '2022-01-01', 'A0020'),
(22, 'D 000829', 'D  09KJ499', 'D  19KJ499', 'Chams', 'Chamsdine', 'chams@gmail.com', 'Oui', '2022-01-04', 'Niamey', '+212709448946', '2022-01-27', 'A0011');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant_classe`
--

CREATE TABLE `etudiant_classe` (
  `code_classe` varchar(50) NOT NULL,
  `nom_etudiant` varchar(20) NOT NULL,
  `prenom_etudiant` varchar(20) NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  `id_groupe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

CREATE TABLE `groupe` (
  `id_Groupe` int(11) NOT NULL,
  `Code_Classe` varchar(20) NOT NULL,
  `Annee_Universitaire` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `groupe`
--

INSERT INTO `groupe` (`id_Groupe`, `Code_Classe`, `Annee_Universitaire`) VALUES
(1, 'A0011', '2021/2022'),
(2, 'A0013', '2021/2022'),
(3, 'A0015', '2021/2022'),
(4, 'A0017', '2021/2022'),
(5, 'A0019', '2021/2022');

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

CREATE TABLE `module` (
  `id_module` int(11) NOT NULL,
  `NomModule` text NOT NULL,
  `Type` varchar(100) NOT NULL,
  `Coefficient` int(11) NOT NULL,
  `Code_Classe` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `module`
--

INSERT INTO `module` (`id_module`, `NomModule`, `Type`, `Coefficient`, `Code_Classe`) VALUES
(14, ' UNITE ATELIERS DU PROJET ARCHITECTURAL ET URBAIN', 'UAPAU', 5, 'A0011'),
(15, 'UNITE DOCTRINES ET THEORIE D\'ARCHITECTURE', 'UDTA', 3, 'A0011'),
(16, 'UNITE ATELIERS DU PROJET ARCHITECTURAL ET URBAIN', 'UAPAU', 5, 'A0013'),
(17, 'UNITE DES SCIENCES HUMAINES ET SOCIALES', 'USHS', 3, 'A0013'),
(18, 'UNITE DES SCIENCES HUMAINES ET SOCIALES', 'USHS', 3, 'A0011'),
(19, 'UNITE SCIENCES DES MATERIAUX', 'USDM', 3, 'A0011'),
(20, ' UNITE STRUCTURES ET TECHNOLOGIES DE LA CONSTRUCTION', 'USTC', 5, 'A0015'),
(21, ' UNITE STRUCTURES ET TECHNOLOGIES DE LA CONSTRUCTION', 'USTC', 5, 'A0026'),
(22, ' UNITE STRUCTURES ET TECHNOLOGIES DE LA CONSTRUCTION', 'USTC', 5, 'A0024'),
(23, ' UNITE SCIENCES DU CONFORT ET DES AMBIANCES', 'USCA', 2, 'A0028'),
(24, ' UNITE SCIENCES DU CONFORT ET DES AMBIANCES', 'USCA', 5, 'A0019'),
(25, ' Statique/ Resistance des matériaux', 'STC1', 3, 'A0011'),
(26, 'Connaissance des matériaux', 'STC2', 3, 'A0011'),
(27, 'Introduction au Béton armé', 'STC3', 3, 'A0013'),
(28, ' Procédés Généraux de Construction (PGC)', 'STC4', 3, 'A0024');

-- --------------------------------------------------------

--
-- Structure de la table `module_classe`
--

CREATE TABLE `module_classe` (
  `Code_Classe` varchar(5) NOT NULL,
  `module` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `notes_classe`
--

CREATE TABLE `notes_classe` (
  `id_Etudiant` int(11) NOT NULL,
  `Code_Classe` varchar(5) NOT NULL,
  `Note` int(11) NOT NULL,
  `Coefficient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

CREATE TABLE `paiement` (
  `Reference_Reçu` varchar(20) NOT NULL,
  `Date_Reçu` date NOT NULL,
  `Date_remise_Reçu` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `paiement`
--

INSERT INTO `paiement` (`Reference_Reçu`, `Date_Reçu`, `Date_remise_Reçu`) VALUES
('A00TT', '2022-01-01', '2022-01-02'),
('loers88', '2022-01-23', '2022-01-30'),
('sdghh', '2022-01-18', '2022-01-26'),
('sthj20', '2022-01-20', '2022-01-27'),
('vfhfg52', '1970-01-01', '1970-01-01');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `role` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `role`, `email`, `password`) VALUES
(6, 'ADMIN', 'admin@gmail.com', '$2y$10$poFMOr2dWMYFwgcf2ZIdOexXqmMMuuEZ0/i6lc3bKHqIfr.TVkbL.'),
(7, 'DG', 'dg@gmail.com', '$2y$10$UdGu0znec9v.KFUgwIyoNOd0.FncBeOQT94../DVCi17/tq0vplg.'),
(8, 'SAE', 'sae@gmail.com', '$2y$10$crQb1sfPMW9qMez4poc6runZb0Byt3lA5tk/rYhDAYWt0q8l1LVe.');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`Code_Classe`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `etudiant_classe`
--
ALTER TABLE `etudiant_classe`
  ADD PRIMARY KEY (`code_classe`),
  ADD KEY `fk_id_etudiant` (`id_etudiant`),
  ADD KEY `fk_id_groupe` (`id_groupe`);

--
-- Index pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD PRIMARY KEY (`id_Groupe`),
  ADD KEY `fk_code_classe_groupe` (`Code_Classe`);

--
-- Index pour la table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id_module`),
  ADD KEY `fk_Code_Classe_module` (`Code_Classe`);

--
-- Index pour la table `module_classe`
--
ALTER TABLE `module_classe`
  ADD KEY `fk_Code_Classe` (`Code_Classe`);

--
-- Index pour la table `notes_classe`
--
ALTER TABLE `notes_classe`
  ADD KEY `fk_code_classe_notes` (`Code_Classe`),
  ADD KEY `fk_id_etudiant_notes` (`id_Etudiant`);

--
-- Index pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD PRIMARY KEY (`Reference_Reçu`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `groupe`
--
ALTER TABLE `groupe`
  MODIFY `id_Groupe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `module`
--
ALTER TABLE `module`
  MODIFY `id_module` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `etudiant_classe`
--
ALTER TABLE `etudiant_classe`
  ADD CONSTRAINT `fk_id_etudiant` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id`),
  ADD CONSTRAINT `fk_id_groupe` FOREIGN KEY (`id_groupe`) REFERENCES `groupe` (`id_Groupe`);

--
-- Contraintes pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD CONSTRAINT `fk_code_classe_groupe` FOREIGN KEY (`Code_Classe`) REFERENCES `classe` (`Code_Classe`);

--
-- Contraintes pour la table `module`
--
ALTER TABLE `module`
  ADD CONSTRAINT `fk_Code_Classe_module` FOREIGN KEY (`Code_Classe`) REFERENCES `classe` (`Code_Classe`);

--
-- Contraintes pour la table `module_classe`
--
ALTER TABLE `module_classe`
  ADD CONSTRAINT `fk_Code_Classe` FOREIGN KEY (`Code_Classe`) REFERENCES `classe` (`Code_Classe`);

--
-- Contraintes pour la table `notes_classe`
--
ALTER TABLE `notes_classe`
  ADD CONSTRAINT `fk_code_classe_notes` FOREIGN KEY (`Code_Classe`) REFERENCES `classe` (`Code_Classe`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
