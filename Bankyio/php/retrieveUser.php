<?php
  require_once("config.php");
  require_once("session.php");
  
  $sql = "SELECT * FROM users WHERE user_id = '$id'";
  $query = mysqli_query($connect,$sql);
  if($row = mysqli_fetch_array($query))
  {
    $name = $row['fullname'];
  }
  else
  {
    header("location: login.html");
    echo("No users found"); 
  }
?>