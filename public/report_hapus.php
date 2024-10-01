<?php

include "../config/koneksi_database.php";


$kodeReport = $_REQUEST['kodeReport'];
$idSurat = $_REQUEST['idSurat'];
$kategoriSurat = $_REQUEST['kategoriSurat'];


$query = mysqli_query($config, "SELECT * FROM sip_report WHERE kodeReport ='$kodeReport'");
$array = mysqli_fetch_array($query);

    $hapus = mysqli_query($config, "DELETE FROM sip_report WHERE kodeReport ='$kodeReport'");

    if($hapus == true){
        echo "<script>
            alert('Report berhasil dihapus!.');location.href='disposisi_list.php?idSurat=$idSurat&&kategoriSurat=$kategoriSurat';
        </script>";
    } else {
        echo "<script>
            alert('Report gagal dihapus!.');location.href='disposisi_list.php?idSurat=$idSurat&&kategoriSurat=$kategoriSurat';
        </script>";                  
    }

?>