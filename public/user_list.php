<?php include"../config/koneksi_database.php"; ?>
<?php include"../template/header.php"; ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-database"></i> DAFTAR USER
      </h1>
    </section>

    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <a class="btn btn-app" href="user_add.php">
                <i class="fa fa-plus"></i> Tambah Data
              </a>

            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Tindakan</th>
                  <th>NIK</th>
                  <th>Nama</th>
                  <th>Divisi / Bagian</th>
                </tr>
                </thead>
                <tbody>
                <?php
                  $query_user = mysqli_query($config, "SELECT * FROM sip_user");
                  while($array_user=mysqli_fetch_array($query_user))
                  {
                    $nip=$array_user['nip'];
                    $nama=$array_user['nama'];
                    $kodeBidang=$array_user['kodeBidang'];
                    $golongan=$array_user['golongan'];

                    if($golongan=="b"){
                      $query_bidang = mysqli_query($config, "SELECT namaBidang FROM sip_bidang WHERE kodeBidang='$kodeBidang'");
                      $array_bidang = mysqli_fetch_array($query_bidang);

                      $namaUnit=$array_bidang['namaBidang'];
                    }else{
                      $query_sie = mysqli_query($config, "SELECT namaSie FROM sip_sie WHERE kodeSie='$kodeBidang'");
                      $array_sie = mysqli_fetch_array($query_sie);

                      $namaUnit=$array_sie['namaSie'];
                    }

                    

                    echo"
                    <tr>
                      <td>
                        <div class='btn-group'>
                          <button type='button' class='btn btn-primary dropdown-toggle' data-toggle='dropdown'>
                            <span class='fa fa-bars'></span>
                            <span class='sr-only'>Toggle Dropdown</span>
                          </button>
                          <ul class='dropdown-menu' role='menu'>
                            <li><a href='user_ubah.php?nip=$nip'>Ubah</a></li>
                            <li><a href='user_hapus.php?nip=$nip'>Hapus</a></li>
                          </ul>
                        </div>
                      </td>
                      <td>".$nip."</td>
                      <td>".$nama."</td>
                      <td>".$namaUnit."</td>
                    </tr>";
                  }
                ?>
                </tbody>
                <tfoot>
                <tr>
                  <th>Tindakan</th>
                  <th>NIK</th>
                  <th>Nama</th>
                  <th>Divisi / Bagian</th>
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
