function fetchPatient(patientID) {
    $.ajax({
      url: '../../php/appointments/fetch_patient.php',
      type: 'POST',
      data: { id: patientID },
      success: function (data) {
        const patientData = JSON.parse(data);
        document.getElementById('appointmentID').textContent = patientData.appointment_id;
        document.getElementById('appointmentID').style.display = "none";
        document.getElementById('patientQueue').textContent = patientData.queue_no;
        document.getElementById('patientName').textContent = patientData.last_name + ", " + patientData.first_name + " " + patientData.middle_name + " " + patientData.extension_name;
        document.getElementById('patientBirthdate').textContent = patientData.birhdate;
        document.getElementById('patientSex').textContent = patientData.sex;
        document.getElementById('patientContact').textContent = patientData.phone_number;
        document.getElementById('patientEmail').textContent = patientData.email;
        document.getElementById('patientOccupation').textContent = patientData.occupation;
        document.getElementById('patientNationality').textContent = patientData.nationality;
        document.getElementById('patientReligion').textContent = patientData.religion;
        document.getElementById('patientStatus').textContent = patientData.civil_status;
        document.getElementById('patientAddress').textContent = patientData.house_no + ", " + patientData.street + ", " + patientData.barangay + ", " + patientData.municipality + ", " + patientData.province;
        document.getElementById('patientSpouse').textContent = patientData.spouse_name;
        document.getElementById('patientSpouseAdd').textContent = patientData.spouse_address;
        document.getElementById('patientFather').textContent = patientData.fathers_name;
        document.getElementById('patientMother').textContent = patientData.mothers_maiden_name;
        // document.getElementById('patientGuardian').textContent = patientData.guardian;
        document.getElementById('patientDate').textContent = patientData.day;
        document.getElementById('patientTime').textContent = patientData.time;
        document.getElementById('patientID').textContent = patientData.patient_id;
        document.getElementById('patientConcern').textContent = patientData.cheif_complaint;
  
        document.querySelector('.decline').id = patientData.appointment_id;
        document.querySelector('.decline').setAttribute('onclick', 'deleteAppt(' + patientData.appointment_id + ')');
        // console.log(data);
      }
    });
  }