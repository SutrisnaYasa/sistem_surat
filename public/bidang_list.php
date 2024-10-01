<?php include"../config/koneksi_database.php"; ?>

<?php include"../template/header.php"; ?>



  <!-- Content Wrapper. Contains page content -->

  <div class="content-wrapper">

    <!-- Content Header (Page header) -->

    <section class="content-header">

      <h1>

        <i class="fa fa-database"></i> DAFTAR DIVISI / BAGIAN

      </h1>

    </section>



    <section class="content">

      <div class="row">

        <div class="col-xs-12">

          <div class="box">

            <div class="box-header">

              <a class="btn btn-app" href="bidang_add.php">

                <i class="fa fa-plus"></i> Tambah Data

              </a>



            </div>

            <!-- /.box-header -->

            <div class="box-body">

              <table id="example1" class="table table-bordered table-striped">

                <thead>

                <tr>

                  <th>Tindakan</th>

                  <th>ID</th>

                  <th>Nama Divisi / Bagian</th>

                  <th>Kode Divisi / Bagian</th>

                </tr>

                </thead>

                <tbody>

                <?php

                  $query_bidang = mysqli_query($config, "SELECT * FROM sip_bidang ORDER BY kodesurat ASC");

                  while($array_bidang=mysqli_fetch_array($query_bidang))

                  {

                    $kodeBidang=$array_bidang['kodeBidang'];

                    $namaBidang=$array_bidang['namaBidang'];

				          	$kodesurat=$array_bidang['kodesurat'];





                    echo"

                    <tr>

                      <td>

                        <div class='btn-group'>

                          <button type='button' class='btn btn-primary dropdown-toggle' data-toggle='dropdown'>

                            <span class='fa fa-bars'></span>

                            <span class='sr-only'>Toggle Dropdown</span>

                          </button>

                          <ul class='dropdown-menu' role='menu'>

                            <li><a href='bidang_ubah.php?kodeBidang=$kodeBidang'>Ubah</a></li>";

                ?>

                <?php

                          if($kodeBidang!="1" && $kodeBidang!="2"){

                            echo"<li><a href='bidang_hapus.php?kodeBidang=$kodeBidang'>Hapus</a></li>";

                          } 

                ?>

                <?php               

                        echo"    

                          </ul>

                        </div>

                      </td>

                      <td>".$kodeBidang."</td>

                      <td>".$namaBidang."</td>

					  <td>".$kodesurat."</td>

                    </tr>";

                  }

                ?>

                </tbody>

                <tfoot>

                <tr>

                  <th>Tindakan</th>

                  <th>ID</th>

                  <th>Nama Divisi / Bagian</th>

				          <th>Kode Divisi / Bagian</th>

                </tr>

                </tfoot>

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