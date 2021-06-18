<?php 
require_once('/var/www/vhosts/avanceytec.com.mx/httpdocs/logs_locales.php');
$activeStore = explode("/",$_SERVER['REQUEST_URI'])[1];

$servername = "localhost";
$dbname = "prestashop_8";
$username = "admin_atp";
$password = "1T7#ev0b";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
	die("Connection failed: " . $conn->connect_error);
}else{
	print_r("PASS 1<br>");
}


$fecha=date("Y-m-d H:i:s");
/*
print_r("<br>------------------------------------------------------------<br>");
$sql = "UPDATE  prstshp_product_shop  SET id_shop = 0 WHERE price = 0";
if ($conn->query($sql)) {
	print_r("sql ::: {$sql}<br>");
}
print_r("<br>------------------------------------------------------------<br>");
$sql = "UPDATE  prstshp_product_shop  SET id_shop = 1 WHERE price > 0";
if ($conn->query($sql)) {
	print_r("sql ::: {$sql}<br>");
}
print_r("<br>------------------------------------------------------------<br>");
$sql = "SELECT id_product FROM prstshp_product_shop  WHERE price = 0";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
	while($row = $result->fetch_assoc()) {
		$sql = "UPDATE  prstshp_product_attribute_shop  SET id_shop = 0 WHERE id_product = {$row[id_product]}";
		if ($conn->query($sql)) {
			print_r("sql ::: {$sql}<br>");
		}
	}
}
print_r("<br>------------------------------------------------------------<br>");
$sql = "SELECT id_product FROM prstshp_product_shop  WHERE price > 0";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
	while($row = $result->fetch_assoc()) {
		$sql = "UPDATE  prstshp_product_attribute_shop  SET id_shop = 1 WHERE id_product = {$row[id_product]}";
		if ($conn->query($sql)) {
			print_r("sql ::: {$sql}<br>");
		}
	}
}
print_r("<br>------------------------------------------------------------<br>");
/*
*/
?>