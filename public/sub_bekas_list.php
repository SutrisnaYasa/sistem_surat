<?php include"../config/koneksi_database.php"; ?>
<?php include"../template/header.php"; ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-database"></i> DAFTAR BERKAS
      </h1>
    </section>

    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <a class="btn btn-app" href="sub_berkas.php">
                <i class="fa fa-plus"></i> Tambah Data
              </a>

            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Tindakan</th>
                  <th>Kode Sub Berkas</th>
                  <th>Nama Sub Berkas</th>
                  <th>Nama Berkas</th>
                </tr>
                </thead>
                <tbody>
                <?php
                  $query_berkas = mysqli_query($config, "SELECT * FROM sip_sub_berkas");
                  while($array_berkas=mysqli_fetch_array($query_berkas))
                  {
                    $kodeBerkas=$array_berkas['idsub'];
					$noBerkas=$array_berkas['nosub'];
                    $namaBerkas=$array_berkas['namasub'];
                    $kodeSie=$array_berkas['kodeberkas'];

                    $query_sie = mysqli_query($config, "SELECT namaberkas FROM sip_berkas WHERE kodeberkas='$kodeSie'");
                    $array_sie = mysqli_fetch_array($query_sie);

                    $namaSie=$array_sie['namaberkas'];

                    echo"
                    <tr>
                      <td>
                        <div class='btn-group'>
                          <button type='button' class='btn btn-primary dropdown-toggle' data-toggle='dropdown'>
                            <span class='fa fa-bars'></span>
                            <span class='sr-only'>Toggle Dropdown</span>
                          </button>
                          <ul class='dropdown-menu' role='menu'>
                            <li><a href='sub_hapus.php?kodeBerkas=$kodeBerkas'>Ubah</a></li>
                            <li><a href='sub_hapus.php?kodeBerkas=$kodeBerkas'>Hapus</a></li>
                          </ul>
                        </div>
                      </td>
                      <td>".$noBerkas."</td>
                      <td>".$namaBerkas."</td>
                      <td>".$namaSie."</td>
                    </tr>";
                  }
                ?>
                </tbody>
                <tfoot>
                <tr>
                  <th>Tindakan</th>
                  <th>Kode Sub Berkas</th>
                  <th>Nama Sub Berkas</th>
                  <th>Nama Berkas</th>
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