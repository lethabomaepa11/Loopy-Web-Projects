<?php
require_once("formPOST.php");
if($legal)
{
  
  require("config.php");
  //get values
  $name = htmlspecialchars($_POST['name']);
  $dateOfBirth = htmlspecialchars($_POST['dateOfBirth']);
  $phoneNumber= htmlspecialchars($_POST['phoneNumber']);
  $pass = htmlspecialchars($_POST['password']);
  $password = password_hash($pass,PASSWORD_BCRYPT);
  $user_id = uniqid();
  
  //sql and query
  $check = "SELECT * FROM users WHERE phone = ".$phoneNumber."";
  $query = mysqli_query($connect,$check);
  if(mysqli_fetch_assoc($query) > 0)
  {
    $_SESSION['id'] = $user_id;
    header("location: createAccount.html");
  }
  else
  {
    $sql = "INSERT INTO users(fullname,dateOfBirth,phone,password,user_id) VALUES ('$name','$dateOfBirth','$phoneNumber','$password','$user_id')";
    if(mysqli_query($connect,$sql))
    {
      
      header("location: ../BankerProfile.php?Logged_in");
    }
  }
  
}
else
{
  
  header("location: ../createAccount.html");
  echo("Illegal Access");
}