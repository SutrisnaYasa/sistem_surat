<?php include "../config/koneksi_database.php"; ?>

<?php include "../template/header.php"; ?>

<?php



$idSurat = $_REQUEST['idSurat'];



$query = mysqli_query($config, "SELECT * FROM sip_suratmasuk WHERE idSurat='$idSurat'");

$array = mysqli_fetch_array($query);



$noSurat = $array['noSurat'];
$tglSurat = $array['tglSurat'];
$jenisSurat = $array['jenisSurat'];
$perihal = $array['perihal'];
$asalSurat = $array['asalSurat'];
$sifatInstruksi = $array['sifatInstruksi'];


?>



<!-- Content Wrapper. Contains page content -->

<div class="content-wrapper">

  <!-- Content Header (Page header) -->

  <section class="content-header">

    <h1>

      UBAH SURAT MASUK

    </h1>



  </section>



  <section class="content">

    <div class="row">

      <div class="col-xs-6">

        <div class="box box-default">

          <div class="box-header with-border">

            <h3 class="box-title">Form Ubah Surat Masuk.</h3>

          </div>

          <!-- /.box-header -->

          <!-- form start -->

          <form role="form" action="suratmasuk_update.php" method="POST" enctype="multipart/form-data">

            <div class="box-body">

              <div class="form-group">

                <label>No. Surat Masuk</label>

                <input type="text" id="noSurat" name="noSurat" class="form-control" value="<?php echo $noSurat; ?>">

              </div>

              
              <div class="form-group">

                <label>Tgl Surat</label>

                <input type="Date" id="tglSurat" name="tglSurat" class="form-control" value="<?php echo $tglSurat; ?>">

              </div>

              <div class="form-group">

                <label>Jenis Surat</label>

                <input type="text" id="jenisSurat" name="jenisSurat" class="form-control" value="<?php echo $jenisSurat; ?>">

              </div>

              <div class="form-group">

                <label>Perihal</label>

                <input type="text" id="perihal" name="perihal" class="form-control" value="<?php echo $perihal; ?>">

              </div>

              <div class="form-group">

                <label>Asal Surat</label>

                <input type="text" id="asalSurat" name="asalSurat" class="form-control" value="<?php echo $asalSurat; ?>">

              </div>

              <div class="form-group">

                <label>Teruskan</label><br>

                <label><input type="checkbox" class="minimal-red" value="1" name="terusan[]"> Ketua STMIK Primakara</label>

                <!--<label><input type="checkbox" class="minimal-red" value="3" name="terusan[]"> Sekertaris</label>-->

              </div>

              <div class="form-group" id="sifatInstruksi">
                    <label>Pilih Sifat Disposisi</label><br>
                    <label><input type="checkbox" class="minimal-red" value="Rahasia" name="sifatInstruksi"> Rahasia</label>
                    <label><input type="checkbox" class="minimal-red" value="Penting" name="sifatInstruksi"> Penting</label>
                    <label><input type="checkbox" class="minimal-red" value="Rutin" name="sifatInstruksi"> Rutin</label>
                  </div>

              <div class="form-group">

                <label>File Surat Masuk</label>

                <input id="fileSurat" name="fileSurat" type="file">

              </div>

            </div>

            <input type="hidden" name="userInput" id="userInput" value="<?php echo $session_username; ?>">

            <input type="hidden" name="idSurat" id="idSurat" value="<?php echo $idSurat; ?>">

            <!-- /.box-body -->



            <div class="box-footer" style="text-align: right;">

              <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Simpan</button> <button type="button" class="btn btn-danger" onclick="location.href='suratmasuk_list.php'"><i class="fa fa-close"></i> Batal</button>

            </div>

          </form>

        </div>

        <!-- /.box -->

      </div>

      <!-- /.col -->

     <!--<div class="col-md-6">

        <div class="box box-default">

          <div class="box-header">

            <i class="fa  fa-file-text-o"></i>



            <h3 class="box-title">Disposisi</h3>

            <h3 id="action-msg"></h3>

            <div class="box-tools pull-right" data-toggle="tooltip" title="Status">

              <div class="btn-group" data-toggle="btn-toggle">

              </div>

            </div>

          </div>

          <div class="box-body chat" id="chat-box">







          

            <div class="item">

              <table width="100%" class="table table-striped table-bordered table-hover " style="font-size:12px" id="dataTables-example">

                <thead>

                  <tr>

                    <th>No</th>

                    <th>Tujuan Disposisi</th>

                    <th>Action</th>

                  </tr>

                </thead>

                <tbody>

                </tbody>

              </table>

            </div>

          </div>

          <div class="box-footer">

            <?php

            $query_userLogin = mysqli_query($config, "SELECT * FROM sip_user WHERE nip='$session_username'");

            $array_userLogin = mysqli_fetch_array($query_userLogin);



            $golonganUserLogin = $array_userLogin['golongan'];



            if ($golonganUserLogin == "b") {

              $kodeBidangLogin = $array_userLogin['kodeBidang'];

              $query_cek = mysqli_query($config, "SELECT * FROM sip_disposisisurat WHERE noSurat='$noSurat' and kodeBidang = '$kodeBidang' ");

              $array_cek = mysqli_num_rows($query_cek);

            } else {

              $kodeSie = $array_userLogin['kodeBidang'];

              $query_sieLogin = mysqli_query($config, "SELECT * FROM sip_sie WHERE kodeSie='$kodeSie'");

              $array_sieLogin = mysqli_fetch_array($query_sieLogin);



              $kodeBidangLogin = $array_sieLogin['kodeBidang'];

            }





            ?>

            <form role="form" action="disposisi_save.php" method="POST" id="form-actionx" enctype="multipart/form-data">

              <div class="input-group my-colorpicker2">

                <input type="text" class="form-control" id="namaBidang" name="namaBidang" readonly>

                <input type="hidden" id="kodeSimpan" name="kodeSimpan" value="text">

                <input type="hidden" id="idSurat" name="idSurat">

                <input type="hidden" id="noSuratx" name="noSurat">

                <input type="hidden" id="kodeBidangPe" name="kodeBidangPe" value="<?php echo $kodeBidangLogin ?>">

                <input type="hidden" id="kodeBidang" name="kodeBidang">

                <input type="hidden" id="userPengirim" name="userPengirim" value="<?php echo $session_username; ?>">

                <input type="hidden" id="kategoriSurat" name="kategoriSurat" value="<?php echo $kategoriSurat; ?>">

                <div class="input-group-addon">

                  <div id="carix" data-toggle="modal" data-target="#myModal"><i class="fa fa-search"> Cari</i></div>

                </div>

                <div class="input-group-btn">

                  <button type="submit" class="btn btn-success"><i class="fa fa-save"></i></button>

                </div>

              </div>

            </form>





          </div>-->

        </div>

      </div>

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

        <h4 class="modal-title" id="myModalLabel">Daftar Data Devisi / Bagian</h4>

      </div>

      <div class="modal-body">

        <table id="example1" class="table table-bordered table-striped">

          <thead>

            <tr>

              <th>Kode Devisi / Bagian</th>

              <th>Nama Devisi / Bagian</th>

            </tr>

          </thead>

          <tbody>

            <?php

            $tampil = mysqli_query($config, "SELECT * FROM sip_bidang WHERE kodeBidang not in (1,2)");

            while ($tampung = mysqli_fetch_array($tampil)) {

              $kodeBidang = $tampung['kodeBidang'];

              $namaBidang = $tampung['namaBidang'];



              $tampil2 = mysqli_query($config, "SELECT * FROM sip_disposisisurat WHERE noSurat='$noSurat' 

						  AND kodeBidang='$kodeBidang'

						  AND pengirim = '2'");

              $tampung2 = mysqli_fetch_array($tampil2);



              $kodeBidangCek = $tampung2['kodeBidang'];



              if ($kodeBidangCek != $kodeBidang) {

                echo "<tr class='pilih' data-kodeBidang='$kodeBidang' data-namaBidang='$namaBidang'>

                              <td>$kodeBidang</td>

                              <td>$namaBidang</td>

                            </tr>";

              }

            }

            ?>

          </tbody>

          <tfoot>

            <tr>

              <th>Kode Devisi / Bagian</th>

              <th>Nama Devisi / Bagian</th>

            </tr>

          </tfoot>

        </table>

      </div>

    </div>

  </div>

</div>



<?php include "../template/footer.php"; ?>

<script>

  $(function() {

        //Initialize Select2 Elements

        $(".selectSifat").select2();

        $(".selectKategori").select2();

</script>



<script type="text/javascript">

  $(document).ready(function() {

    var a = document.getElementById("noSurat").value;

    document.getElementById("noSuratx").value = a;

    $('#dataTables-example').DataTable({

      "bDestroy": true,

      responsive: true,

      "ajax": "../public/disposisi_list_j.php?id=" + a

    });

  });



  $('#form-actionx').submit(function(e) {



    e.preventDefault();



    var me = $(this);



    $.ajax({

      url: me.attr('action'),

      type: 'post',

      data: me.serialize(),

      dataType: 'json',

      success: function(response) {

        if (response.success == true) {



          var table = $('#dataTables-example').DataTable();

          table.ajax.reload();

        } else {

          $('#error-msgx').html('<div class="alert alert-warning">' + response.massages + '</div>');



        }

      }

    })

  });



  $(document).on('click', '.pilih', function(e) {

    document.getElementById("namaBidang").value = $(this).attr('data-namaBidang');

    $('#myModal').modal('hide');

  });

  $(document).on('click', '.pilih', function(e) {

    document.getElementById("kodeBidang").value = $(this).attr('data-kodeBidang');

    $('#myModal').modal('hide');

  });

</script>

<script>

  $(function() {

    //Initialize Select2 Elements

    $(".select2").select2();

  });





  function hapus(id) {

    if (confirm('Anda Yakin menghapus data?')) {

      $.ajax({

        url: '../public/disposisi_del_j.php?id=' + id,

        type: 'POST',

        dataType: 'json',

        success: function(response) {

          if (response.success == true) {

            var table = $('#dataTables-example').DataTable();

            table.ajax.reload();

          } else {

            $('#error-msg').html('<div class="alert alert-warning">' + response.massages + '</div>');



          }

        }

      });

    }

    return false;

  }

</script>





</body>



</html>