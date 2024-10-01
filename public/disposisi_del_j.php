<?php
	include"../config/koneksi_database.php";
	$sql="DELETE FROM sip_disposisisurat WHERE kodeDisposisi='$_GET[id]'";
	$Query=mysqli_query($config,$sql);
		if($Query){
			$msg['success']=TRUE;
			$msg['massages']='Berhasil Dihapus';
		}else{
			$msg['massages']='Gagal Diupdate';
		}
		echo json_encode($msg);

?>