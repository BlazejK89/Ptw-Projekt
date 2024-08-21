<?php
include 'partials/header.php';

$iduser = $_SESSION['user-id'];
$query = "SELECT * FROM posts  WHERE author_id IN (SELECT idobserved FROM observed WHERE iduser = $iduser)";
$posts = mysqli_query($connection, $query);
?>

<section class="category__buttons">
    <div class="post__author">
    <?php while ($post = mysqli_fetch_assoc($posts)) : ?>
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
                        <h5><a href="<?= ROOT_URL ?>user.php?id=<?= $post['author_id'] ?>"> <?= "{$author['username']}" ?></a></h5> 
                        </div>
                        <?php endwhile ?>
                    </div>
                  
</section>
<?php
$posts = mysqli_query($connection, $query);
?>
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
                        <h5>By: <a href="<?= ROOT_URL ?>user.php?id=<?= $post['author_id'] ?>"> <?= "{$author['username']}" ?></a></h5> 
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


<!--====================== END OF CATEGORY BUTTONS ====================-->
