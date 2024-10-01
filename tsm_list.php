<?php include"../config/koneksi_database.php"; ?>
<?php include"../template/header.php"; ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Transaksi Surat
        <small>Surat Masuk</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="index.php"><i class="fa fa-dashboard"></i> Beranda</a></li>
        <li class="active">Surat Masuk</li>
      </ol>
    </section>

    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <a class="btn btn-app" href="tsm_add.php">
                <i class="fa fa-plus"></i> Catat Surat
              </a>
              <a class="btn btn-app">
                <i class="fa fa-database"></i> Import Data
              </a>

            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-striped table-bordered nowrap" cellspacing="0" width="100%">
                <thead>
                <tr>
                  <th>Tindakan</th>
                  <th>No. Agenda</th>
                  <th>No. Surat</th>
                  <th>Asal Surat</th>
                  <th>Perihal</th>
                  <th>Tgl. Surat</th>
                  <th>Tgl. Diterima</th>
                  <th>Keterangan</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                  <th>Tindakan</th>
                  <th>No. Agenda</th>
                  <th>No. Surat</th>
                  <th>Asal Surat</th>
                  <th>Perihal</th>
                  <th>Tgl. Surat</th>
                  <th>Tgl. Diterima</th>
                  <th>Keterangan</th>
                </tr>
                </tfoot>
                <tbody>
                <?php
                  $query_surat_masuk = mysqli_query($config, "SELECT * FROM tbl_surat_masuk ORDER BY no_agenda  DESC");
                  while($array_surat_masuk=mysqli_fetch_array($query_surat_masuk))
                  {
                    $id_surat=$array_surat_masuk['id_surat'];
                    $no_agenda=$array_surat_masuk['no_agenda'];
                    $no_surat=$array_surat_masuk['no_surat'];
                    $asal_surat=$array_surat_masuk['asal_surat'];
                    $perihal=$array_surat_masuk['isi'];
                    $tgl_surat=$array_surat_masuk['tgl_surat'];
                    $tgl_diterima=$array_surat_masuk['tgl_diterima'];
                    $file=$array_surat_masuk['file'];
                    $keterangan=$array_surat_masuk['keterangan'];

                    echo"
                    <tr>
                      <td>
                        <div class='btn-group'>
                          <button type='button' class='btn btn-primary dropdown-toggle' data-toggle='dropdown'>
                            <span class='fa fa-bars'></span>
                            <span class='sr-only'>Toggle Dropdown</span>
                          </button>
                          <ul class='dropdown-menu' role='menu'>
                            <li><a href='tsm_list_disp.php?id_surat=$id_surat'>Disposisi</a></li>
                            <li><a href='tsm_view.php?id_surat=$id_surat'>Lihat</a></li>
                            <li><a href='tsm_edit.php?id_surat=$id_surat'>Edit</a></li>
                            <li><a href='../files/tsm/$file' download>Unduh</a></li>
                            <li><a href='tsm_delete.php?id_surat=$id_surat'>Hapus</a></li>
                          </ul>
                        </div>
                      </td>
                      <td>".$no_agenda."</td>
                      <td>".$no_surat."</td>
                      <td>".$asal_surat."</td>
                      <td>".$perihal."</td>
                      <td>".$tgl_surat."</td>
                      <td>".$tgl_diterima."</td>
                      <td>".$keterangan."</td>
                    </tr>
                    ";
                  }
                ?>
                </tbody>
              </table>
            </div>
            <!-- /.box-body -->
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
$(document).ready(function() {
    var table = $('#example1').DataTable( {
        responsive: true
    } );
 
    new $.fn.dataTable.FixedHeader( table );
} );
</script>

</body>
</html>