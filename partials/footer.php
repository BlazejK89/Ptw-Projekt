
<script src="<?= ROOT_URL ?>js/main.js"></script>

<h2>Dodaj komentarz</h2>
    <form action="admin/add-comment.php" method="post">
        <input type="hidden" id="post" name="post" value= <?= $post['id'] ?>>
        <input type="hidden" id="user" name="user" value= <?= $_SESSION['user'] ?>>
        <textarea id="comment" name="comment" required></textarea><br><br>
        <input type="submit" value="Dodaj komentarz">
    </form>

</body>

<?php
$idpost = $post['id'];

$sql = "SELECT id, user, coment, t FROM comments WHERE idpost = $idpost ORDER BY t DESC ";
$result = $connection->query($sql);

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<div>";
        echo "<h3>" . htmlspecialchars($row["user"]) . " napisał(a):</h3>";
        echo "<p>" . htmlspecialchars($row["coment"]) . "</p>";
        echo "<small>" . $row["t"] . "</small>";
        echo "</div><hr>";
    }
} else {
    echo "Brak komentarzy.";
}

$connection->close();
?>

</html>