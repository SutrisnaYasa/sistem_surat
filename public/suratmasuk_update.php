<?php 



include"../config/koneksi_database.php";



$idSurat=$_REQUEST['idSurat'];

$noSurat=$_REQUEST['noSurat'];
$tglSurat=$_REQUEST['tglSurat'];
$jenisSurat=$_REQUEST['jenisSurat'];

$perihal=$_REQUEST['perihal'];

$asalSurat=$_REQUEST['asalSurat'];
$sifatInstruksi=$_REQUEST['sifatInstruksi'];

$userInput = $_REQUEST['userInput'];



$ekstensi = array('pdf');

$file = $_FILES['fileSurat']['name'];

$x = explode('.', $file);

$eks = strtolower(end($x));

$ukuran = $_FILES['fileSurat']['size'];

$target_dir = "../files/suratmasuk/";



//select no surat lama

$sqlselect = mysqli_query($config,"select * from sip_suratmasuk WHERE idSurat='$idSurat' ");

$aRow = mysqli_fetch_array($sqlselect);



if($file != ""){

	$rand = rand(1,10000);

    $nfile = $rand."-".$file;

	

	if(in_array($eks, $ekstensi) == true){

		

		$query=mysqli_query($config, "SELECT fileSurat FROM sip_suratmasuk WHERE idSurat='$idSurat'");

		list($file) = mysqli_fetch_array($query);



		if(!empty($file)){

			unlink($target_dir.$file);



			move_uploaded_file($_FILES['fileSurat']['tmp_name'], $target_dir.$nfile);



			$update = mysqli_query($config, "UPDATE sip_suratmasuk SET noSurat='$noSurat', tglSurat='$tglSurat',jenisSurat='$jenisSurat',perihal='$perihal',asalSurat='$asalSurat',sifatInstruksi='$sifatInstruksi',fileSurat='$nfile' WHERE idSurat='$idSurat'");

			$update = mysqli_query($config, "UPDATE sip_disposisisurat SET noSurat='$noSurat' WHERE noSurat='$aRow[noSurat]'");

			$update = mysqli_query($config, "UPDATE sip_tujuan SET nosurat='$noSurat' WHERE nosurat='$aRow[noSurat]'");

			

	

			if($update == true){

				echo "<script>

				alert('Perubahan catatan surat masuk berhasil.');location.href='suratmasuk_list.php';

				</script>";

			}else{

				echo "<script>

				alert('Perubahan catatan surat masuk gagal!');location.href='suratmasuk_ubah.php?idSurat=$idSurat';

				</script>";

			}

		}else{

			move_uploaded_file($_FILES['fileSurat']['tmp_name'], $target_dir.$nfile);



			$update = mysqli_query($config, "UPDATE sip_suratmasuk SET noSurat='$noSurat',jenisSurat='$jenisSurat',perihal='$perihal',asalSurat='$asalSurat',fileSurat='$nfile' WHERE idSurat='$idSurat'");

			$update = mysqli_query($config, "UPDATE sip_disposisisurat SET noSurat='$noSurat' WHERE noSurat='$aRow[noSurat]'");

			$update = mysqli_query($config, "UPDATE sip_tujuan SET nosurat='$noSurat' WHERE nosurat='$aRow[noSurat]'");

			if($update == true){

				echo "<script>

				alert('Perubahan catatan surat masuk berhasil.');location.href='suratmasuk_list.php';

				</script>";

			}else{

				echo "<script>

				alert('Perubahan catatan surat masuk gagal!');location.href='suratmasuk_ubah.php?idSurat=$idSurat';

				</script>";

			}

		}

	}else{

		echo "<script>

		alert('Format file yang diupload tidak sesuai!');location.href='suratmasuk_ubah.php?idSurat=$idSurat';

		</script>";

	}

}else{

	$update = mysqli_query($config, "UPDATE sip_suratmasuk SET noSurat='$noSurat',jenisSurat='$jenisSurat',perihal='$perihal',asalSurat='$asalSurat' WHERE idSurat='$idSurat'");

	$update = mysqli_query($config, "UPDATE sip_disposisisurat SET noSurat='$noSurat' WHERE noSurat='$aRow[noSurat]'");

	$update = mysqli_query($config, "UPDATE sip_tujuan SET nosurat='$noSurat' WHERE nosurat='$aRow[noSurat]'");

	if($update == true){

		echo "<script>

		alert('Perubahan catatan surat masuk berhasil.');location.href='suratmasuk_list.php';

		</script>";

	}else{

		echo "<script>

		alert('Perubahan catatan surat masuk gagal!');location.href='suratmasuk_ubah.php?idSurat=$idSurat';

		</script>";

	}

}





?>