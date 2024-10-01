<?php include"../config/koneksi_database.php"; ?>
<?php include"../template/header.php"; ?>
<?php 
  $query=mysqli_query($config, "SELECT * FROM sip_suratmasuk WHERE idSurat='$_REQUEST[idSurat]'");
  $array=mysqli_fetch_array($query);

  $noSurat=$array['noSurat'];
  $jenisSurat=$array['jenisSurat'];
  $perihal=$array['perihal'];
  $asalSurat=$array['asalSurat'];
  $fileSurat=$array['fileSurat'];
  $userInput = $array['userInput'];
  $tglInput=$array['tglInput'];

?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        DETAIL SURAT MASUK
      </h1>
    </section>

    <section class="content">
      <div class="row">
        <div class="col-md-4">
          <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Detail surat masuk</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <table class="table" style="border-style: none; border:none;" width="100%">
                  <tr>
                    <td>No. Surat</td>
                    <td> : </td>
                    <td><?php echo $noSurat; ?></td>
                  </tr>
                  <tr>
                    <td>Jenis Surat</td>
                    <td> : </td>
                    <td><?php echo $jenisSurat; ?></td>
                  </tr>
                  <tr>
                   <td>Perihal</td>
                    <td> : </td>
                    <td><?php echo $perihal; ?></td>
                  </tr>
                  <tr>
                    <td>Asal Surat</td>
                    <td> : </td>
                    <td><?php echo $asalSurat; ?></td>
                  </tr>
                  <tr>
                    <td>Petugas menginput</td>
                    <td> : </td>
                    <td>
                      <?php 
                         $query2=mysqli_query($config, "SELECT * FROM sip_user WHERE nip='$userInput'");
                          $array2=mysqli_fetch_array($query2);
                        echo $array2['nama']; 
                      ?>
                    </td>
                  </tr>
                  <tr>
                    <td>Tgl. Input Surat</td>
                    <td> : </td>
                    <td><?php echo $tglInput; ?></td>
                  </tr>
                </table>
              </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->

        <div class="col-md-8">
          <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Surat Masuk</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <div>
              <embed src="../files/suratmasuk/<?php echo $fileSurat; ?>" width="100%" height="500px" type="application/pdf"/>
            </div>
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

<?php include"../template/footer.php"; ?>

</body>
</html>