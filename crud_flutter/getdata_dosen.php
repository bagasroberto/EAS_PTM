<?php
include 'conn.php';

$queryResult=$con->query("SELECT * FROM tb_dosen");
$result=array();

while($fetchData=$queryResult->fetch_assoc()){
    $result[]=$fetchData;
}

echo json_encode($result);
?>