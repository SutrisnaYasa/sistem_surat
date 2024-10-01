<?php

include "../config/koneksi_database.php";

$nip = $_REQUEST['nip'];

$query = mysqli_query($config, "DELETE FROM sip_user WHERE nip='$nip'");

if($query == true){
    echo "<script>
        alert('User berhasil dihapus.');location.href='user_list.php';
    </script>";
} else {
    echo "<script>
        alert('User gagal dihapus!');location.href='user_list.php';
    </script>";                  
}
?>