<?php



include "../config/koneksi_database.php";



$kodeInstruksi = $_REQUEST['kodeInstruksi'];

$idSurat = $_REQUEST['idSurat'];

$kategoriSurat = $_REQUEST['kategoriSurat'];



$query = mysqli_query($config, "SELECT * FROM sip_instruksi WHERE kodeInstruksi='$kodeInstruksi'");

$array = mysqli_fetch_array($query);



    $hapus = mysqli_query($config, "DELETE FROM sip_instruksi WHERE kodeInstruksi='$kodeInstruksi'");



    if($hapus == true){

        echo "<script>

            alert('Instruksi berhasil dihapus!.');location.href='inbox_detail.php?idSurat=$idSurat&&kategoriSurat=$kategoriSurat';

        </script>";

    } else {

        echo "<script>

            alert('Instruksi gagal dihapus!.');location.href='inbox_detail.php?idSurat=$idSurat&&kategoriSurat=$kategoriSurat';

        </script>";                  

    }


?>