<?php

$servername = "us-cdbr-east-05.cleardb.net";
$username = "bb5dfd11713a8d";
$password = "d8c51ba8";
$database = "heroku_a60d81bd8866fe5";

$con = new mysqli($servername, $username, $password, $database);

$valid = array();



if($val = mysqli_query($link,"SELECT * FROM  farmers)){
    while($pick = $val->fetch_assoc()){
        $valid[] = $pick;
    }
    if(sizeof($valid) != 0){
        $json = json_encode($valid);
        $jsonobj = json_decode($json);
        
        echo("$jsonobj")

    }
    else{
        echo('Not working');
    }
}

mysqli_close($link);

?>
