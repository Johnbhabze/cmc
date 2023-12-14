
function fetchPatientCounts() {
    var xhttpPatientCounts = new XMLHttpRequest();
    var url = "../../php/get_total_patients.php";
    xhttpPatientCounts.open("GET", url, true);
    xhttpPatientCounts.onreadystatechange = function () {
        if (xhttpPatientCounts.readyState == 4) {
            if (xhttpPatientCounts.status == 200) {
                var data = JSON.parse(xhttpPatientCounts.responseText);
                var todayCount = data.today_count;
                var yesterdayCount = data.yesterday_count;
                var tomorrowCount = data.tomorrow_count;

                document.getElementById('patients-today').innerText = todayCount;
                document.getElementById('patients-yesterday').innerText = yesterdayCount;
                document.getElementById('patients-tomorrow').innerText = tomorrowCount;
            } else {
                console.error("Error fetching data. Status code: " + xhttpPatientCounts.status);
            }
        }
    };
    xhttpPatientCounts.send();
}

function fetchAppointments() {
    $.ajax({
        url: "../../php/list_of_appointments.php",
        method: "GET",
        success: function (response) {
            var appointments = JSON.parse(response);
            $('#appointmentsTable tbody').empty();
            if (appointments.length > 0) {
                $.each(appointments, function (index, appointment) {
                    $('#appointmentsTable tbody').append(
                        '<tr>' +
                        '<td>' + appointment.patient_name + '</td>' +
                        '<td>' + appointment.type + '</td>' +
                        '<td>' + appointment.schedule + '</td>' +
                        '<td>' + appointment.status + '</td>' +
                        '</tr>'
                    );
                });
            } else {
                $('#appointmentsTable tbody').append(
                    '<tr>' +
                    '<td></td>' +
                    '<td colspan="5"><img src="../../imgs/appointment.png" alt="No Appointments Image"></td>' +
                    '</tr>'
                );

            }
        },
        error: function () {
            console.log("Error fetching appointments.");
        }
    });
}

function fetchDoneAppointments() {
    $.ajax({
        url: "../../php/get_alldone_appointments.php",
        method: "GET",
        success: function (response) {
            var appointments = JSON.parse(response);
            $('#myHistoryTable tbody').empty();
            if (appointments.length > 0) {
                $.each(appointments, function (index, appointment) {
                    $('#myHistoryTable tbody').append(
                        '<tr>' +
                        '<td>' + appointment.patient_name + '</td>' +
                        '<td>' + appointment.type + '</td>' +
                        '<td>' + appointment.schedule + '</td>' +
                        '<td>' + appointment.status + '</td>' +
                        '</tr>'
                    );
                });
            } else {
                $('#myHistoryTable tbody').append(
                    '<tr>' +
                    '<td></td>' +
                    '<td></td>' +
                    '<td colspan="5"><img src="../../imgs/appointment.png" alt="No Appointments Image"></td>' +
                    '</tr>' 
                );
            }
        },
        error: function () {
            console.log("Error fetching appointments.");
        }
    });
}



// Call the functions on document ready
$(document).ready(function () {
    fetchPatientCounts();
    fetchAppointments();
    fetchDoneAppointments();

});

