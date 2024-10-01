<?php 
session_start();
include"../config/koneksi_database.php";
$session_username= $_SESSION['username'];
$query_userFilter = mysqli_query($config, "SELECT * FROM sip_user WHERE nip='$session_username'");
$array_userFilter = mysqli_fetch_array($query_userFilter);
$kodeBidangFilter = $array_userFilter['kodeBidang'];

$id=$_REQUEST['id'];
$no=$_REQUEST['no'];
$tujuan=$_REQUEST['tujuan'];
$nosurat = explode('/',$no);
$kodeBidang=$_REQUEST['kodeBidang'];

if($kodeBidangFilter=="2"){
	$update_nosurat = mysqli_query($config, "UPDATE sip_nosuratkeluar SET noSurat = '$nosurat[0]', atributSurat='$no' WHERE id='$id'");
}else{
	$update_nosurat = mysqli_query($config, "UPDATE sip_nosuratkeluar SET perihal='$perihal',tujuan='$tujuan' WHERE id='$id'");
}


if($update_nosurat == true){
	echo "<script>
				alert('Data Nomor Surat Keluar berhasil diubah.');location.href='nosuratkeluar_list.php';
			</script>";
}else{
	echo "<script>
		alert('Data Nomor Surat Keluar gagal diubah.');location.href='nosuratkeluar_ubah.php?id=$id';
	</script>";
}

?>