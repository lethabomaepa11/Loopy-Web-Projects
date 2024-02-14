<?php
if($_SERVER["REQUEST_METHOD"] == "POST")
{
  require_once("config.php");
  require_once("session.php");
  
  $name = $_POST['name'];
  $dateOfBirth = $_POST['dateOfBirth'];
  $passport = $_POST['passport'];
  $gender = $_POST['gender'];
  $race = $_POST['race'];
  $phone = $_POST['phone'];
  $email = $_POST['email'];
  
  $sql = "UPDATE users SET fullname = '$name',dateOfBirth = '$dateOfBirth',passport = '$passport',gender = '$gender',race = '$race', phone = '$phone', email ='$email' WHERE user_id = '$id'";
  
  if(mysqli_query($connect,$sql))
  {
    header("location: ../BankerProfile.php");
  }
}
else
{
  header("location: ../createAccount.html");
}

mysqli_close();