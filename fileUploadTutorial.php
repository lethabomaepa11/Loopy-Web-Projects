<?php
/*
Upload an image in PHP
I created this function for my Internet Development students which saves a single uploaded image to disk. Example:
// Assuming the web server has write permissions to /mydir
SaveUploadedImage("/mydir/myimage.png");    

The function can easily be modified to handle multiple filenames (change the parameter to accept an array of filenames and modify the final foreach block). Note that this is modified code from the webdeveloper.com forum. If you want to know more about uploading files in PHP, check out the PHP - File Upload tutorial.
*/

// Return empty string if uploaded image is successfully saved as
// $image_filename or an error message. $image_filename should be 
// saved in a directory that the web server can write to.
function SaveUploadedImage($image_filename)
{
   // This function is greatly modified code from
   // http://www.webdeveloper.com/forum/showthread.php?t=101466
   
   
   // Possible PHP upload errors
   $errors = array(1 => 'php.ini max file size exceeded',
                2 => 'html form max file size exceeded',
                3 => 'file upload was only partial',
                4 => 'no file was attached');
    
   // Store nonempty files in the active_keys array
   $active_keys = array();
   foreach ($_FILES as $key => $file)
   {
      if (!empty($file['name']))
         $active_keys[] = $key;
   }

   // Check at least one file was uploaded
   if (count($active_keys) == 0)
      return 'No files were uploaded';
        
   // Check for standard uploading errors
   foreach ($active_keys as $key)
   {
      if ($_FILES[$key]['error'] > 0)
         return $_FILES[$key]['tmp_name'] . ': ' . $errors[$_FILES[$key]['error']];
   }
    
   // See if the file we are working on really was an HTTP upload
   foreach ($active_keys as $key)
   {
      if (!is_uploaded_file($_FILES[$key]['tmp_name']))
         return $_FILES[$key]['tmp_name'] . ' not an HTTP upload';
   }
    
   // Make sure the image uploaded appears to be an actual image
   foreach ($active_keys as $key)
   {
      if (!getimagesize($_FILES[$key]['tmp_name']))
         return $_FILES[$key]['tmp_name'].' is not an image';
   }
       

   // Save every uploaded file to the same filename (normally we'd want to
   // save each file with its own unique name, but we are assuming there
   // is only one file).
   foreach ($active_keys as $key)
   {
      if (!move_uploaded_file($_FILES[$key]['tmp_name'], $image_filename))
         return 'receiving directory (' . $image_filename . ') has insufficient permission';
   }
    
   // If you got this far, everything has worked and the file has been successfully saved.

   return '';
}  