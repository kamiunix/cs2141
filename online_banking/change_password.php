<?php


//require('connect.php');
require('common.php');
?>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Change Password</title>
    
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
    <h1>Change Password</h1>
    <?php

        if (isset($_SESSION['id'])):

    ?>
    <h2><?php echo $_SESSION['usr']?></h2>
    <hr>
    <div class="container">
    <form action="" method="post">
        <h2>Old Password</h2>
        <input type="password" name="oldpass">
        <br>
        <h2>New Passowrd</h2>
        <input type="password" name="newpass">
    <input type="submit">
    </form>
    
    </div>
    
    <?php
        if(isset($_POST['oldpass'])){
            $query = "SELECT passwd from customer where c_id = '$_SESSION[id]' and passwd = '$_POST[oldpass]'";
            $result = mysqli_query($con, $query);
            $count = mysqli_num_rows($result);
            if($count == 1)
            {
                mysqli_query($con, "CALL setPassword('$_POST[newpass]', '$_SESSION[id]';");
                echo '<h1>Success!</h1>';
            }
            else
                echo '<h2><font color="red">Wrong username and/or password!</font></h2>';
                                
        }
        // Display error if exists

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
