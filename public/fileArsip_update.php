<?php 

include"../config/koneksi_database.php";

$namaFile=$_REQUEST['namaFile'];
$kodeArsip=$_REQUEST['kodeArsip'];
$kodeFile=$_REQUEST['kodeFile'];

$sqlsie = mysqli_query($config,"select * from sip_sie where kodeSie='$_GET[kodeSie]' ");
$uData=mysqli_fetch_array($sqlsie);
$idxBid = $uData['namaSie'];
//echo "select * from sip_berkas where kodeBerkas='$_GET[kodeBerkas]";
$sqlberkas= mysqli_query($config,"select * from sip_berkas where kodeBerkas='$_GET[kodeBerkas]' ");
$uDataberkas=mysqli_fetch_array($sqlberkas);
$namab = $uDataberkas['namaBerkas'];

$ekstensi = array('pdf');
$file = $_FILES['fileArsip']['name'];
$x = explode('.', $file);
$eks = strtolower(end($x));
$ukuran = $_FILES['fileArsip']['size'];
$target_dir = "../files/".$idxBid.'/'.$namab.'/'.$_GET['no'].'/';

if($file != ""){
	$rand = rand(1,10000);
    $nfile = $rand."-".$namaFile.".pdf";
	
	if(in_array($eks, $ekstensi) == true){
		
		$query=mysqli_query($config, "SELECT file FROM sip_filearsip WHERE kodeFile='$kodeFile'");
		list($file) = mysqli_fetch_array($query);

		if(!empty($file)){
			unlink($target_dir.$file);

			move_uploaded_file($_FILES['fileArsip']['tmp_name'], $target_dir.$nfile);

			$update = mysqli_query($config, "UPDATE sip_filearsip SET namaFile='$namaFile', file='$nfile' WHERE kodeFile='$kodeFile'");
		
	
			if($update == true){
				echo "<script>
				alert('Perubahan file arsip berhasil.');location.href='fileArsip_list.php?kodeArsip=$kodeArsip&kodeBerkas=$_GET[kodeBerkas]&no=$_GET[no]&kodeSie=$_GET[kodeSie]';
				</script>";
			}else{
				echo "<script>
				alert('Perubahan catatan surat masuk gagal!');location.href='fileArsip_ubah.php?kodeFile=$kodeFile&kodeBerkas=$_GET[kodeBerkas]&no=$_GET[no]&kodeSie=$_GET[kodeSie]';
				</script>";
			}
		}else{
			move_uploaded_file($_FILES['fileArsip']['tmp_name'], $target_dir.$nfile);

			$update = mysqli_query($config, "UPDATE sip_filearsip SET namaFile='$namaFile', file='$nfile' WHERE kodeFile='$kodeFile&kodeBerkas=$_GET[kodeBerkas]&no=$_GET[no]&kodeSie=$_GET[kodeSie]'");
		
			if($update == true){
				echo "<script>
				alert('Perubahan file arsip berhasil.');location.href='fileArsip_list.php?kodeArsip=$kodeArsip&kodeBerkas=$_GET[kodeBerkas]&no=$_GET[no]&kodeSie=$_GET[kodeSie]';
				</script>";
			}else{
				echo "<script>
				alert('Perubahan catatan surat masuk gagal!');location.href='fileArsip_ubah.php?kodeFile=$kodeFile&kodeBerkas=$_GET[kodeBerkas]&no=$_GET[no]&kodeSie=$_GET[kodeSie]';
				</script>";
			}
		}
	}else{
		echo "<script>
		alert('Format file yang diupload tidak sesuai!');location.href='fileArsip_ubah.php?kodeFile=$kodeFile&kodeBerkas=$_GET[kodeBerkas]&no=$_GET[no]&kodeSie=$_GET[kodeSie]';
		</script>";
	}
}else{
	$update = mysqli_query($config, "UPDATE sip_filearsip SET namaFile='$namaFile' WHERE kodeFile='$kodeFile'");
		
	if($update == true){
		echo "<script>
			alert('Perubahan file arsip berhasil.');location.href='fileArsip_list.php?kodeArsip=$kodeArsip';
		</script>";
	}else{
		echo "<script>
			alert('Perubahan catatan surat masuk gagal!');location.href='fileArsip_ubah.php?kodeFile=$kodeFile';
		</script>";
	}
}


?>