<?php 

include"../config/koneksi_database.php";

$kodeArsip = $_REQUEST['kodeArsip'];
$kodeSie = $_REQUEST['kodeSie'];
$kodeBerkas = $_REQUEST['kodeBerkas'];
$tahun = $_REQUEST['tahun'];
$klasifikasi = $_REQUEST['klasifikasi'];
$uraian = $_REQUEST['uraian'];
$indexes = $_REQUEST['indexes'];
$kodeRak = $_REQUEST['kodeRak'];
$kodeBox = $_REQUEST['kodeBox'];
$sampul = $_REQUEST['sampul'];
$userInput = $_REQUEST['userInput'];

$update = mysqli_query($config, "UPDATE sip_dataarsip SET instansi='$kodeSie', jenisBerkas='$kodeBerkas', tahun='$tahun', klasifikasi='$klasifikasi', uraian='$uraian', indexes='$indexes', kodeRak='$kodeRak', kodeBox='$kodeBox', sampul='$sampul', userInput='$userInput', tglInput=NOW() WHERE kodeArsip='$kodeArsip'");

if($update == true){
	echo "<script>
		alert('Data arsip berhasil diubah.');location.href='arsip_list.php';
	</script>";
}else{
	echo "<script>
		alert('Data arsip gagal diubah!');location.href='arsip_ubah.php?kodeArsip=$kodeArsip';
	</script>";
}


?>