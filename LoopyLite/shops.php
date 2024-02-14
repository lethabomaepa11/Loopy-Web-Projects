<?php
require_once("php/category.php");
require_once("php/session.php");
require_once("php/db.php");


echo'


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="assets/css/fontawesome.css" rel="stylesheet">
    <link href="assets/css/brands.css" rel="stylesheet">
    <link href="assets/css/solid.css" rel="stylesheet">
  <link rel="stylesheet" href="css/global.css">
  <link rel="stylesheet" href="css/second.css">
  <link rel="icon" href="assets/images/logo.jpg">
  <script src="js/index.js"></script>
  <title>LoopyLite Online Market - Shops</title>
  <style>
    .ada
    {
      display: grid;
      grid-template-columns: 1fr 1fr;
      animation: appear 0.3s ease-in-out;
    }
    .head
    {
      background-color: #fff;
      color: #000;
      border-radius: 0;
    }
    .head i
    {
      color: #000;
      font-size: 12pt;
    }
    .head-one
    {
      border: none;
      margin-block: 5px;
      width: 95%;
      display: grid;
      grid-template-columns: 1fr;
      justify-content: center;
      align-items: center;
      background-color: #fff;
      color: #113344;
      border-radius: 8px;
      box-shadow: 0 3px 6px rgba(0,0,0,0.3);
    }
  
    
  </style>
  <script>
    function dropCategory(index)
    {
      const arrCategory = [
      ';
      foreach ($category as $option)
      {
        echo $option.',';
        
      }
      echo'
      Categories]
      const element = document.getElementById(arrCategory[index]).style;
      if(element.display == "none")
      {
        element.display = "grid";
      }
      else
      {
        element.display = "none";
      }
    }
    
  </script>
  </head>
  <body>
    <header>
      <div>
      <h3>LoopyLite</h3>
      
      <input id="sInput1" onclick="search(true);" onfocus="search(true)" type="search" placeholder="Search...">
      <button onclick="search(true);" ><i class="fa fa-search"></i></button>
      <i class="fa-regular fa-shopping-cart" style="color: #000;"></i>
      
      <span class="cart-count float-right">
        <center>
        <p>0</p>
        </center>
      </span>
      </div>
    </header>
    
    <div id="search" class="search">
      <header>
      <form>
      <div>
      <i onclick="search()"class="fa fa-arrow-left float-right" style="float: left; margin: 0;margin-top: 15px; margin-left: 5px;"></i>
      
      <input id="sInput" style="width: 75%;"type="search" placeholder="Search...">
      <button><i class="fa fa-search"></i></button>
      </form>
      </div>
    </header>
    <div style="margin-top: 55px"></div>
    <h4>Recent searches
    <i class="fa-regular fa-history"></i>
    </h4>
    <center>
      <p style="color: #ddd">
      Your recent searches will appear here
      </p>
    </center>
    <h4>Discover searches
    <i class="fa-regular fa-fire-alt"></i></h4>
    <a href="">
    <div class="suggest">
      <p>LoopyLite</p>
    </div>
    </a>
    <a href="">
    <div class="suggest">
      <p>Cellphones</p>
    </div>
    </a>
    </div>
    
    <div style="margin-top: 52px"></div>
    
    
    ';
    $counter = 0;
    foreach ($category as $option)
    {
      
      $sql = "SELECT * FROM products WHERE category = '$option'";
      $query = mysqli_query($connect,$sql);
      $num = mysqli_num_rows($query);
      
      echo'
    <div onclick="dropCategory('.$counter.')" class="head">
    <h4>'.$option.'('.$num.')</h4>
    <i class="fa-regular float-right fa-chevron-up '.$counter.'"></i>
    </div>
    <div id="'.$option.'" class="ada">
    ';
     while($product = mysqli_fetch_assoc($query))
     {
       $product_id = $product["item_id"];
       $product_name = $product["name"];
       $product_image = $product["image"];
       echo'
      <a href="view-item.php?pid='.$product_id.'">
      <div class="head head-one">
        <h4>'.$product_name.'</h4>
        <img src="'.$product_image.'">
      </div>
      </a>';
    }
    $counter++;
    }
    echo'
  <div class="bottom"></div>
  </body>
  <footer>
      <a href="index.php"><i class="fa-regular fa-home">
        <p>Home</p>
      </i></a>
      <a href="#"><i class="fa-regular active fa-store">
        <p>All Shops</p>
       
      </i></a>
      
      <a href="sell.php"><i class="fa-regular fa-circle-plus center-nav">
        <p>Advertise</p>
      </i></a>
      <a href="account.php"><i class="fa-regular fa-user-tie">
        <p>Account</p>
      </i></a>
      <a href="category.html"><i class="fa-regular fa-bars-progress">
        <p>Category</p>
      </i></a>
    </footer>
</html>';
?>