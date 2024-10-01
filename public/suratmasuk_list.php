<?php include "../config/koneksi_database.php"; ?>
<?php include "../template/header.php"; ?>

<?php
$query_user2 = mysqli_query($config, "SELECT * FROM sip_user WHERE nip='$session_username'");
$array_user2 = mysqli_fetch_array($query_user2);

$kodeBidangUsername = $array_user2['kodeBidang'];
$golonganUsername = $array_user2['golongan'];
?>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      DAFTAR SURAT MASUK
    </h1>
  </section>

  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box">
          <div class="box-header">

            <?php

            if ($golonganUsername == "b" && $kodeBidangUsername == '2') {
              echo "<a class='btn btn-app' href='suratmasuk_add.php'>
                    <i class='fa fa-plus'></i> Catat Surat
                  </a>";
            }

            ?>

            <form method="post" action="">
              <table>
                <tr>
                  <td><input class="form-control" type="date" name="awal" value="<?= date('Y-m-d') ?>"></td>
                  <td>&nbsp; - &nbsp;</td>
                  <td><input class="form-control" type="date" name="akhir" value="<?= date('Y-m-d') ?>"> </td>
                  <td> &nbsp;<input type="submit" value="Cari" class="btn btn-primary"></td>
                </tr>
              </table>
            </form>
          </div>

          <!-- /.box-header -->

          <div class="box-body">
            <table id="example1" class="table table-striped table-bordered nowrap" cellspacing="0" width="100%">
              
            <thead>
                <tr>
                  <th>Tindakan</th>
                  <th>Kode Panggil</th>
                  <th>No. Surat</th>
                  <th>Jenis Surat</th>
                  <th>Perihal</th>
                  <th>Asal Surat</th>
                  <th>Tgl. Diterima</th>
                  <!-- <th>Disposisi</th> -->
                </tr>
              </thead>

              <tfoot>
                <tr>
                  <th>Tindakan</th>
                  <th>Kode Panggil</th>
                  <th>No. Surat</th>
                  <th>Jenis Surat</th>
                  <th>Perihal</th>
                  <th>Asal Surat</th>
                  <th>Tgl. Diterima</th>
                  <!-- <th>Disposisi</th> -->
                </tr>
              </tfoot>

              <tbody>

                <?php
                if (isset($_POST['awal'])) {
                  $awal = $_POST['awal'];
                  $akhir = $_POST['akhir'];

                  if (!empty($awal)) {
                    $where = " where tglInput between '$awal' and '$akhir'";
                  } else {
                    $where = "";
                  }
                } else {
                  $where = "";
                }

                $query_suratmasuk = mysqli_query($config, "SELECT * FROM sip_suratmasuk " . $where);
                while ($array_suratmasuk = mysqli_fetch_array($query_suratmasuk)) {
                  $idSurat = $array_suratmasuk['idSurat'];
                  $noSurat = $array_suratmasuk['noSurat'];
                  $jenisSurat = $array_suratmasuk['jenisSurat'];
                  $perihal = $array_suratmasuk['perihal'];
                  $asalSurat = $array_suratmasuk['asalSurat'];
                  $fileSurat = $array_suratmasuk['fileSurat'];
                  $tglInput = $array_suratmasuk['tglInput'];

              
                  echo "
                    <tr>
                      <td>
                        <div class='btn-group'>
                          <button type='button' class='btn btn-primary dropdown-toggle' data-toggle='dropdown'>
                            <span class='fa fa-bars'></span>
                            <span class='sr-only'>Toggle Dropdown</span>
                          </button>
                          <ul class='dropdown-menu' role='menu'>";
                ?>

                <?php
                  $query_disposisi = mysqli_query($config, "SELECT * FROM sip_disposisisurat WHERE noSurat='$noSurat' AND kodeBidang='$kodeBidangUsername'");
                  $array_disposisi = mysqli_fetch_array($query_disposisi);
                  $cek = mysqli_num_rows($query_disposisi);

                  if ($cek > 0) {
                    if ($array_disposisi['pengirim'] == '1') {
                      $statusx = 'Disposisi Kepala';
                    } else if ($array_disposisi['pengirim'] == '2') {
                      $statusx = 'Disposisi Bag. Umum';
                    } else if ($array_disposisi['pengirim'] == '3') {
                      $statusx = 'Disposisi Sekretaris';
                    }
                  } else {
                    $statusx = '-';
                  }

                  $status = $array_disposisi['status'];
                  if ($status == '0' || empty($status)) {
                    if ($kodeBidang != '1' && $golongan == "b") {
                      echo "<li><a href='disposisi_status.php?idSurat=$idSurat&&noSurat=$noSurat&&kategoriSurat=sm&&kodeBidang=$kodeBidangUsername&&golongan=$golonganUsername'>Lihat</a></li>";
                    } else {
                      echo "<li><a href='disposisi_list.php?idSurat=$idSurat&&kategoriSurat=sm'>Lihat</a></li>";
                    }
                  } else {
                    echo "<li><a href='disposisi_list.php?idSurat=$idSurat&&kategoriSurat=sm'>Lihat</a></li>";
                  }


                  // echo"<li><a href='suratmasuk_view.php?idSurat=$idSurat'>Lihat</a></li>";


                  if ($golonganUsername == "b" && $kodeBidangUsername == "2") {
                    /*echo "<li><a href='komentar_list.php?idSurat=$idSurat&&kategoriSurat=sm'>Komentar</a></li>
                                    <li><a href='suratmasuk_ubah.php?idSurat=$idSurat'>Ubah</a></li>
                                    <li><a href='../files/suratmasuk/$fileSurat' download>Unduh</a></li>
                                    <li><a href='suratmasuk_hapus.php?idSurat=$idSurat'>Hapus</a></li>";*/
                    echo "
                                    <li><a href='suratmasuk_ubah.php?idSurat=$idSurat'>Ubah</a></li>
                                    <li><a href='../files/suratmasuk/$fileSurat' download>Unduh</a></li>
                                    <li><a href='suratmasuk_hapus.php?idSurat=$idSurat'>Hapus</a></li>";
                  }

                  echo "  
                          </ul>
                        </div>
                      </td>
                      <td>" . $idSurat . "</td>
                      <td>" . $noSurat . "</td>
                      <td>" . $jenisSurat . "</td>
                      <td>" . $perihal . "</td>
                      <td>" . $asalSurat . "</td>
                      <td>" . $tglInput . "</td>					        
                    </tr>

                    ";

                }

                ?>

              </tbody>
            </table>
          </div>
          <!-- /.box-body -->
        </div>
        <!-- /.box -->
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->
  </section>
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->



<?php include "../template/footer.php"; ?>



<script>
  $(document).ready(function() {
    var table = $('#example1').DataTable({
      responsive: true
    });
    new $.fn.dataTable.FixedHeader(table);
  });
</script>

</body>

</html>