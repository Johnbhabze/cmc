<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../css/style-appointment.css">
    <title>Document</title>
</head>

<body>
    <div id="Admincontent">
        <!-- <div id="sideNav"> This is where Dy's code will be inserted</div> -->
        <div id="adminAppointmentContainer">
            <div id="pendingAppointment">
                <header>PENDING</header>
                <div class="appointmentContainer" id="Pending">
                    <?php
                    include 'db_connect.php';

                    $sql = "SELECT *
                    FROM appointments 
                    INNER JOIN patients ON appointments.patient_id = patients.patient_id 
                    WHERE appointments.stat = 'Pending'
                    AND appointments.day = CURRENT_DATE -- remove the comment symbol to execute this line
                    ORDER BY appointments.queue_no";

                    include 'query_display.php';
                    ?>
                </div>
            </div>
            <div id="onGoingAppointment">
                <header>IN PROGRESS</header>
                <div class="appointmentContainer" id="inProgress" ondrop="inProgress()">
                    <?php
                    include 'db_connect.php';

                    $sql = "SELECT *
                    FROM appointments 
                    INNER JOIN patients ON appointments.patient_id = patients.patient_id 
                    WHERE appointments.stat = 'In Progress'
                    AND appointments.day = CURRENT_DATE -- remove the comment symbol to execute this line
                    ORDER BY appointments.queue_no";

                    include 'query_display.php';
                    ?>
                </div>
            </div>
            <div id="completedAppointment">
                <header>COMPLETED</header>
                <div class="appointmentContainer" id="Completed" ondrop="completed()">
                    <?php
                    include 'db_connect.php';

                    $sql = "SELECT *
                    FROM appointments 
                    INNER JOIN patients ON appointments.patient_id = patients.patient_id 
                    WHERE appointments.stat = 'Completed'
                    AND appointments.day = CURRENT_DATE -- remove the comment symbol to execute this line
                    ORDER BY appointments.queue_no";

                    include 'query_display.php';
                    ?>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="../../js/script-appointment.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

</html>
