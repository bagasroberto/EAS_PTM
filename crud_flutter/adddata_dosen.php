<?php
include 'conn.php';


$kode_dsn = $_POST['kode_dsn'];
$nama = $_POST['nama'];
$alamat = $_POST['alamat'];
$tgl_lahir = $_POST['tgl_lahir'];
$email = $_POST['email'];
$no_telp = $_POST['no_telp'];
$prodi = $_POST['prodi'];
$fakultas = $_POST['fakultas'];
$foto = $_POST['foto'];

$con->query("INSERT INTO tb_dosen (kode_dsn,nama,alamat,tgl_lahir,email,no_telp,prodi,fakultas,foto) VALUES ('".$kode_dsn."','".$nama."','".$alamat."','".$tgl_lahir."','".$email."','".$no_telp."','".$prodi."','".$fakultas."','".$foto."')");
?>