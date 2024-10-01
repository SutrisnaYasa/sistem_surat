<?php 

include"../config/koneksi_database.php";

$noSurat=$_REQUEST['noSurat'];
$kodebidangsurat=$_REQUEST['kodebidang'];
$kodeklasifikasi=$_REQUEST['kodeklasifikasi'];
$tahun=$_REQUEST['tahun'];

$nosuratkeluar = $noSurat;
$jenisSurat=$_REQUEST['jenisSurat'];
$perihal=$_REQUEST['perihal'];
$kodeBidang=$_REQUEST['kodeBidang'];
$userInput = $_REQUEST['userInput'];
$tujuan = $_REQUEST['tujuan'];
$nip = $_REQUEST['nipx'];
$ekstensi = array('pdf');
$file = $_FILES['fileSurat']['name'];
$x = explode('.', $file);
$eks = strtolower(end($x));
$ukuran = $_FILES['fileSurat']['size'];
$target_dir = "../files/suratkeluar/";

$query_siePengirim = mysqli_query($config, "SELECT kodeBidang FROM sip_user WHERE nip='$nip'");
$array_siePengirim = mysqli_fetch_array($query_siePengirim);
$namaBidangPengirim=$array_siePengirim['kodeBidang'];

///cekk

$query_permintaan = mysqli_query($config, "SELECT * FROM sip_nosuratkeluar WHERE atributsurat='$nosuratkeluar'");
$row_permintaan = mysqli_num_rows($query_permintaan);
$query_ceksuratk = mysqli_query($config, "SELECT * FROM sip_suratkeluar WHERE nosuratkeluar='$nosuratkeluar'");
$row_ceksuratk = mysqli_num_rows($query_ceksuratk);

if($file != "")
{
	$rand = rand(1,10000);
    $nfile = $rand."-".$file;

	if(in_array($eks, $ekstensi) == true)
	{
		if($row_ceksuratk > 0){
			echo "<script>
				alert('Pencatatan surat keluar gagal, No surat sudah ada!');location.href='suratkeluar_add.php';
				</script>";
		}

		move_uploaded_file($_FILES['fileSurat']['tmp_name'], $target_dir.$nfile);

		$save=mysqli_query($config, "INSERT INTO sip_suratkeluar(noSuratKeluar, jenisSurat, perihal, userInput, kodeBidang, fileSurat,  tglInput,tujuan) 
		VALUES ('$nosuratkeluar','$jenisSurat','$perihal', '$userInput', '$namaBidangPengirim', '$nfile', NOW(),'$tujuan')");

			if($save == true)
			{
				echo "<script>
				alert('Pencatatan surat keluar berhasil.');location.href='suratkeluar_list.php';
				</script>";
			}else{
				echo "<script>
				alert('Pencatatan surat keluar gagal!');location.href='suratkeluar_add.php';
				</script>";
			}
	}else{
		echo "<script>
		alert('Format file yang diupload tidak sesuai!');location.href='suratkeluar_add.php';
		</script>";
	}
}else{
	echo "<script>
	alert('File surat tidak ada!');location.href='suratkeluar_add.php';
	</script>";
}


?>