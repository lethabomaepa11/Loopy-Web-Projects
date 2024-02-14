<?php

if(isset($_GET['cid']) && isset($_GET['act']))
{
  require_once("session.php");
  require_once("db.php");
  $cid = $_GET['cid'];
  $action = $_GET['act'];
  
  $sql = "SELECT * FROM chats WHERE chat_id = '$cid'";
  $query = mysqli_query($connect,$sql);
  
  if(mysqli_num_rows($query)>0)
  {
    $chat = mysqli_fetch_assoc($query);
    if($id == $chat['user_id_one'] || $id == $chat['user_id_two'])
    {
      if($action == "delete")
      {
        //messages
        $sqls = ["DELETE FROM messages WHERE chat_id = '$cid'","DELETE FROM files WHERE post_id = '$cid'","DELETE FROM chats WHERE chat_id = '$cid'","DELETE FROM chat_wallpaper WHERE chat_id = '$cid'"];//this deletes for both
        foreach ($sqls as $sql)
        {
          if(mysqli_query($connect,$sql))
          {
            echo "deleted";
          } 
        }
        header("location: ../chats.php");
      }
      else if($action == "clear")
      {
        $sql = "SELECT * FROM messages WHERE chat_id = '$cid'";
        $query = mysqli_query($connect,$sql);
        
        while($row = mysqli_fetch_assoc($query))
        {
          $message_id = $row['message_id'];
          $disconnect_user = $row['disconnect_user'];
          
          if($disconnect_user == "none")
          {
           $sql = "UPDATE messages SET disconnect_user = '$id' WHERE message_id = '$message_id'";
          }
         else
         {
           if($disconnect_user != $id)
           {
             $to = "all";
             $sql = "UPDATE messages SET disconnect_user = '$to' WHERE message_id = '$message_id'";
           }
         }
        }
        
        //header("location: ../chats.php");
      }
      else
      {
        header("location: ../chats.php");
      }
    }
  }
  else 
  {
    //this chat is not available
    header("location: ../chats.php");
  }
}