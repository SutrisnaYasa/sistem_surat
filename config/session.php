<?php
session_start();
if(!empty($_SESSION['username'])){
	$session_username= $_SESSION['username'];
}else{
	header('Location: login.php');
}
?>