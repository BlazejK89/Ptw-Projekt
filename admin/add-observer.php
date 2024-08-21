<?php
 require 'config/database.php';

 $idobs = $_REQUEST["idobserved"];
 $iduser= $_SESSION["user-id"];

 $sql = "SELECT id FROM observed WHERE idobserved = $idobs AND iduser = $iduser";
 $result = $connection->query($sql);;

 if ($result->num_rows == 1) {
 $id = $result->fetch_object()->id;
 $sql = "DELETE FROM observed WHERE id = $id";
 } else {
 $sql = "INSERT INTO observed (idobserved, iduser) VALUES ($idobs, $iduser)";
 }

 if ($connection->query($sql) !== TRUE) {
 echo "Error: " . $sql . "<br>" . $connection->error;
 } else {
 echo "sukces";
 }
 $connection->close();
?>
