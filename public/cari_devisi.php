<?php include "../config/koneksi_database.php"; ?>

<?php

        
        if (isset($_POST['kata_kunci'])) {
            $kata_kunci=trim($_POST['kata_kunci']);
            $sql="select * from sip_bidang where kodeBidang like '%".$kata_kunci."%' or namaBidang like '%".$kata_kunci."%' order by kodeBidang asc";

        }else {
            $sql="select * from sip_bidang order by kodeBidang asc";
        }


        $hasil=mysqli_query($config,$sql);
        $no=0;
        while ($data = mysqli_fetch_array($hasil)) {
            $no++;

            ?>
            
            <tr>
                <td><?php echo $no;?></td>
                <td><?php echo $data["kodeBidang"]; ?></td>
                <td><?php echo $data["namaBidang"];   ?></td>
            </tr>
            
            <?php
        }
        ?>
  