<?php include"../config/koneksi_database.php"; ?>
<?php include"../template/header.php"; ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-database"></i> DAFTAR BOX
      </h1>
    </section>

    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <a class="btn btn-app" href="box_add.php">
                <i class="fa fa-plus"></i> Tambah Data
              </a>

            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Tindakan</th>
                  <th>Kode Box</th>
                  <th>Nama Box</th>
                  <th>Jumlah Maksimal</th>
                </tr>
                </thead>
                <tbody>
                <?php
                  $query_box = mysqli_query($config, "SELECT * FROM sip_box");
                  while($array_box=mysqli_fetch_array($query_box))
                  {
                    $kodeBox=$array_box['kodeBox'];
                    $namaBox=$array_box['namaBox'];
                    $jmlMaksimal=$array_box['jmlMaksimal'];

                    echo"
                    <tr>
                      <td>
                        <div class='btn-group'>
                          <button type='button' class='btn btn-primary dropdown-toggle' data-toggle='dropdown'>
                            <span class='fa fa-bars'></span>
                            <span class='sr-only'>Toggle Dropdown</span>
                          </button>
                          <ul class='dropdown-menu' role='menu'>
                            <li><a href='box_ubah.php?kodeBox=$kodeBox'>Ubah</a></li>
                            <li><a href='box_hapus.php?kodeBox=$kodeBox'>Hapus</a></li>
                          </ul>
                        </div>
                      </td>
                      <td>".$kodeBox."</td>
                      <td>".$namaBox."</td>
                      <td>".$jmlMaksimal."</td>
                    </tr>";
                  }
                ?>
                </tbody>
                <tfoot>
                <tr>
                  <th>Tindakan</th>
                  <th>Kode Box</th>
                  <th>Nama Box</th>
                  <th>Jumlah Maksimal</th>
                </tr>
                </tfoot>
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

<?php include"../template/footer.php"; ?>

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