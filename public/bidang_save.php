<?php 

include"../config/koneksi_database.php";

$namaBidang = $_REQUEST['namaBidang'];
$kodesurat = $_REQUEST['kodesurat'];

$save = mysqli_query($config, "INSERT INTO sip_bidang(namaBidang,kodesurat) VALUES ('$namaBidang','$kodesurat')");

if($save == true){
	echo "<script>
		alert('Bagian/Bidang: $namaBidang, berhasil ditambahkan.');location.href='bidang_list.php';
	</script>";
}else{
	echo "<script>
		alert('Bagian/Bidang: $namaBidang, gagal ditambahkan!');location.href='bidang_add.php';
	</script>";
}


?>