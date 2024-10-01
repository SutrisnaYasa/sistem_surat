<?php include"../config/koneksi_database.php"; ?>
<?php include"../template/header.php"; ?>
<?php 
  
  $kodeBox = $_REQUEST['kodeBox'];

  $query=mysqli_query($config, "SELECT * FROM sip_box WHERE kodeBox='$kodeBox'");
  $array=mysqli_fetch_array($query);
  
  $namaBox = $array['namaBox'];
  $jmlMaksimal = $array['jmlMaksimal'];
?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        UBAH DATA BOX
      </h1>
    </section>

    <section class="content">
      <div class="row">
        <div class="col-md-6">
          <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Form Ubah Data Box.</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" action="box_update.php" method="POST" enctype="multipart/form-data">
              <div class="box-body">
                <div class="form-group">
                  <input type="hidden" id="kodeBox" name="kodeBox" value="<?php echo $kodeBox; ?>">
                  <label>Nama Box</label>
                  <input type="text" class="form-control" id="namaBox" name="namaBox" value="<?php echo $namaBox; ?>">
                </div>
                <div class="form-group">
                  <label>Jumlah Maksimal</label>
                  <input type="text" class="form-control" id="jmlMaksimal" name="jmlMaksimal" value="<?php echo $jmlMaksimal; ?>">
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