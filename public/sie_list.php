<?php include"../config/koneksi_database.php"; ?>
<?php include"../template/header.php"; ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-database"></i> DAFTAR SIE
      </h1>
    </section>

    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <a class="btn btn-app" href="sie_add.php">
                <i class="fa fa-plus"></i> Tambah Data
              </a>

            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Tindakan</th>
                  <th>Kode Sie</th>
                  <th>Nama Sie</th>
                  <th>Nama Bagian/Bidang</th>
                </tr>
                </thead>
                <tbody>
                <?php
                  $query_sie = mysqli_query($config, "SELECT * FROM sip_sie");
                  while($array_sie=mysqli_fetch_array($query_sie))
                  {
                    $kodeSie=$array_sie['kodeSie'];
                    $namaSie=$array_sie['namaSie'];
                    $kodeBidang=$array_sie['kodeBidang'];

                    $query_bidang = mysqli_query($config, "SELECT namaBidang FROM sip_bidang WHERE kodeBidang='$kodeBidang'");
                    $array_bidang = mysqli_fetch_array($query_bidang);

                    $namaBidang=$array_bidang['namaBidang'];

                    echo"
                    <tr>
                      <td>
                        <div class='btn-group'>
                          <button type='button' class='btn btn-primary dropdown-toggle' data-toggle='dropdown'>
                            <span class='fa fa-bars'></span>
                            <span class='sr-only'>Toggle Dropdown</span>
                          </button>
                          <ul class='dropdown-menu' role='menu'>
                            <li><a href='sie_ubah.php?kodeSie=$kodeSie'>Ubah</a></li>
                            <li><a href='sie_hapus.php?kodeSie=$kodeSie'>Hapus</a></li>
                          </ul>
                        </div>
                      </td>
                      <td>".$kodeSie."</td>
                      <td>".$namaSie."</td>
                      <td>".$namaBidang."</td>
                    </tr>";
                  }
                ?>
                </tbody>
                <tfoot>
                <tr>
                  <th>Tindakan</th>
                  <th>Kode Sie</th>
                  <th>Nama Sie</th>
                  <th>Nama Bagian/Bidang</th>
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