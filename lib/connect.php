<?php

$servername = "us-cdbr-east-05.cleardb.net";
$password = "root";
$username = "be5a94bd53081c";
$Dbname = "GunPointCoders_Database";

if(!$con = mysqli_connect($servername,$password,$username,$Dbname))
{

	die("failed to connect!");
}
