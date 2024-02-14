<?php
require("database.php");

$sql = "SELECT * FROM sites order by dateCreated DESC";
$query = mysqli_query($con,$sql);
echo '

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="Bankyio/assets/css/fontawesome.css" rel="stylesheet">
    <link href="Bankyio/assets/css/brands.css" rel="stylesheet">
    <link href="Bankyio/assets/css/solid.css" rel="stylesheet">
  <link rel="stylesheet" href="css/index.css">
  <script src="js/index.js"></script>
  <title>PyDEX - Home</title>
  <link rel="stylesheet" href="dex.css">

  </style>
  <script src="dex.js"></script>
  </head>
  <body class="light">
    <header>
      <h1>PyDEX</h1>
      <i id="icon" class="fa fa-moon float-right fa-sun" style="margin-top: -55px;" onclick="toggleMode();"></i>
      <div>
      <form action="dexResults.php" method="GET">
      <input name="search" type="search" placeholder="Search sites...">
      <button><i class="fa fa-search"></i></button>
      </form>
      </div>
    </header>
    <div style="margin-top: 150px;"></div>
    <h4>Suggestions:</h4>
    <center>
    <div class="tabs-container">
    <!-- include a loop to loop through the items from DB-->
    ' ;
    while($row = mysqli_fetch_assoc($query))
    {
      echo'
      <a href="'.$row["url"].'">
      <div class="tab" href="'.$row["url"].'">
      '.$row["name"].'
      </div>
      </a>';
    };
    
      echo'
    </div>
    
    </center>
    <div class="updates">
      <h4>Updates:</h4>
      <div class="content">
        
      </div>
    </div>
  </body>
</html>'
?>