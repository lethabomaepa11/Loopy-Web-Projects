<?php
include("db.php");
$row = "";
if(isset($id))
{
  $legal = true;
  if(isset($_GET['uid']))
  {
    $uid = $_GET['uid'];
    $sql = "SELECT * FROM client WHERE unique_id = '$uid'";
    $product_ref = "Their ";
  }
  else
  {
    $product_ref = "My ";
    $sql = "SELECT * FROM client WHERE unique_id = '$id'";
  }
  
  $query = mysqli_query($connect,$sql);
  if(mysqli_num_rows($query)==1)
  {
    $row = mysqli_fetch_assoc($query);
  }
  else
  {
    header("location: account.php");
  }
}
else
{
  $legal = false;
  header("location: login.php");
}