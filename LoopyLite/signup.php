<?php

require("php/provinces.php");

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
  <script src="js/index.js"></script>
  <link rel="icon" href="assets/images/logo.jpg">
  <title>Sign up - LoopyLite</title>
  <style>
  label
    {
      font-weight: bold;
    }
  </style>
  <script>
    
  </script>
  </head>
  <body>
    <center>
      <h1 class="logoh" style="width: fit-content;">LoopyLite</h1>
      </center>
      <p class="slogan">LoopyLite, online marketplace for you to advertise your products, this is your chance to increase your sales with us.</p>
    <div style="width: 100%;">
      <fieldset>
        
        <legend>
          <div class="head-one" style="background-color: #113344;color: #fff; padding-inline: 5px; width: 100%;">
          <h4>Create an account</h4>
          </div>
        </legend>
        <form action="php/createAccount.php" method="POST" enctype="multipart/form-data">
        <div class="ada" style="grid-template-columns: 1fr;">
        
        <label for="name">Name</label>
        <input type="text" name="name" placeholder="Your name">
        <label for="email">Email</label>
        <input name="email"type="email" placeholder="Your email">
        <label for="mobile">Cellphone</label>
        <input name="mobile" type="number" placeholder="Cellphone number">
        <label>Website</label>
        <input name="website"type="url" name="website">
        <label for="location">Location</label>
        <select name="location" placeholder="Your location">
          <?php 
          $x = 0;
          for($x = 0; $x < 9;$x++)
          {
            echo'<option>'.$arrProvince[$x].'</option>';
          }
          ?>
          </select>
        <label for="profile-pic">Profile Picture</label>
        <input name="profile_img" type="file" accept=".jpg,.jpeg,.png,.webm">
        <label for="password">Password</label>
        <input name="password"type="password" placeholder="Create your password">
        </div>
        <button>Create account</button>
        <br>
        </form>
        
      </fieldset>
      If you have an account already <a href="login.php">Login here.</a>
    </div>
    
  </body>
</html>