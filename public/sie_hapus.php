<?php

include "../config/koneksi_database.php";

$kodeSie = $_REQUEST['kodeSie'];

$query = mysqli_query($config, "DELETE FROM sip_sie WHERE kodeSie='$kodeSie'");

if($query == true){
    echo "<script>
        alert('Sie berhasil dihapus.');location.href='sie_list.php';
    </script>";
} else {
    echo "<script>
        alert('Sie gagal dihapus!');location.href='sie_list.php';
    </script>";                  
}
?>