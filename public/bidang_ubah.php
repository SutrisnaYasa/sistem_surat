<?php include"../config/koneksi_database.php"; ?>

<?php include"../template/header.php"; ?>

<?php 

  

  $kodeBidang = $_REQUEST['kodeBidang'];



  $query=mysqli_query($config, "SELECT * FROM sip_bidang WHERE kodeBidang='$kodeBidang'");

  $array=mysqli_fetch_array($query);

  

  $namaBidang = $array['namaBidang'];

  $kodesurat = $array['kodesurat'];

?>



  <!-- Content Wrapper. Contains page content -->

  <div class="content-wrapper">

    <!-- Content Header (Page header) -->

    <section class="content-header">

      <h1>

        UBAH DATA DIVISI / BAGIAN

      </h1>

    </section>



    <section class="content">

      <div class="row">

        <div class="col-md-6">

          <div class="box box-default">

            <div class="box-header with-border">

              <h3 class="box-title">Form Ubah Data Divisi / Bagian.</h3>

            </div>

            <!-- /.box-header -->

            <!-- form start -->

            <form role="form" action="bidang_update.php" method="POST" enctype="multipart/form-data">

              <div class="box-body">

                <div class="form-group">

                  <input type="hidden" id="kodeBidang" name="kodeBidang" value="<?php echo $kodeBidang; ?>">

                  <input type="hidden" id="namaBidangLama" name="namaBidangLama" value="<?php echo $namaBidang; ?>">

                  <label>Nama Divisi / Bagian</label>

                  <input type="text" class="form-control" id="namaBidang" name="namaBidang" value="<?php echo $namaBidang; ?>">

                  <label>Kode Divisi / Bagian</label>

                  <input type="text" class="form-control" id="kodesurat" name="kodesurat" value="<?php echo $kodesurat; ?>">

                </div>

              </div>

              <!-- /.box-body -->

              <div class="box-footer" style="text-align: right;">

                <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Simpan</button> <button type="button" class="btn btn-danger" onclick="location.href='bidang_list.php'"><i class="fa fa-close"></i> Batal</button>

              </div>

            </form>

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