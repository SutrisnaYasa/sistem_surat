<?php include"../config/koneksi_database.php"; ?>

<?php include"../template/header.php"; ?>



  <!-- Content Wrapper. Contains page content -->

  <div class="content-wrapper">

    <!-- Content Header (Page header) -->

    <section class="content-header">

      <h1>

        <i class="fa fa-database"></i> TAMBAH DATA DIVISI / BAGIAN

      </h1>

    </section>



    <section class="content">

      <div class="row">

        <div class="col-md-6">

          <div class="box box-default">

            <div class="box-header with-border">

              <h3 class="box-title">Form Tambah Data Divisi / Bagian.</h3>

            </div>

            <!-- /.box-header -->

            <!-- form start -->

            <form role="form" action="bidang_save.php" method="POST" enctype="multipart/form-data">

              <div class="box-body">

                <div class="form-group">

                  <label>Nama Divisi / Bagian</label>

                  <input type="text" class="form-control" id="namaBidang" name="namaBidang" required>

                  <label>Kode Divisi / Bagian</label>

                  <input type="text" class="form-control" id="kodesurat" name="kodesurat" required>

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