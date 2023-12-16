// Drag and drop of patient's card
const appointmentContainer = document.querySelectorAll('.appointmentContainer');
const clientAppointments = document.querySelectorAll('.clientAppointment');

clientAppointments.forEach(clientAppointment => {
  clientAppointment.addEventListener('dragstart', (e) => { e.dataTransfer.setData('text/plain', clientAppointment.id) });
});

appointmentContainer.forEach(appointmentContainer => {
  appointmentContainer.addEventListener('dragover', (e) => { e.preventDefault() });
});

// Updates database to in progress
const InProgress = document.getElementById("inProgress");
InProgress.addEventListener('drop', (e) => {
  e.preventDefault();
  const inProgressId = e.dataTransfer.getData('text/plain');
  const dragProgress = document.getElementById(inProgressId);
  InProgress.appendChild(dragProgress);
  inProgress(inProgressId);
});

function inProgress(apptId) {
  $.ajax({
    url: '../../php/appointments/update_patient.php',
    type: 'POST',
    data: { id: apptId },
    success: function () {
      console.log("Appointment already in progress!");
    }
  });
}

// Updates database to completed
const Completed = document.getElementById("Completed");
Completed.addEventListener('drop', (e) => {
  e.preventDefault();
  const CompletedId = e.dataTransfer.getData('text/plain');
  const dragCompleted = document.getElementById(CompletedId);
  Completed.appendChild(dragCompleted);
  completed(CompletedId);
});

function completed(apptId) {
  $.ajax({
    url: '../../php/appointments/completed_patient.php',
    type: 'POST',
    data: { id: apptId },
    success: function () {
      console.log("Appointment already completed!");
    }
  });
}

function deleteAppt(apptID) {
  if (confirm("Are you sure you want to delete an appointment? ") == true) {
    $.ajax({
      url: '../../php/appointments/delete_patient.php',
      type: 'GET',
      data: { id: apptID },
      success: function () {
        $('#patientContainer').css('display', 'none');
        setTimeout(location = 'index.php',5000);
      }
    })
  }
}