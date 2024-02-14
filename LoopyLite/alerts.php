<?php
require_once("php/db.php");
require_once("php/session.php");
require_once("php/months.php");

$sql = "SELECT * FROM activity ORDER BY date DESC";
$query = mysqli_query($connect,$sql);

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
  <script src="js/index.js"></script>
  <title>Alerts - LoopyLite</title>
  <style>
 body
 {
   background-color: #eee;
   color: #0a0a0a;
 }
 .alerts
 {
   width: 100%;
   padding-block: 4px;
   background-color: #fff;
 }
 
.alerts a
{
  text-decoration: none;
  color: #0a0a0a;
}
 .alerts img
 {
   width: 40px;
   height: 40px;
 }
 .alerts .alert img
 {
   border-radius: 50%;
 }
 .alerts .alert
 {
   display: grid;
   flex-wrap: wrap;
   white-space: wrap;
   max-width: 100%;
   overflow: hidden;
   grid-template-columns: auto 5fr;
   padding-block: 5px;
   transition: all 0.1s ease;
 }
 .alert:active
 {
   background-color: #0b527536;
 }
 .user-time
 {
   font-size: 7pt;
   font-family: Arial;
 }
 .info
 {
   font-size: 12px;
 }
 .space-btwn
 {
   display: grid;
   grid-template-columns: 3fr 1fr;
 }
  </style>
  <script>
    
  </script>
  </head>
  <body>
    <header>
    <i onclick="history.back()" class="fa-regular float-left fa-arrow-left"></i>
    <h4 style="text-align: center">Alerts <i class="fa-regular fa-bell"></i></h4>
    </header>
    <div style="margin-top: 52px"></div>
    <div class="alerts">
    ';
    while($alert = mysqli_fetch_assoc($query))
    {
      $user_id = $alert['user_id'];
      $sqla = "SELECT * FROM client WHERE unique_id = '$user_id'";
      $querya = mysqli_query($connect,$sqla);
      $user = mysqli_fetch_assoc($querya);
      //extract what we are going to use
      $user_name = $user['name'];
      $user_img = $user['profile_img'];
      
      
      $activity = $alert['activity'];
      $date = to_datetime($alert['date']);
      $link = $alert['link'];
      $user_id = $alert["to_user"];
            $sqlp = "SELECT * FROM client WHERE unique_id = '$user_id'";
            $queryp = mysqli_query($connect,$sqlp);
            $user = mysqli_fetch_assoc($queryp);
            $to_user_name = $user['name'];
      if($id == $alert['user_id'])
      {
          //you logged in, updated bio and other stuff, followed someone
          if($activity == "followed" || $activity == "commented" || $activity == "unfollowed" || str_contains("commented",$activity))
          {
            
            
            if($activity == "followed" || $activity == "unfollowed")
            {
              $info = "You ".$activity." ".$to_user_name;
            }
            else
            {
              $info = "You ".$activity." on ".$to_user_name."'s product";
            }
          }
          else
          {
            $info = "You ".$activity;
          }
          
        }
      else if($id == $alert['to_user'])
      {
        //someone followed you or unfollowed you
        if($activity == "followed" || $activity == "unfollowed")
            {
              $info = $user_name." ".$activity." you.";
            }
            else if(str_contains($activity,"commented"))
            {
              $info = $user_name." ".$activity." on your product";
            }
            else
            {
              $info = $user_name." ".$activity;
            }
      }
      else
      {
        if($activity == "followed" || $activity == "unfollowed")
            {
              $info = $user_name." ".$activity." ".$to_user_name;
            }
            else if($activity == "commented")
            {
              $info = $user_name." ".$activity." on ".$to_user_name." product";
            }
            else
            {
              $info = $user_name." ".$activity;
            }
      }
      if($alert['privacy'] == "public" || $id == $alert['user_id'] || $id == $alert["to_user"])
      {
       echo'
      <a href="'.$link.'">
      <div class="alert">
      <img src="'.$user_img.'">
      <div class="space-btwn">
        <span class="info">'.$info.'</span>
        <p class="user-time">'.$date.'</p>
      </div>
      </div>
      </a>
      ';}
    }
      echo'
    </div>
  </body>
</html>';

?>