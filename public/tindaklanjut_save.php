<?php 



include"../config/koneksi_database.php";



$idSurat = $_REQUEST['idSurat'];

$isiTindaklanjut = $_REQUEST['isiTindaklanjut'];

$isiTarget = $_REQUEST['isiTarget'];

$tglSelesai = $_REQUEST['tglSelesai'];

$noSurat = $_REQUEST['noSurat'];

$userInput = $_REQUEST['userInput'];

$kategoriSurat = $_REQUEST['kategoriSurat'];






$save = mysqli_query($config, "INSERT INTO sip_tindaklanjut(noSurat, isiTindaklanjut, isiTarget, tglSelesai, userInput, tglInput) VALUES ('$noSurat', '$isiTindaklanjut', '$isiTarget', '$tglSelesai', '$userInput', NOW()) ");



if($save == true){

	echo "<script>

		alert('Tindak Lanjut berhasil ditambahkan.');location.href='disposisi_list.php?idSurat=$idSurat&&kategoriSurat=$kategoriSurat';

	</script>";

}else{

	echo "<script>

		alert('Tindak Lanjut gagal ditambahkan!');location.href='disposisi_list.php?idSurat=$idSurat&&kategoriSurat=$kategoriSurat';

	</script>";

}





?>