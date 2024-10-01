<?php include "../config/session.php"; ?>

<?php
$query = mysqli_query($config, "SELECT * FROM tbl_instansi WHERE id_instansi='1'");
$array = mysqli_fetch_array($query);

$nama_yayasan = $array['institusi'];
$nama_instansi = $array['nama'];
$alamat = $array['alamat'];
$ketua_yayasan = $array['kepsek'];
$nik = $array['nip'];
$website = $array['website'];
$email = $array['email'];
$logo = $array['logo'];
?>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Sistem Informasi Manajemen Administrasi Surat | Yayasan Kesejahteraan Korpri Propinsi Bali</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <script src="../plugins/ckeditor/ckeditor.js"></script>
  <script src="../plugins/ckeditor/samples/js/sample.js"></script>
  <link rel="stylesheet" href="../plugins/ckeditor/samples/css/samples.css">
  <link rel="stylesheet" href="../plugins/ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css">
  <!-- Bootstrap 3.3.6 -->
  <link rel="icon" href="../files/logo/<?php echo $logo; ?>" type="image/x-icon">
  <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="../plugins/iCheck/flat/blue.css">
  <!-- Morris chart -->
  <link rel="stylesheet" href="../plugins/morris/morris.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="../plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <!-- Date Picker -->
  <link rel="stylesheet" href="../plugins/datepicker/datepicker3.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="../plugins/daterangepicker/daterangepicker.css">
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="../plugins/datatables/dataTables.bootstrap.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="../plugins/select2/select2.min.css">

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
        <span class="logo-mini"><b>SMS</b></span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>SIMAS</b></span>
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
            $query_user = mysqli_query($config, "SELECT * FROM tbl_user WHERE username='$session_username'");
            $array_user = mysqli_fetch_array($query_user);

            $id_user = $array_user['id_user'];
            $nama = $array_user['nama'];
            $status = $array_user['admin'];
            ?>
            <li class="dropdown user user-menu">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <img src="../files/logo/<?php echo $logo; ?>" class="user-image" alt="User Image">
                <span class="hidden-xs"><?php echo $nama; ?></span>
              </a>
              <ul class="dropdown-menu">
                <!-- User image -->
                <li class="user-header">
                  <img src="../files/logo/<?php echo $logo; ?>" class="img-circle" alt="User Image">

                  <p>
                    <?php echo $nama; ?>
                    <small>
                      <?php
                      if ($status == '1') {
                        echo "Administrator";
                      } else {
                        echo "Operator";
                      }
                      ?>
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
          <li class="treeview">
            <a href="#">
              <i class="fa fa-file"></i>
              <span>Transaksi Surat</span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
            <ul class="treeview-menu">
              <li><a href="tsm_list.php"><i class="fa fa-circle-o"></i> Surat Masuk</a></li>
              <li><a href="tsk_list.php"><i class="fa fa-circle-o"></i> Surat Keluar</a></li>
            </ul>
          </li>
          <li class="treeview">
            <a href="#">
              <i class="fa fa-file"></i>
              <span>Keputusan</span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
            <ul class="treeview-menu">
              <li><a href="kpt_sk_mpky_list.php"><i class="fa fa-circle-o"></i> SK Panitia MPKY</a></li>
              <li><a href="tsk_list.php"><i class="fa fa-circle-o"></i> Surat Tugas Model 1</a></li>
              <li><a href="tsk_list.php"><i class="fa fa-circle-o"></i> Surat Tugas Model 2</a></li>
            </ul>
          </li>
          <li class="treeview">
            <a href="#">
              <i class="fa fa-file"></i>
              <span>Disposisi</span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
            <ul class="treeview-menu">
              <li><a href="tsm_list.php"><i class="fa fa-circle-o"></i> Surat Keputusan</a></li>
              <li><a href="tsk_list.php"><i class="fa fa-circle-o"></i> Surat Tugas Model 1</a></li>
              <li><a href="tsk_list.php"><i class="fa fa-circle-o"></i> Surat Tugas Model 2</a></li>
            </ul>
          </li>
          <li class="treeview">
            <a href="#">
              <i class="fa fa-table"></i> <span>Pengaturan</span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
            <ul class="treeview-menu">
              <?php
              if ($status == '1') {
                echo "<li><a href='cgi.php'><i class='fa fa-circle-o'></i> Instansi</a></li>";
                echo "<li><a href='cgi_ss_list.php'><i class='fa fa-circle-o'></i> Sifat Surat</a></li>";
                echo "<li><a href='cgi_ks_list.php'><i class='fa fa-circle-o'></i> Kategori Surat</a></li>";
                echo "<li><a href='cgi_user_list.php'><i class='fa fa-circle-o'></i> User</a></li>";
              } else {
                echo "<li><a href='cgi_ss_list.php'><i class='fa fa-circle-o'></i> Sifat Surat</a></li>";
                echo "<li><a href='cgi_ks_list.php'><i class='fa fa-circle-o'></i> Kategori Surat</a></li>";
                echo "<li><a href='cgi_user_edit.php?id_user=$id_user'><i class='fa fa-circle-o'></i> Ubah Password</a></li>";
              }
              ?>
            </ul>
          </li>
        </ul>
      </section>
      <!-- /.sidebar -->
    </aside>