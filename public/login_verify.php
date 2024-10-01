<?php

session_start();



include"../config/koneksi_database.php";



$username_sent =$_REQUEST['username'];

$password_sent =md5($_REQUEST['password']);

$query = mysqli_query($config,"SELECT * FROM sip_user WHERE nip='$username_sent' && password='$password_sent'");

$row = mysqli_num_rows($query);



if($row==1){



	$_SESSION['username']=$username_sent;

	echo "<script>

			location.href='index.php';

		</script>";

}else{

	echo "<script>

		alert('Username dan Password tidak ditemukan');location.href='login.php';</script>";	

}

