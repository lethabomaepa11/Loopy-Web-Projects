<?php 
require_once("php/fetchAll.php");
require_once("php/session.php");
require_once("php/db.php");

//2 arrays for products and posts
$products = [];
$posts = [];


$sql = "SELECT * FROM products ORDER BY date_added desc";
$query = mysqli_query($connect,$sql);
  
while($row = mysqli_fetch_array($query))
{
  $products[] = $row;
}

$sql = "SELECT * FROM post ORDER BY id DESC";
$query = mysqli_query($connect,$sql);
  
while($row = mysqli_fetch_assoc($query))
{
  $posts[] = $row;
}
shuffle($posts);
shuffle($products);
$total_num = count($posts)+count($products);
$displayed = 0;
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="assets/css/fontawesome.css" rel="stylesheet">
    <link href="assets/css/brands.css" rel="stylesheet">
    <link href="assets/css/solid.css" rel="stylesheet">
    <link href="assets/uicons-thin-rounded/css/uicons-thin-rounded.css" rel="stylesheet">
  <link rel="stylesheet" href="css/global.css">
  <link rel="icon" href="assets/images/logo.jpg">
  <script src="js/index.js"></script>
  <title>LoopyLite | Home</title>
  <style>
  body
  {
    background-color: #eee;
  }
  .ada
  {
    margin-block: 8px;
  }
  .head
  {
    color: #000;
  
  }
  
  .head button
  {
    border: none;
    background-color: transparent;
    color: #0b5275;
    width: fit-content;
  }
  .space-btwn
  {
    align-items: center;
  }
  header
  {
    align-items: center;
  }
   header .space-btwn button
  {
    border-radius: 50px;
    margin: 0;
    background-color: #fff;
    color:#0b5275;
    height: 35px;
  }
  header .space-btwn button:hover
  {
    background-color: #0b5275;
    transition: all 0.2s ease-in-out;
  }
  .space-btwn button i 
  {
    color: #000;
  }
  a
  {
    text-decoration: none;
    
  }
   span p
    {
      font-family: 'Varela Round', sans-serif;
      font-size: 10px;
      margin: 0px;
      margin-top: 2px;
      text-decoration: none;
    }
pre
{
  padding-inline: 5px;
}
  /*
  .head i
  {
    color: #000;
  }*/

  </style>
  <script>
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
  </script>
  </head>
  <body>
    <header>
      <div class="space-btwn">
      <h3 onclick="location.reload();">LoopyLite</h3>
      
       <span>
      <button onclick="search(true);" ><i class="fa-regular fi fa-search"></i></button>
      <a href="alerts.php"><button><i class="fa-regular fa-bell"></i></button></a>
      
      </span>
      <i class="fa-regular fa-shopping-cart" style="color: #000;"></i>
      <!---
      <span class="cart-count float-right">
        <center>
        <p>0</p>
        </center>
      </span>--->
      </div>
    </header>
    
    <div id="search" class="search">
      <header>
      <form>
      <div>
      <i onclick="search()"class="fa float-left fa-arrow-left"></i>
      
      <input id="sInput" style="width: 75%;height: 40px;"type="search" placeholder="Search...">
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
      <p>Loopy clothes</p>
    </div>
    </a>
    <a href="">
    <div class="suggest">
      <p>Cellphones</p>
    </div>
    </a>
    </div>
    <!-- the body part --->
    <div style="margin-top: 55px"></div>
    <div class="advert">
      <marquee style="font-weight: bold;">This will be an advert field</marquee>
    </div>
    
    <div class="index-content">
    <?php
    $items = ["product","post"];
    $product_disp = 0;
    $posts_disp = 0;
    while($displayed < $total_num)
    {
      shuffle($items);
      $item = $items[0];
    if($item == "product" && $product_disp<count($products))
    {
      $product = $products[$product_disp];
      $product_disp++;
      $product_name = $product['name'];
      $product_image = $product['image'];
      $product_price = $product['price'];
      $product_category = $product['category'];
      $product_datetime = $product['date_added'];
      require_once("php/months.php");
      $product_date = to_datetime($product_datetime);
      $product_description = $product['description'];
      $product_id = $product['item_id'];
    //fetch seller data
    //seller
    $seller_id = $product['user_id'];
    $sqls = "SELECT * FROM client WHERE unique_id = '$seller_id'";
    $querys = mysqli_query($connect,$sqls);
    if(mysqli_num_rows($querys) == 1)
    {
      $seller = mysqli_fetch_assoc($querys);
      $seller_name = $seller['name'];
      $seller_image = $seller['profile_img'];
    }
    echo'
    <div class="ada">
    ';
    if($seller_id === $id)
    {
      echo'<a href="account.php">';
    }
    else
    {
      echo'<a href="account.php?uid='.$seller_id.'">';
    }
      
      echo'
      <div class="head space-btwn">
      <span class="seller">
        <span>
      <img style="width:40px;aspect-ratio: 1; border-radius: 50%;" src="'.$seller_image.'">
       <h5 style="margin-left: 7px;">'.$seller_name.'</h5>
      </span>
      </span>
      </a>
     
      <!---<i class="fa fa-arrow-right float-right" style="margin-top:-50px"><p>View</p></i>--->
      </div>
      
      <div class="items">
      <a href="view-item.php?pid='.$product_id.'">
          <div class="product" style="box-shadow: 0 #000;">
            <span class="space-btwn">
            <h4>'.$product_name.'</h4>
            </span>
            <img loading="lazy" src="'.$product_image.'">
            <span class="space-btwn">
            <span class="price"><p style="font-size: 14px;">R</p>'.$product_price.'</span>
            <p style="color: #5050cd;font-size:10px;"class="slogan">'.$product_category.'</p>
            </span>
            
            <div class="description">'.$product_description.'</div>
            <p style="margin-top: -20px;float: right;font-size: 8px;"class="slogan"><i class="fa-regular fa-clock"></i> '.$product_date.'</p>
            </div>
          
          </a>
        </div>
      </div>';
    }
    
    else if($posts_disp<count($posts))
    {
    //post 
      $post = $posts[$posts_disp];
      $posts_disp++;
      $post_text = $post['text'];
      $post_id = $post['post_id'];
      $user_id = $post['user_id'];
    
      $sqls = "SELECT * FROM client WHERE unique_id = '$user_id'";
    $querys = mysqli_query($connect,$sqls);
    if(mysqli_num_rows($querys) == 1)
    {
      $user = mysqli_fetch_assoc($querys);
      $user_name = $user['name'];
      $user_image = $user['profile_img'];
    }
    echo "<div class='post'>";
    if($user_id === $id)
    {
      echo'<a href="account.php">';
    }
    else
    {
      echo'<a href="account.php?uid='.$user_id.'">';
    }
      
      echo'
      <div class="head space-btwn">
      <span class="seller">
        <span>
      <img style="width:40px;aspect-ratio: 1; border-radius: 50%;" loading="lazy" src="'.$user_image.'">
       <h5 style="margin-left: 7px;">'.$user_name.'</h5>
      </span>
      </span>
      </div>
      </a>
      ';
      echo'
      <div class="media">';
      $file_sql = "SELECT * FROM files WHERE post_id = '$post_id'";
      $file_query = mysqli_query($connect,$file_sql);
      echo'
          <span class="files">';
      while($file = mysqli_fetch_assoc($file_query))
      { 
        $file_type = $file['type'];
        $file_name = $file['name'];
        $file_path = $file['path'];
          if($file_type == "image")
          {
            echo'
            <img loading="lazy"src="'.$file_path.'">';
          }
          else if($file_type == "video")
          {
            echo'<video controls="true"loading="lazy"><source src="'.$file_path.'"/></video>';
          }
      }
      echo'
          </span>';
          if(strlen($post_text)>0)
          {
            echo'
          <span class="text">
            <pre>'.$post_text.'</pre>
          </span>
          ';
          }
          echo'
          <span class="thumbs">';
          $file_sql = "SELECT * FROM files WHERE post_id = '$post_id'";
          $file_query = mysqli_query($connect,$file_sql);
          while($file = mysqli_fetch_assoc($file_query))
          {
            
          $file_type = $file['type'];
          $file_name = $file['name'];
          $file_path = $file['path'];
          if($file_type == "document")
          { 
            echo'
            <a href="'.$file_path.'"><i class="fa fa-file-download"></i> '.$file_name.'</a>
            ';
          }
          }
      
          echo'
            
          </span>
        </div>
        </div>';
        
        
        }
        $displayed++;
    }
        ?>
        </div>
    <div class="advert">
      <marquee style="font-weight: bold;">This will be an advert field</marquee>
    </div>
    <div class="bottom"></div>
    
    
    
    <footer>
      <div onclick="display();" class="footer overlay" id="overlay"></div>
      
      <div id="modal" style="height:auto;" class="footer footer-modal">
        <h5>Post</h5>
        <span style="margin-top:50px"></span>
        <p onclick="location = 'sell.php'"><span class="fi fi-tr-blog-pencil"></span>Make an Ad/Sell product</p>
        <p onclick="location = 'post.php'"><span class="fi fi-tr-user-pen"></span>Create a Post</p>
        
        </div>
      <a href="#"><span class="fi fi-tr-house-window active">
        <p>Home</p>
      </span></a>
      <a href="chats.php"><span class="fi fi-tr-message-sms">
        <p>Chats</p>
      </span></a>
      <a href="videos.php" ><span class="fi fi-tr-circle-video">
        <p>Videos</p>
      <a onclick="display(true);" href="javascript:void(0)"><span style="color: #000;"class="center-nav fi-tr-square-plus">
        <!--<p>Advertise</p>-->
      </span></a>
      <a href="" ><span class="fi fi-tr-tv-music">
        <p>Music</p>
      <a href="account.php" ><span class="fi fi-tr-circle-user">
        <p>Account</p>
      </span></a>
      <!-- will be moved to more tab-->
      <a href=""><span class="fi fi-tr-bars-staggered">
        <p>More</p>
       
      </span></a>
    </footer>
  </body>
</html>
