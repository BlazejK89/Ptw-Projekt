<?php
include 'partials/header.php';

// fetch post from database if id is set
if (isset($_GET['id'])) {
    $id = filter_var($_GET['id'], FILTER_SANITIZE_NUMBER_INT);
    $query = "SELECT * FROM posts WHERE author_id = $id";
    $posts = mysqli_query($connection, $query);
    //$posts = mysqli_fetch_assoc($result);
} else {
    header('location: ' . ROOT_URL . 'blog.php');
    die();
}
?>

            <?php
            // fetch author from users table using author_id
            $author_id = $id;
            
            $author_query = "SELECT * FROM users WHERE id=$id";
            $author_result = mysqli_query($connection, $author_query);
            $author = mysqli_fetch_assoc($author_result);

            ?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js\script.js"></script>
</head>
<body>
<section class="category__buttons">
<div class="post__author">
<div class="post__author">
            <div class="post__author-avatar">
                <img src="./images/<?= $author['avatar'] ?>">
            </div>
            <div class="post__author-info">
                <h5><a href="<?= ROOT_URL ?>user.php?id=<?= $post['author_id'] ?>"> <?= "{$author['username']}" ?></a></h5> 
                    <?php
                    $iduser = $_SESSION['user-id'];
                    $sql = "SELECT id FROM observed WHERE iduser = $iduser AND idobserved =  $author_id";
                    $added = $connection->query($sql)->num_rows > 0;
                    $text = $added ? "Obserwowany" : "Obserwuj";
                    echo "<p class='obs' data-dzban='$author_id '>$text</p>";
                    ?>
            </div>
</section>

<!--====================== END OF SEARCH ====================-->

<section class="posts <?= $featured ? '' : 'section__extra-margin' ?>">
    <div class="container posts__container">
        <?php while ($post = mysqli_fetch_assoc($posts)) : ?>
            <article class="post">
                <div class="post__thumbnail">
                    <img src="./images/<?= $post['thumbnail'] ?>">
                </div>
                <div class="post__info">
                    <?php
                    // fetch category from categories table using category_id of post
                    $category_id = $post['category_id'];
                    $category_query = "SELECT * FROM categories WHERE id=$category_id";
                    $category_result = mysqli_query($connection, $category_query);
                    $category = mysqli_fetch_assoc($category_result);
                    ?>
                    <a href="<?= ROOT_URL ?>category-posts.php?id=<?= $post['category_id'] ?>" class="category__button"><?= $category['title'] ?></a>
                    <h3 class="post__title">
                        <a href="<?= ROOT_URL ?>post.php?id=<?= $post['id'] ?>"><?= $post['title'] ?></a>
                    </h3>
                    <p class="post__body">
                        <?= substr($post['body'], 0, 150) ?>...
                    </p>
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
                            <h5>By: <?= "{$author['username']}" ?></h5>
                            <small>
                                <?= date("M d, Y - H:i", strtotime($post['date_time'])) ?>
                            </small>
                        </div>
                    </div>
                </div>
            </article>
        <?php endwhile ?>
    </div>
</section>
<!--====================== END OF POSTS ====================-->
        </body>
</html>

<!--====================== END OF CATEGORY BUTTONS ====================-->


