<?php
    include 'db_connect.php';

    if(isset($_POST['id'])){
        $card = $_POST['id'];

        $sql = "UPDATE appointments SET stat = 'Completed', updatedAt = CURRENT_TIMESTAMP WHERE appointment_id = $card ";

        $result = mysqli_query($conn, $sql);

        if($result){
            echo "<script> 
            function() { window.location = 'index.php'; };</script>";
        } else {
            echo "Error updating appointment: " . mysqli_error($conn);
        } 
    } else {
        echo "Appointment ID is not valid.";
    }
?>