<?php

include "../config/koneksi_database.php";

$kodeBidang = $_REQUEST['kodeBidang'];

$query = mysqli_query($config, "DELETE FROM sip_bidang WHERE kodeBidang='$kodeBidang'");

if($query == true){
    echo "<script>
        alert('Bagian/Bidang berhasil dihapus.');location.href='bidang_list.php';
    </script>";
} else {
    echo "<script>
        alert('Bagian/Bidang gagal dihapus!');location.href='bidang_list.php';
    </script>";                  
}
?>