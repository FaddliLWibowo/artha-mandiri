

<?php

$user		= 'root';
$password	= 'rahasia';
$database	= 'artha_mandiri1';
$host		= 'localhost';

mysql_connect($host,$user,$password) or exit("Tidak Bisa Terhubung Dengan Server");
mysql_select_db($database) or exit("Database Tidak Ditemukan.");

?>