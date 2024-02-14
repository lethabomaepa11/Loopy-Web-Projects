<?php

//get all videos and shuffle them

require_once("php/session.php");
require_once("php/db.php");
$video = "video";
$sql = "SELECT * FROM files WHERE type = '$video'";
$q = mysqli_query($connect,$sql);
$x = 0;
$videos = [];
while($row = mysqli_fetch_assoc($q))
{
  $videos[] = $row;
}
shuffle($videos);


echo'

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="assets/css/fontawesome.css" rel="stylesheet">
    <link href="assets/css/brands.css" rel="stylesheet">
    <link href="assets/css/solid.css" rel="stylesheet">
    <link href="assets/uicons-thin-rounded/css/uicons-thin-rounded.css" rel="stylesheet">
  <link rel="stylesheet" href="css/global.css">
  <link rel="icon" href="assets/images/logo.jpg">
  <script src="js/index.js"></script>
  <title>LoopyLite : Videos</title>
  <style>
    video 
    {
      border-radius: 0;
    }
  </style>
  </head>
  <body>
    
    
    <header>
      <h2>Videos</h2>
    </header>
    
    <div class="bottom"></div>
    <div class="media">
    ';
    foreach ($videos as $video)
    {
      $path = $video['path'];
      echo'
      <video controls="true">
      <source src="'.$path.'">
      Your browser does not support video element
    </video>';
    }
    echo'
    </div>
    <div class="bottom"></div>
    
    
    
    <footer>
      <div onclick="display();" class="footer overlay" id="overlay"></div>
      
      <div id="modal" style="height:auto;" class="footer footer-modal">
        <h5>Post</h5>
        <span style="margin-top:50px"></span>
        <p onclick="location = \'sell.php\'"><span class="fi fi-tr-blog-pencil"></span>Make an Ad/Sell product</p>
        <p onclick="location = \'post.php\'"><span class="fi fi-tr-user-pen"></span>Create a Post</p>
        
        </div>
      <a href="index.php"><span class="fi fi-tr-house-window">
        <p>Home</p>
      </span></a>
      <a href="chats.php"><span class="fi fi-tr-message-sms">
        <p>Chats</p>
      </span></a>
      <a href="" ><span class="fi fi-tr-circle-video">
        <p>Videos</p>
      <a onclick="display(true);" href="javascript:void(0)"><span style="color: #000;"class="center-nav fi-tr-square-plus">
        <!--<p>Advertise</p>-->
      </span></a>
      <a href="" ><span class="fi fi-tr-tv-music">
        <p>Music</p>
      <a href="account.php" ><span class="fi fi-tr-circle-user">
        <p>Account</p>
      </span></a>
      <!-- will be moved to more tab-->
      <a href=""><span class="fi fi-tr-bars-staggered">
        <p>More</p>
       
      </span></a>
    </footer>
  </body>
</html>';

?>