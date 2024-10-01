<?php 

include"../config/koneksi_database.php";

$kodeSie = $_REQUEST['kodeSie'];
$namaBerkas = $_REQUEST['namaBerkas'];
$noBerkas = $_REQUEST['noBerkas'];

$save = mysqli_query($config, "INSERT INTO sip_berkas(kodeSie, namaBerkas,noBerkas) VALUES ('$kodeSie', '$namaBerkas','$noBerkas')");

if($save == true){
	$sqlberkas= mysqli_query($config,"select * from sip_sie where kodeSie='$kodeSie' ");
	$uDataberkas=mysqli_fetch_array($sqlberkas);
	$namab = $uDataberkas['namaSie'];
	
	mkdir('../files/'.$namab.'/'.$namaBerkas);
	echo "<script>
		alert('Sie: $namaBerkas, berhasil ditambahkan.');location.href='berkas_list.php';
	</script>";
}else{
	echo "<script>
		alert('Sie: $namaBerkas, gagal ditambahkan!');location.href='berkas_add.php';
	</script>";
}


?>