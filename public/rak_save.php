<?php 

include"../config/koneksi_database.php";

$namaRak = $_REQUEST['namaRak'];
$jmlMaksimal = $_REQUEST['jmlMaksimal'];

$save = mysqli_query($config, "INSERT INTO sip_rak(namaRak, jmlMaksimal,sisa) VALUES ('$namaRak', '$jmlMaksimal','$jmlMaksimal')");

if($save == true){
	echo "<script>
		alert('Nama Rak: $namaRak, berhasil ditambahkan.');location.href='rak_list.php';
	</script>";
}else{
	echo "<script>
		alert('Nama Rak: $namaRak, gagal ditambahkan!');location.href='rak_add.php';
	</script>";
}


?>