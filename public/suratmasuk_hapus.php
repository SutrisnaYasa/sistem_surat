<?php

include "../config/koneksi_database.php";

$idSurat = $_REQUEST['idSurat'];

$query = mysqli_query($config, "SELECT * FROM sip_suratmasuk WHERE idSurat='$idSurat'");
$array = mysqli_fetch_array($query);

$file = $array['fileSurat'];
$noSurat = $array['noSurat'];

if(!empty($file)){
    unlink("../files/suratmasuk/".$file);
    $query = mysqli_query($config, "DELETE FROM sip_suratmasuk WHERE idSurat='$idSurat'");

    if($query == true){
        echo "<script>
            alert('Catatan surat, catatan disposisi dan file surat berhasil dihapus!.');location.href='suratmasuk_list.php';
        </script>";
    } else {
        echo "<script>
            alert('Catatan surat, catatan disposisi dan file surat gagal dihapus!.');location.href='suratmasuk_list.php';
        </script>";                  
    }
} else {

    $query = mysqli_query($config, "DELETE FROM sip_suratmasuk WHERE idSurat='$idSurat'");

    if($query == true){
        echo "<script>
            alert('Catatan surat, catatan disposisi dan file surat berhasil dihapus!.');location.href='suratmasuk_list.php';
        </script>";
    } else {
        echo "<script>
            alert('Catatan surat, catatan disposisi dan file surat gagal dihapus!.');location.href='suratmasuk_list.php';
        </script>";                  
    }
}
?>