<?php

session_start();
$root = realpath($_SERVER["DOCUMENT_ROOT"]);
include_once "$root/project/avanzada 3/Taller2/service/db.php";

$s = $db->prepare('SELECT PV.brand AS marca, (SUM(V.amount)/(SELECT SUM(amount) FROM sales)) * 100 AS ventas 
FROM sales V JOIN product P ON V.id_product = P.id JOIN supplier PV ON P.id_supplier = PV.id GROUP BY PV.brand');

$s->execute();
$sales = $s->fetchAll();

echo json_encode($sales);
