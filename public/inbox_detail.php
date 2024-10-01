<?php include "../config/koneksi_database.php"; ?>
<?php include "../template/header.php"; ?>
<?php
  $kategoriSurat = $_REQUEST['kategoriSurat'];
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

  $query_suratmasuk_t = mysqli_query($config, "SELECT b.namaBidang FROM sip_tujuan a 	inner join sip_bidang b on a.tujuandivisi=b.kodeBidang
	WHERE noSurat='$noSurat' and pengirimdivisi = '$kodeBidangLogin' ");

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
      INBOX DETAIL
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
              if ($kodeBidangLogin == '3') {
              ?>
                <tr>
                  <td>
                    <div data-toggle="modal" data-target="#myModal2"><i class="btn btn-primary"> Teruskan</i></div>
                  </td>
                  <td>:</td>
                  <td>
                    <?php while ($aRow = mysqli_fetch_array($query_suratmasuk_t)) {
                        echo $aRow['namaBidang'] . ',';
                      }  
                    ?>
                  </td>
                </tr>

              <?php
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
                          <td colspan='3'><embed src='../files/suratmasuk/$fileSurat' width='100%' height='550px' type='application/pdf'/></td>
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
                          <td colspan='3'><embed src='../files/suratkeluar/$fileSurat' width='100%' height=450px' type='application/pdf'/></td>
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

            <h3 class="box-title">Disposisi / Abaikan</h3>

            <div class="box-tools pull-right" data-toggle="tooltip" title="Status">
              <div class="btn-group" data-toggle="btn-toggle">
              </div>
            </div>
          </div>
          <div class="box-body chat" id="chat-box" style="height:450px; overflow-y: scroll;">
            <?php
            $query_userFilter = mysqli_query($config, "SELECT * FROM sip_user WHERE nip='$session_username'");
            $array_userFilter = mysqli_fetch_array($query_userFilter);

            $kodeBidangFilter = $array_userFilter['kodeBidang'];

            if ($kodeBidang == "1") {
              $query_disposisi = mysqli_query($config, "SELECT * FROM sip_disposisisurat WHERE noSurat='$noSurat' and pengirim = '$kodeBidangFilter'");
            } else {
              $query_disposisi = mysqli_query($config, "SELECT * FROM sip_disposisisurat WHERE noSurat='$noSurat' and pengirim = '$kodeBidangFilter'");
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
              $isiInstruksi = $array_disposisi['isiInstruksi'];
              $abaikanSurat = $array_disposisi['abaikanSurat'];

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


<!-- Awal Penerima Disposisi-->
              <?php
              if ($kodeBidangLogin != '1' && $kodeBidangLogin != '3') {
              ?>
              
                <div class="item" style="background-color: #d3d3d3"><br>
                  <img src="../files/logo/user.png" alt="user image">
                  <p class="message">
                    <b class="name" style="color: blue;">
                      <small class="text-muted pull-right"><i class="fa fa-calendar"></i> <?php echo $tglInput; ?></small>
                      <?php echo $namaPengirim; ?>
                    </b>
                  </p>
                    
                    <p>Disposisi surat nomor: <b><?php echo $noSurat; ?></b> telah dikirim ke <b><br>1. <?php echo $namaBidangPenerima;  ?><br> 2.<?php echo $namaBidangPenerima2;  ?> 3.<?php echo $namaBidangPenerima3;  ?></p>
                    <p>Dengan Sifat Instruksi : <b><?php echo $sifatInstruksi; ?></b></p>
                    <p class="message">Dengan Instruksi : <b><?php echo $isiInstruksi; ?></b></p>
                   
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
                  <?php if($abaikanSurat == '1'){
                    ?><h4>Surat Telah Diabaikan</h4>
                    <?php
                  }else{
                    
                  ?>
              <div class="box-body" style="background-color: #dfdfdf">
                <div class="item" style="background-color: #dfdfdf" ><br>
                  <img src="../files/logo/user.png" alt="user image">
                  <p class="message">
                    <b class="name" style="color: blue;">
                      <small class="text-muted pull-right"><i class="fa fa-calendar"></i> <?php echo $tglInput; ?> 
                      <a href="disposisi_hapus.php?kodeDisposisi=<?php echo $kodeDisposisi; ?>&&idSurat=<?php echo $idSurat; ?>&&kategoriSurat=<?php echo $kategoriSurat; ?>"><i class="fa fa-trash" style="margin-left: 10px;"></i></a></small>
                      <?php echo $namaPengirim; ?>
                    </b>
                    Disposisi surat nomor: <b><?php echo $noSurat; ?></b> telah dikirim ke <br><b>1.<?php echo $namaBidangPenerima; ?><br> 2. <?php echo $namaBidangPenerima2; ?> <br>3. <?php echo $namaBidangPenerima3; ?></b><hr>
                  </p>
                  
                  <div>
                      <b>Dengan Instruksi : <b>
                      <h4><?php echo $isiInstruksi; ?></h4>
                  </div>
                </div>

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
                  </small>

                  <!-- /.attachment -->
                  <P><br /></P>
                </div><br>
            <?php }
                } 
            ?>
            <?php }?>
          </div>
<!-- AKhir Penerima Disposisi-->

<!-- Penambahan Disposisi-->
          <!-- /.chat -->
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

              if ($kodeBidangLogin == '1' or $kodeBidangLogin == '3') {
            ?>

              <form role="form" action="disposisi_save2.php" method="POST" enctype="multipart/form-data">
      
                <label class="box-body chat"  >Tambah Penerima Disposisi</label>
                <div class="input-group my-colorpicker2">
                    <input type="text" class="form-control" id="namaBidang" name="namaBidang" readonly>
                    <input type="hidden" id="kodeSimpan" name="kodeSimpan" value="text">
                    <input type="hidden" id="idSurat" name="idSurat" value="<?php echo $idSurat; ?>">
                    <input type="hidden" id="noSurat" name="noSurat" value="<?php echo $noSurat; ?>">
                    <input type="hidden" id="kodeBidang" name="kodeBidang">
                    <input type="hidden" id="kodeBidang_2" name="kodeBidang_2">
                    <input type="hidden" id="kodeBidang_3" name="kodeBidang_3">
                    <input type="hidden" id="kodeBidangPe" name="kodeBidangPe" value="<?php echo $kodeBidangFilter; ?>">
                    <input type="hidden" id="userPengirim" name="userPengirim" value="<?php echo $session_username; ?>">
                    <input type="hidden" id="kategoriSurat" name="kategoriSurat" value="<?php echo $kategoriSurat; ?>">
                    
                    <div class="input-group-addon">
                      <div data-toggle="modal" data-target="#myModal"><i class="fa fa-plus"> Pilih Divisi / Bagian</i></div>
                    </div>
                  </div><br>
                  
                  <div class="input-group my-colorpicker2">
                    <input type="text" class="form-control" id="namaBidang_2" name="namaBidang_2" readonly>
                    <div class="input-group-addon">
                      <div data-toggle="modal" data-target="#myModal-2"><i class="fa fa-plus"> Pilih Divisi / Bagian</i></div>
                    </div>
                  </div><br>

                  <div class="input-group my-colorpicker2">
                    <input type="text" class="form-control" id="namaBidang_3" name="namaBidang_3" readonly>
                    <div class="input-group-addon">
                      <div data-toggle="modal" data-target="#myModal-3"><i class="fa fa-plus"> Pilih Divisi / Bagian</i></div>
                    </div>
                  </div><br>
              
                  <!--<div class="box-body chat" id="sifatInstruksi">
                    <label>Pilih Sifat Instruksi</label><br>
                    <label><input type="checkbox" class="minimal-red" value="Rahasia" name="sifatInstruksi"> Rahasia</label>
                    <label><input type="checkbox" class="minimal-red" value="Penting" name="sifatInstruksi"> Penting</label>
                    <label><input type="checkbox" class="minimal-red" value="Rutin" name="sifatInstruksi"> Rutin</label>
                  </div>-->
                  <div class="box-body">
                    <div class="form-group">
                      <label for="exampleFormControlTextarea1">Tambahkan Instruksi</label>
                      <textarea class="form-control" id="isiInstruksi" name="isiInstruksi" rows="3"></textarea>
                    </div>
                    <div class="box-body">
                      <input type="checkbox" class="minimal-red" id="abaikanSurat" name="abaikanSurat" value="1"> Abaikan Surat
                    </div>
                    <div class="box-body">
                      <button type="submit" class="btn btn-success"><i class="fa fa-save"> Save</i></button>
                    </div>
                  </div>
              </form>
            <?php
            }

            if (($kodeBidangLogin != '1' && $kodeBidangLogin != '3')  && $array_cek > 0) {
            ?>

              <form role="form" action="disposisi_save2.php" method="POST" enctype="multipart/form-data">
                <div class="input-group my-colorpicker2">
                  <input type="file" class="form-control" id="fileDisposisi" name="fileDisposisi" readonly>
                  <input type="hidden" id="idSurat" name="idSurat" value="<?php echo $idSurat; ?>">
                  <input type="hidden" id="noSurat" name="noSurat" value="<?php echo $noSurat; ?>">
                  <input type="hidden" id="userInputFile" name="userInputFile" value="<?php echo $session_username; ?>">
                  <input type="hidden" id="kategoriSurat" name="kategoriSurat" value="<?php echo $kategoriSurat; ?>">
                  <input type="hidden" id="kodeSimpan" name="kodeSimpan" value="file">
                  <input type="hidden" id="kodeBidang2" name="kodeBidang2" value="<?= $kodeBidangLogin ?>">
                  <div class="input-group-btn" style ="margin-left: 10px">
                    <button type="submit" class="btn btn-success"><i class="fa fa-upload"></i></button>
                  </div>
                </div>
              </form>

            <?php
            }
            ?>

          </div>
        </div>
      </div>

<!-- AKhir Penambahan Disposisi-->
      
<!-- Awal Tindak Lanjut -->
   <div class="col-md-12">
        <div class="box box-default">
          <div class="box-header">
            <!--<i class="fa fa-comments-o"></i>-->
            <h3 class="box-title">Rencana Tindak Lanjut</h3>
            <div class="box-tools pull-right" data-toggle="tooltip" title="Status">
              <div class="btn-group" data-toggle="btn-toggle"></div>
            </div>
          </div>

          <div class="box-body chat" id="chat-box" style="height:300px; overflow-y: scroll;">
            <table id="example1" class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>Pengirim</th>
                  <th>Rencana Tindak Lanjut</th>
                  <th>Target Penyelesaian</th>
                  <th>Tanggal Penyelesaian</th>
                </tr>
              </thead>

              <tbody>
                <?php
                $query_tindaklanjut = mysqli_query($config, "SELECT * FROM sip_tindaklanjut WHERE noSurat='$noSurat'");
                while ($array_tindaklanjut = mysqli_fetch_array($query_tindaklanjut)) {
                  $isiTindaklanjut = $array_tindaklanjut['isiTindaklanjut'];
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
                  

                  echo "
                    <tr>
                      <td>
                        <div class='item'>
                          <img src='../files/logo/user.png' alt='user image'>
                          <p class='message'>
                            <b class='name' style='color: blue;'>
                              <small class='text-muted pull-right'><i class='fa fa-calendar'></i> $tglInput</small>
                              $nama <br></b>
                              <small>$namaUnit</small>
                              </p>  
                          </div>
                            <th> $isiTindaklanjut</th>
                            <th> $isiTarget</th>
                            <th> $tglSelesai</th>
                      </td>";

                  if ($session_username == $userInput) {
                    echo "<td align='center'><a href=''><i class='fa fa-trash'></a></td>";
                  } else {
                    //echo "<td align='center'>none</a></td>";
                  }
                    echo "</tr>";
                }

                ?>
              </tbody>

              <tfoot>

              </tfoot>
            </table>
            </div>
            </div>    </div>
<!-- Akhir Tindak Lanjut -->


<!-- /.row -->
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

          <div class="box-body chat" id="chat-box" style="height:250px; overflow-y: scroll;">
            <table id="example1" class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>Pengirim</th>
                  <th>Hasil Tindak Lanjut</th>
                </tr>
              </thead>

              <tbody>
                <?php
                $query_report = mysqli_query($config, "SELECT * FROM sip_report WHERE noSurat='$noSurat'");
                while ($array_report = mysqli_fetch_array($query_report)) {
                  $userInput = $array_report['userInput'];
                  $tglInput = $array_report['tglInput'];
                  $keterangan = $array_report['keterangan'];

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
                              $nama <br></b>
                              <small>$namaUnit</small>
                              </p>  
                          </div>
                            <th> $keterangan</th>
                      </td>";

                  if ($session_username == $userInput) {
                    echo "<td align='center'><a href=''><i class='fa fa-trash'></a></td>";
                  } else {
                    //echo "<td align='center'>none</a></td>";
                  }
                    echo "</tr>";
                }

                ?>
              </tbody>

              <tfoot>

              </tfoot>
            </table>
<!-- End Report -->


  </section>

  <!-- /.content -->

  </div>
  </div>

<!-- /.content-wrapper -->

<!--modal10-->
  <div class="modal fade" id="myModal0" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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

              $tampil2 = mysqli_query($config, "SELECT * FROM sip_disposisisurat WHERE noSurat='$noSurat' AND kodeBidang='$kodeBidang'
						  and pengirim = '$kodeBidangFilter'");
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
          </tfoot>

        </table>

      </div>
    </div>
  </div>
 </div>
<!--modal10-->

<!-- Awal Modal 2 -->
  <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
  <div class="modal-dialog" style="width:800px">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Teruskan</h4>
      </div>

      <div class="modal-body">
        <form action="teruskan_save2.php" method="post">
          <input type="hidden" value="<?= $noSurat ?>" name="noSuratT">
          <div class="form-group">
            <label><input type="checkbox" class="minimal-red" value="1" name="terusan"> Kepala Badan</label>
          </div>

          <div class="box-footer" style="text-align: right;">
            <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Simpan</button> <button type="button" class="btn btn-danger" onclick="location.href='inbox_list.php'"><i class="fa fa-close"></i> Batal</button>
          </div>

        </form>
      </div>
    </div>
  </div>
 </div>
<!-- Akhir Modal 2 -->

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

<!-- Awal Modal untuk menampilkan dan menambahkan diposisi 1-->
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
                      $tampil=mysqli_query($config, "SELECT * FROM sip_bidang order by kodesurat ASC");
                      while($tampung=mysqli_fetch_array($tampil))
                      {
                        $kodesurat = $tampung['kodesurat'];
                        $kodeBidang = $tampung['kodeBidang'];
                        $namaBidang = $tampung['namaBidang'];
                        

                        echo"<tr class='pilih' data-kodesurat='$kodesurat' data-kodeBidang='$kodeBidang' data-namaBidang='$namaBidang' data-golongan='b'>
                          <td>$kodesurat</td>  
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
<!--Akhir Modal untuk menampilkan dan menambahkan diposisi 1-->

<!-- Awal Modal untuk menampilkan dan menambahkan diposisi 2-->
 <div class="modal fade" id="myModal-2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" style="width:800px">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title" id="myModalLabel">Daftar Data Divisi / Bagian</h4>
        </div>
        <div class="modal-body">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#tab_2" data-toggle="tab">Divisi / Bagian</a></li>
              <!--<li><a href="#tab_2" data-toggle="tab">Sie</a></li>-->
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="tab_2">
                <table id="table-modal-2" class="table table-bordered table-striped">
                  <thead>
                    <tr>
                      <th>Kode Divisi / Bagian</th>
                      <th>Nama Divisi / Bagian</th>
                    </tr>
                  </thead>
                  <tbody>

                    <?php 
                      $tampil=mysqli_query($config, "SELECT * FROM sip_bidang ORDER BY kodesurat ASC");
                      while($tampung=mysqli_fetch_array($tampil))
                      {
                        $kodesurat = $tampung['kodesurat'];
                        $kodeBidang = $tampung['kodeBidang'];
                        $namaBidang = $tampung['namaBidang'];

                        echo"<tr class='pilih2' data-kodesurat='$kodesurat' data-kodeBidang='$kodeBidang' data-namaBidang='$namaBidang' data-golongan='b'>
                          <td>$kodesurat</td>
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
<!--Akhir Modal untuk menampilkan dan menambahkan diposisi 2-->

<!-- Awal Modal untuk menampilkan dan menambahkan diposisi 3-->
 <div class="modal fade" id="myModal-3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                <table id="table-modal-3" class="table table-bordered table-striped">
                  <thead>
                    <tr>
                      <th>Kode Divisi / Bagian</th>
                      <th>Nama Divisi / Bagian</th>
                    </tr>
                  </thead>
                  <tbody>

                    <?php 
                      $tampil=mysqli_query($config, "SELECT * FROM sip_bidang ORDER BY kodesurat ASC");
                      while($tampung=mysqli_fetch_array($tampil))
                      {
                        $kodesurat = $tampung['kodesurat'];
                        $kodeBidang = $tampung['kodeBidang'];
                        $namaBidang = $tampung['namaBidang'];

                        echo"<tr class='pilih3' data-kodesurat='$kodesurat' data-kodeBidang='$kodeBidang' data-namaBidang='$namaBidang' data-golongan='b'>
                          <td>$kodesurat</td>
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
<!--Akhir Modal untuk menampilkan dan menambahkan diposisi 3-->


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

  $(document).on('click', '.pilih', function(e) {
    document.getElementById("kodesurat").value = $(this).attr('data-kodesurat');
    $('#myModal').modal('hide');
  });

  $(document).on('click', '.pilih2', function(e) {
    document.getElementById("namaBidang_2").value = $(this).attr('data-namaBidang');
    $('#myModal-2').modal('hide');
  });

  $(document).on('click', '.pilih2', function(e) {
    document.getElementById("kodeBidang_2").value = $(this).attr('data-kodeBidang');
    $('#myModal-2').modal('hide');
  });

  $(document).on('click', '.pilih2', function(e) {
    document.getElementById("kodesurat_2").value = $(this).attr('data-kodesurat');
    $('#myModal-2').modal('hide');
  });

  $(document).on('click', '.pilih3', function(e) {
    document.getElementById("namaBidang_3").value = $(this).attr('data-namaBidang');
    $('#myModal-3').modal('hide');
  });

  $(document).on('click', '.pilih3', function(e) {
    document.getElementById("kodeBidang_3").value = $(this).attr('data-kodeBidang');
    $('#myModal-3').modal('hide');
  });

  $(document).on('click', '.pilih3', function(e) {
    document.getElementById("kodesurat_3").value = $(this).attr('data-kodesurat');
    $('#myModal-3').modal('hide');
  });
</script>

<script>
  $(function() {
    //Initialize Select2 Elements
    $(".select2").select2();
  });
</script>


<!-- Awal Script Modal -->
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
    $('#table-modal-2').DataTable( {
        responsive: true
    } );
    $('#table-modal-3').DataTable( {
        responsive: true
    } );
} );
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