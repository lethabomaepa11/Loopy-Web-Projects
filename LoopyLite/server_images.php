<?php
 /* Script name: displayFiles
 * Description: Displays all the files that are
 * stored in a specified directory on the server.
 */
 
 echo "<html><head>
 <link rel='stylesheet' href='css/global.css'/>
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
 </style>
 <title>Server FILES</title></head>
 <body>";
 $dirs =["../LoopyLite/"];

 recurFiles($dirs);
function recurFiles($dirs)
{
   $accessed = [];

 $access = false;

 $file_count = 0;
 echo "<h3 id='info'></h3>";
 foreach ($dirs as $dir)
 {
   if(count($accessed)>0)
   {
     foreach ($accessed as $dirA)
     {
       if($dir == $dirA)
       {
         $access = true;
       }
     }
   }
   if(!$access)
   {
     echo"<br><br><h4>$dir</h4><br>
      <div class='thumbs'>";
     $accessed[] = $dir;
   $dh = opendir($dir); 
   while($filename = readdir($dh)) 
   {
     $filepath = $dir.$filename; 
     if(is_file($filepath)) 
     {
       $files[] = $filepath;
       $file_count++;
     }
     else 
     {
       $dirs[] = $filepath;
     }
   }
   //sort($files);



   foreach($files as $file)

   {
     echo "<hr/>";
     echo "<a href='$file'><img src='$file'/><br>
     $file</a><br/>";
   }
   }
 }
 if(!$access)
 {
   recurFiles($dirs);
 }
}
 echo"
 </div>
 <script>
 document.getElementById('info').textContent = '$file_count Files on server';
 </script>";
?>
