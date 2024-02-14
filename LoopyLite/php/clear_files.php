<?php
/***
 * This is a script that will delete unused files from the server
 * I will iterate and check every file on the server and compare it to where it is supposed to be on the the database, if it does not exist,then delete...or to be on the safe side and avoiding deleting ones that are currently being used, i will check on every field.
 * note that this script is one dir/folder below the assets folder, that is why i concatenate the "../" before the variable $dir, the directories/paths of the files are stored without the one Directory above"../" thing in the database as these files are accessed by files/pages on the sane level the assets folder
 */
  require_once("db.php");//used for database connection
  
 $dirs = ["assets/images/client/profile/","assets/images/client/cover/","assets/images/client/products/","assets/users/files/image/","assets/users/files/audio/","assets/users/files/document/","assets/users/files/video/"]; //all the files on this server are on these directories
 $del = 0;//number of files to delete
 $tbd = [];//will include the files to be deleted
 echo'<!DOCTYPE html>
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
 
 <header id="header" style="display: none;position: fixed;top:background-color: #fff;z-index: 1; font-size: 1rem; 0;width: 100%;left: 0;"></header>
 <body>';//not important
 
 foreach ($dirs as $dir)
{
  //for each directory in array of directories
  
  $dh = opendir("../".$dir);//open the Directory
  echo "<h3>Accessing Directory: </h3>$dir...<br>";//if you want to follow how this program works
  while($filename = readdir($dh))
  {
    //while still getting filename
    $filepath = $dir.$filename;//remember the "../", get filepath
    echo "<br><b>Accessing file:</b><br>$filepath<br>";
    //check if it is a file
    if(is_file("../".$filepath))
    {
      //it is a file
      /***
       * check the file if it is referenced on any entry in the database, the arrays of  tables and fields of where files could be referenced are below
       * profile_img and cover_img share the same table
       *!!!!The database will be normalized soon, all the files will be on one table regardless of where they are used.!!!!
       */
      $tables = ["client","products","files","chat_wallpaper"];
      $fields = ["profile_img","cover_img","image","path","file_path"];
      $i = 0;
      $found = false;
      for($x = 0; $x < count($fields);$x++)
      {
        $i++;
        if($x<2)
        {
          $i = 0;
          //cover_img and profile_img
        }
        
        $table = $tables[$i];
        echo "<br><b>Checking file in database</b><br><b>Table:</b> $table<br>
          <b>Field:</b>$fields[$x]<br>";
          $filepathSQL = htmlspecialchars($filepath);//all files uploaded and referenced on the database were sanitized, anyways it does not matter much, but its safer to do it this way.
          $sql = "SELECT * FROM $table WHERE $fields[$x] = '$filepathSQL'";
          $query = mysqli_query($connect,$sql);
          if(mysqli_num_rows($query) != 0)
          {
            //if referenced on a table somewhere
            $found = true;
            break;
          }
      }
      echo "found: $found";
      if(!$found)
        {
          $del++;
          echo "<br>$filepath to be deleted<br>";
          $tbd[] = $filepath;
        }
    }
  }
}
echo "<br>
<h4>Action</h4><br>$del files to be deleted";

if($del>0)
{
  $count = 0;
 
  foreach ($tbd as $item)
  {
    $count++;
    $percent = ($count/count($tbd))*100;
    unlink("../".$item);
    if(!is_file("../".$item))
    {
      echo "<br>Deleting $item<br><br>
      $percent% completed...";
    }
    else
    {
      echo "<br>Failed to delete file: $item";
    }
  }
  echo "<br>completed...";

}
else 
{
  echo "
  
  <script> 
  window.scrollTo(0,document.body.scrollHeight);
  setTimeout(function()
  {
    document.getElementById('header').style.display = 'block';
    document.getElementById('header').textContent = 'Every file is in use in the app, this page will clear in 10seconds...';
    
    setTimeout(function()
    {
      document.body.innerHTML = 'Everything Seems alright';
    },10000);
  },3000);
  </script>
  </body>
  </html>";
}
?>