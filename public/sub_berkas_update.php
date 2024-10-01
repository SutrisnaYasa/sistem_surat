<?php 

include"../config/koneksi_database.php";

$kodeSie=$_REQUEST['kodeSie'];
$kodeBerkas=$_REQUEST['kodeBerkas'];
$noBerkas=$_REQUEST['noBerkas'];
$namaBerkas=$_REQUEST['namaBerkas'];


if($namaBerkas!=""){
	$update_berkas = mysqli_query($config, "UPDATE sip_sub_berkas SET namasub='$namaBerkas',nosub='$noBerkas' WHERE idsub='$kodeBerkas'");

	if($update_berkas == true){
		mysqli_query($config, "UPDATE sip_berkas SET kodeberkas='$kodeSie' WHERE idsub='$kodeBerkas'");

		echo "<script>
				alert('Nama Sub Berkas dan Nama Berkas berhasil diubah.');location.href='sub_bekas_list.php';
			</script>";
}}else{
	echo "<script>
		alert('Nama Sub Berkas dan Nama Berkas gagal diubah.');location.href='sub_bekas_list.php?kodeBerkas=$kodeBerkas';
	</script>";
}

?>