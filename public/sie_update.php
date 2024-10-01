<?php 

include"../config/koneksi_database.php";

$kodeSie=$_REQUEST['kodeSie'];
$kodeBidang=$_REQUEST['kodeBidang'];
$namaSie=$_REQUEST['namaSie'];


if($namaSie!=""){
	$update_sie = mysqli_query($config, "UPDATE sip_sie SET namaSie='$namaSie' WHERE kodeSie='$kodeSie'");

	if($update_sie == true){
		mysqli_query($config, "UPDATE sip_sie SET kodeBidang='$kodeBidang' WHERE kodeSie='$kodeSie'");

		echo "<script>
				alert('Nama Sie dan Nama Bagian/Bidang berhasil diubah.');location.href='sie_list.php';
			</script>";
}}else{
	echo "<script>
		alert('Nama Sie dan Nama Bagian/Bidang gagal diubah	.');location.href='sie_ubah.php?kodeSie=$kodeSie';
	</script>";
}

?>