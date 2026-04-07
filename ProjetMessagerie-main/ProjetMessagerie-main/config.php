<?php
// Configuration de la connexion à la base de données
define('DB_HOST', 'mysql-projetr4a10-daunis-chatelard.alwaysdata.net');
define('DB_NAME', 'projetr4a10-daunis-chatelard_db');
define('DB_USER', '459579_chat_user');
define('DB_PASS', 'MotDePasseChat!');
define('DB_CHARSET', 'utf8mb4');

$dsn = "mysql:host=" . DB_HOST . ";dbname=" . DB_NAME . ";charset=" . DB_CHARSET;

$options = [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES => false,
];

try {
    $pdo = new PDO($dsn, DB_USER, DB_PASS, $options);
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['erreur' => 'Connexion impossible à la base de données.']);
    exit;
}
?>