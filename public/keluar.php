<?php
session_start();
session_destroy();
include"../config/koneksi_database.php";
{
echo "<script>
	alert('Logout Sukses');location.href='login.php';
	</script>";

	mysqli_query($config, "UPDATE tbl_user SET status='0' WHERE username='$_SESSION[username]'");
}
?>