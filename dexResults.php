<?php

require("database.php");
$search = htmlspecialchars($_GET['search']);
//search = "download";
if(strlen($search)>0)
{
$words = explode(" ",$search);
$return_arr = [];
$arrQuery = [];
for($x = 0; $x<count($words);$x++)
{
  //act on each word
  $word = htmlspecialchars($words[$x]);//download
 // echo 'word = '.$word.'<br>';
  $letter = htmlspecialchars($word[0]);
  for($y = 0; $y<strlen($word); $y++)
  {
    /*** Steps for word "download"
     * d
     * do
     * dow
     * down
     * downl...
    */
    //echo'Letter: '.$letter.'<br>';
    $sql = "SELECT * FROM sites WHERE name LIKE '%$letter%' or description LIKE '%$letter%' or url LIKE '$letter%' or dateCreated LIKE '$letter%' order by dateCreated DESC";
   $query = mysqli_query($con,$sql);
   $results = mysqli_num_rows($query);
   if($results>0)
   {
     $arrQuery = [];//clear array
     for($p = 0; $p<$results;$p++)
     {
       $arrQuery[$p] = mysqli_fetch_assoc($query);
     }
   }
   $letter = $letter.$word[$y+1];
    
  }
  
  //transfer elements to the results array
  $return_arr = array_merge($return_arr,$arrQuery);
  //$return_arr = array_unique($return_arr);
  //$return_arr = $return_arr + $arrQuery;
  //delete duplicates
  /***
   * code will be below
  */
}
$num = count($return_arr);
}
else 
{
  $search = "Nothing was searched";
  $num = "no";
}
//search query

echo'

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="Bankyio/assets/css/fontawesome.css" rel="stylesheet">
    <link href="Bankyio/assets/css/brands.css" rel="stylesheet">
    <link href="Bankyio/assets/css/solid.css" rel="stylesheet">
  <link rel="stylesheet" href="dex.css">
  <script src="js/index.js"></script>
  <title>PyDEX - Results for '.$search.' </title>
  <style>
    .resultTab
    {
      display: inline-block;
      height: 180px;
      width: 100%;
      border-bottom: 1px solid #ddd;
      overflow: hidden;
      margin: 0;
      margin-top: -10px;
    }
     .resultTab p 
    {
      
      font-size: 10pt;
    }
    .url
    {
      margin-top: -20px;
    }
     .resultTab a
    {
      text-decoration: underline;
      color: steelblue;
      font-size: 12pt;
    }
   
  </style>
  <script src="dex.js"></script>
  </head>
  <body>
    <header>
      <h3>PyDEX</h3>
      <i id="icon" class="fa fa-moon float-right fa-sun" style="margin-top: -40px;" onclick="toggleMode();"></i>
      <div>
      <form action="dexResults.php" method="get">
        <input name="search" type="search" value="'.$search.'">
      
       <button> <i class="fa fa-search"></i></button>
        </form>
        </div>
    </header>
    <div style="margin-top: 125px"></div>
    <h5>Results for: <a href="dexResults.php?search='.$search.'">'.$search.'</a><br>
    '.$num.' results found</h5>
    <hr color="#ddd">
    <br>';
    foreach($return_arr as $row)
    {
    echo'
    <div class="resultTab">
      <h4>'.$row["name"].'</h4>
      <p class="float-right" style="margin-top: -35px; font-size: 9pt;">'.$row["dateCreated"].'</p>
      <p class="url"><a href="'.$row["url"].'">'.$row["url"].'</a></p>
      
      <p>'.$row["description"].'</p>
      
    </div>';
    };
    echo'
  </body>
</html>'
?>