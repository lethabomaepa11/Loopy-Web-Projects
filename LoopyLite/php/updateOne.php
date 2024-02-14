<?php
include("db.php");
require_once("session.php");
if($_SERVER['REQUEST_METHOD'] == "POST")
{
  #for image updates
  if(isset($_FILES['img']))
  {
    $type = $_POST['type'];
    $imgName = $_FILES['img']['name'];
    $ext = explode('.',$imgName);
    $ext = strtolower(end($ext));
    $tmp = $_FILES['img']['tmp_name'];
    $allowedExt = ["png","jpg","jpeg","gif"];
    if(in_array($ext,$allowedExt))
    {
      $newFileName = uniqid().".".$ext;
      
      if($type == "profile_img")
      {
        $newPath = 'assets/images/client/profile/'.$newFileName;
      }
      else
      {
        $newPath = 'assets/images/client/cover/'.$newFileName;
      }
      move_uploaded_file($tmp,"../".$newPath);
    }
    $sql = "UPDATE client SET $type = '$newPath' WHERE unique_id = '$id'";
  }
  #for bio updates
  if(isset($_POST['bio']))
  {
    $bio = htmlspecialchars($_POST['bio']);
    $sql = "UPDATE client SET bio = '$bio' WHERE unique_id = '$id'";
  }
  if(isset($_GET['t']))
  {
    $email = $_POST['email'];
    $mobile = $_POST['mobile'];
    $website = $_POST['website'];
    $location = $_POST['location'];
    
    $sql = "UPDATE client SET email = '$email', mobile='$mobile', website = '$website', location = '$location' WHERE unique_id = '$id'";
  }
  if(mysqli_query($connect,$sql))
  {
    header("location: ../account.php");
  }
}
else
{
  header("location: ../login.php");
}