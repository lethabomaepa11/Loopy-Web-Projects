<?php

if($_SERVER['REQUEST_METHOD'] == "POST")
{
  require_once("php/db.php");
  require_once("php/session.php");
  $error = "";
    $text = $_POST['text'];
  if(strlen($text)>0)
  {
    $text = htmlspecialchars($text);
  }
  else
  {
    $text = ".";
  }
  //create Post id
  $post_id = "/".uniqid()."/".$id;//just experimenting
  $post_id = str_shuffle($post_id);
  
  $nums = ["one","two","three","four","five"];
  $isset_count = 0;
  $sql_arr = [];
  for($x = 0;$x < 5; $x++)
  {
    $file = "file_".$nums[$x];
    if(isset($_FILES[$file]))
    {
      $not_allowed = ["exe","bat","py","cpp","js","php","ini","bin"];
      $video = ["mp4","webm","mkv","3gp"];
      $audio = ["mp3","m4a","wav","ogg"];
      $image = ["jpeg","jpg","png","gif"];
      //upload the file to Files table.
      $isset_count++;
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
          $sql = "INSERT INTO files(post_id,name,path,type) VALUES('$post_id','$file_name','$path','$type')";
          $sql_arr[] = $sql;//cannot add these files yet...because the post has not been created yet
          
        }
        else
        {
          $isset_count--;
          $error = "File(s) not uploaded";
        }
      }
      else
      {
        $error = "\".".$ext."\" files are not allowed";
      }
    }
  }
  
  if($isset_count == 0 && strlen($text)<1)
    {
      $error = "Type in text or upload at least one file";
    }
    else 
    {
      
      foreach($sql_arr as $sql)
      {
        mysqli_query($connect,$sql);
      }
      $sql = "INSERT INTO post(post_id,text,user_id) VALUES('$post_id','$text','$id')";
      echo($isset_count);
      if(mysqli_query($connect,$sql))
      {
        header("location: index.php");
      }
    }
  
}


?>
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
  <title>LoopyLite Online Market</title>
  <style>
    form
    {
      display: grid;
      grid-template-columns: 1fr;
      align-items: center;
      width: 94%;
      margin-inline: 2%;
      row-gap: 3px;
      margin-block: 65px;
    }
   textarea
    {
      max-width: 100%;
      min-width: 100%;
      width: 100%;
      background-color: #fff;
      border: 2px solid #000;
      justify-self: center;
      height: 150px;
      resize: none;
      font-size: 0.9rem;
    }
    label
    {
      display: flex;
      align-self: center;
    }
    .slogan
    {
      padding: 0;
      margin: 0;
    }
    input
    {
      width: 90%;
      background-color:#eee5;
      animation: appear 0.3s ease-in-out;
    }
    .float-left
    {
      margin-top: 0;
    }
    .inline 
    {
      position: fixed;
      top: 0;
      display: flex;
      align-items: center;
      width: 100%;
      background-color: #fff;
      z-index: 3;
      left: 0;
      border-bottom: 1px solid #ddd;
      height: 50px;
    }
    .inline h5
    {
      margin-left: 10px;
    }
    .file
    {
      display: none;
    }
    #error
    {
      color: #c35a5a;
    }
    .btn_txt
    {
      width: fit-content;
      margin: 0;
      background-color: #fff;
      color:#0b5275;
      text-align: left;
    }
    .btn_txt:hover
    {
      box-shadow: none;
      
    }
  </style>
  <script>
    function showFile(index = 0)
    {
      const files = document.getElementsByClassName("file");
      
      if(index==5)
      {
        document.getElementById("error").textContent = "Maximum files reached, only a max of 5 files allowed.";
      }
      else
      {
        files[index].style.display = "block";
        index++;
        document.getElementById("addFile").setAttribute("onclick","showFile("+index+")");
        document.getElementById("file_count").textContent = (index)+" file(s) to upload";
      }
      
    }
  </script>
  </head>
  <body>
    <form action="javascript:void(0)" method="post" enctype="multipart/form-data">
      <span class="inline">
        <i onclick="history.back()" class="fa fa-arrow-left float-left"></i>
        <span style="width: 100%" class="space-btwn">
          <h5>Create a Post</h5>
          <button class="btn_txt">POST</button>
        </span>
        
      </span>
      <textarea name="text" placeholder="What's on your mind?"></textarea>
      <label for="file">Upload File - <p class="slogan"> optional (upload up to 5 files)</p></label>
      
      <button class="btn_txt" id="addFile" onclick="showFile()"><i class="fa fa-plus"></i> Add file</button>
      
      <p class="slogan" id="error"><?php echo $error;?></p>
      
      <fieldset>
        <legend>Files</legend>
        <p style="color:#000"class="slogan"id="file_count">No files yet</p>
        <input class="file" name="file_one" type="file" placeholder="Upload File">
        <input class="file" name="file_two" type="file" placeholder="Upload File">
        <input class="file" name="file_three" type="file" placeholder="Upload File">
        <input class="file" name="file_four" type="file" placeholder="Upload File">
        <input class="file" name="file_five" type="file" placeholder="Upload File">
        </fieldset>
        
        <div class="bottom"></div>
        <footer style="display: flex;border: none;">
          <button formaction="post.php" style="width: 100%;height: 45px">Post</button>
        </footer>
    </form>
  </body>

</html>