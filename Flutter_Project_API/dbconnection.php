<?php

function dbconnections() {
    $con = mysqli_connect('localhost','root','','flutter_app');
    return $con;
}

?>