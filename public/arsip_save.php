<?php 

include"../config/koneksi_database.php";

$kodeSie = $_REQUEST['kodeSie'];
$kodeBerkas = $_REQUEST['kodeBerkas'];
$kodesubBerkas = $_REQUEST['kodesubBerkas'];
$tahun = $_REQUEST['tahun'];
$klasifikasi = $_REQUEST['klasifikasi'];
$uraian = $_REQUEST['uraian'];
$indexes = $_REQUEST['indexes'];
$kodeRak = $_REQUEST['kodeRak'];
$kodeBox = $_REQUEST['kodeBox'];
$sampul = $_REQUEST['sampul'];
$userInput = $_REQUEST['userInput'];
$kode = $_REQUEST['kode'];
$no = $_REQUEST['no'];

$sqlberkas= mysqli_query($config,"select * from sip_berkas where kodeberkas='$kodeBerkas' ");
$uDataberkas=mysqli_fetch_array($sqlberkas);
$noberkas = $uDataberkas['noBerkas'];

$sqlsubberkas= mysqli_query($config,"select * from sip_sub_berkas where idsub='$kodesubBerkas' ");
$uDatasubberkas=mysqli_fetch_array($sqlsubberkas);
$nosubberkas = $uDatasubberkas['nosub'];

echo "select * from sip_sub_berkas where kodesubBerkas='$kodesubBerkas' ";
echo "select * from sip_berkas where kodeberkas='$kodeBerkas' ";

$kodejenisarsip = $noberkas.$nosubberkas;

$save = mysqli_query($config, "INSERT INTO sip_dataarsip(instansi, jenisBerkas, tahun, klasifikasi,
 uraian, indexes, kodeRak, kodeBox, sampul, userInput, tglInput,no,kode,subberkas,kodejenisarsip) VALUES ('$kodeSie', '$kodeBerkas', 
 '$tahun', '$klasifikasi', '$uraian', '$indexes', '$kodeRak', '$kodeBox', '$sampul', '$userInput', NOW(),'$no','$kode','$kodesubBerkas','$kodejenisarsip')");

if($save == true){
	$sql = mysqli_query($config, 'select max(kodeArsip) as kodearsip from sip_dataarsip');
	$uData = mysqli_fetch_array($sql);
	$kodearsip = $uData['kodearsip'];
	
	$sqlsie = mysqli_query($config,"select * from sip_sie where kodeSie='$kodeSie' ");
	$uData=mysqli_fetch_array($sqlsie);
	$idxBid = $uData['namaSie'];
	
	
	$sqlberkas= mysqli_query($config,"select * from sip_berkas where kodeBerkas='$kodeBerkas' ");
	$uDataberkas=mysqli_fetch_array($sqlberkas);
	$namab = $uDataberkas['namaBerkas'];
	
	$sqlsberkas= mysqli_query($config,"select * from sip_sub_berkas where idsub='$kodesubBerkas' ");
	$uDatasberkas=mysqli_fetch_array($sqlsberkas);
	$namasb = $uDatasberkas['namasub'];
	//mkdir('../files/'.$idxBid);
	//mkdir('../files/'.$idxBid.'/'.$no);
	
	mkdir('../files/'.$idxBid.'/'.$namab.'/'.$namasb.'/'.$no);
	echo "<script>
		alert('Data arsip berhasil ditambahkan.');location.href='fileArsip_list.php?kodeArsip=$kodearsip&kodeBerkas=$kodeBerkas&no=$no&kodeSie=$kodeSie&sub=$kodesubBerkas';
	</script>";
}else{
	echo "<script>
		alert('Data arsip gagal ditambahkan!');location.href='arsip_add.php';
	</script>";
}


?>