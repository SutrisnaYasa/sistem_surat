<?php 

include"../config/koneksi_database.php";

$kodeRak=$_REQUEST['kodeRak'];
$namaRak=$_REQUEST['namaRak'];
$jmlMaksimal=$_REQUEST['jmlMaksimal'];

if($namaRak!="" && $jmlMaksimal!=""){
$update = mysqli_query($config, "UPDATE sip_rak SET namaRak='$namaRak', jmlMaksimal='$jmlMaksimal' WHERE kodeRak='$kodeRak'");
	
if($update == true){
	echo "<script>
		alert('Nama Rak dan Jumlah Maksimal berhasil diubah.');location.href='rak_list.php';
		</script>";
}}else{
	echo "<script>
		alert('Nama Rak dan Jumlah Maksimal gagal diubah.');location.href='rak_ubah.php?kodeRak=$kodeRak';
				</script>";
}


?>