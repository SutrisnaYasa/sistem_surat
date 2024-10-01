<?php 

include"../config/koneksi_database.php";

$nip=$_REQUEST['nip'];
$nama=$_REQUEST['nama'];
$kodeBidang=$_REQUEST['kodeBidang'];
$golongan=$_REQUEST['golongan'];
$password = MD5($_REQUEST['password']);


if($nama!="" || $password!=""){
	$update_user = mysqli_query($config, "UPDATE sip_user SET nama='$nama', password='$password' WHERE nip='$nip'");

	if($update_user == true){
		mysqli_query($config, "UPDATE sip_user SET kodeBidang='$kodeBidang', golongan='$golongan' WHERE nip='$nip'");

		echo "<script>
				alert('User berhasil diubah.');location.href='user_list.php';
			</script>";
}}else{
	echo "<script>
		alert('User gagal diubah.');location.href='user_ubah.php?nip=$nip';
	</script>";
}

?>