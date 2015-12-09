<?php

define('INCLUDE_CHECK',true);

define("__ROOT__", dirname(dirname(__FILE__))); 
// Those two files can be included only if INCLUDE_CHECK is defined


session_name('bank_login');
// Starting the session

session_start();

//connect to database
require 'connect.php';



// If user is logged in, and if the currentcookie is not set (ie, the browser was
// closed), and if remember me was unchecked at log in, destroy session (if
// remember me was checked, the session is retained.
if(isset($_SESSION['id']) && (!isset($_COOKIE['bank_user'])) && !(isset($_SESSION['rememberMe'])))
{

	$_SESSION = array();
	session_destroy();
	
	// Destroy the session
}


if (isset($_POST['submit']))
{
	// Checking whether the Login form has been submitted
	
	$err = array();
	// Will hold our errors
	
	
	if(!$_POST['username'] || !$_POST['password'])
		$err[] = 'All the fields must be filled in!';
	
	if(!count($err))
	{
		$_POST['username'] = mysql_real_escape_string($_POST['username']);
		$_POST['password'] = mysql_real_escape_string($_POST['password']);
		$_POST['rememberMe'] = (int)$_POST['rememberMe'];
		
		// Escaping all input data

        $usr = $_POST['username'];
        $pswd = $_POST['password'];
        // Check for employee or customer.
        if ($usr < 4521999999999999){
           $_SESSION['banker'] = true;
           $sqlquery = "SELECT CONCAT(first_name, \" \", last_name) AS 'Name', e_id FROM banker WHERE card_number='$usr' AND first_name='$pswd'";
           $result = mysqli_query($con, $sqlquery);
        }
        else{
            $sqlquery = "SELECT CONCAT(first_name, \" \", last_name) AS 'Name', c_id FROM customer WHERE card_number='$usr' AND passwd='$pswd'";
            $result = mysqli_query($con, $sqlquery);
        }
        // Match user and password.

        $count = mysqli_num_rows($result);
		if($count == 1)
		{

			// User and password match... countinue
            $row = mysqli_fetch_assoc($result);
			
			// Store some data in the session
			$_SESSION['usr']=$row['Name'];
            if (isset($_SESSION['banker']))
                $_SESSION['id'] = $row['e_id'];
            else
                $_SESSION['id'] = $row['c_id'];

            // Remember user only if checked.
            if ($_POST['rememberMe'] != 0)
                $_SESSION['rememberMe'] = $_POST['rememberMe'];
            
            // Set cookie for two weeks
            setcookie('bank_user', 'new user', 2*7*24*60*60, '/');

			
            // Remove previous error messages

            unset($_SESSION['msg']);
			
		}
		else $err[]='Wrong username and/or password!';
        // Free result set
        mysqli_free_result($result);
	}
	
	if($err)
	$_SESSION['msg']['login-err'] = implode('<br />',$err);
	// Save the error messages in the session

	header("Location: index.php");
	exit;
}

if(isset($_GET['logoff']))
{
	$_SESSION = array();
    $_POST = array();
	session_destroy();
	
	header("Location: index.php");
	exit;
}


$script = '';

if (isset($_SESSION['msg']))
{
	// The script below shows the sliding panel on page load
	
	$script = '
	<script type="text/javascript">
	
		$(function(){
		
			$("div#panel").show();
			$("#toggle a").toggle();
		});
	
	</script>';
	
}

?>


<!DOCTYPE html>
<html >

<head> <link rel="icon" type="image/png"
        href="http://www.dal.ca/etc/designs/dalhousie/clientlibs/global/default/images/favicon/DALSocialMediaMark-Blk.png" />
       <link rel="shortcut icon" type="image/png"
        href="http://www.dal.ca/etc/designs/dalhousie/clientlibs/global/default/images/favicon/DALSocialMediaMark-Blk.png" />
</head>
<!-- Panel -->
<div id="toppanel">
	<div id="panel">
		<div class="content clearfix">
            
            <?php
			
			if (!isset($_SESSION['id'])):
			
			?>
			<div class="left">
				<h1>Welcome to Online Banking at Dalhousie</h1>
				<h2>Login to access your account</h2>		
                <p class="grey">To login, use your card number as your username. If it is your first time logging in, use the password 
                    given to you by your banker.</p>
				<h2>No Account?</h2>
				<p class="grey">No Problem! Simply send fill out the form, and a banker will contact you shortly.</p>
			</div>
            
            
			<div class="left">
				<!-- Login Form -->
				<form class="clearfix" action="" method="post">
					<h1>Account Login</h1>
                    
                    <?php
						
						if(isset($_SESSION['msg']['login-err']))
						{
							echo '<div class="err">'.$_SESSION['msg']['login-err'].'</div>';
							unset($_SESSION['msg']['login-err']);
						}
					?>
					
					<label class="grey" for="username">Username:</label>
					<input class="field" type="text" name="username" id="username" value="" size="23" />
					<label class="grey" for="password">Password:</label>
					<input class="field" type="password" name="password" id="password" size="23" />
	            	<label><input name="rememberMe" id="rememberMe" class="mycheckbox" type="checkbox" checked="checked" value="1" /> &nbsp;Remember me</label>
        			<div class="clear"></div>
					<input type="submit" name="submit" value="Login" class="bt_login" />
				</form>
			</div>
			<div class="left right">			
				<!-- Register Form -->
				<form action="" method="post">
					<h1>New to online banking? Request to meet with a banker!</h1>		
                    
                    <?php
						
						if(isset($_SESSION['msg']['reg-err']))
						{
							echo '<div class="err">'.$_SESSION['msg']['reg-err'].'</div>';
							unset($_SESSION['msg']['reg-err']);
						}
						
						if(isset($_SESSION['msg']['reg-success']))
						{
							echo '<div class="success">'.$_SESSION['msg']['reg-success'].'</div>';
							unset($_SESSION['msg']['reg-success']);
						}
					?>
                    		
					<label class="grey" for="username">Your Name:</label>
					<input class="field" type="text" name="username" id="username" value="" size="23" />
					<label class="grey" for="email">Email:</label>
					<input class="field" type="text" name="email" id="email" size="23" />
					<label>A banker will e-mail you with information about applying.</label>
					<input type="submit" name="submit" value="Submit" class="bt_register" />
				</form>
			</div>
            
            <?php
			
			else:
			
			?>
			<div class="left">
				<h1>Thank you for choosing us, for your online banking.</h1>
				<h2>Transactions</h2>		
                <p class="grey">Navigate through the Members panel to complete various bank transactions. </p>
				<h2>Information?</h2>
				<p class="grey">View account and customer information by navigating the user panel.</p>
			</div>
            
            <?php
                  if (!isset($_SESSION['banker'])){
            echo'<div class="left">
            
            <h1>Services</h1>
            
            <p></p>
            <p><a href="transfer_bw_accounts.php">Transfer between accounts</a></p>
            <p><a href="loan_payment.php">Make a payment</a></p>
            <p><a href="change_password.php">Change Password</a></p>
            
            </div>
            
            <div class="left right">
            <h1>Welcome, '.$_SESSION['usr'].'</h1> 
            <p></p>
            <p><a href="account_info.php">Account Information</a></p>
            <p><a href="personal_info.php">Personal Information</a></p>
            <p><a href="?logoff">Log off</a></p>
            </div></div></div>';
            
            }
            else{
            echo'<div class="left">
            <h1>Services</h1>
            
            <p></p>
            <p><a href="transfer_bw_accounts.php">Customer List</a></p>
            <p><a href="edit_hold.php">Edit Customer Holds</a></p>
            
            </div>
            
            <div class="left right">
            <h1>Welcome,'.$_SESSION['usr'].'</h1> 
            <p></p>
            <p><a href="?logoff">Log off</a></p>
            </div></div></div>';
            }?>
            <?php
                endif;
			?>
	 <!-- /login -->	

    <!-- The tab on top -->	
	<div class="tab">
		<ul class="login">
	    	<li class="left">&nbsp;</li>
	        <li>Hello <?php echo isset($_SESSION['usr']) ? $_SESSION['usr'] : 'Guest';?>!</li>
			<li class="sep">|</li>
			<li id="toggle">
				<a id="open" class="open" href="#"><?php echo isset($_SESSION['id'])?'Open Panel':'Log In | Request';?></a>
				<a id="close" style="display: none;" class="close" href="#">Close Panel</a>			
			</li>
	    	<li class="right">&nbsp;</li>
		</ul> 
	</div> <!-- / top -->
	
</div> <!--panel -->

    <div id="foot">
          <div class="wrap">
            <img src = "http://passages.ie.dal.ca/Dal_Logo.png" alt="HTML5 Icon" height="80">
          </div>
     </div>

</div>

</html>
