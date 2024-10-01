<?php include "../config/session.php";
date_default_timezone_set('Asia/Makassar');
?>


<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Sistem Informasi Manajemen Persuratan</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="icon" href="../files/logo/logo.png" type="image/x-icon">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- daterange picker -->
  <link rel="stylesheet" href="../plugins/daterangepicker/daterangepicker.css">
  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="../plugins/datepicker/datepicker3.css">
  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="../plugins/iCheck/all.css">
  <!-- Bootstrap Color Picker -->
  <link rel="stylesheet" href="../plugins/colorpicker/bootstrap-colorpicker.min.css">
  <!-- Bootstrap time Picker -->
  <link rel="stylesheet" href="../plugins/timepicker/bootstrap-timepicker.min.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="../plugins/select2/select2.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="../plugins/datatables/dataTables.bootstrap.css">
  <!-- Fixed Header -->
  <link rel="stylesheet" href="https://cdn.datatables.net/fixedheader/3.1.3/css/fixedHeader.bootstrap.min.css">
  <!-- Responsive -->
  <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.1/css/responsive.bootstrap.min.css">
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

</head>

<body class="hold-transition skin-blue sidebar-mini">
  <div class="wrapper">

    <header class="main-header">
      <!-- Logo -->
      <a href="index.php" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><img src="../files/logo/logo.png" width="70%"></span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><img src="../files/logo/logo.png" width="20%"> PERSURATAN</span>
      </a>
      <!-- Header Navbar: style can be found in header.less -->
      <nav class="navbar navbar-static-top">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
          <span class="sr-only">Toggle navigation</span>
        </a>

        <div class="navbar-custom-menu">
          <ul class="nav navbar-nav">

            <?php

            $query_user = mysqli_query($config, "SELECT * FROM sip_user WHERE nip='$session_username'");
            $array_user = mysqli_fetch_array($query_user);

            $nama = $array_user['nama'];
            $kodeBidang = $array_user['kodeBidang'];
            $golongan = $array_user['golongan'];

            if ($golongan == "b") {
              $query_bidang = mysqli_query($config, "SELECT namaBidang FROM sip_bidang WHERE kodeBidang='$kodeBidang'");
              $array_bidang = mysqli_fetch_array($query_bidang);

              $namaBidang = $array_bidang['namaBidang'];
            } else {
              $query_sie = mysqli_query($config, "SELECT namaSie FROM sip_sie WHERE kodeSie='$kodeBidang'");
              $array_sie = mysqli_fetch_array($query_sie);

              $namaBidang = $array_sie['namaSie'];
            }
            ?>
            <li class="dropdown user user-menu">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <img src="../files/logo/logo.png" class="user-image" alt="User Image">
                <span class="hidden-xs"><?php echo $nama; ?></span>
              </a>
              <ul class="dropdown-menu">
                <!-- User image -->
                <li class="user-header">
                  <img src="../files/logo/user.png" class="img-circle" alt="User Image">

                  <p style="font-size: 10pt;">
                    <?php echo $nama; ?>
                    <small>
                      <?php echo $namaBidang; ?>
                    </small>
                  </p>
                </li>
                <!-- Menu Body -->
                <!-- Menu Footer-->
                <li class="user-footer">
                  <div class="pull-left">
                  </div>
                  <div class="pull-right">
                    <a href="keluar.php" class="btn btn-default btn-flat">Keluar</a>
                  </div>
                </li>
              </ul>
            </li>
            <!-- Control Sidebar Toggle Button -->
            <li>

            </li>
          </ul>
        </div>
      </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
      <!-- sidebar: style can be found in sidebar.less -->
      <section class="sidebar">
        <!-- Sidebar user panel -->
        <ul class="sidebar-menu">
          <li class="header">MAIN NAVIGATION</li>
          <li><a href="index.php"><i class="fa fa-dashboard"></i> <span>Beranda</span></a></li>
          <?php
          if ($golongan == "b" && $kodeBidang == "2") {
          ?>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-database"></i>
                <span>Data Master</span>
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
              </a>
              <ul class="treeview-menu">
                <li><a href="bidang_list.php"><i class="fa fa-circle-o"></i> Divisi / Bagian</a></li>
                <!--<li><a href="sie_list.php"><i class="fa fa-circle-o"></i> Sie</a></li>
                <li><a href="berkas_list.php"><i class="fa fa-circle-o"></i> Berkas</a></li>
                <li><a href="sub_bekas_list.php"><i class="fa fa-circle-o"></i> Sub Berkas</a></li>
                <li><a href="rak_list.php"><i class="fa fa-circle-o"></i> Rak</a></li>
                <li><a href="box_list.php"><i class="fa fa-circle-o"></i> Box</a></li>-->
                <li><a href="user_list.php"><i class="fa fa-circle-o"></i> User</a></li>
              </ul>
            </li>
          <?php
          }
          ?>

<!-- Awal Menu inbox Untuk Pak Ketua -->     
          <?php
          if ($kodeBidang == "1" or $kodeBidang == "3") {
          ?>
            <li><a href="inbox_list.php"><i class="fa fa-inbox"></i> <span>Semua Inbox</span></a></li>
            <li><a href="inbox_belum_disposisi.php"><i class="fa fa-inbox"></i> <span>Belum Disposisi</span></a></li>
            <li><a href="inbox_sudah_disposisi.php"><i class="fa fa-inbox"></i> <span>Sudah Disposisi</span></a></li>
            <li><a href="inbox_dalam_tindaklanjut.php"><i class="fa fa-inbox"></i> <span>Dalam Tindak Lanjut</span></a></li>
            <li><a href="inbox_history.php"><i class="fa fa-inbox"></i> <span>Selesai Ditindak Lanjut</span></a></li>
            <li><a href="inbox_diabaikan.php"><i class="fa fa-inbox"></i> <span>Surat Diabaikan</span></a></li>
          <?php
          }
          ?>
<!-- Awal Menu inbox Untuk Pak Ketua-->


<!-- Awal Menu inbox Untuk Devisi / Bagian & Kesekretariatan -->
          <?php
          if ($golongan == "b" and $kodeBidang != "1" and $kodeBidang != "3") {
          ?>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-database"></i>
                <span>Inbox</span>
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
              </a>
              <ul class="treeview-menu">
                <li><a href="inbox_bidang_list.php"><i class="fa fa-inbox"></i> <span>Semua Inbox</span></a></li>
                <li><a href="inbox_bidang_perlu_tindakan.php"><i class="fa fa-inbox"></i> <span>Perlu Tindak Lanjut</span></a></li>
                <li><a href="inbox_bidang_dalam_tindakan.php"><i class="fa fa-inbox"></i> <span>Dalam Tindak Lanjut</span></a></li>
                <li><a href="inbox_bidang_history.php"><i class="fa fa-inbox"></i> <span>Selesai Ditindak Lanjut</span></a></li></li>
              </ul>

              

<!-- Akhir Menu inbox Untuk Devisi / Bagian Kesekretariatan -->

<!-- Awal Menu surat masuk dan keluar -->
          <?php
          }
          if ($golongan == "b" and $kodeBidang != "1" and $kodeBidang != "3" and $kodeBidang != "2") { ?>
            <li><a href="suratkeluar_list.php"><i class="fa fa-file"></i> <span>Surat Keluar</span></a></li>

          <?php }
          if ($golongan == "b" and $kodeBidang == "2") {
          ?>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-database"></i>
                <span>Inbox Ketua</span>
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
              </a>
              <ul class="treeview-menu">
            
                <li><a href="inbox_belum_disposisi_sekre.php"><i class="fa fa-inbox"></i> <span>Belum Disposisi</span></a></li>
                <li><a href="inbox_sudah_disposisi_sekre.php"><i class="fa fa-inbox"></i> <span>Sudah Disposisi</span></a></li>
                <li><a href="inbox_perlu_tindakan_sekre.php"><i class="fa fa-inbox"></i> <span>Dalam Tindakan</span></a></li>
                <li><a href="inbox_history_sekre.php"><i class="fa fa-inbox"></i> <span>Sudah Ditindak</span></a></li>
                <li><a href="inbox_diabaikan_sekre.php"><i class="fa fa-inbox"></i> <span>Surat Diabaikan</span></a></li>

              </ul>

            <li><a href="suratmasuk_list.php"><i class="fa fa-file"></i> <span>Surat Masuk</span></a></li>

            <!--<li class="treeview">
              <a href="#">
                <i class="fa fa-database"></i>
                <span>Surat Keluar</span>
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
              </a>-->
             <!-- <ul class="treeview-menu"> -->
                <li class="treeview" ><a href="suratkeluar_list.php"><i class="fa fa-file"></i> <span>Surat Keluar</span></a></li>
                <?php if ($kodeBidang == "2") { ?>
                  <!-- <li><a href="nosuratkeluar_list.php"><i class="fa fa-sort-numeric-asc"></i> <span>Nomor Surat Keluar</span></a></li> -->
                <?php } ?>
              <!--</ul>-->
            </li>
          <?php
          }
          ?>
<!-- Akhir Menu surat masuk dan keluar -->

          <?php
          if ($kodeBidang <> "1" && $kodeBidang <> "3" and $golongan != "s") {
          ?>
            <!--<li><a href="teruskan_list.php"><i class="fa fa-send"></i> <span>Teruskan</span></a></li>-->
          <?php
          }
          ?>
          <?php
          if ($golongan == "s" || $golongan == "b" && $kodeBidang == "1") {
          ?>
            <!--<li><a href="arsip_list.php"><i class="fa fa-file"></i> <span>Arsip</span></a></li>-->
          <?php
          }
          if ($golongan != "s") {
          ?>

            <!--<li class="treeview">
              <a href="#">
                <i class="fa fa-file"></i>
                <span>Laporan</span>
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
              </a>
              <ul class="treeview-menu">
                <li><a href="lap_suratmasuk.php"><i class="fa fa-file"></i> <span>Laporan Surat Masuk</span></a></li>
                <li><a href="lap_suratkeluar.php"><i class="fa fa-file"></i> <span>Laporan Surat Keluar</span></a></li>
                <li><a href="lap_disposisi.php"><i class="fa fa-file"></i> <span>Laporan Disposisi</span></a></li>
                <li><a href="lap_teruskan.php"><i class="fa fa-file"></i> <span>Laporan Teruskan</span></a></li>
              </ul>
            </li>-->
          <?php } ?>
        </ul>
      </section>
      <!-- /.sidebar -->
    </aside>
