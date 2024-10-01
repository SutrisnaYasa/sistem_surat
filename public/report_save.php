<?php 



include"../config/koneksi_database.php";



$idSurat = $_REQUEST['idSurat'];

$noSurat = $_REQUEST['noSurat'];

$userInput = $_REQUEST['userInput'];

$kategoriSurat = $_REQUEST['kategoriSurat'];

$keterangan = $_REQUEST['keterangan'];





$save = mysqli_query($config, "INSERT INTO sip_report(noSurat, userInput, tglInput, keterangan) VALUES ('$noSurat', '$userInput', NOW(), '$keterangan') ");



if($save == true){

	echo "<script>

		alert('Report berhasil ditambahkan.');location.href='disposisi_list.php?idSurat=$idSurat&&kategoriSurat=$kategoriSurat';

	</script>";

}else{

	echo "<script>

		alert('Report gagal ditambahkan!');location.href='disposisi_list.php?idSurat=$idSurat&&kategoriSurat=$kategoriSurat';

	</script>";

}





?>