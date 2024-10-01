<?php

include "../config/koneksi_database.php";

$kodeBerkas = $_REQUEST['kodeBerkas'];

$query = mysqli_query($config, "DELETE FROM sip_berkas WHERE kodeBerkas='$kodeBerkas'");

if($query == true){
    echo "<script>
        alert('Berkas berhasil dihapus.');location.href='berkas_list.php';
    </script>";
} else {
    echo "<script>
        alert('Berkas gagal dihapus!');location.href='berkas_list.php';
    </script>";                  
}
?>