<?php
require('config.php');

if (isset($_POST['auteur']) && isset($_POST['contenu'])) {
    $auteur = trim($_POST['auteur']);
    $contenu = trim($_POST['contenu']);

    if ($auteur === '' || $contenu === '') {
        http_response_code(400);
        echo 'Erreur : auteur et contenu ne peuvent pas être vides.';
        exit;
    }

    $stmt = $pdo->prepare('INSERT INTO messages (auteur, contenu, date_message) VALUES (?, ?, ?)');
    $stmt->execute([$auteur, $contenu, date('Y-m-d H:i:s')]);

    echo 'OK';
} else {
    http_response_code(400);
    echo 'Erreur : paramètres manquants.';
}
?>