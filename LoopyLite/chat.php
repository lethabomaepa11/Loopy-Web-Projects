<?php

/**
 * Page: chat
 * Author: Lethabo Maepa
 * Description: This page should display text/multimedia messages between two users and also allow the logged in user to send and receive messages
 * chat_id = the id used to identify this chat and its contents; will be used to send and retrieve messages to and from the database on the server; related to messages, wallpaper and files tables.it is passed on the link as "cid"/ GET method used and identified as $_GET['cid'];
 * If the chat_id is not set, then redirect to chats.php but if the uid is set, create a new chat shared by the logged in user and the user who's id is passed in on the link as uid(user_id), ONLY CREATE A NEW CHAT IF THERE IS NO CHAT WHERE THESE TWO USERS ARE BOTH IN TO AVOID CHAT DUPLICATES.
 */
require_once("php/session.php");
require_once("php/db.php");
function displayfiles($files)
{
  $file_type = $files['type'];
  $file_path = $files['path'];
  
  //echo "$filestype";
  if($files['type'] == "audio")
            {
              echo'
              <audio controls="true" loading="lazy"><source src="'.$file_path.'"/></audio>';
            }
            else if($files['type'] == "image")
            {
              echo'
              <img loading="lazy"src="'.$file_path.'">';
            }
            else if($files['type'] == "video")
            {
              echo'<video controls="true"loading="lazy"><source src="'.$file_path.'"/></video>';
            }
            else if($files['type'] == "document")
            {
              echo'
              <div class="thumbs">
              <a href="'.$file_path.'">'.$files["name"].'</a>
              </div>';
            }
}
if(isset($_GET['cid']))//chat_id
{
  $cid = htmlspecialchars($_GET["cid"]);
  //check if this user is allowed to see this chat
  $sql = "SELECT * FROM chats WHERE chat_id = '$cid' AND (user_id_one = '$id' OR user_id_two = '$id')";
  $query = mysqli_query($connect,$sql);
  if(mysqli_num_rows($query)>0)
  {
    $data = mysqli_fetch_assoc($query);
   
    if($data['user_id_one'] == $id)
    {
      //then user_id_two is the reciepient
      $receiver = $data["user_id_two"];
    }
    else
    {
      //then user_id_two is the reciepient
      $receiver = $data["user_id_one"];
    }
    $sql = "SELECT * FROM client WHERE unique_id = '$receiver'";
    $receiver = mysqli_fetch_assoc(mysqli_query($connect,$sql));//receiver info
    $profile = $receiver['profile_img'];
    $name = $receiver['name'];
    
    $sql = "SELECT * FROM messages WHERE chat_id ='$cid' ORDER BY id DESC";
    $query = mysqli_query($connect,$sql);
  
    if(mysqli_num_rows($query)>0)
    {
      //update chat
      while($row = mysqli_fetch_assoc($query))
      {
        $messages[] = $row;
      }
      
    }
    else
    {
      //no messages found
      
    }
}
else
{
  header("location: chats.php");
}
}
else
{
  //create a new chat.
  if(isset($_GET['uid']))
  {
    $uid = htmlspecialchars($_GET['uid']);
    
    $sql = "SELECT * FROM chats WHERE (user_id_one = '$id' AND user_id_two = '$uid') OR (user_id_one = '$uid' AND user_id_two = '$id')";
    if(mysqli_num_rows(mysqli_query($connect,$sql)) == 0)
    {
      //check before inserting to avoid duplication
      $last_modified = date("YmdGis", time());
      $cid = uniqid()."-".$last_modified."LoopyLite";
      $cid = str_shuffle($cid);
      
      $sql = "INSERT INTO chats(chat_id,user_id_one,user_id_two,last_modified) VALUES('$cid','$id','$uid','$last_modified')";
      if(mysqli_query($connect,$sql))
      {
        header("location: chat.php?cid=".$cid);
      }
    }
    else
    {
      $chat = mysqli_fetch_assoc(mysqli_query($connect,$sql));
      $cid = $chat['chat_id'];
      header("location: chat.php?cid=".$cid);
    }
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
  <title>'.$name.' in Chat - LoopyLite</title>
  <style>
   *
   {
     font-family: Arial;
   }
   img
   {
     border: 1px solid #ddd;
   }
    .seller
    {
      display: flex;
      flex-direction: row;
      padding-block: 0;
    }
    .seller i
    {
      font-size: 20px;
      margin-right: 10px;
    }
 
    footer
    {
      display: flex;
      flex-direction: row;
      align-items: end;
      padding-left: 3px;
      height: auto;
      max-height: 220px;
      padding-block: 5px;
      overflow: hidden;
      background-color: #eee;
      border: none;
    }
    footer i,button
    {
      font-size: 22px;
      margin-inline: 5px;
      border-radius: 25px;
      padding: 10px;
      color: #0b5275;
      width: fit-content;
    }
    .fa-add
    {
      /*position: absolute;
     transform: rotate(90deg);*/
       
    }
    button
    {
      padding: 0;
      margin-block: 0;
      background-color: transparent;
      float: right;
    }
    .fa-paper-plane
    {
      transform: rotate(10deg);
      transform: translateX(2%);
      background-color: #1579aa;
    }
    textarea
    {
      resize: none;
      width: 70%;
      border-radius: 15px;
      height: 30px;
      background-color: #ddd;
      font-size: 16px;
      max-height: 130px;
      padding:10px;
      padding-bottom: 10px;
      outline: none;
    }
    textarea:active,textarea:focus
    {
      border: 2px solid #0b5275;
    }
    .chat-container
    {
    
      height: 100%;
      width: 100%;
      display: flex;
      flex-direction: column-reverse;
     overflow-y: auto;
     ';
     $sqlWp = "SELECT file_path FROM chat_wallpaper WHERE chat_id = '$cid' AND user_id = '$id'";
     $queryWp = mysqli_query($connect,$sqlWp);
     $wallpaper = mysqli_fetch_assoc($queryWp);
     $wallpaper = $wallpaper['file_path'];
     echo'
     background: url("'.$wallpaper.'");
     background-position: center;
     background-size: cover;
    }
    .chat
    {
      width: 100%;
      margin-block: 5px;
      
    }
    .send,.receive
    {
      max-width: 70%;
      width: fit-content;
      height: auto;
      margin-inline: 4px;
      /*margin-block: 10px;*/
      padding: 0;
      padding-inline: 8px;
      font-size: 15px;
      border-radius: 15px 15px 0 15px;
      white-space: wrap;
    }
    .send
    {
      float: right;
      background-color: #0b5275;
      color: #fff;
    }
    .receive
    {
     border-radius: 0 15px 15px 15px;
      background-color: #eee;
     /* margin-top: 5px;*/
      float: left;
      color: #1f1f1f;
    }
    
    .media img,.media video,.media audio
    {
      border: 1px solid #0b5275;
      border-radius: 8px;
      max-width: 98%;
      margin-top: 10px;
    }
    .media audio
    {
       background-color: #eee;
       border: 2px solid #0b5275;
    }
    .from
    {
      float: left;
      height: 35px;
      width: 35px;
      border-radius: 50%;
      aspect-ratio: 1;
      
    }
    .thumbs
    {
      max-width: 100%;
    }
    .thumbs a 
    {
      float: right;
      background-color: #e15656;
      max-width: 100%;
    }
    .time
    {
      font-size: 8px;
      color: #bbb;
      text-align: center;
      float: right;
    }
    input
    {
      width: 85%;
    }
    header
    {
      background-color: #eee;
    }
    .forMessage
    {
      
      position: relative;
      width: 50%;
      background-color: rgba(255,255,255,0.9);
      border-radius: 8px;
      margin-inline: 10px;
      margin-block: -3px;
      padding-block: 10px;
      display: none;
      border-radius: 25px;
      animation: appear 0.3s ease-in-out;
      box-shadow: 0 6px 9px rgba(0,0,0,0.4);
    }
    .forMessage ul li
    {
      display: block;
      margin-block: 5px;
      margin-left: -25px;
      font-size: 1.05rem;
      padding: 8px;
      border-radius: 8px;
    }
    .forMessage ul li:hover
    {
      background-color: #ddd;
    }
    .forMessage ul li i 
    {
      margin-inline: 5px;
    }
    @keyframes display{
      from{
        
      }
      to
      {
        
      }
    }
    .input_reply
    {
      width: 100%;
      border-radius: 25px;
      display: flex;
      flex-direction: column;
    }
    .input_reply .inputs
    {
      width: 100%;
      border-radius: 25px;
      display: flex;
      flex-direction: row;
      align-items: end;
    }
    .reply 
    {
      width: 70%;
      margin-left: 50px;
      margin-top: 20px;
      background-color: rgb(220,220,220,0.9);
      max-height: 100px;
      overflow: hidden;
      border-radius:4px;
      display: none;
      padding-inline: 5px;
      margin-block: 5px;
      border: 1px solid #22cb54;
    }
    .chat .reply
    {
      margin-left: 10px;
    }
    .reply pre 
    {
      font-size: 11px;
      color: #303030;
    }
    .chat .reply
    {
      width: 80%;
      border-radius: 4px;
    }
  </style>

  </head>
  <body>
    <header>
      <span class="seller">
        <i onclick="location.href = \'chats.php\'"class="fa-regular float-left fa-arrow-left"></i>
        <span>
        <img style="width:35px;aspect-ratio: 1; border-radius: 50%;" src="'.$profile.'">
        <h5>'.$name.'</h5>
        
        </span>
      </span>
      <i style="color: #0b5275" onclick="location.href = \'chat.settings.php?cid='.$cid.'\'"class="fa-regular fa-gear float-right"></i>
    </header>
    <div style="margin-top: 55px"></div>
    <div class="chat-container">
      <br><br><br><br>';
      
        foreach ($messages as $message)
        {
          //use message_id to display the files
          $message_id = $message["message_id"];
          $disconnect_user = $message['disconnect_user'];
          
          if($id != $disconnect_user && $disconnect_user != "all")
          {
          $sql = "SELECT * FROM files WHERE post_id = '$message_id'";
          $query = mysqli_query($connect,$sql);
          $files = mysqli_fetch_assoc($query);
          $text = $message['text'];
          $time = $message['time'];
          $reply_to = $message['reply_to'];
          
        if($message['user_id'] != $id)
        {
          $uid = $message['user_id'];
          echo'
          <div class="chat">
            
          <a href="account.php?uid='.$uid.'">
            <img class="from" src="'.$profile.'"></a>
            <div onclick="messageOptions(\''.$message_id.'\')" class="receive">
            ';
            $qsl = "SELECT text FROM messages WHERE message_id = '$reply_to'";
            $reply_text = mysqli_fetch_assoc(mysqli_query($connect,$qsl));
            $reply_text = $reply_text['text'];
            if(mysqli_num_rows(mysqli_query($connect,$qsl))>0)
            {
              echo'
              <div style="display: block" class="reply">
              <pre>'.$reply_text.'</pre>
              </div>';
            }
            echo'
            <div class="media">
            ';
            displayfiles($files);
             echo'</div>
            ';
            $arrContain = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9"];
            $contain = false;
            for($p = 0; $p<count($arrContain);$p++)
            {
              if(str_contains(strtolower($text),$arrContain[$p]))
              {
                $contain = true;
              }
            }
            if(strlen($text)<10 && $contain == false)
            {
              echo' <pre style="font-size: 3rem">';
            }
            else 
            {
              echo'<pre>';
            }
            echo''.$text.'</pre>
          <p class="time" style="color: #2f2d2dce;float: left;">'.$time.'</p>
          </div>
          <div id="'.$message_id.'" style="float: left;" class="forMessage">
              <ul>
              <li onclick="replyMessage(`'.$text.'`,`'.$message_id.'`)"><i class="fa fa-reply"></i>Reply</li>
              <li onclick=""><i class="fa fa-mail-forward"></i>Forward</li>
              <li onclick="location.href = `delete.message.php?cid='.$cid.'&mid='.$message_id.'&qry=del.me`"><i class="fa fa-trash-alt"></i>Delete</li>
              </ul>
            </div>
        </div>
        ';
        }
        else 
        {
          echo'
          <div class="chat">
            <div onclick="messageOptions(\''.$message_id.'\')" class="send">
            ';
            $qsl = "SELECT text FROM messages WHERE message_id = '$reply_to'";
            $reply_text = mysqli_fetch_assoc(mysqli_query($connect,$qsl));
            $reply_text = $reply_text['text'];
            if(mysqli_num_rows(mysqli_query($connect,$qsl))>0)
            {
              echo'
              <div style="display: block" class="reply">
              <pre>'.$reply_text.'</pre>
              </div>';
            }
            echo'
            <div class="media">
            ';
            //echo $files['type'];
            displayfiles($files);
            echo'</div>
            ';
            $arrContain = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9"];
            $contain = false;
            for($p = 0; $p<count($arrContain);$p++)
            {
              if(str_contains(strtolower($text),$arrContain[$p]))
              {
                $contain = true;
              }
            }
            if(strlen($text)<10 && ($contain == false))
            {
              echo' <pre style="font-size: 3rem">';
            }
            else 
            {
              echo'<pre>';
            }
            echo''.$text.'</pre>
              <p class="time">'.$time.'</p>
            </div>
            <div id="'.$message_id.'" style="float:right;border-radius: 25px 0 25px 25px;" class="forMessage">
              <ul>
              <li onclick="replyMessage(`'.$text.'`,`'.$message_id.'`)"><i class="fa fa-reply"></i>Reply</li>
              <li onclick=""><i class="fa fa-mail-forward"></i>Forward</li>
              <li onclick=""><i class="fa fa-pen"></i>Edit</li>
              <li onclick="location.href = `delete.message.php?cid='.$cid.'&mid='.$message_id.'&qry=del.me`"><i class="fa fa-trash-alt"></i>Delete for me</li>
              
              <li style="color: red" onclick="location.href = `delete.message.php?cid='.$cid.'&mid='.$message_id.'&qry=del.every`"><i class="fa fa-trash-can"></i>Delete for everyone</li>
              </ul>
            </div>
          </div>
          ';
        }
        }
        }
        echo'
    
    
    
    <div style="margin-bottom: 100px;"></div>
    <form id="form" action="message.php?cid='.$cid.'" method="POST" enctype="multipart/form-data">
    <footer>
   
    <div onclick="display();" class="footer overlay" id="overlay"></div>
          <div id="modal" style="z-index: 4;height:auto;" class="footer footer-modal">
          <h5>Send an attachment</h5>
      
        <input name="file" type="file"/>
        </div>
        
      <div class="input_reply">
      <div class="reply">
      <pre id="replyReview"></pre>
      </div>
      <div class="inputs">
      <i onclick="display(true);" class="fa-regular fa-add" style="z-index: 3"></i>
      <textarea style="z-index: 2" name="message" placeholder="Message..." id="textbox"></textarea>
      
      <button style="z-index: 5"><i style="color: #fff;padding: 10px;"class="fa-regular fa-paper-plane">
      </i></button>
      </div>
      </div>
    </footer>
    </form>
      <script>
      function messageOptions(id)
      {
        const messages = document.getElementsByClassName("forMessage");
       for(var x = 0; x < messages.length; x++)
        {
          messages[x].style.display = "none";
        }
        //display the one clicked
        const element = document.getElementById(id);
        
        if(element.style.display == "none")
        {
          element.style.display = "block";
        }
        else 
        {
          element.style.display = "none";
        }
        
      }
      
      function replyMessage(text,message_id)
      {
        const replyReview = document.getElementById("replyReview");
        const replyEl = document.getElementsByClassName("reply");
        for(var i = 0; i<replyEl.length;i++)
        {
          replyEl[i].style.display = "block";
        }
        replyReview.textContent = text;
        //change form action attribute
        const form = document.getElementById("form");
        form.setAttribute("action","message.php?cid='.$cid.'&reply="+message_id);
        const element = document.getElementById(message_id);
        element.style.display = "none";
      }
      
      function display(display = false)
    {
      const modal = document.getElementById("modal");
      const overlay = document.getElementById("overlay");
      if(display==true)
      {
        modal.style.display = "block";
        overlay.style.display = "block";
      }
      else
      {
        modal.style.display = "none";
        overlay.style.display = "none";
      }
    }
      let scroll = false;
  const body = document.body;
  body.addEventListener("scroll",function()
  {
    scroll = true;//check if user is scrolling
  });
  $(document).ready(function(){
   var text = $("#textbox").attr("placeholder");
   console.log(text);
   if(!scroll)
   {
     window.scrollTo(0,document.body.scrollHeight);
   }
    function focused()
    {
      const icons = document.getElementsByClassName("media");
      const textarea = document.getElementById("textbox");
      
      if(textarea.width == "60%")
      {
        for(var i = 0; i < icons.length; i++)
        {
          icons[i].display = "none";
        }
        textarea.width == "80%";
      }
      else
      {
        for(var i = 0; i < icons.length; i++)
        {
          icons[i].display = "block";
        }
        textarea.width == "60%";
      }
    }
  });
    
  </script>
  </body>
</html>
';
?>