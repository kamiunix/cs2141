<?php


//require('connect.php');
require('common.php');
?>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Personal Information</title>
    
    <link rel="stylesheet" type="text/css" href="css/info_page.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="login_panel/css/slide.css" media="screen" />
    
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
    <link rel="icon" type="image/png"
        href="http://www.dal.ca/etc/designs/dalhousie/clientlibs/global/default/images/favicon/DALSocialMediaMark-Blk.png" />

    <script src="login_panel/js/slide.js" type="text/javascript"></script>
    
    <?php echo $script; ?>
    
</head>

<body>

<div id ="outerborder">
    <div id = "innerborder">
<div id="main">
    <h1>Personal Information</h1>
    <?php

        if (isset($_SESSION['id'])):

    ?>
    <hr>
    
    <?php
        // Get customer information
            echo '<div class="container"> <h2><strong>'.$_SESSION['usr'].':</strong></h2><hr> ';
            $query = "SELECT * FROM customer_info WHERE c_id = '$_SESSION[id]'";
            $result = mysqli_query($con, $query);
            echo mysqli_error($con);
            $row = mysqli_fetch_assoc($result);
            echo '<h2>&emsp;Address: $ '.$row['address'].'</h2><br>';
            echo '<h2>&emsp;City: $ '.$row['city'].'</h2><br>';
            echo '<h2>&emsp;Postal Code: $ '.$row['postal_code'].'</h2><br>';
            echo '<h2>&emsp;Date of Birth: $ '.$row['dob'].'</h2><br>';
            echo '<br>'
            echo '<h2>&emsp;Accounts: $ '.$row['acconts'].'</h2><br>';
            echo '<br>'
            echo '<h2>&emsp;Banker: $ '.$row['banker_fname'].' '.$row['banker_lname'].'</h2><br>';
            echo '</div>';
    ?>
    
    <?php 
        else:
            echo '<h1>Please, <a href="home.php">login</a> and come back later!</h1>';
        endif;
    ?>
   </div>
  </div>

 </body>
</html>
