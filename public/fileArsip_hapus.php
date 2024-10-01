<?php

include "../config/koneksi_database.php";

$kodeFile = $_REQUEST['kodeFile'];

$query = mysqli_query($config, "SELECT * FROM sip_filearsip WHERE kodeFile='$kodeFile'");
$array = mysqli_fetch_array($query);

$file = $array['file'];
$kodeArsip = $array['kodeArsip'];

if(!empty($file)){
    unlink("../files/arsip/".$file);
    $query = mysqli_query($config, "DELETE FROM sip_filearsip WHERE kodeFile='$kodeFile'");

    if($query == true){
        echo "<script>
            alert('File asrip berhasil dihapus!.');location.href='fileArsip_list.php?kodeArsip=$kodeArsip';
        </script>";
    } else {
        echo "<script>
            alert('File arsip gagal dihapus!.');location.href='fileArsip_list.php?kodeArsip=$kodeArsip';
        </script>";                  
    }
} else {

    $query = mysqli_query($config, "DELETE FROM sip_filearsip WHERE kodeFile='$kodeFile'");

    if($query == true){
        echo "<script>
            alert('File asrip berhasil dihapus!.');location.href='fileArsip_list.php?kodeArsip=$kodeArsip';
        </script>";
    } else {
        echo "<script>
            alert('File arsip gagal dihapus!.');location.href='fileArsip_list.php?kodeArsip=$kodeArsip';
        </script>";                  
    }
}
?>