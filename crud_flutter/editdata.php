<?php
include 'conn.php';

$nbi = $_POST['nbi'];
$nama = $_POST['nama'];
$alamat = $_POST['alamat'];
$tgl_lahir = $_POST['tgl_lahir'];
$email = $_POST['email'];
$no_telp = $_POST['no_telp'];
$prodi = $_POST['prodi'];
$fakultas = $_POST['fakultas'];
$ipk = $_POST['ipk'];
$dosen_wali = $_POST['dosen_wali'];
$foto = $_POST['foto'];

$con->query("UPDATE tb_mahasiswa SET nama='".$nama."', alamat='".$alamat."', tgl_lahir='".$tgl_lahir."', email='".$email."', no_telp='".$no_telp."', prodi='".$prodi."', fakultas='".$fakultas."', ipk='".$ipk."', dosen_wali='".$dosen_wali."', foto='".$foto."' WHERE nbi=". $nbi);
?>