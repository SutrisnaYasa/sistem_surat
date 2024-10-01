<?php include"../config/koneksi_database.php"; ?>
<?php include"../template/header.php"; ?>
<?php
	$terusan = $_POST['terusan'];
	$noSurat = $_POST['noSuratT'];
	$query_userLogin = mysqli_query($config, "SELECT * FROM sip_user WHERE nip='$session_username'");
	
	$array_userLogin = mysqli_fetch_array($query_userLogin);
	$kodeBidangLogin = $array_userLogin['kodeBidang'];
	
		$save=mysqli_query($config, "INSERT INTO sip_tujuan(noSurat, pengirimdivisi, tujuandivisi, status, userinput, tglinput) 
		VALUES ('$noSurat','$kodeBidangLogin','$terusan', '0', '$session_username', NOW())");
		
	
	if($save == true)
	{
		echo "<script>
		alert('Pencatatan surat masuk berhasil.');location.href='inbox_list.php';
		</script>";
	}else{
		echo "<script>
		alert('Pencatatan surat masuk gagal!');location.href='inbox_list.php';
		</script>";
	}
?>