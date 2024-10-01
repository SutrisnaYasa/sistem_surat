<?php 



include"../config/koneksi_database.php";


$kodeSimpan = $_REQUEST['kodeSimpan'];



if($kodeSimpan=='text'){
	$idSurat = $_REQUEST['idSurat'];
	$noSurat = $_REQUEST['noSurat'];
	$kodeBidang = $_REQUEST['kodeBidang'];
	$kodeBidang_2 = $_REQUEST['kodeBidang_2'];
	$kodeBidang_3 = $_REQUEST['kodeBidang_3'];
	$kodeBidangPe = $_REQUEST['kodeBidangPe'];
	$userPengirim = $_REQUEST['userPengirim'];
	$kategoriSurat = $_REQUEST['kategoriSurat'];
	$isiInstruksi = $_REQUEST['isiInstruksi'];
	$abaikanSurat = $_REQUEST['abaikanSurat'];

	
	$save = mysqli_query($config, "INSERT INTO sip_disposisisurat(noSurat, kodeBidang, kodeBidang_2, kodeBidang_3, pengirim, tglInput, userPengirim, status, tglStatus, fileDisposisi, tglInputFile,  userInputFile, isiInstruksi, abaikanSurat) VALUES ('$noSurat', '$kodeBidang', '$kodeBidang_2', '$kodeBidang_3','$kodeBidangPe', NOW(), '$userPengirim', '0', NOW(), '', NOW(), '', '$isiInstruksi', '$abaikanSurat')");

	if($save == true){				
					echo "<script>
					location.href='inbox_detail.php?idSurat=$idSurat&&kategoriSurat=$kategoriSurat';
					</script>";
				}else{
					echo "<script>
					alert('Disposisi gagal!');location.href='inbox_detail.php?idSurat=$idSurat&&kategoriSurat=$kategoriSurat';
					</script>";
				}

}else{
	$idSurat=$_REQUEST['idSurat'];
	$noSurat=$_REQUEST['noSurat'];
	$kodeBidang = $_REQUEST['kodeBidang2'];
	$userInputFile = $_REQUEST['userInputFile'];
	$kategoriSurat = $_REQUEST['kategoriSurat'];

	$ekstensi = array('pdf');
	$file = $_FILES['fileDisposisi']['name'];
	$x = explode('.', $file);
	$eks = strtolower(end($x));
	$ukuran = $_FILES['fileDisposisi']['size'];
	$target_dir = "../files/disposisi/";

		$rand = rand(1,10000);
    	$nfile = $rand."-".$file;

		if(in_array($eks, $ekstensi) == true){

			$query=mysqli_query($config, "SELECT fileDisposisi FROM sip_disposisisurat WHERE noSurat='$noSurat' ");
			list($file) = mysqli_fetch_array($query);

			if(!empty($file)){
				unlink($target_dir.$file);

				move_uploaded_file($_FILES['fileDisposisi']['tmp_name'], $target_dir.$nfile);

				$update = mysqli_query($config, "UPDATE sip_disposisisurat SET fileDisposisi='$nfile', tglInputFile=NOW(), userInputFile='$userInputFile' WHERE noSurat='$noSurat' and kodeBidang='$kodeBidang'");

				if($update == true){				
					echo "<script>
					alert('Upload file disposisi berhasil.');location.href='disposisi_list.php?idSurat=$idSurat&&kategoriSurat=$kategoriSurat';
					</script>";
				}else{
					echo "<script>
					alert('Upload file disposisi gagal!');location.href='disposisi_list.php?idSurat=$idSurat&&kategoriSurat=$kategoriSurat';
					</script>";
				}
			}else{
				move_uploaded_file($_FILES['fileDisposisi']['tmp_name'], $target_dir.$nfile);

				$update = mysqli_query($config, "UPDATE sip_disposisisurat SET fileDisposisi='$nfile', tglInputFile=NOW(), userInputFile='$userInputFile' WHERE noSurat='$noSurat' and kodeBidang='$kodeBidang'");

				if($update == true){				
					echo "<script>
					alert('Upload file disposisi berhasil.');location.href='disposisi_list.php?idSurat=$idSurat&&kategoriSurat=$kategoriSurat';
					</script>";
				}else{
					echo "<script>
					alert('Upload file disposisi gagal!');location.href='disposisi_list.php?idSurat=$idSurat&&kategoriSurat=$kategoriSurat';
					</script>";
				}
			}

		}else{
			echo "<script>
			alert('Format file yang diupload tidak sesuai!');location.href='disposisi_list.php?idSurat=$idSurat&&kategoriSurat=$kategoriSurat';
			</script>";
		}
}

echo json_encode($msg);

?>