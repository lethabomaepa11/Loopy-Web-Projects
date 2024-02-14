<?php
//category array
require_once("php/category.php");
require_once("php/session.php");
require_once("php/fetchOne.php");
if($_SERVER["REQUEST_METHOD"] == "POST")
{
  require_once("php/db.php");
  if(strlen($_POST['name'])<1)
  {
    $error = "Enter name of product";
  }
  else if(strlen($_POST['price'])<1)
  {
    $error = "Enter price of product";
  }
  else if(strlen($_POST['description'])<1)
  {
    $error = "Description field must not be empty";
  }
  else{
  
  $name = htmlspecialchars($_POST['name']);
  $price = htmlspecialchars($_POST['price']);
  $category = htmlspecialchars($_POST['category']);
  $specifications = htmlspecialchars($_POST['description']);
  
  $description = htmlspecialchars($_POST['description']);
  //first 100 characters
  
  if(isset($_FILES['image']))
  {
    $imgName = $_FILES['image']['name'];
    $ext = explode('.',$imgName);
    $ext = strtolower(end($ext));
    $tmp = $_FILES['image']['tmp_name'];
    $allowedExt = ["png","jpg","jpeg","gif"];
    if(in_array($ext,$allowedExt))
    {
       $newFileName = uniqid().".".$ext;
       $path = 'assets/images/client/products';
       #mkdir("$path");
       $newPath = $path.'/'.$newFileName;
       
       if(move_uploaded_file($tmp,$newPath))
       {
         
       }
       else
       {
         $error = "Failed to upload image";
       }
       
       //upload to database
       $sql = "SELECT * FROM client WHERE unique_id = '$id'";
       $query = mysqli_query($connect,$sql);
       if(mysqli_num_rows($query) == 1)
       {
         $item_id = uniqid();
         $sql = "INSERT INTO products(user_id,item_id,name,price,description,specifications,image,category) VALUES('$id','$item_id','$name','$price','$description','$specifications','$newPath','$category')";
         if(mysqli_query($connect,$sql))
         {
           $activity = "added a product: ".$name." at R ".$price;
           $privacy = "public";
           $link = "view-item.php?pid=".$item_id;
           db_add($connect,$id,$activity,$link,$privacy,"me");
           header("location: view-item.php?pid=".$item_id);
         }
         else
         {
           $error = "Failed to add item";
         }
       }
       else
       {
         $error = "This user does not exist.Try logging in again <a href='login.php'>Login here</a>";
       }
    
  }
  else
  {
    $error = "Upload an image to continue";
  }
}
}
}
else
{
  $error = "";
}


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
  <title id="docTitle">Sell items - LoopyLite</title>
  <style>
  body,header
  {
    background-position: center;
    background-repeat: no-repeat;
    background: linear-gradient(to right,#000,#0b5275);
    color: #fff;
    overflow-x: hidden;
  }
  label
  {
    color: #fff;
  }
  input,select,option,textarea
  {
    background-color: #fff;
    padding-block: 4px;
    padding-inline: 2px;
  }
  label
    {
      font-weight: bold;
    }
  .long
  {
    height: 255px;
  }
  .slogan
  {
    color: #fff;
  }
  .grid2
  {
    display: grid;
    grid-template-columns: 1fr 1fr;
    grid-column-gap: 5px;
    grid-row-gap: 10px;
  }
  .inner-grid2
  {
    display: grid;
    grid-template-columns: 1fr;
  }
  </style>
  <script>
    function itemName()
    {
      document.getElementById("item-nameh5").textContent = "Advertise "+document.getElementById("item-name").value;
      if((document.getElementById("price").value).length>0 && (document.getElementById("item-name").value).length>0)
      {
        document.getElementById("item-nameh5").textContent += " at R "+document.getElementById("price").value;
      }
      document.getElementById("docTitle").textContent = document.getElementById("item-nameh5").textContent + " - LoopyLite";
      
      //character length count down
      const chars = document.getElementById("description").value;
      const change = document.getElementById("length");
      const MAXLEN = 500;
      if(chars.length > 0)
      {
        let size = MAXLEN - chars.length;
        if(size < 20)
        {
          change.style.color = "red";
          change.textContent = size;
        }
        else if(size > 20)
        {
          change.style.color = "#fff";
          change.textContent = size;
        }
        else if(size < 1)
        {
          change.textContent = "Reached max character length";
        }
      }
    }
    setInterval(itemName,100);
    //using intervals to do real time insteqd of onkeydown event as it leaves a character out
  </script>
  <header>
  <i class="fa fa-arrow-left" style="float: left; margin: 0;margin-top: 15px; margin-left: 5px; font-size: 18pt;color: #fff;" onclick="history.back();"></i>
      <h5 style="margin-left: 8%;margin-top: 18px;"id="item-nameh5"></h5>
    </header>
  </head>
  <body>
    <div style="margin-top: 52px"></div>
    <span style="display: flex;align-items: center;">
    <img id="pic" src="'.$row["profile_img"].'" style="border-radius: 50%;width: 40px;height:40px;">
    <h4>'.$row["name"].'</h4>
    </span>
    <center><!--
      <p class="slogan" style="color: #fff;">Your item will be displayed on your profile and everywhere else on the LoopyLite site
      <br>
      Users will have to contact you through your website or contact details(email,mobile) to purchase your products
      </p>--->
      ';
       if($error != "")
      {
        echo"<div class='error-msg'>
        <p><i class='fa-regular fa-circle-xmark'></i>$error</p></div>";
      }
      echo'
    </center>
    <div style="width: 100%;">
      <fieldset>
        
        <legend>
          <p class="account-type">LoopyLite</p>
        </legend>
        <form action="#" method="POST" enctype="multipart/form-data">
        <div class="ada" style="grid-template-columns: 1fr;grid-row-gap: 10px;">
        <span class="grid2">
          <span class="inner-grid2"> 
        <label for="name">Name of product</label>
        <input value="'.$_POST["name"].'" name="name" id="item-name" type="text" placeholder="e.g LoopyLite t-shirt"></span>
        <span style="display: grid;
          grid-template-columns: 1fr;"> 
        <label for="price">Price(R)</label>
        <input value="'.$_POST["price"].'" name="price" id="price" type="number" placeholder="Price for your item in rands">
        </span>
        <span class="inner-grid2">
        <label>Category</label>
        <select name="category">';
          
          foreach ($category as $option)
          {
            echo"<option>".$option."</option>";
          }
          echo'
        </select>
        </span>
        <span class="inner-grid2">
        <label>Image of product</label>
        <input name="image" id="item-picture" type="file" accept=".png,.jpeg,.jpg,.gif">
        </span>
        </span>
        <span class="space-btwn">
        <label>Description</label>
        <p class="slogan" style="font-weight: bold" id="length">500</p>
        </span>
        <textarea value="'.$_POST["description"].'" id="description" name="description" maxlength="500" class="long" placeholder="Full Description and specifications of product: colors, size..."></textarea>
        </div><hr>
        <button>Advertise product</button>
        <br>
        </form>
        
      </fieldset>
    </div>
    <div class="bottom"></div>
  </body>
</html>
';
?>