<?php
require_once("php/session.php");
require_once("php/db.php");
$cid = htmlspecialchars($_GET['cid']);
if($_SERVER['REQUEST_METHOD'] == "POST")
{
  if(isset($_GET['cid']))
  {
    $cid = htmlspecialchars($_GET['cid']);
    //check if it exists
    $sql = "SELECT * FROM chats WHERE chat_id = '$cid'";
    $query = mysqli_query($connect,$sql);
    if(isset($_FILES['wallpaper']) && mysqli_num_rows($query) > 0)
    {
      $allowed = ["jpeg","jpg","gif","png"];
      $tmp = $_FILES['wallpaper']['tmp_name'];
      $name = $_FILES['wallpaper']['name'];
      $size = $size['wallpaper']['size'];
      
      $ext = explode(".",$name);
      $ext = end($ext);
      if(in_array($ext,$allowed))
      {
        $name = "wp.".uniqid().$id;
        $name = str_shuffle($name).".".$ext;
        $path = "assets/users/files/image/".$name;
        if(move_uploaded_file($tmp,$path))
        {
          //if this user wants to replace their wallpaper
          $sql = "SELECT * FROM chat_wallpaper WHERE chat_id = '$cid' AND user_id = '$id'";
          $query = mysqli_query($connect,$sql);
          if(mysqli_num_rows($query)>0)
          {
            $del = mysqli_fetch_assoc($query);
            $del_file = $del['file_path'];
            unlink($del_file);//apply error handling
            $sql = "UPDATE chat_wallpaper SET file_path = '$path' WHERE chat_id = '$cid' AND user_id = '$id'";
          }
          else
          {
           $sql = "INSERT INTO chat_wallpaper(chat_id,user_id,file_path) VALUE('$cid','$id','$path')";
          }
          
          if(mysqli_query($connect,$sql))
          {
            header("location: chat.php?cid=".$cid);
          }
          else 
          {
            $error = "Failed to add wallpaper";
          }
        }
        else 
        {
          $error = "Failed to upload wallpaper";
        }
      }
      else
      {
        $error = "Only an image file is allowed";
      }
    }
    else 
    {
      //chat doesnt exist
      header("location: chats.php");
    }
  }
  else 
  {
    header("location: chats.php");
  }
}

echo'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <meta name="theme-color" content="#fff"/>
  <link href="assets/css/fontawesome.css" rel="stylesheet">
    <link href="assets/css/brands.css" rel="stylesheet">
    <link href="assets/css/solid.css" rel="stylesheet">
  <link rel="stylesheet" href="css/global.css">
  <link rel="stylesheet" href="css/second.css">
  <link href="assets/uicons-thin-rounded/css/uicons-thin-rounded.css" rel="stylesheet">
  <script src="js/index.js"></script>
  <script src="js/jquery/jquery-3.7.1.slim.min.js"></script>
  <title>Chat Settings</title>
  <style>
  .outlined-btn
  {
    margin: 0; 
    width: 100%;
    margin-block: 2px;
    border: 1px solid ;
    text-align: left;
  }
  .outlined-btn i
  {
    color: #0b5275;
  }
  .outlined-btn i:hover
  {
    color: #fff;
  }
  form
  {
    display: none;
    
  }

  </style>
 </head>
 <header><span><i onclick="history.back()" class="fa fa-arrow-left float-left"></i><h4 style="text-align: center;"> Chat Settings</h4></span></header>
 <body>
 <div style="margin-top: 55px"></div>
   <p class="error-msg">'.$error.'</p>
 <div class="head">
  <br>
  <button onclick="show()" class="outlined-btn">
  <i class="fa fa-image"></i> Change Wallpaper</button>
  <form id="form" action="#" method="POST" enctype="multipart/form-data">
 <h4>Wallpaper</h4>
  <input type="file" name="wallpaper" accept=".jpeg,.gif,.jpg,.png">
  <br>
  <button>Submit</button>
  <br><br>
  </form>
  
  
  <button onclick="proceed(\'clear\',\'cid\',\''.$cid.'\',\'php/chat.action.php\')" class="outlined-btn"><i class="fa fa-xmark"></i> Clear chat</button>
  <button onclick="proceed(\'delete\',\'cid\',\''.$cid.'\',\'php/chat.action.php\')" style="border: 1px solid red;color: red;" class="outlined-btn"><i style="color: red;" class="fa fa-trash-alt"></i> Delete chat</button>
'; require_once("confirm.php");
echo'
 </body>
 </html>
 ';
 ?>