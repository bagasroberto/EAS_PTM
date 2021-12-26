<?php
include 'conn.php';

$kode_dsn=$_POST['kode_dsn'];
$con->query("DELETE FROM tb_dosen WHERE kode_dsn=".$kode_dsn);
?>