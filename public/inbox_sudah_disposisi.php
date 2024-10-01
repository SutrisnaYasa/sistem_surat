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
      DAFTAR INBOX SUDAH DISPOSISI
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
                  <th>No. Surat</th>
                  <th>Jenis Surat</th>
                  <th>Perihal</th>
                  <th>Asal Surat</th>
                  <th>Asal Devisi / Bagian</th>
                  <th>Tgl. Diterima</th>
                </tr>
              </thead>

              <tfoot>
                <tr>
                  <th>Tindakan</th>
                  <th>No. Surat</th>
                  <th>Jenis Surat</th>
                  <th>Perihal</th>
                  <th>Asal Surat</th>
                  <th>Asal Devisi / Bagian</th>
                  <th>Tgl. Diterima</th>
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

                $query_suratmasuk = mysqli_query($config, "SELECT c.fileSurat,c.idSurat,a.idtujuan,a.noSurat,a.tglInput,b.namaBidang, c.jenisSurat,c.perihal,c.asalSurat 
                FROM sip_tujuan a INNER JOIN sip_bidang b ON a.pengirimdivisi=b.kodeBidang
                INNER JOIN sip_suratmasuk c ON a.nosurat = c.nosurat
                INNER JOIN sip_disposisisurat d ON c.nosurat = d.nosurat
                LEFT JOIN sip_tindaklanjut e ON d.nosurat = e.nosurat
                WHERE a.tujuandivisi = '$kodeBidangUsername' $filterTanggal AND e.nosurat IS Null AND d.abaikanSurat = '0' GROUP BY d.nosurat ORDER BY tglInput DESC");
                while ($array_suratmasuk = mysqli_fetch_array($query_suratmasuk)) {
                  $idTujuan = $array_suratmasuk['idtujuan'];
                  $idSurat = $array_suratmasuk['idSurat'];
                  $noSurat = $array_suratmasuk['noSurat'];
                  $jenisSurat = $array_suratmasuk['jenisSurat'];
                  $perihal = $array_suratmasuk['perihal'];
                  $asalSurat = $array_suratmasuk['asalSurat'];
                  $asalSuratBid = $array_suratmasuk['namaBidang'];
                  $fileSurat = $array_suratmasuk['fileSurat'];
                  $tglInput = $array_suratmasuk['tglInput'];


                  echo "
                    <tr>
                      <td>
                        <div class='btn-group'>
                        ";
                ?>

                <?php

                  echo "<a href='inbox_detail.php?idSurat=$idSurat&&kategoriSurat=sm'>Lihat</a>";
                  echo "  
                          </ul>
                        </div>
                      </td>
                      <td>" . $noSurat . "</td>
                      <td>" . $jenisSurat . "</td>
                      <td>" . $perihal . "</td>
                      <td>" . $asalSurat . "</td>
					            <td>" . $asalSuratBid . "</td>
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