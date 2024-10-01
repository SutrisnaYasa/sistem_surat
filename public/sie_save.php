<?php 

include"../config/koneksi_database.php";

$kodeBidang = $_REQUEST['kodeBidang'];
$namaSie = $_REQUEST['namaSie'];

$save = mysqli_query($config, "INSERT INTO sip_sie(kodeBidang, namaSie) VALUES ('$kodeBidang', '$namaSie')");

if($save == true){
	mkdir('../files/'.$namaSie);
	echo "<script>
		alert('Sie: $namaSie, berhasil ditambahkan.');location.href='sie_list.php';
	</script>";
}else{
	echo "<script>
		alert('Sie: $namaSie, gagal ditambahkan!');location.href='sie_add.php';
	</script>";
}


?>