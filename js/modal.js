let currentStep = 1; // Initialize current step

// Open the modal when the "Make Appointment" button is clicked
$('.make-appointment-btn').on('click', function () {
    currentStep = 1; // Reset current step to 1 when opening the modal
    $('#appointmentModal').css('display', 'block');
    showStep(currentStep);
});

// Close the modal
function closeModal() {
    Swal.fire({
        title: 'Are you sure?',
        text: 'You will exit the form and lose your progress.',
        icon: 'warning',
        showCancelButton: true,
        cancelButtonText: 'Cancel',
        confirmButtonText: 'Yes, close it!'

    }).then((result) => {
        if (result.isConfirmed) {
            // If user clicks "Yes", close the modal
            $('#appointmentModal').css('display', 'none');
        }
        // If user clicks "Cancel", do nothing
    });
}

function showStep(stepNumber) {
    $('.modal-step').css('display', 'none');
    $('#step' + stepNumber).css('display', 'block');
    updateProgressBar(stepNumber);
    currentStep = stepNumber;
}

function updateProgressBar(stepNumber) {
    for (let i = 1; i <= 4; i++) {
        const progressStep = $('#progress' + i);
        const progressLine = $('.progress-line').eq(i - 1);

        if (i < stepNumber) {
            progressStep.addClass('completed').html('✔');
            progressLine.addClass('completed');
        } else {
            progressStep.removeClass('completed').html(i);
            progressLine.removeClass('completed');
        }
    }
}

// Move to the next step with validation
function nextStep() {
    // Check if the fields are empty based on the current step
    var isStepValid = validateStep(currentStep);

    if (isStepValid) {
        showStep(currentStep + 1);
    } else {
        // Display an error message or handle validation failure
        Swal.fire({
            icon: 'error',
            title: 'Validation Error',
            text: 'Please fill in all required fields'
        });
    }
}

// Validate fields in the current step
function validateStep(stepNumber) {
    var isValid = true;

    // Select the input fields in the current step
    var inputFields = $('#step' + stepNumber + ' input[required], #step' + stepNumber + ' select[required]');

    // Loop through each input field to check if it's empty
    inputFields.each(function () {

        if (
            (stepNumber !== 3 || ($(this).is('[name=spouseName], [name=spouseAddress]') && $(this).val().trim() !== ''))
            &&
            ($(this).val().trim() === '' && !$(this).is('[name=middleName], [name=extensionName], [name=spouseName], [name=spouseAddress]'))
        ) {
            isValid = false;
            return false;
        }
    });

    return isValid;
}


// Move to the previous step
function prevStep() {
    showStep(currentStep - 1);
}


function openAddDependentModal() {
    var addDependentModal = document.getElementById('addDependentModal');
    addDependentModal.style.display = 'block';
}

function closeAddDependentModal() {
    var addDependentModal = document.getElementById('addDependentModal');
    addDependentModal.style.display = 'none';
}

function submitAddDependentForm(event) {

    event.preventDefault();
}


//FOR APPOINTMENT DETAILS VIEWING

$('.view-button').on('click', function () {
    openViewAppointmentModal();
});


function viewAppointment() {
    openViewAppointmentModal();

}

function openViewAppointmentModal() {
    var viewAppointmentModal = document.getElementById('viewAppointmentDetailsModal');
    viewAppointmentModal.style.display = 'block';
    // You may fetch and update the actual appointment details here
}

// Close the viewing appointment details modal
function closeViewAppointmentModal() {
    var viewAppointmentModal = document.getElementById('viewAppointmentDetailsModal');
    viewAppointmentModal.style.display = 'none';
}

//FOR CONFIRMATION MODAL IN MAKING APPOINTMENT

$('.submit-button').on('click', function () {
    openConfirmationModal();
});

function openConfirmationModal() {
    console.log('Opening confirmation modal');  // Add this line for debugging
    var modal = document.getElementById('confirmationModal');
    modal.style.display = 'block';
}

// Function to close the confirmation modal
function closeConfirmationModal() {
    var modal = document.getElementById('confirmationModal');
    modal.style.display = 'none';
}

// Function to handle the confirmation and submit the form
function confirmSubmit() {
    showSuccessModal();

    closeConfirmationModal();
}


$('.confirm-button').on('click', function () {
    showSuccessModal();
});

// Function to open the success modal
function showSuccessModal() {
    // Show the loader
    document.getElementById('loader').style.display = 'block';

    setTimeout(function () {
        // Hide the loader
        document.getElementById('loader').style.display = 'none';

        // Show the success modal
        document.getElementById('successModal').style.display = 'block';
    }, 1000);

}
// Function to close the success modal
function closeSuccessModal() {
    var successModal = document.getElementById('successModal');
    successModal.style.display = 'none';
}

// Function to print the success modal
function printSuccessModal() {
    window.print(); // Trigger browser's print functionality
}






