<?php

require_once("php/session.php");
require_once("php/db.php");
 /***page name: Chats
  * 
  * Description: Displays all chats for the logged in user, the chats are ordered by last_modified field in the chats table in the database, the last_modified field of every chat is updated when the chat_id is used for a message, in other words if user1 or user2(logged in user or the recipient) send a message, the last_modified gets updated...view this in the message script: "message.php"
  * Do not mind the indentation...

 The program
  
  * We fetch every chat associated with the logged in user
  * For every chat, we need the chat id and the recipient id
  * We use the chat id to navigate the logged in user to that particular chat  and also fetch and display the last message in that chat
  * We use the recipient id to display the recipient's name and profile picture 
  */
 
 echo"<!doctype html>
 <html>
   <head>
 <meta charset='UTF-8'>
  <meta name='viewport' content='width=device-width, initial-scale=1.0'>
 <link rel='stylesheet' href='css/global.css'/>
 <link href='assets/uicons-thin-rounded/css/uicons-thin-rounded.css' rel='stylesheet'>
 <style>
 
 img
 {
   width: 50px;
   aspect-ratio: 4/3;
   margin-block: 5px;
 }
 .thumbs
 {
   display: block;
   overflow: hidden;
 }
 
 .thumbs a 
 {
   width: fit-content;
 }
 a 
 {
   color: #1f1f1f;
   text-decoration: none;
 }
 .seller span div
 {
   width: 100%;
   display: grid;
   align-items: center;
   padding: 0;
   overflow: hidden;
   max-height: 55px;
 }
 .seller,.seller span
 {
   width: 100%;
 }
 .seller span img
 {
   margin-top: 20px;
 }
 .slogan
 {
   margin: 0;
   padding: 0;
   margin-top: -10px;
   margin-left: 8px;
   color: #2f2d2dce;
   font-size: 13px;
 }
 </style>
 
 <title>Chats</title></head>
 
 <header><h2>Chats</h2></header>
 <body><div style='margin-top: 40px;'></div>";
 /***
  * Get all the chats in the chats table where the user_id_one or user_id_two value is the logged in user's id.
  */
 $sql = "SELECT * FROM chats WHERE user_id_one = '$id' OR user_id_two = '$id' ORDER BY last_modified DESC";
$query = mysqli_query($connect,$sql);


while($row = mysqli_fetch_assoc($query))
{
  /**
   * while accepting each row that meets our condtion, we need to declare the $uid(the recipient's id) so that we can know who the sender is and who the recipient is
   */
  if($row['user_id_one'] == $id)
  {
    $uid = $row['user_id_two'];
  }
  else 
  {
    $uid = $row['user_id_one'];
  }
  $cid = $row['chat_id'];//the chat id into $cid for future use
  
  //fetch the recipient data
  $sql = "SELECT * FROM client WHERE unique_id = '$uid'";
  $user = mysqli_fetch_assoc(mysqli_query($connect,$sql));
  $profile = $user['profile_img'];
  $name = $user['name'];
  //fetch the last message in this chat
  $sql = "SELECT * FROM messages WHERE chat_id = '$cid' ORDER BY id DESC LIMIT 1";
  $qu = mysqli_query($connect,$sql);
  $message = mysqli_fetch_assoc($qu);
  $text = $message['text'];
  $time = $message['time'];
  echo'<a href="chat.php?cid='.$cid.'"
      <div class="head space-btwn">
      <span class="seller">
        <span>
      <img style="width:45px;aspect-ratio: 1; border-radius: 50%;" loading="lazy" src="'.$profile.'">
      <div>
       <p style="font-size: 1rem;margin-left: 7px;color: #000">'.$name.'</p>
       <p class="slogan">'.$text.'</p>
      </div>
      <p style="position: absolute;font-size: 9px;color: #aaa;margin-left: 70%;">'.$time.'</p>
      </span>
      </span>
      </div>
      </a>
      ';
}
echo'</div>
<div class="bottom"></div>
    
    
    
    <footer>
      <div onclick="display();" class="footer overlay" id="overlay"></div>
      
      <div id="modal" style="height:auto;" class="footer footer-modal">
        <i style="float: right;font-size:24px;margin-right: 25px;"class="fa-regular fa-xmark"></i>
        <span style="margin-top:50px"></span>
        <p onclick="location = \'sell.php\'"><span class="fi fi-tr-blog-pencil"></span>Make an Ad/Sell product</p>
        <p onclick="location = \'post.php\'"><span class="fi fi-tr-user-pen"></span>Create a Post</p>
        
        </div>
       <a href="index.php"><span class="fi fi-tr-house-window">
        <p>Home</p>
      </span></a>
      <a href="chats.php"><span class="fi fi-tr-message-sms active">
        <p>Chats</p>
      </span></a>
      <a href="videos.php" ><span class="fi fi-tr-circle-video">
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
    </footer>';

?>