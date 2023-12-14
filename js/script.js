
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




$(document).ready(function () {
    $('.make-appointment-btn').click(function () {
        var patientId = $(this).data('patient-id');


        // Set patient ID in the hidden field or wherever needed
        $('#patientId').val(patientId);


        // Perform AJAX request to fetch patient details
        $.ajax({
            url: '../../php/fetchPatientDetails.php', 
            type: 'GET',
            data: { patientId: patientId },
            success: function (response) {
                // Parse the JSON response
                var patientDetails = JSON.parse(response);

                // Populate the form fields with patient details
                $('#firstName').val(patientDetails.first_name);
                $('#lastName').val(patientDetails.last_name);
                $('#middleName').val(patientDetails.middle_name);
                $('#extensionName').val(patientDetails.extension_name);
                $('#dob').val(patientDetails.birhdate);
                $('#civilStatus').val(patientDetails.civil_status);
                $('#sex').val(patientDetails.sex);
                $('#religion').val(patientDetails.religion);
                $('#occupation').val(patientDetails.occupation);
                $('#nationality').val(patientDetails.nationality);
                $('#cellphoneNumber').val(patientDetails.phone_number);
                $('#houseLotNo').val(patientDetails.house_no);
                $('#barangay').val(patientDetails.barangay);
                $('#postalCode').val(patientDetails.postal_code);
                $('#spouseName').val(patientDetails.spouse_name);
                $('#spouseAddress').val(patientDetails.spouse_address);
                $('#street').val(patientDetails.street);
                $('#fathersName').val(patientDetails.fathers_name);
                $('#motherMaidenName').val(patientDetails.mothers_maiden_name);
                $('#province').val(patientDetails.province);
                $('#city').val(patientDetails.municaplity);

                // Show the modal
                $('#appointmentModal').modal('show');
            },
            error: function () {
                alert('Error fetching patient details');
            }
        });
    })


});


//ADDING APPOINTMENTS VALIDATION
var isFormValid = false; 
$('.submit-button').on('click', function (event) {
    event.preventDefault();

    isFormValid = validateForm();

    if (isFormValid) {
        checkAppointmentAvailability();
    }
});

function validateForm() {
    var patientId = $('#patientId').val();
    var category = $('#category').val();
    var appointmentDate = $('#appointmentDate').val();
    var chiefComplaint = $('#chiefComplaint').val();
    var time = $('#time').val();
    
    $('#error-message').text('');

    if (!patientId || !category || !appointmentDate || !chiefComplaint || !time) {
        $('#error-message').text('Please fill in all required fields');
        isFormValid = false; 
        return false;
    } else {
        isFormValid = true; 
        return true;
    }
}

// Function to check appointment availability
function checkAppointmentAvailability() {
    var appointmentDate = $('#appointmentDate').val();
    var category = $('#category').val();


    $.ajax({
        type: 'POST',
        url: '../../php/check_availability.php', 
        data: { appointmentDate: appointmentDate , category: category},
        dataType: 'json',
        success: function(response) {
            if (response.success) {
                openConfirmationModal();
            } else {
                $('#error-message').text(response.message);
            }
        },
        error: function(xhr, status, error) {
            console.error('Error checking appointment availability: ' + error);
        }
    });
}

// Function to open the confirmation modal
function openConfirmationModal() {
    console.log('Opening confirmation modal');
    var modal = document.getElementById('confirmationModal');
    modal.style.display = 'block';
}

// Function to close the confirmation modal
function closeConfirmationModal() {
    var modal = document.getElementById('confirmationModal');
    var closeAppModal = document.getElementById('appointmentModal');
    modal.style.display = 'none';
    closeAppModal.style.display = 'none';
}

