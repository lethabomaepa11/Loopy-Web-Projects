<?php
include("db.php");
if($_SERVER['REQUEST_METHOD'] == "POST")
{
  //validate form first
  $name = htmlspecialchars($_POST['name']);
  $email = htmlspecialchars($_POST['email']);
  $mobile = htmlspecialchars($_POST['mobile']);
  $website = htmlspecialchars($_POST['website']);
  $location = htmlspecialchars($_POST['location']);
  $profile_img =  $_POST['profile_img'];
  $password = htmlspecialchars($_POST['password']);
  $bio = "Click here to edit your bio";
  
  if(strlen($name)>0 && (strlen($email)>0||strlen($mobile)>0) && strlen($location)>0 && strlen($password)>0)
  {
    $hashed_pass = password_hash($password,PASSWORD_BCRYPT);
    $unique_id = uniqid().uniqid()."abcde12345/-!";
    $unique_id = str_shuffle($unique_id);
    #CHECK IF THIS CLIENT HASNT BEEN REGISTERED YET
    $v_sql = "SELECT * FROM client WHERE email = '$email' or mobile = '$mobile' or unique_id = '$unique_id'";
    $v_query = mysqli_query($connect,$v_sql);
    if(mysqli_num_rows($v_query) > 0)
    {
      header("location: ../signup.php");
    }
    else
    {
      $newPath = "none";
      #successful
      if(isset($_FILES['profile_img']))
      {
        $imgName = $_FILES['profile_img']['name'];
        $ext = explode('.',$imgName);
        $ext = strtolower(end($ext));
        $tmp = $_FILES['profile_img']['tmp_name'];
        $allowedExt = ["png","jpg","jpeg","gif"];
        if(in_array($ext,$allowedExt))
        {
           $newFileName = uniqid().".".$ext;
           $path = 'assets/images/client/profile';
           #mkdir("$path");
           $newPath = $path.'/'.$newFileName;
           
           if(move_uploaded_file($tmp,"../".$newPath))
           {
             
           }
           else
           {
             echo 'error';
           }
        }
        
      }
      $sql = "INSERT INTO client(name,email,mobile,website,location,profile_img,password,unique_id,bio) VALUES ('$name','$email','$mobile','$website','$location','$newPath','$hashed_pass','$unique_id','$bio')";
      
      if(mysqli_query($connect,$sql))
      {
        $id = $unique_id;
        $link = "account.php?uid=".$id;
        $activity = "created an account";
        $privacy = "public";
        db_add($connect,$id,$activity,$link,$privacy);
        header("location: ../index.php");
      }
    }
  }
}
else
{
  header("location: ../signup.php");
}