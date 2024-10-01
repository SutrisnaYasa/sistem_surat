<?php

include "../config/koneksi_database.php";

$kodeArsip = $_REQUEST['kodeArsip'];

$query = mysqli_query($config, "DELETE FROM sip_dataarsip WHERE kodeArsip='$kodeArsip'");

if($query == true){
    echo "<script>
        alert('Data arsip berhasil dihapus.');location.href='arsip_list.php';
    </script>";
} else {
    echo "<script>
        alert('Data arsip gagal dihapus!');location.href='arsip_list.php';
    </script>";                  
}
?>