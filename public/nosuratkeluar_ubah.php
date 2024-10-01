<?php include"../config/koneksi_database.php"; ?>
<?php date_default_timezone_set('Asia/Makassar'); ?>
<?php include"../template/header.php"; ?>
<?php 
  
  $id = $_REQUEST['id'];
  
  $query_userFilter = mysqli_query($config, "SELECT * FROM sip_user WHERE nip='$session_username'");
	$array_userFilter = mysqli_fetch_array($query_userFilter);
	$kodeBidangFilter = $array_userFilter['kodeBidang'];

  $query_nosurat=mysqli_query($config, "SELECT * FROM sip_nosuratkeluar WHERE id='$id'");
  $array_nosurat=mysqli_fetch_array($query_nosurat);
  
  
  $perihal = $array_nosurat['perihal'];
  $tujuan = $array_nosurat['tujuan'];
  $kodeBidang = $array_nosurat['kodeBidang'];
  $xNo = $array_nosurat['noSurat'];

  $query_bidang = mysqli_query($config, "SELECT * FROM sip_bidang WHERE kodeBidang='$kodeBidang'");
  $array_bidang = mysqli_fetch_array($query_bidang);

  $namaBidang = $array_bidang['namaBidang'];
  
  if(empty($xNo)){
  //Membuat data no
  
	$month = date('M', strtotime(date("Y-m-d")));
	$monthList = array(
		'Jan' => 'I',
		'Feb' => 'II',
		'Mar' => 'III',
		'Apr' => 'IV',
		'May' => 'V',
		'Jun' => 'VI',
		'Jul' => 'VII',
		'Aug' => 'VIII',
		'Sep' => 'IX',
		'Oct' => 'X',
		'Nov' => 'XI',
		'Des' => 'XII'
	);
	$tahun = date("Y");
	$query = mysqli_query($config, "SELECT * FROM sip_nosuratkeluar ORDER BY noSurat DESC");
	$array = mysqli_fetch_array($query);

	$th=$array['tahun'];
	if($th==""){
		$noBaru='0001'.'/'.$monthList[$month].'/'.$tahu;
	}else{
		$no = $array['noSurat'];
		$plus = 1;
		$tambah = $no+$plus;
		$panjang = strlen($tambah);
		if($panjang == 1){
			$noBaru = '000'.$tambah.'/'.$monthList[$month].'/'.$tahun;
		}
		if($panjang == 2){
			$noBaru = '00'.$tambah.'/'.$monthList[$month].'/'.$tahun;
		}
		if($panjang == 3){
			$noBaru = '0'.$tambah.'/'.$monthList[$month].'/'.$tahun;
		}
		if($panjang == 4){
			$noBaru = $tambah.'/'.$monthList[$month].'/'.$tahun;
		}
		
	}
	
	
  }else{
	  $noBaru = $array_nosurat['atributSurat'];
  }
?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-database"></i> DATA NOMOR SURAT
      </h1>
    </section>

    <section class="content">
      <div class="row">
        <div class="col-md-6">
          <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Form Data Nomor Surat.</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" action="nosuratkeluar_update.php" method="POST" enctype="multipart/form-data">
              <div class="box-body">
			  <?php if($kodeBidangFilter=='2'){ ?>
				<div class="form-group" >
                  <label>No</label>
                  <input type="text" class="form-control"  id="no" name="no" value="<?php echo $noBaru; ?>" style="width:200px;">
                </div>
			  <?php } ?>
               
				
				 <input type="hidden" id="id" name="id" value="<?php echo $id; ?>">
                <div class="form-group">
                  <label>Nama Bagian/Bidang</label>
                    <div class="input-group my-colorpicker2">
                      <input type="text" class="form-control" id="namaBidang" name="namaBidang" readonly="readonly" value="<?php echo $namaBidang; ?>">
                      <input type="hidden" id="kodeBidang" name="kodeBidang" value="<?=$kodeBidang?>">
                      <div class="input-group-addon">
                        <div data-toggle = "modal" data-target="#myModal"><i class="fa fa-search" > Cari</i></div> 
                      </div>
                    </div>
                </div>
              </div>
              <!-- /.box-body -->
              <div class="box-footer" style="text-align: right;">
                <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Simpan</button> <button type="button" class="btn btn-danger" onclick="location.href='nosuratkeluar_list.php'"><i class="fa fa-close"></i> Batal</button>
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
                  <h4 class="modal-title" id="myModalLabel">Daftar Data Bagian/Bidang</h4>
            </div>
            <div class="modal-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                      <tr>
                          <th>Kode Bidang</th>
                          <th>Nama Bidang</th>
                        </tr>
                    </thead>
                    <tbody>
                     <?php 
                        $tampil=mysqli_query($config, "SELECT * FROM sip_bidang");
                        while($tampung=mysqli_fetch_array($tampil))
                        {
                          $kodeBidang = $tampung['kodeBidang'];
                          $namaBidang = $tampung['namaBidang'];
                          

                        echo"<tr class='pilih' data-kodeBidang='$kodeBidang' data-namaBidang='$namaBidang'>
                            <td>$kodeBidang</td>
                            <td>$namaBidang</td>
                          </tr>";
                        }
                     ?> 
                    </tbody>
                    <tfoot>
                      <tr>
                        <th>Kode Bidang</th>
                        <th>Nama Bidang</th>
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
      document.getElementById("namaBidang").value = $(this).attr('data-namaBidang');
        $('#myModal').modal('hide');
        });
  $(document).on('click', '.pilih', function (e) {
      document.getElementById("kodeBidang").value = $(this).attr('data-kodeBidang');
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