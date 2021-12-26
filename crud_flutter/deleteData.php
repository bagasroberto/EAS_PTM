<?php
include 'conn.php';

$nbi=$_POST['nbi'];
$con->query("DELETE FROM tb_mahasiswa WHERE nbi=".$nbi);
?>