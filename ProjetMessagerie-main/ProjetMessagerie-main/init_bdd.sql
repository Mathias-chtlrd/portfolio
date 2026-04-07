-- ============================================================
--  Script d'initialisation – projetR4A10
--  Exercice 1 : création de la base, de la table et données initiales
-- ============================================================

-- Création de la base dédiée
CREATE DATABASE IF NOT EXISTS projetR4A10
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE projetR4A10;

-- Création de la table messages
-- id       : identifiant auto-généré par MySQL
-- auteur   : pseudo de l'utilisateur
-- contenu  : texte du message
-- date_message : estampille horaire calculée par PHP (ou NOW() par défaut)
CREATE TABLE IF NOT EXISTS messages (
    id            INT          NOT NULL AUTO_INCREMENT,
    auteur        VARCHAR(50)  NOT NULL,
    contenu       TEXT         NOT NULL,
    date_message  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Création d'un compte dédié (sécurité – pas root)
CREATE USER IF NOT EXISTS 'chat_user'@'localhost' IDENTIFIED BY 'MotDePasseChat!';
GRANT SELECT, INSERT ON projetR4A10.messages TO 'chat_user'@'localhost';
FLUSH PRIVILEGES;

-- ============================================================
--  Jeu de données initial : au moins 20 enregistrements
-- ============================================================
INSERT INTO messages (auteur, contenu, date_message) VALUES
('alice',   'Bonjour tout le monde !',                        '2025-05-10 08:00:00'),
('bob',     'Salut Alice, ça va ?',                           '2025-05-10 08:01:12'),
('alice',   'Oui merci, et toi ?',                            '2025-05-10 08:01:45'),
('bob',     'Nickel. Prêt pour le TP ?',                      '2025-05-10 08:02:30'),
('claire',  'Moi aussi je suis là !',                         '2025-05-10 08:03:00'),
('alice',   'Super Claire !',                                  '2025-05-10 08:03:20'),
('david',   'Quelqu'un a fini l'exercice 2 ?',               '2025-05-10 08:05:00'),
('bob',     'Presque, j'ai un souci avec le PDO.',            '2025-05-10 08:05:45'),
('claire',  'Tu vérifies les paramètres de config ?',         '2025-05-10 08:06:10'),
('bob',     'Ah oui, c'était ça ! Merci Claire.',             '2025-05-10 08:07:00'),
('david',   'L'exo 3 est franchement bien.',                  '2025-05-10 08:08:30'),
('alice',   'Oui, le setInterval c'est pratique.',            '2025-05-10 08:09:00'),
('emma',    'Bonjour à tous, je rejoins la salle !',          '2025-05-10 08:10:00'),
('claire',  'Bienvenue Emma !',                               '2025-05-10 08:10:15'),
('emma',    'Merci ! Vous avez commencé le bonus ?',          '2025-05-10 08:11:00'),
('david',   'Pas encore, on finit d'abord les bases.',        '2025-05-10 08:11:30'),
('alice',   'La partie jQuery est vraiment fun.',             '2025-05-10 08:12:00'),
('bob',     'Ouais, $.post c'est simple et efficace.',        '2025-05-10 08:12:45'),
('emma',    'Et le load() pour afficher les messages.',       '2025-05-10 08:13:20'),
('claire',  'Bonne séance à tous, on va y arriver !',        '2025-05-10 08:14:00');
