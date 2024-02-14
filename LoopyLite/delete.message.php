<?php

/**
 * When a message or a chat is deleted by one user, it should only be deleted and not visible to that user but visible to the other unless if the message was deleted for everyone
 * for messages, when the chats are cleared, all the messages are updated, the "disconnect_user" will be set to the logged in user. then the messages will not be displayed, this includes the deleted messages
 * The delete for everyone deletes the chat for both, just like in telegram
 */
 require_once("php/db.php");
 require_once("php/session.php");
 
 if(isset($_GET['mid']) && isset($_GET['cid']) && isset($_GET['qry']))
 {
   $cid = $_GET['cid'];
   $mid = htmlspecialchars($_GET['mid']);
   $qry = htmlspecialchars($_GET['qry']);
   if($qry == "del.me")
   {
     $sql = "SELECT * FROM messages WHERE message_id = '$mid'";
     $query = mysqli_query($connect,$sql);
     
     $row = mysqli_fetch_assoc($query);
     if($row['disconnect_user'] == "none")
     {
       $sql = "UPDATE messages SET disconnect_user = '$id' WHERE message_id = '$mid'";
     }
     else
     {
       if($row['disconnect_user'] != $id)
       {
         $to = "all";
         $sql = "UPDATE messages SET disconnect_user = '$to' WHERE message_id = '$mid'";
       }
     }
   }
   else if($qry == "del.every")
   {
     $sqls = ["DELETE FROM messages WHERE message_id= '$mid'","DELETE FROM files WHERE post_id = '$mid'"];//this deletes for both
        foreach ($sqls as $sql)
        {
          mysqli_query($connect,$sql);
        }
   }
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
   if(isset($_GET['cid']))
   {
     $cid = $_GET['cid'];
     header("location: chat.php?cid=".$cid);
   }
   else
   {
     header("location: chats.php");
   }
 }