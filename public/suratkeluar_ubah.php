<?php include "../config/koneksi_database.php"; ?>

<?php include "../template/header.php"; ?>

<?php



$idSurat = $_REQUEST['idSurat'];



$query = mysqli_query($config, "SELECT * FROM sip_suratkeluar WHERE idSurat='$idSurat'");

$array = mysqli_fetch_array($query);



$noSurat = $array['noSuratKeluar'];

$jenisSurat = $array['jenisSurat'];

$perihal = $array['perihal'];

$kodeBidang = $array['kodeBidang'];

$tujuan = $array['tujuan'];



$query2 = mysqli_query($config, "SELECT * FROM sip_bidang WHERE kodeBidang='$kodeBidang'");

$array2 = mysqli_fetch_array($query2);



$namaBidang = $array2['namaBidang'];

?>



<!-- Content Wrapper. Contains page content -->

<div class="content-wrapper">

  <!-- Content Header (Page header) -->

  <section class="content-header">

    <h1>

      UBAH SURAT KELUAR

    </h1>



  </section>



  <section class="content">

    <div class="row">

      <div class="col-xs-6">

        <div class="box box-default">

          <div class="box-header with-border">

            <h3 class="box-title">Form Ubah Surat Keluar.</h3>

          </div>

          <!-- /.box-header -->

          <!-- form start -->

          <form role="form" action="suratkeluar_update.php" method="POST" enctype="multipart/form-data">

            <div class="box-body">

              <div class="form-group">

                <label>No. Surat Keluar</label>

                <?php $nox = explode('/', $noSurat); ?>

                <table>

                  <tr>



                    <!--/*  <td><input type="text" title="Kode Bidang" id="kodebidang" name="kodebidang"class="form-control" style="width:80px" required ></td>

                  <td> / </td>*/-->

                    <td><input type="text" title="No Urut" id="noSurat" name="noSurat" onKeyUp="myon()" class="form-control" value="<?= $noSurat ?>" style="width:300px" required>

                    </td>



                  </tr>

                </table>

              </div>

              <input type="hidden" id="nipx" name="nipx" value="<?= $_SESSION['username'] ?>" class="form-control">

              <div class="form-group">

                <label>Tujuan Surat</label>

                <input type="text" id="tujuan" name="tujuan" class="form-control" value="<?= $tujuan ?>" required>

              </div>

              <!--<div class="form-group">

                <label>Jenis Surat</label>

                <input type="text" id="jenisSurat" name="jenisSurat" class="form-control" value="<?php echo $jenisSurat; ?>">

              </div>-->

              <div class="form-group">
                <label>Jenis Surat</label>
                <select id="jenisSurat" name="jenisSurat" class="form-control" required value="<?php echo $jenisSurat; ?>">
                    <option value="<?php echo $jenisSurat; ?>"><?php echo $jenisSurat; ?></option>
                    <option value="Surat Tugas">Surat Tugas</option>
                    <option value="Surat Pengantar">Surat Pengantar</option>
                    <option value="Surat Pernyataan">Surat Pernyataan</option>
                    <option value="Surat Permohonan">Surat Permohonan</option>
                    <option value="Surat Undangan">Surat Undangan</option>
                    <option value="Surat Keterangan">Surat Keterangan</option>
                    <option value="Surat Pemberitahuan">Surat Pemberitahuan</option>
                    <option value="Surat Edaran">Surat Edaran</option>
                    <option value="Surat MOU">Surat MOU</option>
                    <option value="Surat MOA">Surat MOA</option>
                    <option value="Surat Pengumuman">Surat Pengumuman</option>
                </select>
              </div>

              <div class="form-group">

                <label>Perihal</label>

                <input type="text" id="perihal" name="perihal" class="form-control" value="<?php echo $perihal; ?>">

              </div>



              <div class="form-group">

                <label>File Surat Keluar</label>

                <input id="fileSurat" name="fileSurat" type="file">

              </div>

            </div>

            <input type="hidden" name="userInput" id="userInput" value="<?php echo $session_username; ?>">

            <input type="hidden" name="idSurat" id="idSurat" value="<?php echo $idSurat; ?>">

            <!-- /.box-body -->



            <div class="box-footer" style="text-align: right;">

              <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Simpan</button> <button type="button" class="btn btn-danger" onclick="location.href='suratkeluar_list.php'"><i class="fa fa-close"></i> Batal</button>

            </div>

          </form>

        </div>

        <!-- /.box -->

      </div>

      <!-- /.col -->

      <div class="col-md-6">

        <div class="box box-default">

          <div class="box-header">

            <i class="fa  fa-file-text-o"></i>



            <h3 class="box-title">Tujuan Surat</h3>

            <h3 id="action-msg"></h3>

            <div class="box-tools pull-right" data-toggle="tooltip" title="Status">

              <div class="btn-group" data-toggle="btn-toggle">

              </div>

            </div>

          </div>

          <div class="box-body chat" id="chat-box">







            <!-- /.chat -->

            <div class="item">

              <table width="100%" class="table table-striped table-bordered table-hover " style="font-size:12px" id="dataTables-example">

                <thead>

                  <tr>

                    <th>No</th>

                    <th>Tujuan Surat</th>

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

                <input type="hidden" id="noSuratx" name="noSurat" value="<?= $noSurat ?>">

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





          </div>

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

        <h4 class="modal-title" id="myModalLabel">Daftar Data Bidang</h4>

      </div>

      <div class="modal-body">

        <table id="example1" class="table table-bordered table-striped">

          <thead>

            <tr>

              <th>Kode Bidang/Bagian</th>

              <th>Nama Bidang/Bagian</th>

            </tr>

          </thead>

          <tbody>

            <?php

            $tampil = mysqli_query($config, "SELECT * FROM sip_bidang WHERE kodeBidang!='1'");

            while ($tampung = mysqli_fetch_array($tampil)) {

              $kodeBidang = $tampung['kodeBidang'];

              $namaBidang = $tampung['namaBidang'];





              echo "<tr class='pilih' data-kodeBidang='$kodeBidang' data-namaBidang='$namaBidang'>

                            <td>$kodeBidang</td>

                            <td>$namaBidang</td>

                          </tr>";

            }

            ?>

          </tbody>

          <tfoot>

            <tr>

              <th>Kode Bidang/Bagian</th>

              <th>Nama Bidang/Bagian</th>

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

  $(document).on('click', '.pilih', function(e) {

    document.getElementById("namaBidang").value = $(this).attr('data-namaBidang');

    $('#myModal').modal('hide');

  });

  $(document).on('click', '.pilih', function(e) {

    document.getElementById("kodeBidang").value = $(this).attr('data-kodeBidang');

    $('#myModal').modal('hide');

  });

</script>

<script type="text/javascript">

  $(document).ready(function() {

    var a = document.getElementById("noSurat").value;

    $('#dataTables-example').DataTable({

      "bDestroy": true,

      responsive: true,

      "ajax": "../public/disposisi_list_keluar.php?id=" + a

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



  function myon() {

    var a = document.getElementById("noSurat").value;

    if (a == '') {

      document.getElementById("carix").style.display = "none";

    } else {

      document.getElementById("carix").style.display = "block";

      document.getElementById("noSuratx").value = a;

      $('#dataTables-example').DataTable({

        "bDestroy": true,

        responsive: true,

        "ajax": "../public/disposisi_list_keluar.php?id=" + a

      });

    }

  }



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