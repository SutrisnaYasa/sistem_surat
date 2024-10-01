<?php 

include"../config/koneksi_database.php";

$kodeBidang=$_REQUEST['kodeBidang'];
$namaBidang=$_REQUEST['namaBidang'];
$namaBidangLama=$_REQUEST['namaBidangLama'];
$kodesurat = $_REQUEST['kodesurat'];

if($namaBidang!=""){
$update = mysqli_query($config, "UPDATE sip_bidang SET namaBidang='$namaBidang',kodesurat='$kodesurat' WHERE kodeBidang='$kodeBidang'");
	
if($update == true){
	echo "<script>
		alert('Nama Bidang: $namaBidangLama berhasil diubah menjadi: $namaBidang.');location.href='bidang_list.php';
		</script>";
}}else{
	echo "<script>
		alert('Nama Bidang: $namaBidangLama gagal diubah menjadi: $namaBidang.');location.href='bidang_ubah.php?kodeBidang=$kodeBidang';
				</script>";
}


?>