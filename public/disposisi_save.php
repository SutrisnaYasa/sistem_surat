<?php 



include"../config/koneksi_database.php";



$kodeSimpan = $_REQUEST['kodeSimpan'];



if($kodeSimpan=='text'){

	$idSurat = $_REQUEST['idSurat'];

	$noSurat = $_REQUEST['noSurat'];

	$kodeBidang = $_REQUEST['kodeBidang'];

	$kodeBidangPe = $_REQUEST['kodeBidangPe'];

	$userPengirim = $_REQUEST['userPengirim'];

	$kategoriSurat = $_REQUEST['kategoriSurat'];

	

	$save = mysqli_query($config, "INSERT INTO sip_disposisisurat(noSurat, kodeBidang, pengirim, tglInput, userPengirim, status, tglStatus, fileDisposisi, tglInputFile,  userInputFile) VALUES ('$noSurat', '$kodeBidang', '$kodeBidangPe', NOW(), '$userPengirim', '0', NOW(), '', NOW(), '')");



	if($save == true){



						$msg['success']=TRUE;

						$msg['massages']='Berhasil Disimpan';



		

	}else{

		$msg['massages']='Gagal Disimpan';

		

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