<?php include "../config/koneksi_database.php"; ?>
<?php include "../template/header.php"; ?>

<?php
$query_user2 = mysqli_query($config, "SELECT * FROM sip_user WHERE nip='$session_username'");
$array_user2 = mysqli_fetch_array($query_user2);

echo $kodeBidangUsername = $array_user2['kodeBidang'];
echo $golonganUsername = $array_user2['golongan'];
?>

<!-- Content Wrapper. Contains page content -->

<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      DAFTAR INBOX DALAM TINDAK LANJUT
    </h1>
  </section>

  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box">
          <div class="box-header">
          </div>

          <!-- /.box-header -->
          <div class="box-body">
          <form method="post" action="" style="margin-bottom: 10px;">
              <table>
                <tr>
                  <td><input class="form-control" type="date" name="awal" value="<?= date('Y-m-d') ?>"></td>
                  <td>&nbsp; - &nbsp;</td>
                  <td><input class="form-control" type="date" name="akhir" value="<?= date('Y-m-d') ?>"> </td>
                  <td> &nbsp;<input type="submit" value="Cari" class="btn btn-primary"></td>
                </tr>
              </table>
            </form>
            <table id="example1" class="table table-striped table-bordered nowrap" cellspacing="0" width="100%">
              <thead>
                <tr>
                  <th>Tindakan</th>
                  <th>Terbaca</th>
                  <th>No. Surat</th>
                  <th>Jenis Surat</th>
                  <th>Perihal</th>
                  <th>Asal Surat</th>
                  <th>Status</th>
                </tr>
              </thead>

              <tfoot>
                <tr>
                  <th>Tindakan</th>
                  <th>Terbaca</th>
                  <th>No. Surat</th>
                  <th>Jenis Surat</th>
                  <th>Perihal</th>
                  <th>Asal Surat</th>
                  <th>Status</th>
                </tr>
              </tfoot>

              <tbody>

                <?php

                    $fileSurat = "";
                    if(isset($_POST['awal'])) {
                      $awal = $_POST['awal'];
                      $akhir = $_POST['akhir'];
                    }

                    $filterTanggal = "";
                    if(!empty($awal) && !empty($akhir)) {
                      $filterTanggal = " AND (c.tglInput between '$awal' AND '$akhir')";
                    }


                $query_suratmasuk = mysqli_query($config, "SELECT b.idsurat,b.nosurat,jenissurat,perihal,asalSurat,e.namabidang, c.status, b.tglInput  FROM sip_suratmasuk b 
                INNER JOIN sip_disposisisurat c ON b.nosurat=c.nosurat
                INNER JOIN sip_bidang e ON c.userpengirim=e.kodebidang 
	              INNER JOIN sip_bidang d ON c.kodebidang=d.kodebidang
                LEFT JOIN sip_tindaklanjut f ON c.nosurat = f.nosurat
                LEFT JOIN sip_report g ON c.nosurat = g.nosurat
                WHERE c.kodebidang='$kodeBidangUsername' $filterTanggal AND f.nosurat = f.nosurat AND g.nosurat IS NULL GROUP BY f.nosurat
                ORDER BY tglInput DESC" );

                while ($array_suratmasuk = mysqli_fetch_array($query_suratmasuk)) {
                  $idSurat = $array_suratmasuk['idsurat'];
                  $status = $array_suratmasuk['status'];
                  $noSurat = $array_suratmasuk['nosurat'];
                  $jenisSurat = $array_suratmasuk['jenissurat'];
                  $perihal = $array_suratmasuk['perihal'];
                  $asalSurat = $array_suratmasuk['asalSurat'];
                  $disposisi = $array_suratmasuk['namabidang'];

                  $statusText = ($status == 0) ? "Belum dibaca" : "Sudah Dibaca";
                  $statusColor = ($status == 0) ? "red" : "blue";

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

                      echo "<li><a href='disposisi_list.php?idSurat=$idSurat&kategoriSurat=sm'>Lihat</a></li>";
                      echo "  
                        </ul>
                          </div>
                            </td>
                            <td style='color: $statusColor'>" . $statusText . "</td>
                            <td>" . $noSurat . "</td>
                            <td>" . $jenisSurat . "</td>
                            <td>" . $perihal . "</td>
                            <td>" . $asalSurat . "</td>
                            <td>" . $disposisi . "</td>
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