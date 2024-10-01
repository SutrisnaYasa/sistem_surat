<?php

include "../config/koneksi_database.php";

$idSurat = $_REQUEST['idSurat'];

$query = mysqli_query($config, "SELECT * FROM sip_suratkeluar WHERE idSurat='$idSurat'");
$array = mysqli_fetch_array($query);

$file = $array['fileSurat'];
$noSurat = $array['noSuratKeluar'];

if(!empty($file)){
    unlink("../files/suratkeluar/".$file);
    $query = mysqli_query($config, "DELETE FROM sip_suratkeluar WHERE idSurat='$idSurat'");

    if($query == true){
        echo "<script>
            alert('Catatan surat, catatan disposisi dan file surat berhasil dihapus!.');location.href='suratkeluar_list.php';
        </script>";
    } else {
        echo "<script>
            alert('Catatan surat, catatan disposisi dan file surat gagal dihapus!.');location.href='suratkeluar_list.php';
        </script>";                  
    }
} else {

    $query = mysqli_query($config, "DELETE FROM sip_suratkeluar WHERE idSurat='$idSurat'");

    if($query == true){
        echo "<script>
            alert('Catatan surat, catatan disposisi dan file surat berhasil dihapus!.');location.href='suratkeluar_list.php';
        </script>";
    } else {
        echo "<script>
            alert('Catatan surat, catatan disposisi dan file surat gagal dihapus!.');location.href='suratkeluar_list.php';
        </script>";                  
    }
}
?>