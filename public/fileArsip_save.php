<?php 

include"../config/koneksi_database.php";
//echo "select * from sip_sie where kodeSie='$_GET[kodeArsip]' ";
$sqlsie = mysqli_query($config,"select * from sip_sie where kodeSie='$_GET[kodeSie]' ");
$uData=mysqli_fetch_array($sqlsie);
$idxBid = $uData['namaSie'];
//echo "select * from sip_berkas where kodeBerkas='$_GET[kodeBerkas]";
$sqlberkas= mysqli_query($config,"select * from sip_berkas where kodeBerkas='$_GET[kodeBerkas]' ");
$uDataberkas=mysqli_fetch_array($sqlberkas);
$namab = $uDataberkas['namaBerkas'];

$sqlsberkas= mysqli_query($config,"select * from sip_sub_berkas where idsub='$_GET[sub]' ");
$usDataberkas=mysqli_fetch_array($sqlsberkas);
$namasb = $usDataberkas['namasub'];

$namaFile=$_REQUEST['namaFile'];
$kodeArsip=$_REQUEST['kodeArsip'];

$ekstensi = array('pdf');
$file = $_FILES['fileArsip']['name'];
$x = explode('.', $file);
$eks = strtolower(end($x));
$ukuran = $_FILES['fileArsip']['size'];
echo "../files/".$idxBid.'/'.$namab.'/'.$namasb.'/'.$_GET['no'].'/';
$target_dir = "../files/".$idxBid.'/'.$namab.'/'.$namasb.'/'.$_GET['no'].'/';

if($file != "")
{
	$rand = rand(1,10000);
    $nfile = $namaFile.".pdf";
	
	if(in_array($eks, $ekstensi) == true)
	{
		move_uploaded_file($_FILES['fileArsip']['tmp_name'], $target_dir.$nfile);

		$save=mysqli_query($config, "INSERT INTO sip_filearsip(kodeArsip, namaFile, file) VALUES ('$kodeArsip','$namaFile','$nfile')");
	
			if($save == true)
			{
				echo "<script>
				alert('File arsip berhasil ditambah.');location.href='fileArsip_list.php?kodeArsip=$kodeArsip&kodeBerkas=$_GET[kodeBerkas]&no=$_GET[no]&kodeSie=$_GET[kodeSie]';
				</script>";
			}else{
				echo "<script>
				alert('File arsip gagal ditambah!');location.href='fileArsip_add.php?kodeArsip=$kodeArsip&kodeBerkas=$_GET[kodeBerkas]&no=$_GET[no]&kodeSie=$_GET[kodeSie]';
				</script>";
			}
	}else{
		echo "<script>
		alert('Format file yang diupload tidak sesuai!');location.href='fileArsip_add.php?kodeArsip=$kodeArsip&kodeBerkas=$_GET[kodeBerkas]&no=$_GET[no]&kodeSie=$_GET[kodeSie]';
		</script>";
	}
}else{
	echo "<script>
	alert('File surat tidak ada!');location.href='fileArsip_add.php?kodeArsip=$kodeArsip&kodeBerkas=$_GET[kodeBerkas]&no=$_GET[no]&kodeSie=$_GET[kodeSie]';
	</script>";
}


?>