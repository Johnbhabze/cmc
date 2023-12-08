

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CMC | Available Slots</title>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script type="text/javascript" src="../js/authentication.js"></script>
    <link rel="icon" type="image/x-icon" href="../imgs/favicon.ico">
    <link href='https://fonts.googleapis.com/css?family=Inter' rel='stylesheet'>
    <link rel="stylesheet" href="../css/style.css">
</head>

<body>

    <!-- =============== Navigation Sidebar ================ -->
    <div class="container">
        <div class="navigation">
            <ul>
                <li>
                    <a href="user_dashboard.php">
                        <div class="logo">
                            <img src="../imgs/sidebarlogo.png" alt="">
                        </div>
                    </a>
                </li>

                <li>
                    <a href="user_dashboard.php">
                        <span class="icon">
                            <ion-icon name="home-outline"></ion-icon>
                        </span>
                        <span class="title">Home</span>
                    </a>
                </li>

                <li>
                    <a href="availableSlots.php">
                        <span class="icon">
                            <ion-icon name="time"></ion-icon>
                        </span>
                        <span class="title">Available Slots</span>
                    </a>
                </li>

                <li>
                    <a href="myAppointments.php">
                        <span class="icon">
                            <ion-icon name="calendar-outline"></ion-icon>
                        </span>
                        <span class="title">My Appointments</span>
                    </a>
                </li>

                <li>
                    <a href="myHistory.php">
                        <span class="icon">
                            <ion-icon name="document-text-outline"></ion-icon>
                        </span>
                        <span class="title">My History</span>
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


        <!-- ========================= Main ==================== -->
        <div class="main">
            <div class="topbar">
                <div class="toggle">
                    <ion-icon name="menu-outline"></ion-icon>
                </div>

                <div class="topbar">
                <div class="toggle">
                    <ion-icon name="menu-outline"></ion-icon>
                </div>

                <div class="user-dropdown">
                    <div class="user">
                        <?php
                            if($_SESSION['sex'] === 'male'){
                                echo '<img src="../imgs/male.png" alt="user-male">';
                            }else {
                                echo  '<img src="../imgs/female.png" alt="user-female">';
                            }
                        ?>
                        <div class="user-info">
                            <p class="user-name">
                                <?php
                                    echo $_SESSION['user_name'];
                                ?>
                            </p>
                            <p class="user-email">
                                <?php
                                    echo $_SESSION['user_email'];
                                ?>
                            </p>
                        </div>
                    </div>

                    <div class="dropdown-content">
                        <a href="#" class="appointments">
                            <ion-icon class="icon" name="calendar-outline"></ion-icon> My Appointments
                        </a>
                        <a href="#" class="slots">
                            <ion-icon class="icon" name="time-outline"></ion-icon> Available Slots
                        </a>
                        <a href="#" class="history">
                            <ion-icon class="icon" name="document-text-outline"></ion-icon> My History
                        </a>
                        <a href="#" class="logout" onclick="signoutClick(event)">
                            <ion-icon class="icon" name="log-out-outline"></ion-icon> Sign out
                        </a>
                    </div>
                </div>
            </div>
            </div>

    </div>
    </div>
    </div>

    <!-- =========== Scripts =========  -->
    <script src="../js/main.js"></script>



</body>

</html>