<?php 
session_start();

if(isset($_SESSION['id']))
{
  require_once("config.php");
  $id = $_SESSION["id"];
  $qp = "SELECT * FROM users WHERE user_id = '$id'";
  $qpp = mysqli_query($connect,$qp);
  if(mysqli_num_rows($qpp)>0)
  {
    
  }
  else
  {
    session_destroy();
    header("location: login.html");
  }
}
else
{
  header("location: login.html");
}