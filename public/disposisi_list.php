<?php include "../config/koneksi_database.php"; ?>
<?php include "../template/header.php"; ?>

<?php
$kategoriSurat = $_REQUEST['kategoriSurat'];
$query_userLogin = mysqli_query($config, "SELECT * FROM sip_user WHERE nip='$session_username'");
$array_userLogin = mysqli_fetch_array($query_userLogin);
$kodeBidangLogin = $array_userLogin['kodeBidang'];

if ($kategoriSurat == 'sm') {
  $query_suratmasuk = mysqli_query($config, "SELECT * FROM sip_suratmasuk WHERE idSurat='$_REQUEST[idSurat]'");
  $array_suratmasuk = mysqli_fetch_array($query_suratmasuk);

  $idSurat = $array_suratmasuk['idSurat'];
  $noSurat = $array_suratmasuk['noSurat'];
  $tglSurat = $array_suratmasuk['tglSurat'];
  $jenisSurat = $array_suratmasuk['jenisSurat'];
  $perihal = $array_suratmasuk['perihal'];
  $asalSurat = $array_suratmasuk['asalSurat'];
  $sifatInstruksi = $array_suratmasuk['sifatInstruksi'];
  $fileSurat = $array_suratmasuk['fileSurat'];
  $tglInput= $array_suratmasuk['tglInput'];

  $query_suratmasuk_t = mysqli_query($config, "SELECT b.namaBidang,a.tujuandivisi FROM sip_tujuan a 
	inner join sip_bidang b on a.tujuandivisi=b.kodeBidang
	WHERE noSurat='$noSurat' and pengirimdivisi = '$kodeBidangLogin' ");

  $query_cek_disposisi = mysqli_query($config, "SELECT * from sip_disposisisurat where noSurat = '$noSurat' ");
  $cek_disposisi = mysqli_num_rows($query_cek_disposisi);
  $queryUpdate = mysqli_query($config, "update sip_disposisisurat set status='1' where noSurat='$noSurat' and kodeBidang='$kodeBidangLogin' ");

} else {
  $query_suratkeluar = mysqli_query($config, "SELECT * FROM sip_suratkeluar WHERE idSurat='$_REQUEST[idSurat]'");
  $array_suratkeluar = mysqli_fetch_array($query_suratkeluar);

  $idSurat = $array_suratkeluar['idSurat'];
  $noSurat = $array_suratkeluar['noSuratKeluar'];
  $jenisSurat = $array_suratkeluar['jenisSurat'];
  $perihal = $array_suratkeluar['perihal'];
  $kodeBidang = $array_suratkeluar['kodeBidang'];
  $fileSurat = $array_suratkeluar['fileSurat'];

  $query_bidang = mysqli_query($config, "SELECT * FROM sip_bidang WHERE kodeBidang='$kodeBidang'");
  $array_bidang = mysqli_fetch_array($query_bidang);

  $namaBidang = $array_bidang['namaBidang'];

}

?>

<!-- Content Wrapper. Contains page content -->

<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      DAFTAR DISPOSISI
    </h1>
  </section>

  <section class="content">
    <div class="row">
      <div class="col-md-6">
        <div class="box box-default">
          <div class="box-header with-border">

            <h3 class="box-title">
              <?php
              if ($kategoriSurat == 'sm') {
                echo "Surat Masuk";
              } else {
                echo "Surat Keluar";
              }
              ?>
            </h3>

            <!-- /.box-tools -->
          </div>
          <!-- /.box-header -->
          <div class="box-body">
            <table class="table" style="border-style: none; border:none;" width="100%">
              <?php
              if ($cek_disposisi > 0) {
                $arow_cek_disposisi = mysqli_fetch_array($query_cek_disposisi);
                if ($arow_cek_disposisi['pengirim'] == '2') {
              ?>

                  <tr>
                    <td>
                      <div data-toggle="modal" data-target="#myModal2"><i class="btn btn-primary"> Teruskan</i></div>
                    </td>
                    <td>:</td>
                    <td><?php while ($aRow = mysqli_fetch_array($query_suratmasuk_t)) {
                          echo $aRow['namaBidang'] . ',';
                        }  ?></td>
                  </tr>

              <?php
                }
              }
              ?>
              <tr>
                <td>Diteruskan Kepada</td>
                <td> : </td>
                <td>
                  <?php
                    $q = mysqli_query($config, "SELECT * FROM sip_tujuan WHERE nosurat = '$noSurat' LIMIT 1");
                    $tujuan = mysqli_fetch_array($q);
                    if($tujuan['tujuandivisi'] == 1) {
                      echo "Ketua STMIK Primakara";
                    } else {
                      echo "-";
                    }
                  ?>
                </td>
              </tr>
              <tr>
                <td>No. Surat</td>
                <td> : </td>
                <td><?php echo $noSurat; ?></td>
              </tr>
              <tr>
                <td>Tgl. Surat</td>
                <td> : </td>
                <td><?php echo $tglSurat; ?></td>
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
              <tr>
                <td>Sifat Disposisi</td>
                <td> : </td>
                <td><?php echo $sifatInstruksi; ?></td>
              </tr>
              <tr>
                <td>Tgl. Surat Diterima</td>
                <td> : </td>
                <td><?php echo $tglInput; ?></td>
              </tr>
              <?php

              if ($_REQUEST['kategoriSurat'] == 'sm') {
                echo "
                        <tr>
                          <td>Asal Surat</td>
                          <td> : </td>
                          <td>$asalSurat</td>
                        </tr>
                        <tr>
                          <td colspan='3'><embed src='../files/suratmasuk/$fileSurat' width='100%' height='450px' type='application/pdf'/></td>
                        </tr>
                      ";
              } else {
                echo "
                        <tr>
                          <td>Bidang/Bagian</td>
                          <td> : </td>
                          <td>$namaBidang</td>
                        </tr>
                        <tr>
                          <td colspan='3'><embed src='../files/suratkeluar/$fileSurat' width='100%' height='450px' type='application/pdf'/></td>
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

      <div class="col-md-6">
        <div class="box box-default">
          <div class="box-header">
            <i class="fa  fa-file-text-o"></i>
            <h3 class="box-title">Disposisi</h3>
            <div class="box-tools pull-right" data-toggle="tooltip" title="Status">
              <div class="btn-group" data-toggle="btn-toggle">
              </div>
            </div>
          </div>

          <div class="box-body chat" id="chat-box" style="height:750px; overflow-y: scroll;">
            <?php
            $query_userFilter = mysqli_query($config, "SELECT * FROM sip_user WHERE nip='$session_username'");
            $array_userFilter = mysqli_fetch_array($query_userFilter);

            $kodeBidangFilter = $array_userFilter['kodeBidang'];

            if ($kodeBidang == "1") {
              $query_disposisi = mysqli_query($config, "SELECT * FROM sip_disposisisurat WHERE noSurat='$noSurat'");
            } else {
              $query_disposisi = mysqli_query($config, "SELECT * FROM sip_disposisisurat WHERE noSurat='$noSurat'");
            }

            while ($array_disposisi = mysqli_fetch_array($query_disposisi)) {
              $kodeDisposisi = $array_disposisi['kodeDisposisi'];
              $noSuratDisposisi = $array_disposisi['noSurat'];
              $kodeBidangDisposisi = $array_disposisi['kodeBidang'];
              $kodeBidangDisposisi2 = $array_disposisi['kodeBidang_2'];
              $kodeBidangDisposisi3 = $array_disposisi['kodeBidang_3'];
              $pengirim = $array_disposisi['pengirim'];
              $tglInput = $array_disposisi['tglInput'];
              $userPengirim = $array_disposisi['userPengirim'];
              $status = $array_disposisi['status'];
              $tglStatus = $array_disposisi['tglStatus'];
              $fileDisposisi = $array_disposisi['fileDisposisi'];
              $tglInputFile = $array_disposisi['tglInputFile'];
              $userInputFile = $array_disposisi['userInputFile'];
              $sifatInstruksi = $array_disposisi['sifatInstruksi'];
              $isiInstruksi = $array_disposisi['isiInstruksi'];

              //menampilkan pengirim file
              $query_userPengirim = mysqli_query($config, "SELECT * FROM sip_user WHERE nip='$userPengirim'");
              $array_userPengirim = mysqli_fetch_array($query_userPengirim);

              $namaPengirim = $array_userPengirim['nama'];
              $kodeBidangPengirim = $array_userPengirim['kodeBidang'];
              $golonganPengirim = $array_userPengirim['golongan'];

              if ($golonganPengirim == "b") {
                $query_bidangPengnirim = mysqli_query($config, "SELECT namaBidang FROM sip_bidang WHERE kodeBidang='$kodeBidangPengirim'");
                $array_bidangPengirim = mysqli_fetch_array($query_bidangPengnirim);
                $namaBidangPengirim = $array_bidangPengirim['namaBidang'];
              } else {
                $query_siePengirim = mysqli_query($config, "SELECT namaSie FROM sip_sie WHERE kodeSie='$kodeBidangPengirim'");
                $array_siePengirim = mysqli_fetch_array($query_siePengirim);
                $namaBidangPengirim = $array_siePengirim['namaSie'];
              }
              //--------------------------------------

              //menampilkan pengupload file
              $query_userInputFile = mysqli_query($config, "SELECT * FROM sip_user WHERE nip='$userInputFile'");
              $array_userInputFile = mysqli_fetch_array($query_userInputFile);

              $namaInputFile = $array_userInputFile['nama'];
              $kodeBidangInputFile = $array_userInputFile['kodeBidang'];
              $golonganInputFile = $array_userInputFile['golongan'];

              $query_bidangInputFile = mysqli_query($config, "SELECT namaBidang FROM sip_bidang WHERE kodeBidang='$kodeBidangInputFile'");
              $array_bidangInputFile = mysqli_fetch_array($query_bidangInputFile);
              $namaBidangInputFile = $array_bidangInputFile['namaBidang'];
              //--------------------------------------

              //menampilkan bidang penerima disposisi
              $query_bidangPenerima = mysqli_query($config, "SELECT namaBidang FROM sip_bidang WHERE kodeBidang='$kodeBidangDisposisi'");
              $array_bidangPenerima = mysqli_fetch_array($query_bidangPenerima);
              $namaBidangPenerima = $array_bidangPenerima['namaBidang'];
              //--------------------------------------

              //menampilkan bidang penerima disposisi2
              $query_bidangPenerima2 = mysqli_query($config, "SELECT namaBidang FROM sip_bidang WHERE kodeBidang='$kodeBidangDisposisi2'");
              $array_bidangPenerima2 = mysqli_fetch_array($query_bidangPenerima2);
              $namaBidangPenerima2 = $array_bidangPenerima2['namaBidang'];
              //--------------------------------------          
              
              //menampilkan bidang penerima disposisi3
              $query_bidangPenerima3 = mysqli_query($config, "SELECT namaBidang FROM sip_bidang WHERE kodeBidang='$kodeBidangDisposisi3'");
              $array_bidangPenerima3 = mysqli_fetch_array($query_bidangPenerima3);
              $namaBidangPenerima3 = $array_bidangPenerima3['namaBidang'];
              //--------------------------------------    

              //menampilkan verifikasi user
              $query_userLogin = mysqli_query($config, "SELECT * FROM sip_user WHERE nip='$session_username'");
              $array_userLogin = mysqli_fetch_array($query_userLogin);
              $golonganUserLogin = $array_userLogin['golongan'];

              if ($golonganUserLogin == "b") {
                $kodeBidangLogin = $array_userLogin['kodeBidang'];
              } else {
                $kodeSie = $array_userLogin['kodeBidang'];
                $query_sieLogin = mysqli_query($config, "SELECT * FROM sip_sie WHERE kodeSie='$kodeSie'");
                $array_sieLogin = mysqli_fetch_array($query_sieLogin);
                $kodeBidangLogin = $array_sieLogin['kodeBidang'];
              }
              //--------------------------------------

            ?>
              <?php
              if ($kodeBidangLogin != '1') {
              ?>

              <div class="box-body" style="background-color: #dfdfdf">
                <div class="item" style="background-color: #dfdfdf" ><br>
                  <img src="../files/logo/user.png" alt="user image">
                  <p class="message">
                    <b class="name" style="color: blue;">
                      <small class="text-muted pull-right"><i class="fa fa-calendar"></i> <?php echo $tglInput; ?></small>
                      <?php echo $namaPengirim; ?>
                    </b>
                    Disposisi surat nomor: <b><?php echo $noSurat; ?></b> telah dikirim ke <b><br> 1.<?php echo $namaBidangPenerima; ?><br> 2.<?php echo $namaBidangPenerima2; ?><br> 3.<?php echo $namaBidangPenerima3; ?> </b><hr>
                  </p>
 
                    <div class="box-header">
                     <b>Dengan Instruksi : </b>
                     <h4> <?php echo $isiInstruksi; ?></h4>
                    </div>
                 
              </div>


                  <?php
                  if (!empty($fileDisposisi)) {
                  ?>

                    <div class="attachment">
                      <h4>File Disposisi:</h4>
                      <p>Diupload oleh: <?php echo $namaInputFile; ?></p>
                      <p>Bidang/Bagian: <?php echo $namaBidangInputFile; ?></p>
                      <p>Tgl. Upload: <?php echo $tglInputFile; ?></p>
                      <hr />

                      <p class="filename">
                        <?php echo $fileDisposisi; ?>
                      </p>

                      <div class="pull-right">
                        <button type="button" class="btn btn-primary btn-sm btn-flat" onclick="window.open('../files/disposisi/<?php echo $fileDisposisi; ?>')">Buka</button>
                      </div>
                    </div>

                    <!-- /.attachment -->

                  <?php }
                  ?>
                </div><?php } else { ?>

                <div class="item" style="background-color: #d3d3d3" >
                  <img src="../files/logo/user.png" alt="user image">
                  <p class="message" >
                    <b class="name" style="color: blue;">
                      <small class="text-muted pull-right"><i class="fa fa-calendar"></i> <?php echo $tglInput; ?> <a href="disposisi_hapus.php?kodeDisposisi=<?php echo $kodeDisposisi; ?>&&idSurat=<?php echo $idSurat; ?>&&kategoriSurat=<?php echo $kategoriSurat; ?>"><i class="fa fa-trash" style="margin-left: 10px;"></i></a></small>
                      <?php echo $namaPengirim; ?>
                    </b>
                    Disposisi surat nomor: <b><?php echo $noSurat; ?></b> telah dikirim ke <b><br>1.<?php echo $namaBidangPenerima; ?><br> 2.<?php echo $namaBidangPenerima2; ?><br> 3.<?php echo $namaBidangPenerima3; ?></b>
                  </p>

                  <?php if (!empty($fileDisposisi)) { ?>
                    <div class="attachment">
                      <h4>File Disposisi:</h4>

                      <p>Diupload oleh: <?php echo $namaInputFile; ?></p>
                      <p>Bidang/Bagian: <?php echo $namaBidangInputFile; ?></p>
                      <p>Tgl. Upload: <?php echo $tglInputFile; ?></p>
                      <hr />
                      <p class="filename">
                        <?php echo $fileDisposisi; ?>
                      </p>

                      <div class="pull-right">
                        <button type="button" class="btn btn-primary btn-sm btn-flat" onclick="window.open('../files/disposisi/<?php echo $fileDisposisi; ?>')">Open</button>
                      </div>
                    </div>
                  <?php } ?>
                  <small class="text-muted pull-right">

                    <?php
                      if ($status == '1') {
                        echo "<i style='color:blue'><b>Sudah dibaca</b></i>";
                      } else {
                        echo "<i><b>Belum dibaca</b></i>";
                      }
                    ?>
                  </small><br>

                  <!-- /.attachment -->

                  <P><br /></P>
                </div>
            <?php }
                  } ?>
          </div>

          <!-- /.chat -->


<!-- Awal Menambahkan File disposisi-->
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

            if ($kodeBidangLogin == '1') {

            ?>
              <form role="form" action="disposisi_save.php" method="POST" enctype="multipart/form-data">
                <div class="input-group my-colorpicker2">
                  <!--<input type="text" class="form-control" id="namaBidang" name="namaBidang" readonly>-->
                  <input type="hidden" id="kodeSimpan" name="kodeSimpan" value="text">
                  <input type="hidden" id="idSurat" name="idSurat" value="<?php echo $idSurat; ?>">
                  <input type="hidden" id="noSurat" name="noSurat" value="<?php echo $noSurat; ?>">
                  <input type="hidden" id="kodeBidang" name="kodeBidang">
                  <input type="hidden" id="userPengirim" name="userPengirim" value="<?php echo $session_username; ?>">
                  <input type="hidden" id="kategoriSurat" name="kategoriSurat" value="<?php echo $kategoriSurat; ?>">

                  <!--<div class="input-group-addon">
                       <div data-toggle = "modal" data-target="#myModal"><i class="fa fa-search" > Cari</i></div> 
                    </div>
                    <div class="input-group-btn">
                      <button type="submit" class="btn btn-success"><i class="fa fa-save"></i></button> 
                    </div>-->
                </div>
              </form>

            <?php
            }

            if ($kodeBidangLogin != '1' && $array_cek > 0) {
            ?>
              <!--<form role="form" action="disposisi_save.php" method="POST" enctype="multipart/form-data">
                <div class="input-group my-colorpicker2">
                  <input type="file" class="form-control" id="fileDisposisi" name="fileDisposisi" readonly>
                  <input type="hidden" id="idSurat" name="idSurat" value="<?php echo $idSurat; ?>">
                  <input type="hidden" id="noSurat" name="noSurat" value="<?php echo $noSurat; ?>">
                  <input type="hidden" id="userInputFile" name="userInputFile" value="<?php echo $session_username; ?>">
                  <input type="hidden" id="kategoriSurat" name="kategoriSurat" value="<?php echo $kategoriSurat; ?>">
                  <input type="hidden" id="kodeSimpan" name="kodeSimpan" value="file">
                  <input type="hidden" id="kodeBidang2" name="kodeBidang2" value="<?= $kodeBidangLogin ?>">

                  <div class="input-group-btn">
                    <button type="submit" class="btn btn-success"><i class="fa fa-upload"></i></button>
                  </div>
                </div>
              </form>-->

            <?php
            }
            ?>

          </div>
        </div>
      </div>
<!-- Akhir Menambahkan File disposisi-->

<!--Instruksi-->
      <!--<div class="col-md-6">
        <div class="box box-default">
          <div class="box-header">
            <i class="fa fa-comments-o"></i>
            <h3 class="box-title">Instruksi</h3>
            <div class="box-tools pull-right" data-toggle="tooltip" title="Status">
              <div class="btn-group" data-toggle="btn-toggle"></div>
            </div>
          </div>

          <div class="box-body chat" id="chat-box" style="height:220px; overflow-y: scroll;">
            <table id="example1" class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>Pengirim</th>
                  <th>Jenis</th>
                  <th>Instruksi</th>
                </tr>
              </thead>

              <tbody>
                <?php
                $query_instruksi = mysqli_query($config, "SELECT * FROM sip_instruksi WHERE noSurat='$noSurat'");
                while ($array_instruksi = mysqli_fetch_array($query_instruksi)) {
                  $isiInstruksi = $array_instruksi['isiInstruksi'];
                  $sifatInstruksi = $array_instruksi['sifatInstruksi'];
                  $userInput = $array_instruksi['userInput'];
                  $tglInput = $array_instruksi['tglInput'];

                  $query_user = mysqli_query($config, "SELECT * FROM sip_user WHERE nip='$userInput'");
                  $array_user = mysqli_fetch_array($query_user);

                  $nama = $array_user['nama'];
                  $kodeBidang = $array_user['kodeBidang'];
                  $golongan = $array_user['golongan'];

                  if ($golongan == "b") {
                    $query_bidang = mysqli_query($config, "SELECT namaBidang FROM sip_bidang WHERE kodeBidang='$kodeBidang'");
                    $array_bidang = mysqli_fetch_array($query_bidang);

                    $namaUnit = $array_bidang['namaBidang'];
                  } else {
                    $query_sie = mysqli_query($config, "SELECT namaSie FROM sip_sie WHERE kodeSie='$kodeBidang'");
                    $array_sie = mysqli_fetch_array($query_sie);

                    $namaUnit = $array_sie['namaSie'];

                  }

                      echo "
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
                                  <th>$sifatInstruksi</th>
                                  <th>$isiInstruksi </th>
                                </p>
                              </div>
                            </td>";

                //  if ($session_username == $userInput) {
                  //  echo "<td align='center'><a href=''><i class='fa fa-trash'></a></td>";
                  //} else {
                    //echo "<td align='center'>none</a></td>";
                  //}
                    //echo "</tr>";
                }

                ?>
              </tbody>

              <tfoot>
                <tr>
                  <th>Pengirim</th>
                  <th>Jenis</th>
                  <th>Instruksi</th>
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
Instruksi-->
    

<!-- Tindak Lanjut -->
      <div class="col-md-12">
        <div class="box box-default">
          <div class="box-header">
            <!--<i class="fa fa-comments-o"></i>-->
            <h3 class="box-title">Tindak lanjut</h3>
            <div class="box-tools pull-right" data-toggle="tooltip" title="Status">
              <div class="btn-group" data-toggle="btn-toggle"></div>
            </div>
          </div>
          <div class="box-footer">
              <form role="form" action="tindaklanjut_save.php" method="POST" enctype="multipart/form-data">
                <div class="input-group">
                  
                  <div class="box-body" style="width:500px;">
                    <div class="form-group">
                      <label>Rencana Tindak Lanjut</label>
                      <textarea class="form-control" id="isiTindaklanjut" name="isiTindaklanjut" required></textarea>
                    </div>
                    <div class="form-group">
                      <label>Target Penyelesaian</label>
                      <textarea class="form-control" id="isiTarget" name="isiTarget" required></textarea>
                    </div>
                    <div class="form-group">
                      <label>Tanggal Penyelesaian Tindakan</label>
                      <input type="Date" class="form-control" id="tglSelesai" name="tglSelesai" />
                    </div>
                   <!-- <div class="form-group">
                      <label>Hasil Tindak Lanjut</label>
                      <textarea class="form-control" id="keterangan" name="keterangan" ></textarea>
                    </div>-->
              
                  <input type="hidden" id="noSurat" name="noSurat" value="<?php echo $noSurat; ?>">
                  <input type="hidden" id="userInput" name="userInput" value="<?php echo $session_username; ?>">
                  <input type="hidden" id="idSurat" name="idSurat" value="<?php echo $idSurat; ?>">
                  <input type="hidden" id="kategoriSurat" name="kategoriSurat" value="<?php echo $kategoriSurat; ?>"><br>

                </div>
                <div class="box-body" >
                    <button type="submit" class="btn btn-success"><i class="fa fa-send"> KIRIM</i></button>
                  </div>
              </form>
            </div> 
          </div>

          <div class="box-body chat" id="chat-box" style="height:250px; overflow-y: scroll;">
            <table id="example1" class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>Pengirim</th>
                  <th>Rencana Tindak Lanjut</th>
                  <th>Target Penyelesaian</th>
                  <th>Tanggal Penyelesaian</th>
                  <!--<th>Keterangan</th>-->
                  <th>Opsi</th>
                </tr>
              </thead>

              <tbody>
                <?php
                $query_tindaklanjut = mysqli_query($config, "SELECT * FROM sip_tindaklanjut WHERE noSurat='$noSurat'");
                while ($array_tindaklanjut = mysqli_fetch_array($query_tindaklanjut)) {
                  $isiTindaklanjut = $array_tindaklanjut['isiTindaklanjut'];
                  $kodeTindaklanjut = $array_tindaklanjut['kodeTindaklanjut'];
                  $isiTarget = $array_tindaklanjut['isiTarget'];
                  $tglSelesai = $array_tindaklanjut['tglSelesai'];
                  $userInput = $array_tindaklanjut['userInput'];
                  $tglInput = $array_tindaklanjut['tglInput'];

                  $query_user = mysqli_query($config, "SELECT * FROM sip_user WHERE nip='$userInput'");
                  $array_user = mysqli_fetch_array($query_user);

                  $nama = $array_user['nama'];
                  $kodeBidang = $array_user['kodeBidang'];
                  $golongan = $array_user['golongan'];

                  if ($golongan == "b") {
                    $query_bidang = mysqli_query($config, "SELECT namaBidang FROM sip_bidang WHERE kodeBidang='$kodeBidang'");
                    $array_bidang = mysqli_fetch_array($query_bidang);

                    $namaUnit = $array_bidang['namaBidang'];
                  } else {
                    $query_sie = mysqli_query($config, "SELECT namaSie FROM sip_sie WHERE kodeSie='$kodeBidang'");
                    $array_sie = mysqli_fetch_array($query_sie);

                    $namaUnit = $array_sie['namaSie'];

                  }
                  
                  ?>

                  
                    <tr>
                      <td>
                        <div class='item'>
                          <img src='../files/logo/user.png' alt='user image'>
                          <p class='message'>
                            <b class='name' style='color: blue;'>
                              <small class='text-muted pull-right'><i class='fa fa-calendar'></i> <?php echo $tglInput?></small>
                              <?php echo $nama ?><br></b>
                              <small><?php echo $namaUnit ?></small>
                              </p>  
                          </div>
                            <th> <?php echo $isiTindaklanjut ?></th>
                            <th> <?php echo $isiTarget ?></th>
                            <th> <?php echo $tglSelesai ?></th>
                            <th> <a href="tindaklanjut_hapus.php?kodeTindaklanjut=<?php echo $kodeTindaklanjut; ?>&&idSurat=<?php echo $idSurat; ?>&&kategoriSurat=<?php echo $kategoriSurat; ?>"><i class="fa fa-trash" style="margin-left: 10px;"></i></a></small></th>
                      </td>
                      
                      

                <?php
                }
                ?>
              </tbody>

              <tfoot>
                <tr>
                  <th>Pengirim</th>
                  <th>Rencana Tindak Lanjut</th>
                  <th>Target Penyelesaian</th>
                  <th>Tanggal Penyelesaian</th>
                  <!--<th>Keterangan</th>-->
                  <th>Opsi</th>
                </tr>
              </tfoot>
            </table>
<!-- End Tindak Lanjut -->
        </div>
    </div>
  </div>


<!-- Awal Report -->
   <div class="col-md-12">
        <div class="box box-default">
          <div class="box-header">
            <!--<i class="fa fa-comments-o"></i>-->
            <h3 class="box-title">Report Hasil Tindak Lanjut</h3>
            <div class="box-tools pull-right" data-toggle="tooltip" title="Status">
              <div class="btn-group" data-toggle="btn-toggle"></div>
            </div>
          </div>
          <div class="box-footer" >
              <form role="form" action="report_save.php" method="POST" enctype="multipart/form-data">
                <div class="input-group">
                  
                  <div class="box-body" style="width:500px;">
                    <div class="form-group">
                      <label>Hasil Tindak Lanjut</label>
                      <textarea class="form-control" id="keterangan" name="keterangan" ></textarea>
                    </div>
              
                  <input type="hidden" id="noSurat" name="noSurat" value="<?php echo $noSurat; ?>">
                  <input type="hidden" id="userInput" name="userInput" value="<?php echo $session_username; ?>">
                  <input type="hidden" id="idSurat" name="idSurat" value="<?php echo $idSurat; ?>">
                  <input type="hidden" id="kategoriSurat" name="kategoriSurat" value="<?php echo $kategoriSurat; ?>"><br>

                </div>
                <div class="box-body" >
                    <button type="submit" class="btn btn-success"><i class="fa fa-save"> Report</i></button>
                  </div>
              </form>
            </div> 
          </div>

          <div class="box-body chat" id="chat-box" style="height:250px; overflow-y: scroll;">
            <table id="example1" class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>Pengirim</th>
                  <th>Hasil Tindak Lanjut</th>
                  <th>Opsi</th>
                </tr>
              </thead>

              <tbody>
                <?php
                $query_report = mysqli_query($config, "SELECT * FROM sip_report WHERE noSurat='$noSurat'");
                while ($array_report = mysqli_fetch_array($query_report)) {
                  $userInput = $array_report['userInput'];
                  $tglInput = $array_report['tglInput'];
                  $keterangan = $array_report['keterangan'];
                  $kodeReport = $array_report['kodeReport'];

                  $query_user = mysqli_query($config, "SELECT * FROM sip_user WHERE nip='$userInput'");
                  $array_user = mysqli_fetch_array($query_user);

                  $nama = $array_user['nama'];
                  $kodeBidang = $array_user['kodeBidang'];
                  $golongan = $array_user['golongan'];

                  if ($golongan == "b") {
                    $query_bidang = mysqli_query($config, "SELECT namaBidang FROM sip_bidang WHERE kodeBidang='$kodeBidang'");
                    $array_bidang = mysqli_fetch_array($query_bidang);

                    $namaUnit = $array_bidang['namaBidang'];
                  } else {
                    $query_sie = mysqli_query($config, "SELECT namaSie FROM sip_sie WHERE kodeSie='$kodeBidang'");
                    $array_sie = mysqli_fetch_array($query_sie);

                    $namaUnit = $array_sie['namaSie'];

                  }
                  
                ?>

                    <tr>
                      <td>
                        <div class='item'>
                          <img src='../files/logo/user.png' alt='user image'>
                          <p class='message'>
                            <b class='name' style='color: blue;'>
                              <small class='text-muted pull-right'><i class='fa fa-calendar'></i> <?php echo $tglInput?></small>
                              <?php echo $nama ?><br></b>
                              <small><?php echo $namaUnit ?></small>
                              </p>  
                          </div>
                            <th> <?php echo $keterangan ?></th>
                            <th> <a href="report_hapus.php?kodeReport=<?php echo $kodeReport; ?>&&idSurat=<?php echo $idSurat; ?>&&kategoriSurat=<?php echo $kategoriSurat; ?>"><i class="fa fa-trash" style="margin-left: 10px;"></i></a></small></th>
                      </td>

                <?php
                }
                ?>
          
              </tbody>

              <tfoot>
                <tr>
                  <th>Pengirim</th>
                  <th>Hasil Tindak Lanjut</th>
                  <th>Opsi</th>
                </tr>
              </tfoot>
            </table>
<!-- End Report -->

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
            $tampil = mysqli_query($config, "SELECT * FROM sip_bidang WHERE kodeBidang!='1'");
            while ($tampung = mysqli_fetch_array($tampil)) {
              $kodeBidang = $tampung['kodeBidang'];
              $namaBidang = $tampung['namaBidang'];

              $tampil2 = mysqli_query($config, "SELECT * FROM sip_disposisisurat WHERE noSurat='$noSurat' AND kodeBidang='$kodeBidang'");
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
              <th>Kode Bidang</th>
              <th>Nama Bidang</th>
            </tr>
          </tfoot
          >
        </table>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
  <div class="modal-dialog" style="width:800px">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Teruskan</h4>
      </div>
      <div class="modal-body">
        <form action="disposisi_teruskan_save.php" method="post">
          <input type="hidden" value="<?= $noSurat ?>" name="noSuratT">
          <div class="form-group">
            <label><input type="checkbox" class="minimal-red" value="1" name="terusan[]"> Kepala Badan</label>
            <label><input type="checkbox" class="minimal-red" value="3" name="terusan[]"> Sekertaris</label>
          </div>
          <div class="box-footer" style="text-align: right;">
            <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Simpan</button> <button type="button" class="btn btn-danger" onclick="location.href='suratmasuk_list.php'"><i class="fa fa-close"></i> Batal</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>


<!-- Awal Modal untuk Teruskan Atasan-->
 <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" style="width:800px">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title" id="myModalLabel">Daftar Data User</h4>
        </div>
        <div class="modal-body">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#tab_3" data-toggle="tab3">User</a></li>
              <!--<li><a href="#tab_2" data-toggle="tab">Sie</a></li>-->
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="tab_3">
                <table id="tab3" class="table table-bordered table-striped">
                  <thead>
                    <tr>
                      <th>NIK</th>
                      <th>Nama User</th>
                    </tr>
                  </thead>
                  <tbody>

                    <?php 
                      $tampiluser=mysqli_query($config, "SELECT * FROM sip_user");
                      while($tampunguser=mysqli_fetch_array($tampiluser))
                      {
                        $nip = $tampunguser['nip'];
                        $nama = $tampunguser['nama'];

                        echo"<tr class='pilihuser' data-nip='$nip' data-nama='$nama' data-golongan='b'>
                          <td>$nip</td>
                          <td>$nama</td>
                          </tr>";
                      }
                    ?> 
                  </tbody>
                  <tfoot>
                    <tr>
                      <th>NIK</th>
                      <th>Nama User</th>
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
<!--Akhir Modal untuk Teruskan Atasan-->

<?php include "../template/footer.php"; ?>



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

<script>
  $(function() {
    //Initialize Select2 Elements
    $(".select2").select2();
  });
</script>

<!-- Awal Script Modal Atasan-->
<script>
$(document).ready(function() {
    var table = $('#tab3').DataTable( {
        responsive: true
    } );
} );
</script>
<script type="text/javascript">
  $(document).on('click', '.pilihuser', function (e) {
      document.getElementById("nama").value = $(this).attr('data-nama');
        $('#myModal3').modal('hide');
        });
</script>
<!-- Akhir Script Modal Atasan -->

</body>
</html>