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

$con->query("UPDATE tb_dosen SET nama='".$nama."', alamat='".$alamat."', tgl_lahir='".$tgl_lahir."', email='".$email."', no_telp='".$no_telp."', prodi='".$prodi."', fakultas='".$fakultas."', foto='".$foto."' WHERE kode_dsn=". $kode_dsn);
?>