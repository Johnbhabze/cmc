<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../../css/style-navigation.css">
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <link href='https://fonts.googleapis.com/css?family=Inter' rel='stylesheet'>
</head>
<body>
    <div class="navigation">
        <ul>
            <li>
                <!-- <a href="dashboard.html"> -->
                    <div class="logo">
                        <img src="../../img/imgs/logo.png" alt="">
                    </div>
                <!-- </a> -->
            </li>
    
            <li>
                <!-- <a href="dashboard.html"> -->
                    <span class="icon">
                        <ion-icon name="home"></ion-icon>
                    </span>
                    <span class="title">Home</span>
                <!-- </a> -->
            </li>
    
            <li >
                <!-- <a href=""> -->
                    <span class="icon"  onclick="slots()">
                        <ion-icon name="library-outline"></ion-icon>
                    </span>
                    <span class="title" onclick="slots()">Available Slots</span>
                <!-- </a> -->
            </li>
    
            <li>
                <!-- <a href="myAppointments.html"> -->
                    <span class="icon"  onclick="appointment()">
                        <ion-icon name="calendar-outline"></ion-icon>
                    </span>
                    <span class="title"  onclick="appointment()">My Appointments</span>
                <!-- </a> -->
            </li>
    
            <li>
                <!-- <a href="myHistory.html"> -->
                    <span class="icon">
                        <ion-icon name="document-text-outline"></ion-icon>
                    </span>
                    <span class="title">My History</span>
                <!-- </a> -->
            </li>
    
            <li>
                <!-- <a onclick="signoutClick(event)" id="logout"> -->
                    <span class="icon">
                        <ion-icon name="log-out-outline"></ion-icon>
                    </span>
                    <span class="title">Sign Out</span>
                <!-- </a> -->
            </li>
        </ul>
    </div>
</body>
<!-- <script src="../../js/script.js"></script> -->
<script src="../../js/script-navigation.js"></script>
</html>