<?php include"../config/koneksi_database.php"; ?>
<?php include"../template/header.php"; ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-database"></i> TAMBAH DATA BOX
      </h1>
    </section>

    <section class="content">
      <div class="row">
        <div class="col-md-6">
          <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Form Tambah Data Box.</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" action="box_save.php" method="POST" enctype="multipart/form-data">
              <div class="box-body">
                <div class="form-group">
                  <label>Nama Box</label>
                  <input type="text" class="form-control" id="namaBox" name="namaBox">
                </div>
                <div class="form-group">
                  <label>Jumlah Maksimal</label>
                  <input type="text" class="form-control" id="jmlMaksimal" name="jmlMaksimal">
                </div>
              </div>
              <!-- /.box-body -->
              <div class="box-footer" style="text-align: right;">
                <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Simpan</button> <button type="button" class="btn btn-danger" onclick="location.href='box_list.php'"><i class="fa fa-close"></i> Batal</button>
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