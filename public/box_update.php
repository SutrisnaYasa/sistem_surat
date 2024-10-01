<?php 

include"../config/koneksi_database.php";

$kodeBox=$_REQUEST['kodeBox'];
$namaBox=$_REQUEST['namaBox'];
$jmlMaksimal=$_REQUEST['jmlMaksimal'];

if($namaBox!="" && $jmlMaksimal!=""){
$update = mysqli_query($config, "UPDATE sip_box SET namaBox='$namaBox', jmlMaksimal='$jmlMaksimal' WHERE kodeBox='$kodeBox'");
	
if($update == true){
	echo "<script>
		alert('Nama Box dan Jumlah Maksimal berhasil diubah.');location.href='box_list.php';
		</script>";
}}else{
	echo "<script>
		alert('Nama Box dan Jumlah Maksimal gagal diubah.');location.href='box_ubah.php?kodeBox=$kodeBox';
				</script>";
}


?>