<?php

require_once("db.php");
require_once("session.php");
$pid = $_GET['pid'];
//verify that the user who is deleting the item is the one who added it
$verify = "SELECT user_id FROM products WHERE item_id = '$pid' AND user_id = '$id'";
if(mysqli_query($connect,$verify))
{
$del = "DELETE FROM products WHERE item_id = '$pid'";
$del_review = "DELETE FROM product_reviews WHERE product_id = '$pid'";
if(mysqli_query($connect,$del))
{
  $activity = "deleted your product";
  $privacy = "only me";
  $link = "account.php";
  db_add($connect,$id,$activity,$link,$privacy,"me");
  header("location: ../account.php");
}
}
else
{
  header("location: ../account.php?id=".$id);
}