<?php include"../config/koneksi_database.php"; ?>

<?php include"../template/header.php"; ?>

<?php 

  if($_REQUEST['kategoriSurat']=='sm'){

    $query_suratmasuk = mysqli_query($config, "SELECT * FROM sip_suratmasuk WHERE idSurat='$_REQUEST[idSurat]'");

    $array_suratmasuk = mysqli_fetch_array($query_suratmasuk);



    $idSurat=$array_suratmasuk['idSurat'];

    $noSurat=$array_suratmasuk['noSurat'];

    $jenisSurat=$array_suratmasuk['jenisSurat'];

    $perihal=$array_suratmasuk['perihal'];

    $asalSurat=$array_suratmasuk['asalSurat'];

    $fileSurat=$array_suratmasuk['fileSurat'];

    $kategoriSurat=$_REQUEST['kategoriSurat'];    

  }else{

    $query_suratkeluar = mysqli_query($config, "SELECT * FROM sip_suratkeluar WHERE idSurat='$_REQUEST[idSurat]'");

    $array_suratkeluar = mysqli_fetch_array($query_suratkeluar);



    $idSurat=$array_suratkeluar['idSurat'];

    $noSurat=$array_suratkeluar['noSuratKeluar'];

    $jenisSurat=$array_suratkeluar['jenisSurat'];

    $perihal=$array_suratkeluar['perihal'];

    $kodeBidang=$array_suratkeluar['kodeBidang'];

    $fileSurat=$array_suratkeluar['fileSurat'];

    $kategoriSurat=$_REQUEST['kategoriSurat']; 



    $query_bidang = mysqli_query($config, "SELECT * FROM sip_bidang WHERE kodeBidang='$kodeBidang'");

    $array_bidang = mysqli_fetch_array($query_bidang);



    $namaBidang=$array_bidang['namaBidang'];    

  }

?>



  <!-- Content Wrapper. Contains page content -->

  <div class="content-wrapper">

    <!-- Content Header (Page header) -->

    <section class="content-header">

      <h1>

        DAFTAR KOMENTAR

      </h1>

    </section>



    <section class="content">

      <div class="row">

         <div class="col-md-6">

          <div class="box box-default">

            <div class="box-header with-border">

              <h3 class="box-title">Surat Masuk</h3>



              <!-- /.box-tools -->

            </div>

            <!-- /.box-header -->

            <div class="box-body">

                <table class="table" style="border-style: none; border:none;" width="100%">

                  <tr>

                    <td>No. Surat</td>

                    <td> : </td>

                    <td><?php echo $noSurat; ?></td>

                  </tr>

                  <tr>

                    <td>Jenis Surat</td>

                    <td> : </td>

                    <td><?php echo $jenisSurat; ?></td>

                  </tr>

                  <tr>

                   <td>Perihal</td>

                    <td> : </td>

                    <td><?php echo $perihal; ?></td>

                  </tr>

                  <?php 

                    if($_REQUEST['kategoriSurat']=='sm'){

                      echo"

                        <tr>

                          <td>Asal Surat</td>

                          <td> : </td>

                          <td>$asalSurat</td>

                        </tr>

                        <tr>

                          <td colspan='3'><embed src='../files/suratmasuk/$fileSurat' width='100%' height='500px' type='application/pdf'/></td>

                        </tr>

                      ";

                    }else{

                      echo"

                        <tr>

                          <td>Bidang/Bagian</td>

                          <td> : </td>

                          <td>$namaBidang</td>

                        </tr>

                        <tr>

                          <td colspan='3'><embed src='../files/suratkeluar/$fileSurat' width='100%' height='500px' type='application/pdf'/></td>

                        </tr>

                      ";

                    }

                  ?>

                </table>

              </div>

            <!-- /.box-body -->

          </div>

          <!-- /.box -->

        </div>

        <!-- /.col -->



        <div class="col-md-5">

          <div class="box box-default">

            <div class="box-header">

              <i class="fa fa-comments-o"></i>



              <h3 class="box-title">Komentar</h3>



              <div class="box-tools pull-right" data-toggle="tooltip" title="Status">

                <div class="btn-group" data-toggle="btn-toggle">

                </div>

              </div>

            </div>

            <div class="box-body chat" id="chat-box">

              <table id="example1" class="table table-bordered table-striped">

                <thead>

                <tr>

                  <th>Kometar</th>

                  <th>Opsi</th>

                </tr>

                </thead>

                <tbody>

                <?php

                  $query_komentar = mysqli_query($config, "SELECT * FROM sip_komentar WHERE noSurat='$noSurat'");

                  while($array_komentar = mysqli_fetch_array($query_komentar)){

                    $isiKomentar=$array_komentar['isiKomentar'];

                    $userInput=$array_komentar['userInput'];

                    $tglInput=$array_komentar['tglInput'];



                    $query_user = mysqli_query($config, "SELECT * FROM sip_user WHERE nip='$userInput'");

                    $array_user = mysqli_fetch_array($query_user);



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

                        <div class='item'>

                          <img src='../files/logo/user.png' alt='user image'>



                          <p class='message'>

                            <b class='name' style='color: blue;'>

                              <small class='text-muted pull-right'><i class='fa fa-calendar'></i> $tglInput</small>

                              $nama <br>

                              <small>$namaUnit</small>

                            </b>

                            $isiKomentar  

                          </p>

                        </div>

                      </td>";

                      

                      if($session_username==$userInput){

                        echo "<td align='center'><a href=''><i class='fa fa-trash'></a></td>";

                      }else{

                        echo"<td align='center'>none</a></td>";

                      }

                      

                    echo"</tr>";

                  }

                ?>

                </tbody>

                <tfoot>

                <tr>

                  <th>Kometar</th>

                  <th>Opsi</th>

                </tr>

                </tfoot>

              </table>

            <div class="box-footer">

              <form role="form" action="komentar_save.php" method="POST" enctype="multipart/form-data">

                <div class="input-group">

                  <input type="text" class="form-control" id="isiKomentar" name="isiKomentar">

                  <input type="hidden" id="noSurat" name="noSurat" value="<?php echo $noSurat; ?>">

                  <input type="hidden" id="userInput" name="userInput" value="<?php echo $session_username; ?>">

                  <input type="hidden" id="idSurat" name="idSurat" value="<?php echo $idSurat; ?>">

                  <input type="hidden" id="kategoriSurat" name="kategoriSurat" value="<?php echo $kategoriSurat; ?>">



                  <div class="input-group-btn">

                      <button type="submit" class="btn btn-success"><i class="fa fa-plus"></i></button>

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