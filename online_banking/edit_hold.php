<?php


//require('connect.php');
require('common.php');
?>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Edit Holds</title>
    
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
    <h1>Edit Holds</h1>
   <?php

        if (isset($_SESSION['id'])):

    ?>
    <h2><?php echo $_SESSION['usr']?></h2>
    <hr>
    <div class="container">
    <form action="" method="post">
        <h2>From:</h2>
        <input list="accounts" name="accounts">
        <datalist id="accounts">
        <?php 
            $query = "SELECT a.a_num FROM account as a, banker as b, customer as c, depositor as d Where c.c_id = d.c_id and d.a_num = a.a_num and b.e_id = '$_SESSION[id]' and c.banker = b.e_id";
            $result = mysqli_query($con, $query);
            echo mysqli_error($con);
            while ($row = mysqli_fetch_assoc($result)){
                echo '<option value= "'.$row['c_id'].'">';
            }
        ?>
        </datalist>
    
    </div>
    
    <?php
            echo '<div class="container"> <h2><New Amount:</h2>';
            echo '<input type="number" name="amount">';
            echo '<input type="submit"></form></div>';
            echo '<div class="container">';
            if(!isset($_POST['accounts']) || !isset($_POST['amount']))
                $err[] = 'All the fields must be filled in!';
            else
            {
                mysqli_query($con, "CALL payHolds('$_POST[accounts]', '$_POST[amount]');");
                echo '<div class="container"> <h2>Holds:</h2>';
                $query = "SELECT holds FROM account Where a_num = '$_POST[accounts]'";
                $result = mysqli_query($con, $query);
                echo mysqli_error($con);
                $curr = mysqli_fetch_assoc($result);
                echo '<h2><strong>Hold: '.$curr['holds'].'</strong></h2>';
            }
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
