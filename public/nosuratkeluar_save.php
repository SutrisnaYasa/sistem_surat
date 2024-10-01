<?php
session_start();
$session_username= $_SESSION['username'];
date_default_timezone_set('Asia/Makassar'); 
?>

<?php 

include"../config/koneksi_database.php";

$awal = $_REQUEST['awal'];
$akhir = $_REQUEST['akhir'];
$kodeBidang = $_REQUEST['kodeBidang'];
$userInput = $_REQUEST['userInput'];

$query_userLogin = mysqli_query($config, "SELECT * FROM sip_user WHERE nip='$session_username'");
$array_userLogin = mysqli_fetch_array($query_userLogin);
$golonganUserLogin=$array_userLogin['kodeBidang'];
$query_nosurat = mysqli_query($config, "SELECT * FROM sip_bidang where kodebidang = '$golonganUserLogin'");
$array_nosurat = mysqli_fetch_array($query_nosurat);
$kodeklasifikasi = $array_nosurat['kodesurat'];
$thn = 'Bapenda';

for($i=$awal;$i<=$akhir;$i++){
	$panjangx = strlen($i);
		if($panjangx == 1){
			$cek = '000'.$i;
		}
		if($panjangx == 2){
			$cek = '00'.$i;
		}
		if($panjangx == 3){
			$cek = '0'.$i;
		}
		if($panjangx == 4){
			$cek = $i;
		}
		
	$query = mysqli_query($config, "SELECT LEFT(noSuratKeluar,'4') as noSurat FROM sip_suratkeluar where kodebidang = '$golonganUserLogin' and LEFT(noSuratKeluar,'4') ='$cek' and right(noSuratKeluar,'4')='$thn'");
	$array_cek = mysqli_num_rows($query);
	
	if($array_cek > 0){
		echo "<script>
		alert('Data nomor urut $cek pada surat keluar sudah digunakan oleh Bidang .');location.href='nosuratkeluar_list.php';
	</script>";	
	}

	
}

$query_userFilter = mysqli_query($config, "SELECT * FROM sip_user WHERE nip='$session_username'");
$array_userFilter = mysqli_fetch_array($query_userFilter);
$kodeBidangFilter = $array_userFilter['kodeBidang'];

for($i=$awal;$i<=$akhir;$i++){
	$panjang = strlen($i);
		if($panjang == 1){
			$noBaru = $kodeklasifikasi.'/'.'000'.$i.'/'.$thn;
			$noBaru2 = '000'.$i;
		}
		if($panjang == 2){
			$noBaru = $kodeklasifikasi.'/'.'00'.$i.'/'.$thn;
			$noBaru2 = '00'.$i;
		}
		if($panjang == 3){
			$noBaru = $kodeklasifikasi.'/'.'0'.$i.'/'.$thn;
			$noBaru2 = '0'.$i;
		}
		if($panjang == 4){
			$noBaru = $kodeklasifikasi.'/'.$i.'/'.$thn;
			$noBaru2 = $i;
		}
	$save = mysqli_query($config, "INSERT INTO sip_nosuratkeluar(nosurat,atributsurat,tahun,kodeBidang, userInput, tglInput) 
	VALUES ('$noBaru2','$noBaru','$thn', '$kodeBidang', '$userInput', NOW())");
}
if($save == true){
	echo "<script>
		alert('Data nomor surat keluar berhasil ditambahkan.');location.href='nosuratkeluar_list.php';
	</script>";
}else{
	echo "<script>
		alert('Data nomor surat keluar gagal ditambahkan!');location.href='nosuratkeluar_add.php';
	</script>";
}


?>