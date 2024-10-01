<?php include"../config/koneksi_database.php"; ?>
<?php include"../template/header.php"; ?>
<?php 
  
  $kodeBerkas = $_REQUEST['kodeBerkas'];

  $query_berkas=mysqli_query($config, "SELECT * FROM sip_berkas WHERE kodeBerkas='$kodeBerkas'");
  $array_berkas=mysqli_fetch_array($query_berkas);
  
  
  $kodeSie = $array_berkas['kodeSie'];
  $namaBerkas = $array_berkas['namaBerkas'];
  $noBerkas = $array_berkas['noBerkas'];

  $query_sie = mysqli_query($config, "SELECT * FROM sip_sie WHERE kodeSie='$kodeSie'");
  $array_sie = mysqli_fetch_array($query_sie);

  $namaSie = $array_sie['namaSie'];
?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        UBAH DATA BERKAS
      </h1>
    </section>

    <section class="content">
      <div class="row">
        <div class="col-md-6">
          <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Form Ubah Data Berkas.</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" action="berkas_update.php" method="POST" enctype="multipart/form-data">
              <div class="box-body">
                  <input type="hidden" id="kodeBerkas" name="kodeBerkas" value="<?php echo $kodeBerkas; ?>">
                <div class="form-group">
                  <label>Nama Sie</label>
                    <div class="input-group my-colorpicker2">
                      <input type="text" class="form-control" id="namaSie" name="namaSie" readonly="readonly" value="<?php echo $namaSie; ?>">
                      <input type="hidden" id="kodeSie" name="kodeSie" value="<?=$kodeSie?>">
                      <div class="input-group-addon">
                        <div data-toggle = "modal" data-target="#myModal"><i class="fa fa-search" > Cari</i></div> 
                      </div>
                    </div>
                </div>
                <div class="form-group">
                  <label>Nama Berkas</label>
                  <input type="text" class="form-control" id="namaBerkas" name="namaBerkas" value="<?php echo $namaBerkas; ?>">
                </div>
				<div class="form-group">
                  <label>Nomor Berkas</label>
                  <input type="text" class="form-control" id="noBerkas" name="noBerkas" value="<?php echo $noBerkas; ?>">
                </div>
              <!-- /.box-body -->
              <div class="box-footer" style="text-align: right;">
                <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Simpan</button> <button type="button" class="btn btn-danger" onclick="location.href='berkas_list.php'"><i class="fa fa-close"></i> Batal</button>
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


  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:800px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <h4 class="modal-title" id="myModalLabel">Daftar Data Sie</h4>
            </div>
            <div class="modal-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                      <tr>
                          <th>Kode Sie</th>
                          <th>Nama Sie</th>
                        </tr>
                    </thead>
                    <tbody>
                     <?php 
                        $tampil=mysqli_query($config, "SELECT * FROM sip_sie");
                        while($tampung=mysqli_fetch_array($tampil))
                        {
                          $kodeSie = $tampung['kodeSie'];
                          $namaSie = $tampung['namaSie'];
                          

                        echo"<tr class='pilih' data-kodeSie='$kodeSie' data-namaSie='$namaSie'>
                            <td>$kodeSie</td>
                            <td>$namaSie</td>
                          </tr>";
                        }
                     ?> 
                    </tbody>
                    <tfoot>
                      <tr>
                        <th>Kode Sie</th>
                        <th>Nama Sie</th>
                      </tr>
                    </tfoot>
                </table>  
            </div>
        </div>
    </div>
  </div>


<?php include"../template/footer.php"; ?>

<script type="text/javascript">
  $(document).on('click', '.pilih', function (e) {
      document.getElementById("namaSie").value = $(this).attr('data-namaSie');
        $('#myModal').modal('hide');
        });
  $(document).on('click', '.pilih', function (e) {
      document.getElementById("kodeSie").value = $(this).attr('data-kodeSie');
        $('#myModal').modal('hide');
        });
</script>
<script>
$(document).ready(function() {
    var table = $('#example1').DataTable( {
        responsive: true
    } );
 
    new $.fn.dataTable.FixedHeader( table );
} );
</script>

</body>
</html>