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
      DAFTAR TERUSKAN SURAT
    </h1>
  </section>

  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box">
          <div class="box-header">
            <?php
            if ($golongan == "b" && $kodeBidang != "1") {
              echo "<a class='btn btn-app' href='suratkeluar_add.php'>
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
                  <th>No. Surat</th>
                  <th>Jenis Surat</th>
                  <th>Perihal</th>
                  <th>Asal Surat</th>
                  <?php if ($kodeBidangUsername == '2') {
                    echo "<th>Pengirm</th>";
                  }
                  ?>
                  <th>Tujuan</th>
                  <th>Tgl. Input</th>
                </tr>
              </thead>
              <tfoot>
                <tr>
                  <th>Tindakan</th>
                  <th>No. Surat</th>
                  <th>Jenis Surat</th>
                  <th>Perihal</th>
                  <th>Asal Surat</th>
                  <?php
                  if ($kodeBidangUsername == '2') {
                    echo "<th>Pengirm</th>";
                  }
                  ?>
                  <th>Tujuan</th>
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
                $pengirim = "";
                if ($kodeBidangUsername == '2') {
                  $query_suratkeluar = mysqli_query($config, "SELECT a.noSurat,b.jenisSurat,b.perihal,b.asalsurat, 
					  d.namaBidang as pengirim1,c.namaBidang, a.tglInput 
					  FROM sip_tujuan a 
					  INNER JOIN sip_suratmasuk b ON a.noSurat=b.noSurat 
					  INNER JOIN sip_bidang c ON a.tujuandivisi = c.kodeBidang
					  INNER JOIN sip_bidang d ON a.pengirimdivisi = d.kodeBidang");
                } else {
                  $query_suratkeluar = mysqli_query($config, "SELECT a.noSurat,b.jenisSurat,b.perihal,b.asalsurat, 
					  c.namaBidang, a.tglInput 
					  FROM sip_tujuan a 
					  INNER JOIN sip_suratmasuk b ON a.noSurat=b.noSurat 
					  INNER JOIN sip_bidang c ON a.tujuandivisi = c.kodeBidang 
					  where a.pengirimdivisi = '$kodeBidangUsername' ");
                }
                while ($array_suratkeluar = mysqli_fetch_array($query_suratkeluar)) {
                  $noSurat = $array_suratkeluar['noSurat'];
                  $jenisSurat = $array_suratkeluar['jenisSurat'];
                  $perihal = $array_suratkeluar['perihal'];
                  $asalsurat = $array_suratkeluar['asalsurat'];
                  $namaBidang = $array_suratkeluar['namaBidang'];
                  $tglInput = $array_suratkeluar['tglInput'];
                  $pengirim = $array_suratkeluar['pengirim1'];

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



                  echo "</ul>
                        </div>
                      </td>
					  <td>" . $noSurat . "</td>
                      <td>" . $jenisSurat . "</td>
                      <td>" . $perihal . "</td>
                      <td>" . $asalsurat . "</td>";
                  if ($kodeBidangUsername == '2') {
                    echo "<td>" . $pengirim . "</td>";
                  }
                  echo "
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