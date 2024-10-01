<?php 

include"../config/koneksi_database.php";

$kodeSie = $_REQUEST['kodeSie'];
$namaBerkas = $_REQUEST['namaBerkas'];
$noBerkas = $_REQUEST['noBerkas'];

	$sqlberkas= mysqli_query($config,"select * from sip_berkas where kodeberkas='$kodeSie' ");
	$uDataberkas=mysqli_fetch_array($sqlberkas);
	$namab = $uDataberkas['namaBerkas'];
	$kode_sie = $uDataberkas['kodeSie'];

$save = mysqli_query($config, "INSERT INTO sip_sub_berkas(kodeberkas, namasub,nosub,kodesie) VALUES ('$kodeSie', '$namaBerkas','$noBerkas','$kode_sie')");

if($save == true){
	$sqlberkas= mysqli_query($config,"select * from sip_berkas where kodeberkas='$kodeSie' ");
	$uDataberkas=mysqli_fetch_array($sqlberkas);
	$namab = $uDataberkas['namaBerkas'];
	$kode_sie = $uDataberkas['kodeSie'];
	
	$sqlsub= mysqli_query($config,"select * from sip_sie where kodeSie='$kode_sie' ");
	$uDatasub=mysqli_fetch_array($sqlsub);
	$namabsub = $uDatasub['namaSie'];
	
	mkdir('../files/'.$namabsub.'/'.$namab.'/'.$namaBerkas);
	echo "<script>
		alert('sub berkas: $namaBerkas, berhasil ditambahkan.');location.href='sub_bekas_list.php';
	</script>";
}else{
	echo "<script>
		alert('sub berkas: $namaBerkas, gagal ditambahkan!');location.href='sub_bekas_list.php';
	</script>";
}


?>