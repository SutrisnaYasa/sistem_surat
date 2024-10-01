<?php
$host = "localhost";
$username = "root";
$password = "";
$database = "u0453371_surat";
$config = mysqli_connect($host, $username, $password, $database);

if (!$config) {
    die("Koneksi database gagal: " . mysqli_connect_error());
}
