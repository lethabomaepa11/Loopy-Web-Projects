<?php 
require_once("php/db.php");
require_once("php/session.php");

//get the view condtion
if(isset($_GET['view']) && isset($_GET['uid']))
{
  //the viewed user 
  require_once("php/fetchOne.php");
  $user = explode(" ",$row['name']);
  $user = $user[0];//the first part
  $view = htmlspecialchars($_GET['view']);
  if($view == "followers")
  {
    $sql = "SELECT follower FROM follows WHERE followed = '$uid'";
  }
  else if($view == "following")
  {
    $sql = "SELECT followed FROM follows WHERE follower = '$uid'";
    
  }
  else
  {
    header("location: account.php");
  }
  
  $qu = mysqli_query($connect,$sql);
  //use while loop below for mysqli_fetch_assoc
  
}
else 
{
  header("location: account.php");
}

echo'

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
  <title>View '.$user.'\'s '.$view.' - LoopyLite</title>
  <style>
     .container
     {
       height: 80%;
       overflow: hidden;
       overflow-y: auto;
     }
    .follower,.follower span
    {
      display: flex;
      flex-direction: row;
      align-items: center;
    }
    .follower
    {
      width: 100%;
      justify-content: space-between;
      margin-block: 10px;
    }
    .follower h3
    {
      margin-inline: 10px;
      font-size: 14px;
    }
    .follower button
    {
      width: 100px;
      height: 45px;
      margin-right: 20px; 
    }
    .following
    {
      background-color: #ddd;
      color: #000;
    }
    .top-tab
    {
      display: flex;
      flex-direction: row;
      justify-content: space-between;
      height: 45px;
    }
    .top-tab button
    {
      margin: 0;
      width: 50%;
      height: 45px;
      background-color: transparent;
      color: #000;
      border-radius: 0;
    }
    .top-tab button:hover,.follower:hover
    {
      background-color: #1540c257;
    }
    .top-tab span
    {
      background-color: #bbb;
      width: 2px;
    }
 
   header
   {
     position: relative;
     display: grid;
     grid-template-columns: auto 1fr;
     
   }
   a
   {
     text-decoration: none;
     color: #000;
   }
  </style>
  </head>
  <header>
    <i onclick="history.back();"class="fa-regular float-left fa-arrow-left"></i>
    <h5 style="text-align: center;"><i class="fa-regular fa-users"></i> '.$user.'\'s '.$view.'</h5>
  </header>
  <body>
    <!---<span class="top-tab">
       <button class="active">All</button>
       <span></span>
       <button>Mutual</button>
     </span>--->
    <div class="container">
     ';
     while($fid = mysqli_fetch_assoc($qu))
     {
       if($view == "followers")
       {
         $fid = $fid['follower'];
       }
       else
       {
         $fid = $fid['followed'];
       }
       $sqli = "SELECT * FROM client WHERE unique_id = '$fid'";
       $query = mysqli_query($connect,$sqli);
       
       while($f_user = mysqli_fetch_assoc($query))
       {
         $fuid = $f_user['unique_id'];
         $follow = "SELECT * FROM follows WHERE followed = '$fuid' AND follower = '$id' ORDER BY date DESC";
        $fquery = mysqli_query($connect,$follow);
        if(mysqli_num_rows($fquery) == 1)
        {
          $follower = true;
        }
        else
        {
          $follower = false;
        }
          if($f_user["unique_id"]==$id)
          {
            //do nothing
            echo'
          <span class="follower">
          <a href="account.php">
            <span>
            <img style="width: 40px;height:40px;"src="'.$f_user["profile_img"].'">
            <h3>Me</h3>
            </span>
            </a>';
          }
          else
          {
          echo'
          <span class="follower">
          <a href="account.php?uid='.$f_user["unique_id"].'">
            <span>
            <img style="width: 40px;height:40px;"src="'.$f_user["profile_img"].'">
            <p>'.$f_user["name"].'</p>
            </span>
            </a>
            <form action="php/follow.php?locate=view&vid='.$_GET["uid"].'&view='.$view.'&uid='.$f_user["unique_id"].'" method="post">
            ';
            
            if($follower)
            {
              
          
              echo'<button class="following"><i class="fa-regular fa-user-check"></i> Following</button>';
            }
            else
            {
            
              echo'<button> <i class="fa-regular fa-user-plus"></i> Follow</button>';
            }
          }
            echo'
            </form>
          </span>';
       }
     }
     echo'
    </div>


  </body>
  </html>';
  
  ?>