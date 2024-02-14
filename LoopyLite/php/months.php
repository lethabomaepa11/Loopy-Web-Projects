<?php




function to_datetime($timestamp)
{
        /***
       * Time format code starts here, belo
       * this function takes a timestamp and returns a datetime in human written format 
       */
       $months = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
      $product_dat = explode(" ",$timestamp);//explode the tinestamp it is yyyy-mm-dd hh:mm:ss:ms
      $product_date1 = $product_dat[0];//the first part before " ", yyyy-mm-dd
      
      $product_time = $product_dat[1];//second part after " " hh:mm:ss:ms
      
      $product_date1 = explode("-",$product_date1);//find - in yyyy-mm-dd it will result in an array of 3 elements
      #echo $product_date1[0]." ".$product_date1[1];
      $product_times = explode(":",$product_time);//will result in an array of 4 elements hh,mm,ss,ms
      $ind = $product_date1[1]-1;//array index of a particular month in the months array
      $product_date_ymd = $product_date1[2]." "." ".$months[$ind]." ".$product_date1[0];//final date in format dd mmm yyyy
      $product_time_hms = $product_times[0].":".$product_times[1];
      //final time in hh:mm
      
      
      $product_date = $product_date_ymd." at ".$product_time_hms;
      return $product_date;
      //dd mmm yyyy at hh:mm
      
      //using this one for now
      
      /***
       * The time format function ends here, might replace it
       */
}
//echo date("l F jS, Y - g:ia", time());
?>
