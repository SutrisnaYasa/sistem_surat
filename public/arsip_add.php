<?php include"../config/koneksi_database.php"; ?>
<?php include"../template/header.php"; 

$sql = mysqli_query($config,"select * from sip_user where nip='$_SESSION[username]' ");
$uData=mysqli_fetch_array($sql);
$idx = $uData['kodeBidang'];

$sqlsie = mysqli_query($config,"select * from sip_sie where kodeSie='$idx' ");
$uData=mysqli_fetch_array($sqlsie);
$idxBid = $uData['kodeBidang'];
$idxSie = $uData['kodeSie'];
$kode = $idxBid.'.'.$idxSie;

$sqlNo = mysqli_query($config,"select max(no) as nox from sip_dataarsip where instansi='$idx' ");
$uDataNo=mysqli_fetch_array($sqlNo);
$cekNo=mysqli_num_rows($sqlNo);

if($cekNo > 0)
	$jml = $uDataNo['nox'] + 1;
else
	$jml = 1;
	

?>
<style>
							.Select-input option[value=1] {display: none;}
						</style>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-database"></i> TAMBAH DATA ARSIP
      </h1>
    </section>

    <section class="content">
      <div class="row">
        <div class="col-md-6">
          <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Form Tambah Data Arsip.</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" action="arsip_save.php" method="POST" enctype="multipart/form-data">
              <div class="box-body">
              	<div class="form-group">
                  <label>No (Otomatis)</label>
                  <input type="text" value="<?=$jml?>" class="form-control" id="no" name="no" readonly>
                </div>
                <div class="form-group">
                  <label>Instansi</label>
                  <select class="form-control select2" style="width: 100%;" name="kodeSie" id="kodeSie">
                   
                    <?php 
                      $query_sie=mysqli_query($config, " SELECT * FROM sip_sie where kodeSie='$idx' ");
                      while($array_sie=mysqli_fetch_array($query_sie))
                      {
                          $kodeSie = $array_sie['kodeSie'];
                          $namaSie = $array_sie['namaSie'];

                          echo "<option value='$kodeSie'>$namaSie</option>";
                      }
                    ?>
                  </select>
                  
                </div>
                <div class="form-group">
                  <label>Jenis Berkas</label>
                  <select class="form-control select2" style="width: 100%;" name="kodeBerkas" id="kodeBerkas" required>
                    <option value="">----- Pilih Data Disini -----</option>
                    <?php 
					
                      $query_berkas=mysqli_query($config, "SELECT * FROM sip_berkas where kodeSie='$idx'");
                      while($array_berkas=mysqli_fetch_array($query_berkas))
                      {
                          $kodeBerkas = $array_berkas['kodeBerkas'];
                          $namaBerkas = $array_berkas['namaBerkas'];

                          echo "<option value='$kodeBerkas'>$namaBerkas</option>";
                      }
                    ?>
                  </select>
                </div>
				<div class="form-group">
                  <label>Jenis Sub Berkas</label>
                  <select class="form-control select2" style="width: 100%;" name="kodesubBerkas" id="kodesubBerkas" required>
                    <option value="">----- Pilih Data Disini -----</option>
                    <?php 
					
                      $query_berkas=mysqli_query($config, "SELECT * FROM sip_sub_berkas where kodeSie='$idx'");
                      while($array_berkas=mysqli_fetch_array($query_berkas))
                      {
                          $kodeBerkas = $array_berkas['idsub'];
                          $namaBerkas = $array_berkas['namasub'];

                          echo "<option value='$kodeBerkas'>$namaBerkas</option>";
                      }
                    ?>
                  </select>
                </div>
                <div class="form-group">
                  <label>Kode (Otomatis)</label>
                  <input type="text" value="<?=$kode?>" class="form-control" id="kode" name="kode" readonly>
                </div>
                <div class="form-group">
                  <label>Tahun</label>
                  <input type="text" class="form-control" id="tahun" name="tahun" required>
                </div>
                <div class="form-group">
                  <label>Klasifikasi</label>
                  <input type="text" class="form-control" id="klasifikasi" name="klasifikasi" required>
                </div>
                <div class="form-group">
                  <label>Uraian</label>
                  <input type="text" class="form-control" id="uraian" name="uraian" required>
                </div>
                <div class="form-group">
                  <label>Indexe</label>
                  <input type="text" class="form-control" id="indexes" name="indexes" required>
                </div>
                <div class="form-group">
                  <label>Nama Rak</label>
                  <select class="form-control" style="width: 100%;" name="kodeRak" id="kodeRak" required>
                   
                    <?php 
                      $query_rak=mysqli_query($config, "SELECT * FROM sip_rak where sisa <> 0");
                      while($array_rak=mysqli_fetch_array($query_rak))
                      {
						 
						  
						  $query_arsip = mysqli_query($config, "SELECT COUNT(kodearsip) AS jml,koderak 
						  FROM sip_dataarsip where koderak = '$array_rak[kodeRak]'");
						  $array_arsip = mysqli_fetch_array($query_arsip);
						
						  $instansiEdit = $array_arsip['jml'];
						  
						  if($instansiEdit == $array_rak['jmlMaksimal']){
							  $h="style='display:none;'";
						  }else{
							  $h="";
						  }
						  
                          $kodeRak = $array_rak['kodeRak'];
                          $namaRak = $array_rak['namaRak'];
						?>
                       	
                          <option value="<?=$kodeRak?>" <?=$h?>><?=$namaRak ?></option>";
                          <?php
                      }
                    ?>
                  </select>
                </div>
                <div class="form-group">
                  <label>Nama Box</label>
                  <select class="form-control select2" style="width: 100%;" name="kodeBox" id="kodeBox" required>
                    
                    <?php 
                      $query_box=mysqli_query($config, "SELECT * FROM sip_box where sisa <> 0");
                      while($array_box=mysqli_fetch_array($query_box))
                      {
                          $kodeBox = $array_box['kodeBox'];
                          $namaBox = $array_box['namaBox'];

                          echo "<option value='$kodeBox'>$namaBox</option>";
                      }
                    ?>
                  </select>
                </div>
                <div class="form-group">
                  <label>Sampul</label>
                  <input type="text" class="form-control" id="sampul" name="sampul" required>
                </div>
                <input type="hidden" class="form-control" id="userInput" name="userInput" value="<?php echo $session_username; ?>">
              </div>
              <!-- /.box-body -->
              <div class="box-footer" style="text-align: right;">
                <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Simpan</button> <button type="button" class="btn btn-danger" onclick="location.href='arsip_list.php'"><i class="fa fa-close"></i> Batal</button>
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


<?php include"../template/footer.php"; ?>

<script>
  $(function () {
    //Initialize Select2 Elements
    $(".select2").select2();
    });
</script>

</body>
</html>