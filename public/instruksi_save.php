<?php 



include"../config/koneksi_database.php";



$idSurat = $_REQUEST['idSurat'];

$sifatInstruksi = $_REQUEST['sifatInstruksi'];

$isiInstruksi = $_REQUEST['isiInstruksi'];

$noSurat = $_REQUEST['noSurat'];

$userInput = $_REQUEST['userInput'];

$kategoriSurat = $_REQUEST['kategoriSurat'];





$save = mysqli_query($config, "INSERT INTO sip_instruksi(sifatInstruksi, noSurat, isiInstruksi, userInput, tglInput) VALUES ('$sifatInstruksi','$noSurat', '$isiInstruksi', '$userInput', NOW())");



if($save == true){

	echo "<script>

		alert('Instruksi berhasil ditambahkan.');location.href='inbox_detail.php?idSurat=$idSurat&&kategoriSurat=$kategoriSurat';

	</script>";

}else{

	echo "<script>

		alert('Instruksi gagal ditambahkan!');location.href='inbox_detail.php?idSurat=$idSurat&&kategoriSurat=$kategoriSurat';

	</script>";

}





?>