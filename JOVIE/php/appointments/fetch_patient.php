<?php
    include 'db_connect.php';

    if(isset($_POST['id'])){
        $appointment_id = $_POST['id'];

        $sql_data = "SELECT * 
        FROM appointments 
        INNER JOIN patients ON appointments.patient_id = patients.patient_id 
        WHERE appointments.appointment_id = $appointment_id";
         //-- WHERE patients.patient_id = $patient_id
         // -- AND appointments.date_sched = CURRENT_DATE 
        // -- ORDER BY appointments.queue_no";

        $prep = mysqli_prepare($conn, $sql_data); mysqli_stmt_execute($prep);
        $result = mysqli_stmt_get_result($prep);

        if ($result) {
            $patient = mysqli_fetch_assoc($result);
            echo json_encode($patient);
        } else {
            echo json_encode(['error' => 'Error fetching patient data']);
        }
        mysqli_stmt_close($prep);
    } else {
        echo json_encode(['error' => 'Patient ID is not provided']);
    }
?>