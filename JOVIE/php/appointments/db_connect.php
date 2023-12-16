<?php
$servername = 'localhost';
$username = 'root';  // Your MySQL username
$password = '';  // Your MySQL password
$database = 'cmc_db';

$conn = new mysqli($servername, $username, $password, $database);

if (!$conn) {
    die(mysqli_error($conn));
    
}
    
?>
