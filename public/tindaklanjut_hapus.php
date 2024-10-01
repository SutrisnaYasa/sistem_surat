<?php

include "../config/koneksi_database.php";


$kodeTindaklanjut = $_REQUEST['kodeTindaklanjut'];
$idSurat = $_REQUEST['idSurat'];
$kategoriSurat = $_REQUEST['kategoriSurat'];


$query = mysqli_query($config, "SELECT * FROM sip_tindaklanjut WHERE kodeTindaklanjut ='$kodeTindaklanjut'");
$array = mysqli_fetch_array($query);

    $hapus = mysqli_query($config, "DELETE FROM sip_tindaklanjut WHERE kodeTindaklanjut ='$kodeTindaklanjut'");

    if($hapus == true){
        echo "<script>
            alert('Tindak Lanjut berhasil dihapus!.');location.href='disposisi_list.php?idSurat=$idSurat&&kategoriSurat=$kategoriSurat';
        </script>";
    } else {
        echo "<script>
            alert('Tindak Lanjut gagal dihapus!.');location.href='disposisi_list.php?idSurat=$idSurat&&kategoriSurat=$kategoriSurat';
        </script>";                  
    }

?>