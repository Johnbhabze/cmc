<?php

$result = $conn -> query($sql);

    if($result -> num_rows > 0){
        while($card = $result -> fetch_assoc()){
            $appt = $card['appointment_id'];
            $queue = $card['queue_no'];
            $fname = $card['first_name'];
            $mname = $card['middle_name'];
            $lname = $card['last_name'];
            $xname = $card['extension_name'];
            $dateSched = $card['day'];
            $timeSched = $card['time']; // remove the comment symbol to execute this line

            $dateString = strtotime($dateSched);
            $formatDate = date("F j, Y", $dateString);

            $name = $lname .", ". $fname ." ". $mname ." ". $xname;
            // $sched = $dateSched.' @ '.$timeSched; -- remove the comment symbol to execute this line
            
        
            echo "
                <div class='clientAppointment' id='$appt' onclick='fetchPatient($appt)'  draggable='true'>
                    <p>Queue No.: $queue</p>
                    <p>Patient's name: $name</p>
                    <p>Schedule : $formatDate @ $timeSched</p>
                </div>
            ";
        }
    }
?>