<?php
require 'config/database.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $idpost = $_POST["post"];
    $user = $_POST["user"];
    $comment = $_POST["comment"];
    
    $sql = "INSERT INTO comments (idpost, user, coment) VALUES ($idpost, '$user', '$comment')";
    if ($connection->query($sql)) {
        header('location: ' . ROOT_URL . 'post.php?id='. $idpost);
    } else {
        echo "Błąd: " . $sql . "<br>" . $connection->error;
    }
}

$connection->close();
?>
