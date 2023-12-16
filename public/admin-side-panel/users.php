<?php
session_start();
if(!isset($_SESSION["admin_email"])){
        header('location: ../index.php');
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CMC | List of Patients</title>


    <script src="https://kit.fontawesome.com/75f1c3823b.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script type="text/javascript" src="../../js/authentication.js"></script>
    <link rel="icon" type="image/x-icon" href="../../imgs/favicon.ico">
    <link href='https://fonts.googleapis.com/css?family=Inter' rel='stylesheet'>
    <link rel="stylesheet" href="../../css/admin.css">
    <link rel="stylesheet" href="../../css/user.css">

</head>

<body>
    <!-- =============== SIDEBAR ================ -->
    <div class="container">
        <div class="navigation">
            <ul>
                <li>
                    <a href="admin_dashboard.php">
                        <div class="logo">
                            <img src="../../imgs/sidebarlogo.png" alt="sidebarlogo">
                        </div>
                    </a>
                </li>

                <li>
                    <a href="admin_dashboard.php">
                        <span class="icon"><ion-icon name="home"></ion-icon></span>
                        <span class="title">Home</span>
                    </a>
                </li>

                <li >
                    <a href="availableAdminSlot.php">
                        <span class="icon">
                            <ion-icon name="time-outline"></ion-icon>
                        </span>
                        <span class="title">Available Slots</span>
                    </a>
                </li>

                <li>
                    <a href="pendingAppointment.php">
                        <span class="icon">
                            <ion-icon name="calendar-outline"></ion-icon>
                        </span>
                        <span class="title">Pending Appointments</span>
                    </a>
                </li>

                <li>
                    <a href="history.php">
                        <span class="icon">
                            <ion-icon name="document-text-outline"></ion-icon>
                        </span>
                        <span class="title">Catered</span>
                    </a>
                </li>

                <li style="background-color: #FBF5EE; font-size: 30px">
                    <a href="users.php">
                        <span class="icon">
                        <ion-icon name="people-outline"></ion-icon>
                        </span>
                        <span class="title">Patients</span>
                    </a>
                </li>

                <li>
                    <a onclick="signoutClick(event)" id="logout">
                        <span class="icon">
                            <ion-icon name="log-out-outline"></ion-icon>
                        </span>
                        <span class="title">Sign Out</span>
                    </a>
                </li>
            </ul>
        </div>

        <!-- =========== MAIN ============= -->
        <div class="main">
            <div class="topbar">
                <div class="toggle">
                    <ion-icon name="menu-outline"></ion-icon>
                </div>

                <div class="admin-dropdown">
                    <div class="admin">
                    <img src="../../imgs/admin.png" alt="admin">
                        <div class="admin-info">
                            <p class="admin-name">
                                <?php
                                    echo $_SESSION['admin_name'];
                                ?>
                            </p>
                            <p class="admin-email">
                                <?php
                                    echo $_SESSION['admin_email'];
                                ?>
                            </p>
                        </div>
                    </div>

                    <div class="dropdown-content">
                        <a href="pendingAppointment.php" class="appointments">
                            <ion-icon class="icon" name="calendar-outline"></ion-icon> All Pendings
                        </a>
                        <a href="availableAdminSlot.php" class="slots">
                            <ion-icon class="icon" name="time-outline"></ion-icon> Available Slots
                        </a>
                        <a href="history.php" class="history">
                            <ion-icon class="icon" name="document-text-outline"></ion-icon> Done Appointments
                        </a>
                        <a href="#" class="logout" onclick="signoutClick(event)">
                            <ion-icon class="icon" name="log-out-outline"></ion-icon> Sign out
                        </a>
                    </div>
                </div> <!--DROPDOWN-->
            </div> <!--TOPBAR-->

            <div class="list-of-users">
                <div class="users-content">
                    <div class="user-header">
                        <div class="header">
                            <h1>List of Patients</h1>
                        </div>

                        <div class="patient-search">
                            <div class="searchbox">
                                <input type="search" name="search-patient" id="search-patient" placeholder="Search">
                            </div>
                        </div>
                    </div>

                    <div class="patients-div">
                        <div class="show-allPatients" id="showAllPatients">

                        </div>
                    </div>
                    
                </div>
            </div>

        </div> <!-- ==== MAIN ==== -->
    </div> <!--CONTAINER-->
    
    <script type="text/javascript" src="../../js/main.js"></script>
</body>

</html>