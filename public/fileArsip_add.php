<?php include"../config/koneksi_database.php"; ?>
<?php include"../template/header.php"; ?>
<?php $kodeArsip=$_REQUEST['kodeArsip']; ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        TAMBAH FILE ARSIP
      </h1>
      
    </section>

    <section class="content">
      <div class="row">
        <div class="col-xs-6">
          <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Form File Arsip.</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" action="fileArsip_save.php?kodeArsip=<?=$_GET['kodeArsip']?>&kodeBerkas=<?=$_GET['kodeBerkas']?>&no=<?=$_GET['no']?>&kodeSie=<?=$_GET['kodeSie']?>&sub=<?=$_GET['sub']?>" method="POST" enctype="multipart/form-data">
              <div class="box-body">
                <div class="form-group">
                  <label>Nama File</label>
                  <input type="text" class="form-control" id="namaFile" name="namaFile">
                </div>
                <div class="form-group">
                  <label>File Arsip</label>
                  <input id="fileArsip" name="fileArsip" type="file">
                </div>
                <input type="hidden" name="kodeArsip" id="kodeArsip" value="<?php echo $_REQUEST['kodeArsip']; ?>">
              </div>
              <!-- /.box-body -->

              <div class="box-footer" style="text-align: right;">
                <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Simpan</button> <button type="button" class="btn btn-danger" onclick="location.href='fileArsip_list.php?kodeArsip=<?php echo $kodeArsip; ?>'"><i class="fa fa-close"></i> Batal</button>
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
<script>
  $(function () {
    //Initialize Select2 Elements
    $(".select2").select2();
    });
</script>

</body>
</html>