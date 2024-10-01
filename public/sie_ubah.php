<?php include"../config/koneksi_database.php"; ?>
<?php include"../template/header.php"; ?>
<?php 
  
  $kodeSie = $_REQUEST['kodeSie'];

  $query_sie=mysqli_query($config, "SELECT * FROM sip_sie WHERE kodeSie='$kodeSie'");
  $array_sie=mysqli_fetch_array($query_sie);
  
  
  $kodeBidang = $array_sie['kodeBidang'];
  $namaSie = $array_sie['namaSie'];

  $query_bidang = mysqli_query($config, "SELECT * FROM sip_bidang WHERE kodeBidang='$kodeBidang'");
  $array_bidang = mysqli_fetch_array($query_bidang);

  $namaBidang = $array_bidang['namaBidang'];
?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        UBAH DATA SIE
      </h1>
    </section>

    <section class="content">
      <div class="row">
        <div class="col-md-6">
          <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Form Ubah Data Sie.</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" action="sie_update.php" method="POST" enctype="multipart/form-data">
              <div class="box-body">
                  <input type="hidden" id="kodeSie" name="kodeSie" value="<?php echo $kodeSie; ?>">
                <div class="form-group">
                  <label>Nama Bagian/Bidang</label>
                    <div class="input-group my-colorpicker2">
                      <input type="text" class="form-control" id="namaBidang" name="namaBidang" readonly="readonly" value="<?php echo $namaBidang; ?>">
                      <input type="hidden" id="kodeBidang" name="kodeBidang">
                      <div class="input-group-addon">
                        <div data-toggle = "modal" data-target="#myModal"><i class="fa fa-search" > Cari</i></div> 
                      </div>
                    </div>
                </div>
                <div class="form-group">
                  <label>Nama Sie</label>
                  <input type="text" class="form-control" id="namaSie" name="namaSie" value="<?php echo $namaSie; ?>">
                </div>
              <!-- /.box-body -->
              <div class="box-footer" style="text-align: right;">
                <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Simpan</button> <button type="button" class="btn btn-danger" onclick="location.href='sie_list.php'"><i class="fa fa-close"></i> Batal</button>
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
                  <h4 class="modal-title" id="myModalLabel">Daftar Data Bagian/Bidang</h4>
            </div>
            <div class="modal-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                      <tr>
                          <th>Kode Bidang</th>
                          <th>Nama Bidang</th>
                        </tr>
                    </thead>
                    <tbody>
                     <?php 
                        $tampil=mysqli_query($config, "SELECT * FROM sip_bidang");
                        while($tampung=mysqli_fetch_array($tampil))
                        {
                          $kodeBidang = $tampung['kodeBidang'];
                          $namaBidang = $tampung['namaBidang'];
                          

                        echo"<tr class='pilih' data-kodeBidang='$kodeBidang' data-namaBidang='$namaBidang'>
                            <td>$kodeBidang</td>
                            <td>$namaBidang</td>
                          </tr>";
                        }
                     ?> 
                    </tbody>
                    <tfoot>
                      <tr>
                        <th>Kode Bidang</th>
                        <th>Nama Bidang</th>
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
      document.getElementById("namaBidang").value = $(this).attr('data-namaBidang');
        $('#myModal').modal('hide');
        });
  $(document).on('click', '.pilih', function (e) {
      document.getElementById("kodeBidang").value = $(this).attr('data-kodeBidang');
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