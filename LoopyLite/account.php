<?php
require_once("php/session.php");
require_once("php/fetchOne.php");
require_once("php/follow.php");
require_once("php/months.php");
//fetch this user products and order by date_added in descending latest first
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
  <title>'.$row["name"].' - LoopyLite</title>
  <style>
  .profile-container
  {
    margin-top: 51px;
    position: relative;
    display: block;
    width: 100%;
    
  }
  .cover-img
  {
    width: 100%;
    aspect-ratio: 16/5;
    padding: 0;
    margin: 0;
    /*background-color: #136767b4;*/
  }
  .profile-img
  {
    border-radius: 50%;
    width: 30%;
    aspect-ratio: 1;
   /* background-color: #ddd;*/
    position: absolute;
    margin-top: -16%;
  }
  .cover-img img
  {
    aspect-ratio: 16/5;
    width: 100%;
    height: 100%;
  }
  .profile-img img
  {
    aspect-ratio: 1;
    border-radius: 50%;
    width: 100%;
    height: auto;
    border: 2px solid #eef;
  }
  .container
  {
    background-color: #fff;
    width: 96%;
    height: 500px;
    padding: 1%;
    padding-block: 5px;
    padding-left: 3%;
  }
  .head
  {
    border: none;
    background-color: transparent;
    display: grid;
    grid-template-columns: auto auto 1fr;
    grid-template-rows: auto;
    align-items: center;
    grid-column-gap: 10px;
    max-width: 100%;
    white-space: wrap;
    transition: ease-in-out 0.1s all;
  }
  .head:hover
  {
    border-left: 2px solid #0b5275;
    border-radius: 0;
  }
  .head h3
  {
    width: 100%;
    white-space: wrap;
  }
  .bio,.bio textarea
  {
    
    font-size: 10pt;
    width: 70%;
    max-height: 100px;
    overflow: hidden;
    padding: 6px;
  }
  .bio textarea
  {
    overflow-y: auto;
  }
  /*.bio:hover, .bio:active
  {
    background-color: #0b5275;
    font-weight: bold;
    border-radius: 8px;
    color: #fff;
  }*/
  .about
  {
    margin-top: 0;
    font-size: 10pt;
  }
  legend
  {
    font-size: 18px;
  }
  
  footer
  {
    background-color: transparent;
    border: none;
    padding: 0;
  }
  footer .footer-modal
  {
    display: none;
    min-height: 100px;
    width: 100%;
    border-radius: 25px 25px 0 0;
    background-color: #fff;
    position: fixed;
    z-index: 2;
    bottom: 0;
    padding: 2px;
    animation: appear ease-in-out 0.15s;
  }
  .footer-modal h5
  {
    text-align: center;
  }
  .overlay
  {
    display: none;
    height: 100%;
    width: 100%;
    z-index: 1;
    background-color: rgba(0,0,0,0.5);
    position: fixed;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    animation: appear ease-in-out 0.15s;
  }
  #picture,#accounts
  {
    display: none;
  }
  .table-grid-3
  {
    display: grid;
    grid-template-columns: auto repeat(2,1fr);
  }
  .table-grid-3 p
  {
    width: fit-content;
    height: fit-content;
    align-self: center;
    margin-left: 5px;
  }
  button
  {
    width: 80%;
    
  }
  textarea
  {
    height: 100px;
    max-height: 100px;
    width: 70%;
    max-width: 70%;
    font-size: 10pt;
    font-family: arial;
    outline-color: #0b5275;
    border: 2px solid #0b5275;
    border-radius: 4px;
  }
  .about a 
  {
    text-decoration: none;
  }
  #clue
  {
    animation: appear 1s ease-in-out;
    font-size: 10px;
  }
  .about
  {
    background-color: #fff;
    border-radius: 4px;
  }
  body
  {
    background-color: #fff;
    overflow-x: hidden;
  }
  .ab
  {
    grid-template-columns: 0.4fr 3fr;
    padding-block: 10px;
  }
  .edit-me
  {
    display: none;
  }
  .edit-me button
  {
    width: 100%;
  }
  .products a
  {
    text-decoration: none;
    color: #000;
  }
  .suggest
  {
    font-size: 14px;
    padding-block: 4px;
    padding-inline: 8px;
  }

  .advertise
  {
    background: linear-gradient(to right,#000,#0b5275);
    border-radius: 8px;
    width: fit-content;
    margin-bottom: 15px;
    color: #fff;
    font-size: 14px;
    padding: 7px
  }
  .advertise i
  {
    font-size: 25px;
    color: #fff;
    margin-inline: 5px;
  }
  .products
  {
    overflow-x: hidden;
    max-width: 98%;
  }
.products fieldset 
{
  display: flex;
  overflow-x: scroll;
}
.products fieldset .product
{
  width: 100%;
}
.post 
{
  margin-block: 5px;
  border-bottom: 5px solid #eee;
}
.outlined-btn
{
  padding: 0;
  text-align: center;
  width: 45%;
}

  </style>
  <script>
    function displayElement(id,display,footerDisp = false,pic = null)
    {
      //display = (display.length>3)?display:false;//incase it has been left empty, making the default value to false
      let footer = document.getElementsByClassName("footer");
      for(var x = 0; x<footer.length;x++)
      { 
        
        if(footerDisp && display)
        {
          //console.log("drop");
          footer[x].style.display = "block";
        }
        else
        {
          footer[x].style.display = "none";
        }
      }
      const element = document.getElementById(id);
      document.getElementById("picture").style.display = "none";
      document.getElementById("accounts").style.display = "none";
      if(display)
      {
        element.style.display = "block";
      }
      else
      {
        element.style.display = "none";
        document.getElementById("bio").style.display = "block";
        
      }
      
      if(id == "bio-edit")
      {
        document.getElementById("bio").style.display = "none";
      }
      
      if(pic != null && footerDisp == true)
      {
        document.getElementById(pic).style.height = "60%";
        document.getElementById(pic).style.marginTop = "50px";
        document.getElementById(pic).style.width = "100%";
        document.getElementById(pic).style.borderRadius = "4px";
        document.getElementById(pic).style.position = "fixed";
        document.getElementById(pic).style.zIndex = "3";
        document.getElementById(pic).style.top = "0";
        document.getElementById("h5pic").textContent = pic + " image";
        document.getElementById("type").value = pic+"_img";//for php 
      }
      else
      {
        
        let arrPic = ["cover","profile"];
        for(var x = 0; x<2;x++)
        {
          document.getElementById(arrPic[x]).style.marginTop = "0";
          //console.log("droppic");
          document.getElementById(arrPic[x]).style.height = "auto";
          document.getElementById(arrPic[x]).style.width = "100%";
          document.getElementById(arrPic[x]).style.position = "";
          document.getElementById(arrPic[x]).style.zIndex = "0";
          if(arrPic[x] === "profile")
          {
            document.getElementById(arrPic[x]).style.borderRadius = "50%";
          }
          else
          {
            document.getElementById(arrPic[x]).style.borderRadius = "0";
          }
        }
      }
    }
    
    function clues()
    {
      let arrClues = ["Click on the picture to view/change it","Click your account name/drop down to switch accounts","Click on your bio to edit it.","A feature that will allow you as a shopper to also advertise your products"];
      
      
      let num = Math.floor(Math.random()*(arrClues.length));
      document.getElementById("clue").textContent = arrClues[num];
    }
    setInterval(clues,5000);
    
    function showInputs()
    {
      const edit_me = document.getElementsByClassName("edit-me");
      const me = document.getElementsByClassName("me");
      
      for(var x = 0; x<edit_me.length;x++)
      {
        var y = x-1;
        if(edit_me[x].style.display === "none")
        {
          edit_me[x].style.display = "grid";
           me[x].style.display = "none";
        }
        else
        {
          edit_me[x].style.display = "none";
            me[x].style.display = "grid";
        }
      }
    }
  </script>
  </head>
  <body>
    <header style="display: flex;flex-direction: row;justify-content: space-between;align-items:center;">
      <span style="width: max-content;display:grid;grid-template-columns:max-content auto;align-items: center;grid-column-gap: 10px;">
      <i class="fa fa-arrow-left" style="font-size: 18pt;" onclick="history.back();"></i>
      
      <h5>
        '.$row["name"].'
      </h5></span>
      ';
        if(!isset($_GET['uid']))
        {
          echo'
        
          <button onclick="proceed(\'Logout\',\'null\',\'null\',\'php/logout.php\')" style="width: 100px;background-color: red;border-radius: 4px;">Logout</button>';
      }
      ?>
    </header>
    <div class="profile-container">
      <div class="cover-img" onclick="displayElement('picture',true,true,'cover')">
        <img id="cover" alt="Cover image" src="<?php echo $row['cover_img']?>">
      </div>
      <div onclick="displayElement('picture',true,true,'profile')" class="profile-img">
        <img id="profile" alt="Profile image" src="<?php echo $row['profile_img']?>">
      </div>
      
      <div class="container">
        <div style="margin-left: 30%;font-size:10pt;
        display:grid;
        grid-template-columns: auto auto;
        grid-column-gap: 10px;
        ">
          <?php 
          if(isset($_GET["uid"]))
          {
            $uid = $_GET['uid'];
          }
          else
          {
            $uid = $id;
          }
          ?>
        <a style="text-decoration:none;color:#000"href="view.php?view=followers&uid=<?php echo $uid?>"><span class="space-btwn"><h4>Followers</h4><h4 class="suggest">
          <?php echo $row['followers']?>
        </h4></span></a>
        <a style="text-decoration:none;color:#000" href="view.php?view=following&uid=<?php echo $uid?>">
        <span class="space-btwn"><h4>Following</h4><h4 class="suggest">
          <?php echo $row['following']?>
        </h4></span></a>
        </div>
        <!--
        <p style="margin-left: 30%;font-size: 10pt;">
          
          <i class="fa-regular fa-lightbulb"></i><span id="clue">Click on the picture to change/view it.</span>
  
        </p>-->
        <div onclick="displayElement('accounts',true,true);" class="head" style="margin: 0; margin-top: 5%;white-space: wrap;">
          <h3><?php echo $row['name']?></h3>
          <i class="fa-regular fa-chevron-down" ></i>
          <p class="account-type">Individual</p></i>
          <!-- 
          the user will be able to have their personal account used for buying or viewing stuff and also a shop account where theyll be able to now sell their stuff
          -->
        </div>
        <div <?php if(!isset($_GET['uid'])){echo 'onclick="displayElement(\'bio-edit\',true)"';}?> class="bio" id="bio">
<pre><?php echo $row['bio']?></pre>


        </div>
        <div style="display: none;"class="bio-edit" id="bio-edit">
          <form action="php/updateOne.php" method="POST">
          <textarea name="bio" placeholder="Edit bio"><?php echo $row['bio']?></textarea>
          <button style="margin: 0;width:70%;">Save</button>
          </form>
        </div>
        <div style="display: flex;
        flex-direction: row;
        align-items:center;
        max-width: 100%;
        overflow: hidden;
        border-top: 1px solid #ddd;">
       <?php 
        if(isset($_GET['uid']))
        {
          $uid = $_GET['uid'];
          echo'<a class="outlined-btn" href="chat.php?uid='.$uid.'"><p><i class="fa fa-comment"></i>  Chat</p></a><br>';
          echo'<form action="php/follow.php?uid='.$uid.'" method="POST">';
          if($follower)
          {
          echo'
          <button class="space-btwn" style="width:100%;background-color:#ddd;color:#000;padding-inline: 50px;margin-block: 10px;">
          <i class="fa-regular fa-user-check"></i> Following</button>';
          }
          else
          {
            echo'
            <button class="space-btwn" style="width: 100%;padding-inline: 50px;margin-block: 10px;">
            <i class="fa-regular fa-user-plus"></i> Follow</button>';
          }
          
        }
        echo'
        </form>
        </div>';
        if(!isset($_GET['uid']))
        {
          
        echo'
        <div class="actions ada">
          <a href="">
            <div class="head-one">
              <h4>
                <i class="fa-regular fa-user-gear"></i>
                Preferences
                </h4>
            </div>
          </a>
          <a href="">
            <div class="head-one">
              <h4>
              <i class="fa-regular fa-truck"></i>
                Orders
                </h4>
            </div>
          </a>
          <a href="">
            <div class="head-one">
              <h4>
                <i class="fa-regular fa-comments"></i>
                My Reviews
                </h4>
            </div>
          </a>
          <a href="">
            <div class="head-one">
              <h4>
                <i class="fa-regular fa-heart"></i>
                Favorites
                </h4>
            </div>
          </a>
          <a href="">
            <div class="head-one">
              <h4>
                <i class="fa-regular fa-gifts"></i>
                Gifts & Vouchers
                </h4>
            </div>
          </a>
          <a href="">
            <div class="head-one">
              <h4>
                <i class="fa-regular fa-wallet"></i>
                Wallet
                </h4>
            </div>
          </a>
 
        </div>
        ';
        }
        ?>
        <div class="about">
          <fieldset>
            <legend>About</legend>
            <form action="php/updateOne.php?id=<?php echo $row['unique_id']?>&t=details" method="POST">
          <div class="head ab">
          <i class="fa-regular fa-message">
            <p>email</p>
          </i>
          <input class="edit-me" type="email" name="email" value="<?php echo $row['email']?>">
          <p class="me"><a href="mailTo:<?php echo $row['email']?>"><?php echo $row['email']?></a></p>
          </div>
          <div class="head ab">
          <i class="fa-regular fa-phone">
            <p>Mobile</p>
          </i>
          <input class="edit-me" type="number" name="mobile" value="<?php echo $row['mobile']?>">
          <p class="me"><?php echo $row['mobile']?></p>
          </div>
          <div class="head ab">
          <i class="fa-regular fa-globe">
            <p>Website</p>
          </i>
          <input class="edit-me" type="url" name="website" value="<?php echo $row['website']?>">
          <p class="me" style="text-decoration: underline; color: royalblue;"><a href="<?php echo $row['website']?>"><?php echo $row['website']?></a></p>
          </div>
          
          
          <div class="head ab">
            <i class="fa-regular fa-location-pin">
              <p>Location</p>
            </i>
            <select class="edit-me" name="location" value="<?php echo $row['location']?>">
              <?php include('php/provinces.php');
                $x = 0;
                for($x = 0; $x < 9;$x++)
                {
                  echo'<option>'.$arrProvince[$x].'</option>';
                }
              ?>
              </select>
            <p class="me">Situated in <b><?php echo $row['location']?></b></p>
            
          </div>
          
          <div class="head edit-me" style="grid-template-columns: 1fr 1fr;padding: 0;margin: 0;">
            <button  onclick="showInputs()" formaction="javascript:void(0)" style="background-color: red;">Cancel</button>
            <button>Update</button>
          </div>
          <?php if(!isset($_GET['uid']))
          {
            
          echo'
          <div  onclick="showInputs();"class="ab me outlined-btn" style="display: flex;
          flex-direction: row; border-radius: 8px;padding: 2px;padding-inline:5px;justify-content: center;align-items:center;">
            <i class="fa-regular fa-pen">
              
            </i>
            <p><b>Edit my details</b></p>
          </div>
          ';
          }
          $acc_date = to_datetime($row['date_created']);
          echo'
          <p>Account created: '.$acc_date.'</p>
          </form>
          </fieldset>
          
        </div>
        ';
        if(!isset($_GET['uid']))
        {
          echo'
        <a style="text-decoration: none;" href="sell.php">
        <span class="advertise" >
          <i class="fa-regular fa-circle-plus"></i><p>Advertise new product</p>
      </span></a>';
        }
        echo'
      
      <div class="products">
        <fieldset>
          <legend>'.$product_ref.'Products</legend>
          ';
          
          
       $user_id = $row['unique_id'];
       $sql = "SELECT * FROM products WHERE user_id = '$user_id' order by date_added desc";
       $products_query = mysqli_query($connect,$sql);
      if(mysqli_num_rows($products_query) == 0)
      {
        echo '<p class="null" style="color: #ddd;font-size: 13px;"><i class="fa-regular fa-hourglass-empty"></i><i>Nothing to see here...
        <br> Products will appear here when added.</i></p>';
      }
      else
      {
         while($product = mysqli_fetch_assoc($products_query))
         {
           $product_name = $product['name'];
           $product_price = $product['price'];
           $product_id = $product['item_id'];
           require_once("php/months.php");
           $product_date = to_datetime($product['date_added']);
           $product_image = $product['image'];
           $product_description = $product['description'];
           $product_category = $product['category'];
         
         echo'
          <div class="product">
            <span class="space-btwn">
            <h4>'.$product_name.'</h4>
            ';
            if(!isset($_GET['uid']))
            {
              echo'
           
            <i onclick="proceed(\'delete\',\'pid\',\''.$product_id.'\',\'php/delete_product.php\')"style="color: #990b0b;
            font-size: 22px;"class="fa-regular fa-trash-alt">
              <p>Delete</p>
            </i>';
            }
            require_once("confirm.php");
            echo'
            </span>
            
            <a href=view-item.php?pid='.$product_id.'>
            <img src="'.$product_image.'">
            <span class="space-btwn">
            <span class="price"><p style="font-size: 14px;">R</p>'.$product_price.'</span>
            <p style="color: #5050cd;"class="slogan">'.$product_category.'</p>
            </span>
            <div class="description">'.$product_description.'</div>
            <p style="margin-top: -20px;float: right;font-size: 8px;"class="slogan"><i class="fa-regular fa-clock"></i> '.$product_date.'</p>
          </div>
          </a>
          ';
         }
      }
      echo'
      </fieldset>
      </div>';
      //display posts
      if(!isset($_GET['uid']))
      {
       $sql = "SELECT * FROM post WHERE user_id = '$id' ORDER BY id DESC";
      }
      else
      {
        $sql = "SELECT * FROM post WHERE user_id = '$uid' ORDER BY id DESC";
      }
      $query = mysqli_query($connect,$sql);
  
      while($post = mysqli_fetch_assoc($query))
      {
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
      echo'
      <div class="head space-btwn">
      <span class="seller">
        <span>
      <img style="width:40px;aspect-ratio: 1; border-radius: 50%;" loading="lazy" src="'.$user_image.'">
       <h5 style="margin-left: 7px;">'.$user_name.'</h5>
      </span>
      </span>
      </div>
      ';
    echo "<div class='post'>";
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
      
       echo'
        
      <div class="bottom"></div>
        </div>
      </div>
    </div>
    
    ';
    if(!isset($_GET['uid']))
    {
      echo'
    <footer>
      <div onclick="displayElement(\'overlay\',false,false,null);" class="footer overlay" id="overlay"></div>
      
      <div class="footer footer-modal">
        <div id="picture" style="height: 100%;display: none;">
          <h5 id="h5pic"></h5>
          <hr width="90%">
          <div class="head">
            <form action="php/updateOne.php?id=<?php echo $row[\'unique_id\']?>" method="post"enctype="multipart/form-data">
              
            <i class="fa-regular fa-camera">
              <p>Change picture</p>
            </i>
            <input style="width: 100%"type="file" accept=".jpg,.jpeg,.png,.gif" name="img">
            <input hidden type="text" id="type" name="type">
            <button>Upload</button>
            </form>
          </div>
        </div>
        <div id="accounts">
          <h5>Switch Accounts</h5>
          <hr width="90%">
          <div class="table-grid-3">
            <h4>LoopyLite</h4>
            <p class="account-type">Bankyio</p>
            <button onclick="location = \'../Bankyio/BankHomepage.php\'">Switch</button>
          </div>

          <div class="head">
            <h5>Create a business Account</h5>
            <button style="width: 200%"><i class="fa-regular fa-circle-plus" style="color: #fff;">
              <p>Create</p>
            </i></button>
          </div>
        </div>
      </div>
    </footer>';
    }
    ?>
  </body>
</html>