<?php include"../config/koneksi_database.php"; ?>
<?php include"../template/header.php"; 
$query_userFilter = mysqli_query($config, "SELECT * FROM sip_user WHERE nip='$session_username'");
$array_userFilter = mysqli_fetch_array($query_userFilter);
$kodeBidangFilter = $array_userFilter['kodeBidang'];
?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-database"></i> DAFTAR NOMOR SURAT KELUAR
      </h1>
    </section>

    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <a class="btn btn-app" href="nosuratkeluar_add.php">
                <i class="fa fa-plus"></i> Tambah Data
              </a>

            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Tindakan</th>
                  <th>No Surat</th>
                  <th>Bidang</th>
                </tr>
                </thead>
                <tbody>
                <?php
				if($kodeBidangFilter=='2'){
                  $query_nosurat = mysqli_query($config, "SELECT * FROM sip_nosuratkeluar  ");
				}else{
				   $query_nosurat = mysqli_query($config, "SELECT * FROM sip_nosuratkeluar where kodeBidang = '$kodeBidangFilter'");
				}
                  while($array_nosurat = mysqli_fetch_array($query_nosurat))
                  {
                    $id=$array_nosurat['id'];
                    $noSurat=$array_nosurat['noSurat'];
                    $tahun=$array_nosurat['tahun'];
                    $atributSurat=$array_nosurat['atributSurat'];                    
                    $perihal=$array_nosurat['perihal'];
                    $kodeBidang=$array_nosurat['kodeBidang'];

                    $query_bidang = mysqli_query($config, "SELECT * FROM sip_bidang WHERE kodeBidang='$kodeBidang'");
                    $array_bidang = mysqli_fetch_array($query_bidang);

                    $namaBidang = $array_bidang['namaBidang'];

                    echo"
                    <tr>
                      <td>
                        <div class='btn-group'>
                          <button type='button' class='btn btn-primary dropdown-toggle' data-toggle='dropdown'>
                            <span class='fa fa-bars'></span>
                            <span class='sr-only'>Toggle Dropdown</span>
                          </button>
                          <ul class='dropdown-menu' role='menu'>
                            <li><a href='nosuratkeluar_ubah.php?id=$id'>Ubah</a></li>
							<li><a href='suratkeluar_add.php?no=$atributSurat'>Buat Surat Keluar</a></li>
                          </ul>
                        </div>
                      </td>
                      <td>".$atributSurat."</td>
                      <td>".$namaBidang."</td>
                    </tr>";
                  }
                ?>
                </tbody>
                <tfoot>
                <tr>
                  <th>Tindakan</th>
                  <th>No Surat</th>
                  <th>Bidang</th>
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