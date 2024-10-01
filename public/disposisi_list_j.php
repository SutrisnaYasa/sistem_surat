<?php
 include"../config/koneksi_database.php";
	$sql=mysqli_query($config,"SELECT a.kodeDisposisi,b.namaBidang FROM sip_disposisisurat a INNER JOIN sip_bidang b
ON a.kodeBidang=b.kodeBidang WHERE a.noSurat='$_GET[id]' and pengirim = '2' ");
			
		$data = array();
		
		$i=1;
		while ($tampung2=mysqli_fetch_array($sql)) {
			$row = array();
			$row[] = $i;
			$row[] = $tampung2['namaBidang'];
			$row[] = '<a class="btn btn-xs btn-primary" href="#" title="Edit" onclick="hapus('.$tampung2['kodeDisposisi'].')"><i class="glyphicon glyphicon-pencil"></i> del</a>';
			$i++;
			$data[] = $row;
		}
		$output = array(
			"data" => $data,
		);
		//output to json format
		echo json_encode($output);	
		?>