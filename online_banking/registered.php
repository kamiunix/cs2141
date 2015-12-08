<?php

session_name('bank_login');
session_set_cookie_params(2*7*24*60*60);
session_start();

?>

<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Registered users only!</title>
    
    <link rel="stylesheet" type="text/css" href="demo.css" media="screen" />
    
</head>

<body>

<div id="main">
  <div class="container">
    <h1>Registered Users Only!</h1>
    <h2>Login to view this resource!</h2>
    </div>
    
    <div class="container">
    
    <?php
	if(isset($_SESSION['id']))
	echo '<h1>Hello, '.$_SESSION['usr'].'! You are registered and logged in!</h1>';
	else echo '<h1>Please, <a href="demo.php">login</a> and come back later!</h1>';
    ?>
    </div>
    
  <div class="container tutorial-info">
    </div>
</div>

    <div id="foot">
          <div class="wrap">
            <img src = "http://passages.ie.dal.ca/Dal_Logo.png" alt="HTML5 Icon" height="80">
          </div>

</body>
</html>
