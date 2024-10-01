<?php 

include"../config/koneksi_database.php";

$kodeSie=$_REQUEST['kodeSie'];
$kodeBerkas=$_REQUEST['kodeBerkas'];
$noBerkas=$_REQUEST['noBerkas'];
$namaBerkas=$_REQUEST['namaBerkas'];


if($namaBerkas!=""){
	$update_berkas = mysqli_query($config, "UPDATE sip_berkas SET namaBerkas='$namaBerkas',noBerkas='$noBerkas' WHERE kodeBerkas='$kodeBerkas'");

	if($update_berkas == true){
		mysqli_query($config, "UPDATE sip_berkas SET kodeSie='$kodeSie' WHERE kodeBerkas='$kodeBerkas'");

		echo "<script>
				alert('Nama Berkas dan Nama Sie berhasil diubah.');location.href='berkas_list.php';
			</script>";
}}else{
	echo "<script>
		alert('Nama Berkas dan Nama Sie gagal diubah.');location.href='berkas_ubah.php?kodeBerkas=$kodeBerkas';
	</script>";
}

?>