<?php 



include"../config/koneksi_database.php";



$nip = $_REQUEST['nip'];

$nama = $_REQUEST['nama'];

$kodeBidang = $_REQUEST['kodeBidang'];

$golongan = $_REQUEST['golongan'];

$password = md5($_REQUEST['password']);



$save = mysqli_query($config, "INSERT INTO sip_user(nip, nama, kodeBidang, golongan, password) VALUES ('$nip','$nama', '$kodeBidang', '$golongan', '$password')");



if($save == true){

	echo "<script>

		alert('User: $nama, berhasil ditambahkan.');location.href='user_list.php';

	</script>";

}else{

	echo "<script>

		alert('User: $nama, gagal ditambahkan!');location.href='user_add.php';

	</script>";

}





?>