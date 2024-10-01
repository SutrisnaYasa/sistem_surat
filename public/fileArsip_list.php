<?php include"../config/koneksi_database.php"; ?>
<?php include"../template/header.php"; ?>
<?php $kodeArsip=$_REQUEST['kodeArsip']; ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-database"></i> DAFTAR FILE ARSIP
      </h1>
    </section>

    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <?php 
                if($golongan=="s"){
                  echo"<a class='btn btn-app' href='fileArsip_add.php?kodeArsip=$_GET[kodeArsip]&kodeBerkas=$_GET[kodeBerkas]&no=$_GET[no]&kodeSie=$_GET[kodeSie]&sub=$_GET[sub]'>
                        <i class='fa fa-plus'></i> Tambah File
                       </a>";
                }
              ?>

            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Tindakan</th>
                  <th>Kode File</th>
                  <th>Nama Arsip</th>
                  <th>Nama File</th>
                </tr>
                </thead>
                <tbody>
                <?php
                  $query_fileArsip = mysqli_query($config, "SELECT * FROM sip_filearsip where kodearsip = '$_GET[kodeArsip]' ");
                  while($array_fileArsip = mysqli_fetch_array($query_fileArsip))
                  {
                    $kodeFile=$array_fileArsip['kodeFile'];
                    $kodeArsip=$array_fileArsip['kodeArsip'];
                    $namaFile=$array_fileArsip['namaFile'];
                    $file=$array_fileArsip['file'];

                    $query_dataarsip = mysqli_query($config, "SELECT * FROM sip_dataarsip WHERE kodeArsip='$kodeArsip'");
                    $array_dataarsip = mysqli_fetch_array($query_dataarsip);

                    $sampul = $array_dataarsip['sampul'];

                    echo"
                    <tr>
                      <td>
                        <div class='btn-group'>
                          <button type='button' class='btn btn-primary dropdown-toggle' data-toggle='dropdown'>
                            <span class='fa fa-bars'></span>
                            <span class='sr-only'>Toggle Dropdown</span>
                          </button>
                          <ul class='dropdown-menu' role='menu'>
                            <li><a href='../files/arsip/$file' download>Unduh</a></li>";
                            if($golongan=="s"){
                              echo"<li><a href='fileArsip_ubah.php?kodeFile=$kodeFile?kodeArsip=$_GET[kodeArsip]&kodeBerkas=$_GET[kodeBerkas]&no=$_GET[no]&kodeSie=$_GET[kodeSie]'>Ubah</a></li>
                                    <li><a href='fileArsip_hapus.php?kodeFile=$kodeFile?kodeArsip=$_GET[kodeArsip]&kodeBerkas=$_GET[kodeBerkas]&no=$_GET[no]&kodeSie=$_GET[kodeSie]'>Hapus</a></li>";
                            }
                    echo"  
                          </ul>
                        </div>
                      </td>
                      <td>".$kodeFile."</td>
                      <td>".$sampul."</td>
                      <td>".$namaFile."</td>
                    </tr>";
                  }
                ?>
                </tbody>
                <tfoot>
                <tr>
                  <th>Tindakan</th>
                  <th>Kode File</th>
                  <th>Nama Arsip</th>
                  <th>Nama File</th>
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