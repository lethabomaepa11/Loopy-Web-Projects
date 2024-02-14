<?php 
session_start();

if(isset($_SESSION['id']))
{
  require_once("db.php");
  $id = $_SESSION["id"];
  $id = $_SESSION["id"];
  $qp = "SELECT * FROM client WHERE unique_id = '$id'";
  $qpp = mysqli_query($connect,$qp);
  if(mysqli_num_rows($qpp)>0)
  {
    $qp_num = mysqli_num_rows($qpp);
  }
  else
  {
    session_destroy();
    header("location: login.php");
  }
}
else
{
  header("location: login.php");
}