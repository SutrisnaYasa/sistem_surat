<?php include"../config/koneksi_database.php"; ?>

<?php include"../template/header.php"; ?>



  <!-- Content Wrapper. Contains page content -->

  <div class="content-wrapper">

    <!-- Content Header (Page header) -->

    <section class="content-header">

      <h1>

        <i class="fa fa-database"></i> TAMBAH DATA USER

      </h1>

    </section>



    <section class="content">

      <div class="row">

        <div class="col-md-6">

          <div class="box box-default">

            <div class="box-header with-border">

              <h3 class="box-title">Form Tambah Data User.</h3>

            </div>

            <!-- /.box-header -->

            <!-- form start -->

            <form role="form" action="user_save.php" method="POST" enctype="multipart/form-data">

              <div class="box-body">

                <div class="form-group">

                  <label>NIK</label>

                  <input type="text" class="form-control" id="nip" name="nip">

                </div>

                <div class="form-group">

                  <label>Nama</label>

                  <input type="text" class="form-control" id="nama" name="nama">

                </div>

                <div class="form-group">

                  <label>Divisi / Bagian</label>

                    <div class="input-group my-colorpicker2">

                      <input type="text" class="form-control" id="namaBidang" name="namaBidang" readonly="readonly">

                      <input type="hidden" id="kodeBidang" name="kodeBidang">

                      <input type="hidden" id="golongan" name="golongan">

                      <div class="input-group-addon">

                        <div data-toggle = "modal" data-target="#myModal"><i class="fa fa-search" > Cari</i></div> 

                      </div>

                    </div>

                </div>

                <div class="form-group">

                  <label>Password</label>

                  <input type="Password" class="form-control" id="password" name="password">

                </div>

              </div>

              <!-- /.box-body -->

              <div class="box-footer" style="text-align: right;">

                <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Simpan</button> <button type="button" class="btn btn-danger" onclick="location.href='user_list.php'"><i class="fa fa-close"></i> Batal</button>

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

                  <h4 class="modal-title" id="myModalLabel">Daftar Data Divisi / Bagian</h4>

            </div>

            <div class="modal-body">

              <div class="nav-tabs-custom">

                <ul class="nav nav-tabs">

                  <li class="active"><a href="#tab_1" data-toggle="tab">Divisi / Bagian</a></li>

                  <!--<li><a href="#tab_2" data-toggle="tab">Sie</a></li>-->

                </ul>

                <div class="tab-content">

                  <div class="tab-pane active" id="tab_1">

                    <table id="tab1" class="table table-bordered table-striped">

                      <thead>

                        <tr>

                          <th>Kode Divisi / Bagian</th>

                          <th>Nama Divisi / Bagian</th>

                        </tr>

                      </thead>

                      <tbody>

                        <?php 

                          $tampil=mysqli_query($config, "SELECT * FROM sip_bidang");

                          while($tampung=mysqli_fetch_array($tampil))

                          {

                            $kodeBidang = $tampung['kodeBidang'];

                            $namaBidang = $tampung['namaBidang'];



                            echo"<tr class='pilih' data-kodeBidang='$kodeBidang' data-namaBidang='$namaBidang' data-golongan='b'>

                              <td>$kodeBidang</td>

                              <td>$namaBidang</td>

                              </tr>";

                          }

                        ?> 

                      </tbody>

                      <tfoot>

                        <tr>

                          <th>Kode Divisi / Bagian</th>

                          <th>Nama Divisi / Bagian</th>

                        </tr>

                      </tfoot>

                    </table>  

                  </div>

                  <div class="tab-pane" id="tab_2">

                    <table id="tab2" class="table table-bordered table-striped">

                      <thead>

                        <tr>

                          <th>Kode Sie</th>

                          <th>Nama Sie</th>

                        </tr>

                      </thead>

                      <tbody>

                        <?php 

                          $tampil2=mysqli_query($config, "SELECT * FROM sip_sie");

                          while($tampung2=mysqli_fetch_array($tampil2))

                          {

                            $kodeSie = $tampung2['kodeSie'];

                            $namaSie = $tampung2['namaSie'];

                          



                            echo"<tr class='pilih' data-kodeBidang='$kodeSie' data-namaBidang='$namaSie' data-golongan='s'>

                              <td>$kodeSie</td>

                              <td>$namaSie</td>

                            </tr>";

                          }

                        ?> 

                      </tbody>

                      <tfoot>

                        <tr>

                          <th>Kode Sie</th>

                          <th>Nama Sie</th>

                        </tr>

                      </tfoot>

                    </table>  

                  </div>

                </div>

              </div>

          </div>

        </div>

      </div>

    </div>

    





<?php include"../template/footer.php"; ?>



<script>

$(document).ready(function() {

    var table = $('#tab1').DataTable( {

        responsive: true

    } );

} );

</script>

<script>

$(document).ready(function() {

    var table = $('#tab2').DataTable( {

        responsive: true

    } );

} );

</script>

<script type="text/javascript">

  $(document).on('click', '.pilih', function (e) {

      document.getElementById("namaBidang").value = $(this).attr('data-namaBidang');

        $('#myModal').modal('hide');

        });

  $(document).on('click', '.pilih', function (e) {

      document.getElementById("kodeBidang").value = $(this).attr('data-kodeBidang');

        $('#myModal').modal('hide');

        });

  $(document).on('click', '.pilih', function (e) {

      document.getElementById("golongan").value = $(this).attr('data-golongan');

        $('#myModal').modal('hide');

        });

</script>



</body>

</html>