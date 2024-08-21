<?php
require 'config/database.php';

if (isset($_POST['submit'])) {
    // get updated form data
    $id = filter_var($_POST['id'], FILTER_SANITIZE_NUMBER_INT);
    $is_admin = filter_var($_POST['userrole'], FILTER_SANITIZE_NUMBER_INT);

        // update user
        $query = "UPDATE users SET username='$username', is_admin=$is_admin WHERE id=$id LIMIT 1";
        $result = mysqli_query($connection, $query);

        if (mysqli_errno($connection)) {
            $_SESSION['edit-user'] = "Failed to update user.";
        } else {
            $_SESSION['edit-user-success'] = "User $username  updated successfully";
        }
}

header('location: ' . ROOT_URL . 'admin/manage-users.php');
die();
?>