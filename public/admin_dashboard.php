<?php
session_start();

if(isset($_SESSION["admin_email"])){
    if($_SESSION["role"] === 'user-only'){
        // echo "<script>window.location.href='user_dashboard.php'</script>";
        header('location: user_dashboard.php');
    }

}  else{
    header("Location: index.php");
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="../js/authentication.js"></script>
    <title>Document</title>
</head>
<body>
    <center>
    <h1 style="font-size: 100px;">this is an admin page</h1>
    <p style="font-size: 50px;">waiting for jovies tasks</p>

    <br>

    <h1>
        <a onclick="signoutClick(event)" id="logout">
            <span class="icon">
                <ion-icon name="log-out-outline"></ion-icon>
            </span>
    
            <span class="title">Sign Out</span>
        </a>
    </h1>
    </center>

</body>
</html>