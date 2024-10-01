<?php 

include"../config/koneksi_database.php";

$namaBox = $_REQUEST['namaBox'];
$jmlMaksimal = $_REQUEST['jmlMaksimal'];

$save = mysqli_query($config, "INSERT INTO sip_box(namaBox, jmlMaksimal,sisa) VALUES ('$namaBox', '$jmlMaksimal','$jmlMaksimal')");

if($save == true){
	echo "<script>
		alert('Nama Box: $namaBox, berhasil ditambahkan.');location.href='box_list.php';
	</script>";
}else{
	echo "<script>
		alert('Nama Box: $namaBox, gagal ditambahkan!');location.href='box_add.php';
	</script>";
}


?>