<?php

if(isset($_GET['pid']))
{
  require_once("php/session.php");
  $pid = $_GET['pid'];
  include("php/db.php");
  $sql = "SELECT * FROM products WHERE item_id = '$pid'";
  $query = mysqli_query($connect,$sql);
  if(mysqli_num_rows($query) == 1)
  {
    $row = mysqli_fetch_assoc($query);
  }
  
  //fetch user and seller data
  //seller
  $seller_id = $row['user_id'];
  $sqls = "SELECT * FROM client WHERE unique_id = '$seller_id'";
  $querys = mysqli_query($connect,$sqls);
  if(mysqli_num_rows($querys) == 1)
  {
    $seller = mysqli_fetch_assoc($querys);
  }
  //user 
  $sqlu = "SELECT * FROM client WHERE unique_id = '$id'";
  $queryu = mysqli_query($connect,$sqlu);
  if(mysqli_num_rows($queryu) == 1)
  {
    $user = mysqli_fetch_assoc($queryu);
  }
}
else 
{
  header("location: index.php");
}
?>

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
  <title>View <?php echo $row['name']?> - LoopyLite</title>
  <style>
    img
    {
      aspect-ratio: 4/3;
      width: 100%;
      border-radius: 2px;
    }
    .ada
    {
      grid-template-columns: auto 4fr;
      justify-content: center;
      grid-column-gap: 10px;
      align-items: center;
      position: fixed;
      top: 0;
      margin: 0;
      width: 100%;
      border-bottom: 2px solid #ddd;
      height: 50px;
      padding: 0;
      background-color: #fff;
      z-index: 20;
    }
    h4
    {
      text-align: center;
    }
    footer
    {
      display: flex;
      justify-content: center;
      align-items: center;
      
    }
    footer button
    {
      width: 60%;
      margin: 0;
      font-weight: bold;
      font-size: 16px;
    }
    .least-btn
    {
      background-color: #fff;
      width: 20%;
      color: #000;
      font-size: 20px;
      margin-left: 10px;
      border: 1px solid #1540c2;
    }
    span.price
    {
      font-size: 26px;
      font-weight: bold;
      color: #1540c2;
      font-family: Trebuchet MS;
    }
    div
    {
      padding-inline: 5px;
    }
    .head
    {
      border-color: #ddd;
    }
    .slogan
    {
      color: #000;
      font-size: 15px;
      width: 95%;
      white-space: wrap;
    }
    .heading
    {
      font-weight: bold;
    }
    .specs 
    {
      white-space: wrap;
      max-width: 90%;
      overflow: hidden;
    }
    
    .images
    {
      display: flex;
      flex-direction: row;
    }
    .images img,.my-review span img
    {
      aspect-ratio: 4/3;
      width: 15%;
      height: auto;
      border-radius: 4px;
      margin-inline: 4px;
    }
    fieldset
    {
      border-top: 20px solid #def;
      border-radius: 8px;
      background-color: #def;
      margin-block: 15px;
    }
    .specs-head
    {
      background-color: #0b5275;
      color: #fff;
      border-radius: 8px 8px 0 0;
      padding-inline: 4px;
    }
    .specs-head i 
    {
      color: #fff;
    }
    .items 
    {
      border-radius: 0 0 8px 8px;
      font-size: 15px;
      border-inline: 2px solid #ddd;
      border-bottom: 2px solid #ddd;
    }
    .review-container
    {
      margin-block: 10px;
      background-color: #fff;
      border-radius: 8px;
      padding-block: 5px;
      transition: 0.3s all ease-in-out;
    }
    .review-container .seller
    {
      margin-block: 5px;
      transition: 0.3s all ease-in-out;
      
    }
    .review-container .seller
    {
      background-color: #f3f3f3;
    }
    
    .review-container .seller:hover
    {
      background-color: #aaf;
      border-color: #fff;
      box-shadow: 0 10px 30px rgba(0,0,0,0.2);
    }
    .review
    {
      width: 100%;
      margin: 0;
      padding: 1px;
      padding-block: 1px;
      border-left: 2px solid #ccc;
      border-top: none;
      display: block;
    }
    textarea
    {
      transition: 0.3s all ease-in-out;
    }
    /*textarea:hover
    {
      height: 200px;
    }*/
    .seller span h3
    {
      font-size: 14px;
    }
  </style>
  <script>
    window.addEventListener("scroll",function()
    {
      document.getElementById("ada").style.backgroundColor = "#def";
      document.getElementById("nameI").style.textAlign = "left";
    });
    /*
    const text = document.getElementById("text");
    function changeH()
    {
      document.getElementById("text").style.height = "200px";
    };*/
  </script>
  </head>
  <!---
  will use item_id to link it to its pictures
  will use unique_id to link the owner/seller
  an item has a bool state "active" 
  items with active status will appear on the site 
  while those with not_active will not appear
  use a while loop to get all the images for this paticular item
  -->
  <body>
    <div id="ada" class="ada" style="border-radius: 0;">
      <i class="fa fa-arrow-left" style="font-size: 20pt;" onclick="history.back();"></i>
      <h5 id="nameI"><?php echo $row['name'] ?></h5>
      </div>
      <div style="margin-top: 55px;">
        <img loading="lazy" src="<?php echo $row['image']?>">
        <br>
        <span class="price"><p style="font-size: 14px;">R</p><?php echo $row['price']?></span>
        <p class="slogan">
          <?php echo $row['description']?>
        </p>
        <hr color="#ddd">
        <div class="seller">
          <!--
          <div class="images">
            <img src="assets/images/drip.jpg">
            <img src="assets/images/phone.jpg">
            <img src="assets/images/logo2.png">
          </div>--->
          <fieldset>
            <legend><i class="fa-regular  fa-user-tie"></i> Ad owner</legend>
            <span>
            <img loading="lazy" src="<?php echo $seller['profile_img']?>">
            <?php //remove the php echo's and use one,?>
            <h4><a href="account.php?uid=<?php echo $seller['unique_id']?>"><?php echo $seller['name']?></a></h4>
            <a href="" style="font-size: 14px;color: #1540c2;">
              <i class="fa-regular fa-location-pin"></i> Situated in <?php echo $seller['location']?></a>
            </span>
          </fieldset>
        </div>
        <div class="head specs-head">
        <p class="heading"><i class="fa-regular fa-circle-info"></i> Full specifications</p>
        </div>
        
        <div class="items">
          <pre><?php echo $row['specifications']?></pre>
        </div>
        
      <div class="review-container">
        <span style="
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
        padding-inline: 3px;
        ">
          <h3><i class="fa-regular fa-comments"></i> Reviews</h3>
          <a href="#" style="font-size: 22px"><i class="fa-regular fa-arrow-right"><p>More</p></i></a>
        </span>
        <div class="my-review" style="">
          <form action="php/product_reviews.php?for=<?php echo $seller_id?>&pid=<?php echo $_GET['pid']?>" method="POST">
          <fieldset>
            <legend><i class="fa-regular fa-comment"></i>Leave a review</legend>
          <span style="
          display: flex;
          flex-direction: row;
          align-items: center;">
            
          <img loading="lazy" style="border: 1px solid #0b5275;border-radius: 50%;
          width: 50px; aspect-ratio: 1;" src="<?php echo $user['profile_img'];?>">
          
          <textarea name="review" id="textbox" style="width: 90%;
          background-color: #fff;
          resize: none;" maxlength="255" accesskey="r" placeholder="Leave a review about this product"></textarea>
          </span>
          <button style="margin:0;margin-top: 5px;width: 100%;">Submit</button>
          
          </fieldset>
          </form>
        </div>
        <?php 
        
        require_once("php/fetchOne.php");
        $pid = $_GET['pid'];
        $rev = "SELECT * FROM product_reviews WHERE product_id = '$pid' ORDER BY date desc";
        $rquery = mysqli_query($connect,$rev);
        while($review = mysqli_fetch_assoc($rquery))
        {
          //fetch reviewer data
          $reviewer_id = $review['user_id'];
          $reviewer_sql = "SELECT * FROM client WHERE unique_id = '$reviewer_id'";
          $reviewer_qu = mysqli_query($connect,$reviewer_sql);
          $reviewer = mysqli_fetch_assoc($reviewer_qu);
          require_once("php/months.php");
          $datetime = to_datetime($review["date"]);
        echo'
        <div class="seller">
          <span class="space-btwn" style="width: 100%">
          <a href="account.php?uid='.$reviewer["unique_id"].'">
          <span style="width: 100%;white-space: nowrap;">
          <img loading="lazy" src="'.$reviewer["profile_img"].'">
          <h3>'.$reviewer["name"].'</h3>
          </span></a>
          <p class="date" style="font-size: 11px;color: #303030;margin-left: 50px;"><i class="fa-regular fa-clock"></i> '.$datetime.'</p>
          </span>
          <div class="review">
            <pre>'.$review["review"].'
            </pre>
            
          </div>
        </div>';
        }
        ?>
        </div>
        <p class="heading">You may also like</p>
      </div>
    <div class="bottom"></div>
  </body>
  <?php 
  if($id != $seller_id)
  {
    echo'
  <footer>
    <button onclick="location.href = \'chat.php?uid='.$seller_id.'\'">Contact Seller</button>
    <button class="least-btn">
      <i class="fa-regular fa-heart-circle-plus">
        <p>Add to favorites</p>
      </i>
    </button>
  </footer>';
  }
  ?>
</html>
  