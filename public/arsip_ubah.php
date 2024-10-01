<?php include"../config/koneksi_database.php"; ?>
<?php include"../template/header.php"; ?>
<?php
  $kodeArsip = $_REQUEST['kodeArsip'];

  $query_arsip = mysqli_query($config, "SELECT * FROM sip_dataarsip WHERE kodeArsip='$kodeArsip'");
  $array_arsip = mysqli_fetch_array($query_arsip);

  $instansiEdit = $array_arsip['instansi'];
  $jenisBerkasEdit = $array_arsip['jenisBerkas'];
  $jenissBerkasEdit = $array_arsip['subberkas'];
  $tahunEdit = $array_arsip['tahun'];
  $klasifikasiEdit = $array_arsip['klasifikasi'];
  $uraianEdit = $array_arsip['uraian'];
  $indexesEdit = $array_arsip['indexes'];
  $kodeRakEdit = $array_arsip['kodeRak'];
  $kodeBoxEdit = $array_arsip['kodeBox'];
  $sampulEdit = $array_arsip['sampul'];
  $kode = $array_arsip['kode'];
  $no = $array_arsip['no'];
?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-database"></i> UBAH DATA ARSIP
      </h1>
    </section>

    <section class="content">
      <div class="row">
        <div class="col-md-6">
          <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Form Ubah Data Arsip.</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" action="arsip_update.php" method="POST" enctype="multipart/form-data">
              <div class="box-body">
              	<div class="form-group">
                  <label>No (Otomatis)</label>
                  <input type="text" value="<?=$no?>" class="form-control" id="no" name="no" readonly>
                </div>
                <div class="form-group">
                  <label>Nama Sie</label>
                  <select class="form-control select2" style="width: 100%;" name="kodeSie" id="kodeSie">
                    <option>----- Pilih Data Disini -----</option>
                    <?php 
                      $query_sie=mysqli_query($config, "SELECT * FROM sip_sie ");
                      while($array_sie=mysqli_fetch_array($query_sie))
                      {
                          $kodeSie = $array_sie['kodeSie'];
                          $namaSie = $array_sie['namaSie'];

                          if($instansiEdit==$kodeSie){
                            echo "<option value='$kodeSie' selected>$namaSie</option>";
                          }else{
                            echo "<option value='$kodeSie'>$namaSie</option>";
                          }
                      }
                    ?>
                  </select>
                </div>
                <div class="form-group">
                  <label>Jenis Berkas</label>
                  <select class="form-control select2" style="width: 100%;" name="kodeBerkas" id="kodeBerkas">
                    <option>----- Pilih Data Disini -----</option>
                    <?php 
                      $query_berkas=mysqli_query($config, "SELECT * FROM sip_berkas");
                      while($array_berkas=mysqli_fetch_array($query_berkas))
                      {
                          $kodeBerkas = $array_berkas['kodeBerkas'];
                          $namaBerkas = $array_berkas['namaBerkas'];

                          if($jenisBerkasEdit==$kodeBerkas){
                            echo "<option value='$kodeBerkas' selected>$namaBerkas</option>";  
                          }else{
                            echo "<option value='$kodeBerkas'>$namaBerkas</option>";
                          }
                          
                      }
                    ?>
                  </select>
                </div>
                <div class="form-group">
                  <label>Jenis Sub Berkas</label>
                  <select class="form-control select2" style="width: 100%;" name="kodeBerkas" id="kodeBerkas">
                    <option>----- Pilih Data Disini -----</option>
                    <?php 
                      $query_berkas=mysqli_query($config, "SELECT * FROM sip_sub_berkas");
                      while($array_berkas=mysqli_fetch_array($query_berkas))
                      {
                          $kodeBerkas = $array_berkas['idsub'];
                          $namaBerkas = $array_berkas['namasub'];

                          if($jenissBerkasEdit==$kodeBerkas){
                            echo "<option value='$kodeBerkas' selected>$namaBerkas</option>";  
                          }else{
                            echo "<option value='$kodeBerkas'>$namaBerkas</option>";
                          }
                          
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
                  <input type="text" class="form-control" id="tahun" name="tahun" value="<?php echo $tahunEdit; ?>">
                </div>
                <div class="form-group">
                  <label>Klasifikasi</label>
                  <input type="text" class="form-control" id="klasifikasi" name="klasifikasi" value="<?php echo $klasifikasiEdit; ?>">
                </div>
                <div class="form-group">
                  <label>Uraian</label>
                  <input type="text" class="form-control" id="uraian" name="uraian" value="<?php echo $uraianEdit; ?>">
                </div>
                <div class="form-group">
                  <label>Indexes</label>
                  <input type="text" class="form-control" id="indexes" name="indexes" value="<?php echo $indexesEdit; ?>">
                </div>
                <div class="form-group">
                  <label>Nama Rak</label>
                  <select class="form-control select2" style="width: 100%;" name="kodeRak" id="kodeRak">
                    
                    <?php 
                      $query_rak=mysqli_query($config, "SELECT * FROM sip_rak where sisa <> 0");
                      while($array_rak=mysqli_fetch_array($query_rak))
                      {
                          $kodeRak = $array_rak['kodeRak'];
                          $namaRak = $array_rak['namaRak'];

                          if($kodeRakEdit==$kodeRak){
                            echo "<option value='$kodeRak' selected>$namaRak</option>";  
                          }else{
                            echo "<option value='$kodeRak'>$namaRak</option>";
                          }
                          
                      }
                    ?>
                  </select>
                </div>
                <div class="form-group">
                  <label>Nama Box</label>
                  <select class="form-control select2" style="width: 100%;" name="kodeBox" id="kodeBox">
                   
                    <?php 
                      $query_box=mysqli_query($config, "SELECT * FROM sip_box where sisa <> 0");
                      while($array_box=mysqli_fetch_array($query_box))
                      {
                          $kodeBox = $array_box['kodeBox'];
                          $namaBox = $array_box['namaBox'];

                          if($kodeBoxEdit==$kodeBox){
                            echo "<option value='$kodeBox' selected>$namaBox</option>";
                          }else{
                            echo "<option value='$kodeBox'>$namaBox</option>";
                      
                          }
                      }
                    ?>
                  </select>
                </div>
                <div class="form-group">
                  <label>Sampul</label>
                  <input type="text" class="form-control" id="sampul" name="sampul" value="<?php echo $sampulEdit; ?>">
                </div>
                <input type="hidden" class="form-control" id="userInput" name="userInput" value="<?php echo $session_username; ?>">
                <input type="hidden" class="form-control" id="kodeArsip" name="kodeArsip" value="<?php echo $kodeArsip; ?>">
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