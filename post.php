<?php
include 'partials/header.php';

// fetch post from database if id is set
if (isset($_GET['id'])) {
    $id = filter_var($_GET['id'], FILTER_SANITIZE_NUMBER_INT);
    $query = "SELECT * FROM posts WHERE id=$id";
    $result = mysqli_query($connection, $query);
    $post = mysqli_fetch_assoc($result);
} else {
    header('location: ' . ROOT_URL . 'blog.php');
    die();
}
?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js\script.js"></script>
</head>
<body>
<section class="singlepost">
    <div class="container singlepost__container">
        <h2><?= $post['title'] ?></h2>
        <div class="post__author">
            <?php
            // fetch author from users table using author_id
            $author_id = $post['author_id'];
            
            $author_query = "SELECT * FROM users WHERE id=$author_id";
            $author_result = mysqli_query($connection, $author_query);
            $author = mysqli_fetch_assoc($author_result);

            ?>
            <div class="post__author-avatar">
                <img src="./images/<?= $author['avatar'] ?>">
            </div>
            <div class="post__author-info">
                <h5>By: <a href="<?= ROOT_URL ?>user.php?id=<?= $post['author_id'] ?>"> <?= "{$author['username']}" ?></a></h5> 
                <small>
                    <?= date("M d, Y - H:i", strtotime($post['date_time'])) ?>
                </small>
                    <?php
                    $iduser = $_SESSION['user-id'];
                    $sql = "SELECT id FROM observed WHERE iduser = $iduser AND idobserved =  $author_id";
                    $added = $connection->query($sql)->num_rows > 0;
                    $text = $added ? "Obserwowany" : "Obserwuj";
                    echo "<p class='obs' data-dzban='$author_id '>$text</p>";
                    ?>
            </div>
        </div>
        <div class="singlepost__thumbnail">
            <img src="./images/<?= $post['thumbnail'] ?>">
        </div>
        <p>
            <?= $post['body'] ?>
        </p>
    </div>
</section>
</body>
</html>
<!--====================== END OF SINGLE POST ====================-->



<?php
include 'partials/footer.php';

?>