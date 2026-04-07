<?php
require('config.php');

$sql = 'SELECT id, auteur, contenu, date_message
         FROM messages
         ORDER BY date_message DESC
         LIMIT 10';
$stmt = $pdo->prepare($sql);
$stmt->execute();
$messages = array_reverse($stmt->fetchAll());

foreach ($messages as $msg) {
    $id = (int) $msg['id'];
    $auteur = htmlspecialchars($msg['auteur'], ENT_QUOTES, 'UTF-8');
    $contenu = htmlspecialchars($msg['contenu'], ENT_QUOTES, 'UTF-8');
    $ts = strtotime($msg['date_message']);
    $date = date('d/m/Y', $ts);
    $heure = date('H:i:s', $ts);

    echo "<div class=\"message\" data-id=\"{$id}\">\n";
    echo "    <span class=\"contenu\">{$contenu}</span>\n";
    echo "    <span class=\"meta\">{$auteur} | le {$date} à {$heure}</span>\n";
    echo "</div>\n";
}
?>