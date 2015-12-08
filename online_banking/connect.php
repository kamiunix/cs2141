<?php

if(!defined('INCLUDE_CHECK')) die('You are not allowed to execute this file directly');

$db_host		= 'localhost';
$db_user		= 'root';
$db_pass		= '';
$db_database	= 'onlinebanking'; 
$app_name        = "Dal Online Bank";

$con = new mysqli($db_host, $db_user, $db_pass, $db_database) or die($connection->connect_error);


?>
