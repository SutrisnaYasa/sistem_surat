<?php


include "../config/koneksi_database.php";

$noSurat = $_REQUEST['noSurat'];
$tglSurat = $_REQUEST['tglSurat'];
$jenisSurat = $_REQUEST['jenisSurat'];
$perihal = $_REQUEST['perihal'];
$asalSurat = $_REQUEST['asalSurat'];
$sifatInstruksi = $_REQUEST['sifatInstruksi'];
$userInput = $_REQUEST['userInput'];
$terusan = $_POST['terusan'];

$ekstensi = array('pdf');
$file = $_FILES['fileSurat']['name'];
$x = explode('.', $file);
$eks = strtolower(end($x));
$ukuran = $_FILES['fileSurat']['size'];
$target_dir = "../files/suratmasuk/";

$sqlCek = mysqli_query($config, "select * from sip_suratmasuk where noSurat='$noSurat'");
$row = mysqli_num_rows($sqlCek);

if ($row > 0) {
	echo "<script>
	alert('No Surat Sudah Ada');location.href='suratmasuk_add.php';
	</script>";
} else {
	if ($file != "") {
		$rand = rand(1, 10000);
		$nfile = $rand . "-" . $file;

		if (in_array($eks, $ekstensi) == true) {
			move_uploaded_file($_FILES['fileSurat']['tmp_name'], $target_dir . $nfile);

			$save = mysqli_query($config, "INSERT INTO sip_suratmasuk(noSurat, tglSurat, jenisSurat, perihal, asalSurat, sifatInstruksi, fileSurat, userInput, tglInput) VALUES ('$noSurat', '$tglSurat','$jenisSurat','$perihal', '$asalSurat', '$sifatInstruksi', '$nfile','$userInput', NOW())");
			$surat_id = $config->insert_id;

			foreach ($terusan as $value) {
			$save = mysqli_query($config, "INSERT INTO sip_tujuan(noSurat, pengirimdivisi, tujuandivisi, status, userinput, tglinput) 
			VALUES ('$noSurat','2','$value', '0', '$userInput', NOW())");

			}

			if ($save == true) {
				echo "
				<script>
				alert('Pencatatan surat masuk berhasil. Dengan kode panggil : ". $surat_id .".');location.href='suratmasuk_list.php';
				</script>";
			} else {
				echo "<script>
				alert('Pencatatan surat masuk gagal!');location.href='suratmasuk_add.php';
				</script>";
			}
		} else {
			echo "<script>
		alert('Format file yang diupload tidak sesuai!');location.href='suratmasuk_add.php';
		</script>";
		}
	} else {
		echo "<script>
	alert('File surat tidak ada!');location.href='suratmasuk_add.php';
	</script>";
	}
}

