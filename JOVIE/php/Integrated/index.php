<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../../css/style.css">
</head>

<body>
    <div id="Container">
        <div id="navigationContainer">
            <?php include '../navigation/navigation.php'; ?>
        </div>
        <div id="bodyContainer">
            <section id="appointments" > 
                <div id="headerBodyContainer">
                    <div id="hbc1">Appointments</div>
                    <!-- <div id="hbc2"> <?php include '../topbar/topbar.html'; ?></div> -->
                </div>
                <div id="appointmentContent">
                    <div id="contentBodyContainer"> <?php include '../appointments/index.php'; ?> </div>
                    <div id="infoContent"> <?php include '../appointments/patientInfo.html'; ?> </div>
                </div>
            </section>
            <section id="availableSlots">
                <div id="headerBodyContainer">
                    <div id="hbc1"><span style="color:black;"> Available </span>Slots</div>
                    <!-- <div id="hbc2"> <?php include '../topbar/topbar.html'; ?></div> -->
                </div>
                <div> <?php include '../slots/slots.html'; ?> </div>
            </section>
        </div>
    </div>

</body>
<script src="../../js/script.js"></script>
</html>