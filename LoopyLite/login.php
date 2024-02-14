<?php

include("php/db.php");
if($_SERVER['REQUEST_METHOD']=="POST")
{
  $error = "";
  $errors = false;
  $user = htmlspecialchars($_POST['user']);
  $password = htmlspecialchars($_POST['password']);
  $sql = "SELECT * FROM client WHERE email = '$user' OR mobile = '$user'";
  $query = mysqli_query($connect,$sql);
  if(mysqli_num_rows($query)==1)
  {
    $row = mysqli_fetch_assoc($query);
    if(password_verify($password,$row['password']))
    {
      
      $_SESSION['id'] = $row['unique_id'];
      require_once("php/activity.php");
      $device = $_SERVER["HTTP_USER_AGENT"];
      $activity = "logged in on ".$device;
      $id = $_SESSION['id'];
      $privacy = "only me";
      $link = "account.php";
      
      
      if(isset($_GET['app']) && htmlspecialchars($_GET['app']) == "Bankyio")
      {
        $activity = "logged in to Bankyio app using LoopyLite on ".$device;
        //check if this user has already linked the apps if not, then link them
        require_once("../Bankyio/php/config.php");
        $linked = "SELECT * FROM users WHERE user_id = '$id'";
        $linked_q = mysqli_query($connect,$linked);
        if(mysqli_num_rows($linked_q)<1)
        {
          $name = $row['name'];
          $mobile = $row['mobile'];
          $email = $row['email'];
          $password = $row['password'];
          $date_created = $row['date_created'];
          $insert = "INSERT INTO users(fullname,email,phone,password,user_id,dateCreated) VALUES('$name','$email','$mobile','$password','$id','$date_created')";
          if(mysqli_query($connect,$insert))
          {
            
          }
        }
        header("location: ../Bankyio/BankHomepage.php");
      }
      else
      {
        header("location: index.php");
      }
      //$connect variable is common, so force require this file below
      require("php/db.php");
      db_add($connect,$id,$activity,$link,$privacy,"me");
    }
    else
    {
      $error = "Password is incorrect ";
      $errors = true;
    }
  }
  else
  {
    $error = "Account does not exist for \"<b>$user</b>\"<br><br><a href='signup.php'>Create an account</a>";
    $errors = true;
  }
}
else
{
  $errors = false;
  $user = "";
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="assets/css/fontawesome.css" rel="stylesheet">
    <link href="assets/css/brands.css" rel="stylesheet">
    <link href="assets/css/solid.css" rel="stylesheet">
  <link rel="stylesheet" href="css/global.css">
  <link rel="stylesheet" href="css/second.css">
  <link rel="icon" href="assets/images/logo.jpg">
  <script src="js/index.js"></script>
  <title>Login - LoopyLite</title>
  <style>
  label
    {
      font-weight: bold;
    }
  .thumbs a
  {
    background-color: transparent;
    color: #0b5275;
  }
  .form
  {
    display: flex;
    flex-direction: column ;
    justify-content:center ;
    align-items: center;
    width: 100%;
  }
  .form div
  {
    width: 96%;
  }
  input
  {
    height: 44px;
  }
  

  @media  screen and (min-width: 600px) 
  {
    body
    {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      background-color: #eee;
    }
    .form
    {
      min-width: 500px;
      width: 500px;
      box-shadow: 0 10px 13px rgba(0,0,0,0.2);
      border-radius: 8px;
      background-color: #fff;
    } 
    input
    {
      width: 100%;
    }
  }
  </style>
  <script>
  let number = "0123456789";
  let email = "name123@gmail.com"
  let temp = "";
  let counter = 0;
  let choice = 0;
  let length;
    function changeText()
    {
      const element = document.getElementById("phone");
      switch(choice)
      {
        case 0:
          //number
          length = number.length;
          temp += number[counter];
          break;
        case 1:
          //email
          length = email.length;
          temp += email[counter];
          break;
      }
      //temp += number[counter];
      element.setAttribute("placeholder",temp);
      counter++;
      if(counter==length)
      {
        counter = 0;
        temp = "";
        if(choice>0)
        {
          choice--;
        }
        else
        {
          choice++;
        }
      }
    }
    setInterval(changeText,250);
  </script>
  </head>
  <body>
    
    <div class="form">
    <center>
      <h1 class="logoh" style="width: fit-content;">LoopyLite</h1>
      </center>
      
     <div>
      <fieldset style="border-bottom: none;">
        
        <legend style="font-size: 1rem;text-align:center"><h5>Login to your LoopyLite Account</h5></legend>
        
        <?php 
        if($errors)
        {
          echo '<p class="error-msg" style="text-align: center"><i class="fa fa-circle-xmark fa-bounce"></i>'. $error.'</p>';
        }
        ?>
        <form action="#" method="POST" enctype="multipart/form-data">
        <div class="ada" style="grid-template-columns: 1fr;">
        
        <label for="email&phone">Email or Phone</label>
        <input name="user" value="<?php echo $user ?>" id="phone" type="text" placeholder="Your email or phone number">
        <label for="password">Password</label>
        <input name="password" type="password" placeholder="Enter your password">
        </div>
        <button>Login</button>
        <br>
        </form>
        
      
      
      
       
       <fieldset>
        <legend style="text-align: center;">
          <p class="slogan" style="color: #000;">Do not have an account?</p>
          </legend><br>
          <div class="thumbs">
        <a class="outlined-btn"href="signup.php">Create an account here.</a>
        
      
      <?php
      if(isset($_GET['app']) && $_GET['app'] == "Bankyio")
      {
        echo'<br><b>OR</b><br><a class="outlined-btn" href="../Bankyio/createAccount.html">Create a Bankyio account here.</a>';
      }
      ?>
      
      </div>
        </fieldset>
        </fieldset>
        </div>
    </div>
    
  </body>
</html>
