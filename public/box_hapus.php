<?php

include "../config/koneksi_database.php";

$kodeBox = $_REQUEST['kodebox'];

$query = mysqli_query($config, "DELETE FROM sip_box WHERE kodeBox='$kodeBox'");

if($query == true){
    echo "<script>
        alert('Box berhasil dihapus.');location.href='box_list.php';
    </script>";
} else {
    echo "<script>
        alert('Box gagal dihapus!');location.href='box_list.php';
    </script>";                  
}
?>