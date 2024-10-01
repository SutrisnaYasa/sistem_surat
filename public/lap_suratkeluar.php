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
      LAPORAN SURAT KELUAR
    </h1>
  </section>

  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box">
          <div class="box-header">

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
                  <th>No. Surat</th>
                  <th>Jenis Surat</th>
                  <th>Perihal</th>
                  <th>Bidang/Bagian</th>
                  <th>Tgl. Input</th>
                </tr>
              </thead>
              <tfoot>
                <tr>
                  <th>Tindakan</th>
                  <th>No. Surat</th>
                  <th>Jenis Surat</th>
                  <th>Perihal</th>
                  <th>Bidang/Bagian</th>
                  <th>Tgl. Input</th>
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
                $query_suratkeluar = mysqli_query($config, "SELECT * FROM sip_suratkeluar" . $where);

                while ($array_suratkeluar = mysqli_fetch_array($query_suratkeluar)) {
                  $idSurat = $array_suratkeluar['idSurat'];
                  $noSurat = $array_suratkeluar['noSuratKeluar'];
                  $jenisSurat = $array_suratkeluar['jenisSurat'];
                  $perihal = $array_suratkeluar['perihal'];
                  $kodeBidang = $array_suratkeluar['kodeBidang'];
                  $fileSurat = $array_suratkeluar['fileSurat'];
                  $tglInput = $array_suratkeluar['tglInput'];

                  $query_bidang = mysqli_query($config, "SELECT * FROM sip_bidang WHERE kodeBidang='$kodeBidang'");
                  $array_bidang = mysqli_fetch_array($query_bidang);

                  $namaBidang = $array_bidang['namaBidang'];

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

                  $status = $array_disposisi['status'];


                  echo "<li><a href='suratkeluar_view.php?idSurat=$idSurat'>Lihat</a></li>";

                  if ($golonganUsername == "b" && $kodeBidangUsername == "2") {
                    echo "<li><a href='komentar_list.php?idSurat=$idSurat&&kategoriSurat=sk'>Komentar</a></li>
                            <li><a href='suratkeluar_ubah.php?idSurat=$idSurat'>Ubah</a></li>
                            <li><a href='../files/suratkeluar/$fileSurat' download>Unduh</a></li>
                            <li><a href='suratkeluar_hapus.php?idSurat=$idSurat'>Hapus</a></li>";
                  }


                  echo "</ul>
                        </div>
                      </td>
                      <td>" . $noSurat . "</td>
                      <td>" . $jenisSurat . "</td>
                      <td>" . $perihal . "</td>
                      <td>" . $namaBidang . "</td>
                      <td>" . $tglInput . "</td>
                    </tr>
                    ";
                }
                //}
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