<?php



include "../config/koneksi_database.php";



$kodeDisposisi = $_REQUEST['kodeDisposisi'];

$idSurat = $_REQUEST['idSurat'];

$kategoriSurat = $_REQUEST['kategoriSurat'];



$query = mysqli_query($config, "SELECT * FROM sip_disposisisurat WHERE kodeDisposisi='$kodeDisposisi'");

$array = mysqli_fetch_array($query);



$file = $array['fileDisposisi'];



if(!empty($file)){

    unlink("../files/disposisi/".$file);

    $hapus = mysqli_query($config, "DELETE FROM sip_disposisisurat WHERE kodeDisposisi='$kodeDisposisi'");



    if($hapus == true){

        echo "<script>

            alert('Disposisi berhasil dihapus!.');location.href='inbox_detail.php?idSurat=$idSurat&&kategoriSurat=$kategoriSurat';

        </script>";

    } else {

        echo "<script>

            alert('Disposisi gagal dihapus!.');location.href='inbox_detail.php?idSurat=$idSurat&&kategoriSurat=$kategoriSurat';

        </script>";                  

    }

} else {



    $hapus = mysqli_query($config, "DELETE FROM sip_disposisisurat WHERE kodeDisposisi='$kodeDisposisi'");



    if($hapus == true){

        echo "<script>

            alert('Disposisi berhasil dihapus!.');location.href='inbox_detail.php?idSurat=$idSurat&&kategoriSurat=$kategoriSurat';

        </script>";

    } else {

        echo "<script>

            alert('Disposisi gagal dihapus!.');location.href='inbox_detail.php?idSurat=$idSurat&&kategoriSurat=$kategoriSurat';

        </script>";                  

    }

}

?>