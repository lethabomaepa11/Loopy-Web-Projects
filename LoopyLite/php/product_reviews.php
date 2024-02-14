<?php
if(isset($_GET['pid']) && $_SERVER['REQUEST_METHOD']=="POST")
{
  require_once("session.php");
  require_once("db.php");
  
  if(strlen($_POST['review'])>0)
  {
    $pid = $_GET['pid'];
    $to = $_GET["for"];
    $review = htmlspecialchars($_POST['review']);
    $rsql = "INSERT INTO product_reviews(user_id,product_id,review) VALUES('$id','$pid','$review')";
    if(mysqli_query($connect,$rsql))
    {
      $to_user = $to;
      $comment = substr($review,0,50);
      $activity = "commented: ".$comment."...";
      $link = "view-item.php?pid=".$pid;
      $privacy = "public";
      db_add($connect,$id,$activity,$link,$privacy,$to_user);
      header("location: ../view-item.php?pid=".$pid);
    }
  }
  else
  {
    header("location: ../index.php");
  }
}
else
{
  header("location: ../index.php");
}