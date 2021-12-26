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

$con->query("INSERT INTO tb_mahasiswa (nbi,nama,alamat,tgl_lahir,email,no_telp,prodi,fakultas,ipk,dosen_wali,foto) VALUES ('".$nbi."','".$nama."','".$alamat."','".$tgl_lahir."','".$email."','".$no_telp."','".$prodi."','".$fakultas."','".$ipk."','".$dosen_wali."','".$foto."')");
?>