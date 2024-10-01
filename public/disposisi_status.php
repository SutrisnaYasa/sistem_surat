<?php include"../config/koneksi_database.php"; ?>
<?php include"../config/session.php"; ?>

<?php
	$idSurat = $_REQUEST['idSurat'];
	$noSurat = $_REQUEST['noSurat'];
	$kategoriSurat = $_REQUEST['kategoriSurat'];
	$golongan = $_REQUEST['golongan'];
	if($golongan=="b"){
		$kodeBidang = $_REQUEST['kodeBidang'];
	}else{
		$kodeSie = $_REQUEST['kodeBidang'];
		$query_sie = mysqli_query($config, "SELECT * FROM sip_sie WHERE kodeSie='$kodeSie'");
        $array_sie = mysqli_fetch_array($query_sie); 

        $kodeBidang = $array_sie['kodeBidang'];
	}
	
	$update_status = mysqli_query($config, "UPDATE sip_disposisisurat SET status='1', tglStatus=NOW() WHERE noSurat='$noSurat' AND kodeBidang='$kodeBidang'");

	if($update_status == true){
		echo "<script>
				location.href='disposisi_list.php?idSurat=$idSurat&&kategoriSurat=$kategoriSurat';
			</script>";
	}else{
		echo "<script>
				location.href='suratmasuk_list.php';
			</script>";
	}
?>