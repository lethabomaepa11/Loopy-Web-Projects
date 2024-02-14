<?php

require_once("formPOST.php");

if($legal)
{
  require("config.php");
  
  $phone = htmlspecialchars($_POST['phoneNumber']);
  
  $password = htmlspecialchars($_POST['password']);
  
  $sql = "SELECT * FROM users WHERE phone = '$phone'";
  $query = mysqli_query($connect,$sql);
  if(mysqli_num_rows($query) == 1)
  {
    $row = mysqli_fetch_array($query);
    
    if(password_verify($password,$row['password']));
    {
      echo $row['user_id'];
      $_SESSION['id'] = $row['user_id'];
  
      header("location: ../BankHomepage.php");
    }
  }
  else
  {
    //echo(mysqli_fetch_ass)
    header("location: ../login.html");
  }
}
else
{
  header("location: ../login.html");
}