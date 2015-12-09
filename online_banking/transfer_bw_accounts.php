<?php


//require('connect.php');
require('common.php');
?>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Transfer Between Accounts</title>
    
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
    <h1>Transfer Between Accounts</h1>
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
            $query = "SELECT a.type, a.a_num from account as a, customer as c, depositor as d WHERE c.c_id = '$_SESSION[id]' and c.c_id = d.c_id and a.a_num = d.a_num";
            $result = mysqli_query($con, $query);
            echo mysqli_error($con);
            while ($row = mysqli_fetch_assoc($result)){
                echo '<option value= "'.$row['a_num'].'">';
            }
        ?>
        </datalist>
    
    </div>
    
    <?php
            echo '<div class="container"> <h2>To:</h2>';
            echo '<input list="accounts2" name="accounts2"> <datalist id="accounts2">';
            $query = "SELECT a.type, a.a_num from account as a, customer as c, depositor as d WHERE c.c_id = '$_SESSION[id]' and c.c_id = d.c_id and a.a_num = d.a_num and a.type != '$account'";
            $result = mysqli_query($con, $query);
            echo mysqli_error($con);
            while ($row = mysqli_fetch_assoc($result)){
                echo '<option value= "'.$row['a_num'].'">';
            }
            echo '</datalist> </div>';
            echo '<div class="container"> <h2><Amount:</h2>';
            echo '<input type="number" name="amount">';
            echo '<input type="submit"></form></div>';
            if(!isset($_POST['accounts']) || !isset($_POST['accounts2']) || !isset($_POST['amount']))
                $err[] = 'All the fields must be filled in!';
            else
            {
                // All entered, transfer money
                mysqli_query($con, "CALL transferToAcc('$_POST[accounts]', '$_POST[amount]', '$_POST[accounts2]');"); 
            }
            echo '<div class="container">';
            $query = "SELECT a.type, a.ballance, a.a_num from account as a, customer as c, depositor as d WHERE c.c_id = '$_SESSION[id]' and c.c_id = d.c_id and a.a_num = d.a_num";
            $result = mysqli_query($con, $query);
            echo mysqli_error($con);
            while ($row = mysqli_fetch_assoc($result)){
                $rows[] = $row;
            }
            foreach($rows as $curr){
                echo '<h2><strong>'.$curr['type'].' - '.$curr['a_num'].'</strong></h2>';
                echo '<h2>&emsp;BALANCE: $ '.$curr['ballance'].'</h2><br>';
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
