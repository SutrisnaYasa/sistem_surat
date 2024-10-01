<?php 



include"../config/koneksi_database.php";



$idSurat = $_REQUEST['idSurat'];

$isiKomentar = $_REQUEST['isiKomentar'];

$noSurat = $_REQUEST['noSurat'];

$userInput = $_REQUEST['userInput'];

$kategoriSurat = $_REQUEST['kategoriSurat'];



$save = mysqli_query($config, "INSERT INTO sip_komentar(noSurat, isiKomentar, userInput, tglInput) VALUES ('$noSurat', '$isiKomentar', '$userInput', NOW())");



if($save == true){

	echo "<script>

		alert('Komentar berhasil ditambahkan.');location.href='inbox_detail.php?idSurat=$idSurat&&kategoriSurat=$kategoriSurat';

	</script>";

}else{

	echo "<script>

		alert('Komentar gagal ditambahkan!');location.href='inbox_detail.php?idSurat=$idSurat&&kategoriSurat=$kategoriSurat';

	</script>";

}





?>