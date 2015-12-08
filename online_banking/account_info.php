<?php


//require('connect.php');
require('common.php');
?>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Account Information</title>
    
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
    <h1>Account Information</h1>
    <?php

        if (isset($_SESSION['id'])):

    ?>
    <h2><?php echo $_SESSION['usr']?></h2>
    <hr>
    <div class="container">
    <form action="" method="post">
        <h2>Select one of your accounts</h2>
        <input list="accounts" name="accounts">
        <datalist id="accounts">
        <?php 
            $query = "SELECT type from account as a, customer as c, depositor as d WHERE c.c_id = '$_SESSION[id]' and c.c_id = d.c_id and a.a_num = d.a_num";
            $result = mysqli_query($con, $query);
            echo mysqli_error($con);
            while ($row = mysqli_fetch_assoc($result)){
                echo '<option value= "'.$row['type'].'">';
            }
        ?>
        </datalist>
    <input type="submit">
    </form>
    
    </div>
    
    <?php
        // Get account type from form and display.
        if(isset($_POST['accounts'])){
            $account = $_POST['accounts'];
            echo '<div class="container"> <h2><strong>'.$account.':</strong></h2><hr> ';
            $query = "CALL getAccountInfo('$account', $_SESSION[id]);";
            $result = mysqli_query($con, $query);
            echo mysqli_error($con);
            $row = mysqli_fetch_assoc($result);
            echo '<h2>&emsp;BALANCE: $ '.$row['ballance'].'</h2><br>';
            echo '<h2>&emsp;HOLDS: $ '.$row['holds'].'</h2></div>';
        }
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
