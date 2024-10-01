<?php include"../config/koneksi_database.php"; ?>
<?php include"../template/header.php"; 

$sql = mysqli_query($config,"select * from sip_user where nip='$_SESSION[username]' ");
$uData=mysqli_fetch_array($sql);
$idx = $uData['kodeBidang'];

?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-database"></i> DAFTAR DATA ARSIP
      </h1>
    </section>

    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
            <?php
              if($golongan=="s"){
                echo "<a class='btn btn-app' href='arsip_add.php'>
                    <i class='fa fa-plus'></i> Tambah Data
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
                  <th>Id Arsip</th>
				  <th>No Arsip</th>
				  <th>Kode Arsip</th>
				  <th>Kode Jns Arsip</th>
                  <th>Instansi</th>
                  <th>Jenis Berkas</th>
                  <th>Tahun</th>
                  <th>Klasifikasi</th>
                  <th>Uraian</th>
                  <th>Indexes</th>
                  <th>Nama Rak</th>
                  <th>Nama Box</th>
                  <th>Sampul</th>
                </tr>
                </thead>
                <tbody>
                <?php
				if($idx == 1){
					$query_arsip = mysqli_query($config, "SELECT * FROM sip_dataarsip");
				}else{
                  $query_arsip = mysqli_query($config, "SELECT * FROM sip_dataarsip where instansi = '$idx'");
				}
                  while($array_arsip = mysqli_fetch_array($query_arsip))
                  {
                    $kodeArsip=$array_arsip['kodeArsip'];
					
                    $instansi=$array_arsip['instansi'];
					$kode=$array_arsip['kode'];
					$kodejenis=$array_arsip['kodejenisarsip'];
                    $jenisBerkas=$array_arsip['jenisBerkas'];
                    $tahun=$array_arsip['tahun'];
                    $klasifikasi=$array_arsip['klasifikasi'];
                    $uraian=$array_arsip['uraian'];
                    $indexes=$array_arsip['indexes'];
                    $kodeRak=$array_arsip['kodeRak'];
                    $kodeBox=$array_arsip['kodeBox'];
                    $sampul=$array_arsip['sampul'];
					$no=$array_arsip['no'];

                    $query_sie = mysqli_query($config, "SELECT * FROM sip_sie WHERE kodeSie='$instansi'");
                    $array_sie = mysqli_fetch_array($query_sie);
					
					$kodesie = $array_sie['kodeSie'];
                    $namaSie = $array_sie['namaSie'];

                    $query_berkas = mysqli_query($config, "SELECT * FROM sip_berkas WHERE kodeBerkas='$jenisBerkas'");
                    $array_berkas = mysqli_fetch_array($query_berkas);
					
					$kodeberkas = $array_berkas['kodeBerkas'];
                    $namaBerkas = $array_berkas['namaBerkas'];

                    $query_rak = mysqli_query($config, "SELECT * FROM sip_rak WHERE kodeRak='$kodeRak'");
                    $array_rak = mysqli_fetch_array($query_rak);

                    $namaRak = $array_rak['namaRak'];

                    $query_box = mysqli_query($config, "SELECT * FROM sip_box WHERE kodeBox='$kodeBox'");
                    $array_box = mysqli_fetch_array($query_box);

                    $namaBox = $array_box['namaBox'];

                    echo"
                    <tr>
                      <td>
                        <div class='btn-group'>
                          <button type='button' class='btn btn-primary dropdown-toggle' data-toggle='dropdown'>
                            <span class='fa fa-bars'></span>
                            <span class='sr-only'>Toggle Dropdown</span>
                          </button>
                          <ul class='dropdown-menu' role='menu'>
                            <li><a href='fileArsip_list.php?kodeArsip=$kodeArsip&kodeBerkas=$kodeberkas&no=$no&kodeSie=$kodesie'>File Arsip</a></li>";
                            if($golongan=="s"){
                            echo"<li><a href='arsip_ubah.php?kodeArsip=$kodeArsip&kodeBerkas=$kodeberkas&no=$no&kodeSie=$kodesie'>Ubah</a></li>";

                            $query_fileArsip = mysqli_query($config, "SELECT COUNT(namaFile) as totalFile FROM sip_filearsip WHERE kodeArsip='$kodeArsip'");
                            $assoc_fileArsip = mysqli_fetch_assoc($query_fileArsip);
                            $jmlFile = $assoc_fileArsip['totalFile'];
                            
                            if($jmlFile!='' || $jmlFile!='0'){
                              echo "<li><a href='arsip_hapus.php?kodeArsip=$kodeArsip'>Hapus</a></li>";
                            }}
                          echo "</ul>
                        </div>
                      </td>
                      <td>".$kodeArsip."</td>
					  <td>".$no."</td>
					  <td>".$kode."</td>
					  <td>".$kodejenis."</td>
                      <td>".$namaSie."</td>
                      <td>".$namaBerkas."</td>
                      <td>".$tahun."</td>
                      <td>".$klasifikasi."</td>
                      <td>".$uraian."</td>
                      <td>".$indexes."</td>
                      <td>".$namaRak."</td>
                      <td>".$namaBox."</td>
                      <td>".$sampul."</td>
                    </tr>";
                  }
                ?>
                </tbody>
                <tfoot>
                <tr>
                  <th>Tindakan</th>
                  <th>Id Arsip</th>
				  <th>No Arsip</th>
				  <th>Kode Arsip</th>
				  <th>Kode Jns Arsip</th>
                  <th>Instansi</th>
                  <th>Jenis Berkas</th>
                  <th>Tahun</th>
                  <th>Klasifikasi</th>
                  <th>Uraian</th>
                  <th>Indexes</th>
                  <th>Nama Rak</th>
                  <th>Nama Box</th>
                  <th>Sampul</th>
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