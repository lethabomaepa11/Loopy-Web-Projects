<?php

require_once("php/retrieveUser.php");
require_once("../LoopyLite/php/months.php");

$dateCreated = to_datetime($row['dateCreated']);
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="assets/css/fontawesome.css" rel="stylesheet">
    <link href="assets/css/brands.css" rel="stylesheet">
    <link href="assets/css/solid.css" rel="stylesheet">
  <link rel="stylesheet" href="css/index.css">
  <script src="js/index.js"></script>
  <title>Public Bank - Banker Profile</title>
  <style>
     .hist
     {
       grid-template-columns: 1fr 2fr;
     }
    .hist input, .hist select
    {
      width: 90%;
      height: 50px;
      border: none;
      background-color: #ddd;
      border-radius: 4px;
    }
    .edit
    {
      height: 100%;
      position: fixed;
      z-index: 5;
      top: 0;
      left: 0;
      background-color: white;
      width: 100%;
      overflow-y: auto;
      display: none;
    }
    .edit button
    {
      width: 45%;
      margin-inline: 2%;
      float: right;
    }
    
  </style>
  <script>
    
    function updateProfile(action)
    {
      if(action === "update")
      {
        //document.getElementById("edit").style.animation = "appearFromBottom 0.5s ease-in-out";
        document.getElementById("edit").style.display = "block";
      }
      else
      {
        //document.getElementById("edit").style.animation = "goToBottom 0.5s ease-in-out";
        setTimeout(
          function()
          {
            document.getElementById("edit").style.display = "none";
          },10);
      }
    }
    function checkFields()
    {
      let fields = -2;//the select options
      const elements = document.getElementsByClassName('data');
      
      var x = 0;
      for(x = 0; x < elements.length; x++)
      {
        if((elements[x].value).length < 1)
        {
          fields++;
        }
      }
      if(fields>0)
      {
        appear(true,"dataInfo");
        document.getElementById("notify").innerHTML = "<ul><li>You have "+fields+" fields left to complete your profile.</li></ul>";
      }
      
    }
    
    setTimeout(checkFields,100);
  </script>
  </head>
  <header style="border-bottom: #ddd solid 2px">
    <i onclick="history.back();" class="fa fa-arrow-left float-left" style="margin-right: 15px; font-size: 16pt; margin-top: 18px;"></i>
    <h3>Banker Profile</h3>
    <button onclick="updateProfile('update');" style="float: right; width: 35%;margin-top: -50px; background-color: transparent; border: 2px solid #6028e5;color: #6028e5;">Edit Info</button>
  </header>
  <body>
    <div style="margin-top: 80px"></div>
    <div class="warning">
      

    </div>
    <fieldset>
      <legend>Biographical info</legend>
      <div class="hist">
        <h4>Name</h4>
        <h4><?php echo $row['fullname'];?></h4>
        <h4>Date of Birth</h4>
        <h4><?php echo $row['dateOfBirth'];?></h4>
        <h4>ID/Passport</h4>
        <h4><?php echo $row['passport'];?></h4>
        <h4>Gender</h4>
        <h4><?php echo $row['gender'];?></h4>
        <h4>Race</h4>
        <h4><?php echo $row['race'];?></h4>
      </div>
    </fieldset>
    <fieldset>
      <legend>Account Info</legend>
      <div class="hist">
        <h4>Date Created</h4>
        <h4><?php echo $dateCreated;?></h4>
        <h4>Phone number</h4>
        <h4><?php echo $row['phone'];?></h4>
        <h4>Email</h4>
        <h4><?php echo $row['email'];?></h4>
        <h4>Password</h4>
        <button style="margin: 0;">Change Password</button>
      </div>
    </fieldset>
    
    <div id="edit" class="edit">
      <header><h3>Edit Banker profile</h3></header>
          <div style="margin-top: 80px"></div>
          <form action="javascript:void(0);">
          <fieldset>
      <legend>Biographical info</legend>
      <div class="hist">
        
        <h4>Name</h4>
        <input name="name" class="data" type="text" value="<?php echo $row['fullname'];?>">
        <h4>Date of Birth</h4>
        <input name="dateOfBirth" class="data" value="<?php echo $row['dateOfBirth'];?>" type="date">
        <h4>ID/Passport</h4>
        <input name="passport" class="data" value="<?php echo $row['passport'];?>"type="number">
        <h4>Gender</h4>
        <select value="<?php echo $row['gender'];?>" class="data" name="gender">
          <option></option>
          <option>Male</option>
          <option>Female</option>
          <option>Other</option>
        </select>
        <h4>Race</h4>
        <select value="<?php echo $row['race'];?>" class="data" name="race">
          <option></option>
          <option>Black</option>
          <option>White</option>
          <option>Coloured</option>
          <option>Indian</option>
          <option>Other</option>
        </select>
      </div>
    </fieldset>
    <fieldset>
      <legend>Account Info</legend>
      <div class="hist">
        <h4>Phone number</h4>
        <input name="phone" class="data" type="number" value="<?php echo $row['phone'];?>">
        <h4>Email</h4>
        <input name="email" class="data" type="email" value="<?php echo $row['email'];?>">
      </div>
    </fieldset>
    
    <button formmethod="POST" formaction="php/updateUser.php">Update</button>
    <button style="float: left; background-color: red;" onclick="updateProfile('cancel');">Cancel</button>
    </form>
    </div>
    <div class="more" id="dataInfo" style="height: 200px;background-color: #17073d; color: white;">
    <div onclick="appear(false,'dataInfo');" class="new-close"></div>
    <i class="fa fa-xmark float-right" style="color: red;" onclick="appear(false,'dataInfo');"></i>
    <center><h3>Attention!!!</h3></center>
    <div id="notify"></div>
  </body>
</html>