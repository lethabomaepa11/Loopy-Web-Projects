<?php
require_once("php/session.php");
require_once("php/db.php");
if(isset($_GET['cid']))
{
  //insert message in database;
  $text = $_POST['message'];
  $reply_to = "none";
  if(isset($_GET['reply']) && !empty($_GET['reply']))
  {
    $reply_to = $_GET['reply'];
  }
  if(isset($_FILES['file']))
  {
    $cid = htmlspecialchars($_GET['cid']);
    $time = date("F j, Y - G:i", time());
    $message_id = uniqid()."/message/".$cid;
    $message_id = str_shuffle($message_id);
    $text = htmlspecialchars($text);
    $sql = "INSERT INTO messages(chat_id,user_id,text,message_id,time,reply_to) VALUES('$cid','$id','$text','$message_id','$time','$reply_to')";
    if(mysqli_query($connect,$sql))
    {
      $file = "file";
      //update the last_modified
      $last_modified = date("Y-m-d G-i-s", time());
      $sql = "UPDATE chats SET last_modified = '$last_modified' WHERE chat_id = '$cid'";
      mysqli_query($connect,$sql);
      //header("location: chat.php?cid=".$cid);
        if(isset($_FILES[$file]) && !empty($_FILES[$file]))
    {
      $not_allowed = ["exe","bat","py","cpp","js","php","ini","bin"];
      $video = ["mp4","webm","mkv","3gp"];
      $audio = ["mp3","m4a","wav","ogg"];
      $image = ["jpeg","jpg","png","gif"];
      //upload the file to Files table.
      $file_name = htmlspecialchars($_FILES[$file]['name']);
      $file_tmp = $_FILES[$file]['tmp_name'];
      $file_size = $_FILES[$file]['size'];
      $ext = explode(".",$file_name);
      $ext = strtolower(end($ext));
      
      if(in_array($ext,$video))
      {
        $type = "video";
      }
      else if(in_array($ext,$audio))
      {
        $type = "audio";
      }
      else if(in_array($ext,$image))
      {
        $type = "image";
      }
      else
      {
        $type = "document";
      }
      
      if(!in_array($ext,$not_allowed))
      {
        $path = "assets/users/files/";
        //must be example document/filename
        $path = $path.$type."/".$file_name;
        if(move_uploaded_file($file_tmp,$path))
        {
          //record to db
          //$post_id = $cid."&".$id;deconstruct it upon display by exploding it into 2
          $sql = "INSERT INTO files(post_id,name,path,type) VALUES('$message_id','$file_name','$path','$type')";
          if(mysqli_query($connect,$sql))
          {
            header("location: chat.php?cid=".$cid);
          }
          else
          {
            header("location: chat.php?cid=".$cid);
          }
        }
        else
        {
          header("location: chat.php?cid=".$cid);
        }
      }
      else
      {
        header("location: chat.php?cid=".$cid);
      }
    }
    else
    {
      header("location: chat.php?cid=".$cid);
    }
    }
  }
}