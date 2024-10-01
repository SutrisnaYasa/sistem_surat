<?php include"../config/koneksi_database.php"; ?>
<?php include"../template/header.php"; ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-database"></i> TAMBAH DATA
      </h1>
    </section>

    <section class="content">
      <div class="row">
        <div class="col-md-6">
          <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Form Tambah Data</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" action="sub_berkas_save.php" method="POST" enctype="multipart/form-data">
              <div class="box-body">
                <div class="form-group">
                  <label>Nama Berkas</label>
                    <div class="input-group my-colorpicker2">
                      <input type="text" class="form-control" id="namaSie" name="namaSie" readonly="readonly">
                      <input type="hidden" id="kodeSie" name="kodeSie">
                      <div class="input-group-addon">
                        <div data-toggle = "modal" data-target="#myModal"><i class="fa fa-search" > Cari</i></div> 
                      </div>
                    </div>
                </div>
                <div class="form-group">
                  <label>Nama Sub Berkas</label>
                  <input type="text" class="form-control" id="namaBerkas" name="namaBerkas">
                </div>
				<div class="form-group">
                  <label>Nomor Sub Berkas</label>
                  <input type="text" class="form-control" id="noBerkas" name="noBerkas">
                </div>
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
                          <th>Kode Berkas</th>
						  <th>No Berkas</th>
                          <th>Nama Berkas</th>
                        </tr>
                    </thead>
                    <tbody>
                     <?php 
                        $tampil=mysqli_query($config, "SELECT * FROM sip_berkas");
                        while($tampung=mysqli_fetch_array($tampil))
                        {
                          $kodeBerkas = $tampung['kodeBerkas'];
						  $noBerkas = $tampung['noBerkas'];
						  $namaBerkas = $tampung['namaBerkas'];
                          

                        echo"<tr class='pilih' data-kodeBerkas='$kodeBerkas' data-noBerkas='$noBerkas' data-namaBerkas='$namaBerkas'>
                            <td>$kodeBerkas</td>
                            <td>$noBerkas</td>
							<td>$namaBerkas</td>
                          </tr>";
                        }
                     ?> 
                    </tbody>
                    <tfoot>
                      <tr>
                          <th>Kode Berkas</th>
						  <th>No Berkas</th>
                          <th>Nama Berkas</th>
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
      document.getElementById("namaSie").value = $(this).attr('data-namaBerkas');
        $('#myModal').modal('hide');
        });
  $(document).on('click', '.pilih', function (e) {
      document.getElementById("kodeSie").value = $(this).attr('data-kodeBerkas');
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