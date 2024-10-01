<?php

include "../config/koneksi_database.php";

$kodeRak = $_REQUEST['kodeRak'];

$query = mysqli_query($config, "DELETE FROM sip_rak WHERE kodeRak='$kodeRak'");

if($query == true){
    echo "<script>
        alert('Rak berhasil dihapus.');location.href='rak_list.php';
    </script>";
} else {
    echo "<script>
        alert('Rak gagal dihapus!');location.href='rak_list.php';
    </script>";                  
}
?>