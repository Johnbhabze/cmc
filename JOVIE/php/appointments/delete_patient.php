<?php
    include 'db_connect.php';

    if(isset($_GET['id']) && !empty($_GET['id'])){
        $appointment_id = $_GET['id'];
        echo '<script> confirm("Are you sure you want to delete an appointment?"); </script>';
        
        $sql = "DELETE FROM appointments WHERE  appointment_id = $appointment_id";

        if(mysqli_query($conn,$sql)){
            echo "<script>function() { window.location = 'index.php';  };</script>";
        } else {
            echo "Error deleting appointment: " . mysqli_error($conn);
        }
    } else {
        echo "Appointment ID is not valid.";
    }
?>