<?php 

include"../config/koneksi_database.php";

$noSurat=$_REQUEST['noSurat'];
$kodebidangsurat=$_REQUEST['kodebidang'];
$kodeklasifikasi=$_REQUEST['kodeklasifikasi'];
$tahun=$_REQUEST['tahun'];

$nosuratkeluar = $kodeklasifikasi.'/'.$noSurat.'/'.$tahun;

$idSurat=$_REQUEST['idSurat'];
$noSurat=$_REQUEST['noSurat'];
$jenisSurat=$_REQUEST['jenisSurat'];
$perihal=$_REQUEST['perihal'];
$kodeBidang=$_REQUEST['kodeBidang'];
$userInput = $_REQUEST['userInput'];
$nip = $_REQUEST['nipx'];
$tujuan = $_REQUEST['tujuan'];

$query_siePengirim = mysqli_query($config, "SELECT kodeBidang FROM sip_user WHERE nip='$nip'");
$array_siePengirim = mysqli_fetch_array($query_siePengirim);
$namaBidangPengirim=$array_siePengirim['kodeBidang'];

$ekstensi = array('pdf');
$file = $_FILES['fileSurat']['name'];
$x = explode('.', $file);
$eks = strtolower(end($x));
$ukuran = $_FILES['fileSurat']['size'];
$target_dir = "../files/suratkeluar/";

if($file != ""){
	$rand = rand(1,10000);
    $nfile = $rand."-".$file;
	
	if(in_array($eks, $ekstensi) == true){
		
		$query=mysqli_query($config, "SELECT fileSurat FROM sip_suratkeluar WHERE idSurat='$idSurat'");
		list($file) = mysqli_fetch_array($query);

		if(!empty($file)){
			unlink($target_dir.$file);

			move_uploaded_file($_FILES['fileSurat']['tmp_name'], $target_dir.$nfile);

			$update = mysqli_query($config, "UPDATE sip_suratkeluar SET tujuan='$tujuan', noSuratKeluar='$nosuratkeluar',jenisSurat='$jenisSurat',perihal='$perihal',fileSurat='$nfile' WHERE idSurat='$idSurat'");
		
	
			if($update == true){
				//mysqli_query($config, "UPDATE sip_suratkeluar SET kodeBidang='$namaBidangPengirim' WHERE idSurat='$idSurat'");
				
				echo "<script>
				alert('Perubahan catatan surat keluar berhasil.');location.href='suratkeluar_list.php';
				</script>";
			}else{
				echo "<script>
				alert('Perubahan catatan surat keluar gagal!');location.href='suratkeluar_ubah.php?idSurat=$idSurat';
				</script>";
			}
		}else{
			move_uploaded_file($_FILES['fileSurat']['tmp_name'], $target_dir.$nfile);

			$update = mysqli_query($config, "UPDATE sip_suratkeluar SET tujuan='$tujuan',noSuratKeluar='$noSurat',jenisSurat='$jenisSurat',perihal='$perihal',fileSurat='$nfile' WHERE idSurat='$idSurat'");
		
			if($update == true){
				//mysqli_query($config, "UPDATE sip_suratkeluar SET kodeBidang='$namaBidangPengirim' WHERE idSurat='$idSurat'");

				echo "<script>
				alert('Perubahan catatan surat keluar berhasil.');location.href='suratkeluar_list.php';
				</script>";
			}else{
				echo "<script>
				alert('Perubahan catatan surat keluar gagal!');location.href='suratkeluar_ubah.php?idSurat=$idSurat';
				</script>";
			}
		}
	}else{
		echo "<script>
		alert('Format file yang diupload tidak sesuai!');location.href='suratkeluar_ubah.php?idSurat=$idSurat';
		</script>";
	}
}else{
	$update = mysqli_query($config, "UPDATE sip_suratkeluar SET tujuan='$tujuan',noSuratKeluar='$noSurat',jenisSurat='$jenisSurat',perihal='$perihal' WHERE idSurat='$idSurat'");
		
	
	if($update == true){
		//mysqli_query($config, "UPDATE sip_suratkeluar SET kodeBidang='$kodeBidang' WHERE idSurat='$idSurat'");

		echo "<script>
		alert('Perubahan catatan surat keluar berhasil.');location.href='suratkeluar_list.php';
		</script>";
	}else{
		echo "<script>
		alert('Perubahan catatan surat keluar gagal!');location.href='suratkeluar_ubah.php?idSurat=$idSurat';
		</script>";
	}
}


?>