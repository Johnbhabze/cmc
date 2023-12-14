<?php
include '../../php/connection.php';
?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CMC | My Appointments</title>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <!-- <script src="../js/authentication.js"></script> -->
    <link rel="icon" type="image/x-icon" href="../../imgs/favicon.ico">
    <link href='https://fonts.googleapis.com/css?family=Inter' rel='stylesheet'>
    <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet" href="../../css/myAppointments.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />


</head>

<body>

    <!-- =============== Navigation Sidebar ================ -->
    <div class="container">
        <div class="navigation">
            <ul>
                <li>
                    <a href="user_dashboard.php">
                        <div class="logo">
                            <img src="../../imgs/logo(2).png" alt="">
                        </div>
                    </a>
                </li>

                <li>
                    <a href="user_dashboard.php">
                        <span class="icon">
                            <ion-icon name="home-outline"></ion-icon>
                        </span>
                        <span class="title">Home</span>
                    </a>
                </li>

                <li>
                    <a href="availableSlots.php">
                        <span class="icon">
                            <ion-icon name="time-outline"></ion-icon>
                        </span>
                        <span class="title">Available Slots</span>
                    </a>
                </li>

                <li>
                    <a href="myAppointments.php">
                        <span class="icon">
                            <ion-icon name="calendar"></ion-icon>
                        </span>
                        <span class="title">My Appointments</span>
                    </a>
                </li>

                <li>
                    <a href="myHistory.php">
                        <span class="icon">
                            <ion-icon name="document-text-outline"></ion-icon>
                        </span>
                        <span class="title">My History</span>
                    </a>
                </li>

                <li>
                    <a onclick="signoutClick(event)" id="logout">
                        <span class="icon">
                            <ion-icon name="log-out-outline"></ion-icon>
                        </span>
                        <span class="title">Sign Out</span>
                    </a>
                </li>
            </ul>
        </div>


        <!-- ========================= Main ==================== -->
        <div class="main">

            <div class="topbar">
                <div class="toggle">
                    <ion-icon name="menu-outline"></ion-icon>
                </div>

                <div class="user-dropdown">
                    <div class="user">
                        <img src="../../imgs/user.png" alt="">
                        <div class="user-info">
                            <p class="user-name">Angelica Dy</p>
                            <p class="user-email">angelica.dy@gmail.com</p>
                        </div>
                    </div>

                    <div class="dropdown-content">
                        <a href="myAppointments.php" class="appointments">
                            <ion-icon class="icon" name="calendar-outline"></ion-icon> My Appointments
                        </a>
                        <a href="availableSlots.php" class="slots">
                            <ion-icon class="icon" name="time-outline"></ion-icon> Available Slots
                        </a>
                        <a href="myHistory.php" class="history">
                            <ion-icon class="icon" name="document-text-outline"></ion-icon> My History
                        </a>
                        <a href="#" class="logout">
                            <ion-icon class="icon" name="log-out-outline"></ion-icon> Sign out
                        </a>
                    </div>
                </div>
            </div>

            <div class="appointments-title">
                <span style="color: #020303;">My</span>
                <span style="color: #28844B;"> Appointments

                </span>

            </div>


            <!-- ================ My dependents ================= -->
            <div class="appointments-page">
                <div class="dependents">
                    <div class="cardHeader">
                        <h2>My Dependents</h2>
                        <!-- Button to Open Add Dependent Modal -->
                        <a href="#" class="btn" onclick="openAddDependentModal()">
                            <ion-icon name="person-add-outline" class="add-icon"></ion-icon> Add Dependent
                        </a>

                    </div>

                    <!-- Dependent Details Section -->
                    <div class="dependent-details">
                      


                        <div class="dependent-card">
                            <p>Name: Angelica Dy</p>
                            <p>Age: 25</p>
                            <p>Sex: Male</p>
                            <button class="btn make-appointment-btn">Make Appointment</button>
                        </div>

                        <div class="dependent-card">
                            <p>Name: Angelica Dy </p>
                            <p>Age: 30</p>
                            <p>Sex: Female</p>
                            <button class="btn make-appointment-btn">Make Appointment</button>
                        </div> 
                    </div>
                </div>


                <!-- ================ My appointments Table Section ================= -->
                <div class="appointments-table">
                    <table id="myAppointmentsTable">
                        <thead>
                            <tr>
                                <td>Patient Name</td>
                                <td>Type</td>
                                <td>Schedule</td>
                                <td>Status</td>
                                <td></td>


                            </tr>
                        </thead>

                        <tbody>


                      </tbody>
                    </table>
                </div>


                <!-- Modal -->
                <form id="addDependentForm" onsubmit="submitAddDependentForm(event)">
                    <div class="modal" id="appointmentModal">
                        <div class="modal-content">
                            <span class="close" onclick="closeModal()">&times;</span>

                            <!-- Patient Information -->
                            <div class="modal-step" id="step1">
                                <h2>Patient Information</h2>

                                <div class="progress-bar-container">
                                    <div class="progress-bar">
                                        <div class="progress-step" id="progress1">1</div>
                                        <div class="progress-line"></div>
                                        <div class="progress-step" id="progress2">2</div>
                                        <div class="progress-line"></div>
                                        <div class="progress-step" id="progress3">3</div>
                                        <div class="progress-line"></div>
                                        <div class="progress-step" id="progress4">4</div>
                                    </div>
                                </div>


                                <!-- Left Side -->
                                <div class="left-side">
                                    <label for="firstName">First Name</label>
                                    <input type="text" id="firstName" name="firstName" placeholder="First Name" required>

                                    <label for="lastName">Last Name</label>
                                    <input type="text" id="lastName" name="lastName" placeholder="Last Name" required>

                                    <label for="middleName">Middle Name</label>
                                    <input type="text" id="middleName" name="middleName" placeholder="Middle Name">

                                    <label for="extensionName">Extension Name</label>
                                    <select id="extensionName" name="extensionName">
                                        <option value="Sr.">Sr.</option>
                                        <option value="Jr.">Jr.</option>
                                        <option value="N/A">N/A</option>
                                    </select>

                                    <label for="dob">Date of Birth</label>
                                    <input type="date" id="dob" name="dob" required>

                                    <label for="civilStatus">Civil Status</label>
                                    <select id="civilStatus" name="civilStatus" required>
                                        <option value="Single">Single</option>
                                        <option value="Married">Married</option>
                                        <option value="Divorced">Divorced</option>
                                        <option value="Widowed">Widowed</option>
                                    </select>
                                </div>

                                <!-- Right Side -->
                                <div class="right-side">
                                    <label for="sex">Sex</label>
                                    <select id="sex" name="sex" required>
                                        <option value="Female">Female</option>
                                        <option value="Male">Male</option>
                                    </select>

                                    <label for="religion">Religion</label>
                                    <input type="text" id="religion" name="religion" placeholder="Religion" required>

                                    <label for="nationality">Nationality</label>
                                    <input type="text" id="nationality" name="nationality" placeholder="Nationality" required>

                                    <label for="occupation">Occupation</label>
                                    <input type="text" id="occupation" name="occupation" placeholder="Occupation" required>

                                    <label for="cellphoneNumber">Cellphone Number</label>
                                    <input type="tel" id="cellphoneNumber" name="cellphoneNumber" placeholder="Cellphone Number" required>
                                </div>


                                <!-- Next Button with Icon -->
                                <button class="next1-button" onclick="nextStep()">
                                    Next <ion-icon name="arrow-forward-outline"></ion-icon>
                                </button>

                            </div>


                            <!-- Step 2: Address Information -->
                            <div class="modal-step" id="step2" style="display: none;">
                                <h2>Address Information</h2>

                                <div class="progress-bar-container">
                                    <div class="progress-bar">
                                        <div class="progress-step completed" id="progress1">✔</div>
                                        <div class="progress-line completed"></div>
                                        <div class="progress-step" id="progress2">2</div>
                                        <div class="progress-line"></div>
                                        <div class="progress-step" id="progress3">3</div>
                                        <div class="progress-line"></div>
                                        <div class="progress-step" id="progress4">4</div>
                                    </div>
                                </div>

                                <!-- Left Side -->
                                <div class="left-side">
                                    <label for="houseLotNo">House/ Lot No.</label>
                                    <input type="text" id="houseLotNo" name="houseLotNo" placeholder="House/ Lot No." required>

                                    <label for="street">Street</label>
                                    <input type="text" id="street" name="street" placeholder="Street" required>

                                    <label for="province">Province</label>
                                    <input type="text" id="province" name="province" placeholder="Province" required>
                                </div>

                                <!-- Right Side -->
                                <div class="right-side">
                                    <label for="city">City</label>
                                    <input type="text" id="city" name="city" placeholder="City" required>

                                    <label for="barangay">Barangay</label>
                                    <input type="text" id="barangay" name="barangay" placeholder="Barangay" required>

                                    <label for="postalCode">Postal Code</label>
                                    <input type="text" id="postalCode" name="postalCode" placeholder="Postal Code" required>
                                </div>

                                <!-- Previous and Next Buttons with Icons -->
                                <div class="button-container">
                                    <button class="prev-button" onclick="prevStep()">
                                        <ion-icon name="arrow-back-outline"></ion-icon> Previous
                                    </button>

                                    <button class="next-button" onclick="nextStep()">
                                        Next <ion-icon name="arrow-forward-outline"></ion-icon>
                                    </button>
                                </div>

                            </div>


                            <!-- Step 3: Family Background -->
                            <div class="modal-step" id="step3" style="display: none;">
                                <h2>Family Background</h2>

                                <div class="progress-bar-container">
                                    <div class="progress-bar">
                                        <div class="progress-step completed" id="progress1">✔</div>
                                        <div class="progress-line completed"></div>
                                        <div class="progress-step completed" id="progress2">✔</div>
                                        <div class="progress-line completed"></div>
                                        <div class="progress-step" id="progress3">3</div>
                                        <div class="progress-line"></div>
                                        <div class="progress-step" id="progress4">4</div>
                                    </div>
                                </div>
                                <!-- Left Side -->
                                <div class="left-side">
                                    <label for="spouseName">Spouse Name</label>
                                    <input type="text" id="spouseName" name="spouseName" placeholder="Spouse Name">

                                    <label for="spouseAddress">Spouse Address</label>
                                    <input type="text" id="spouseAddress" name="spouseAddress" placeholder="Spouse Address">
                                </div>

                                <!-- Right Side -->
                                <div class="right-side">
                                    <label for="fathersName">Father's Name</label>
                                    <input type="text" id="fathersName" name="fathersName" placeholder="Father's Name" required>

                                    <label for="motherMaidenName">Mother Maiden Name</label>
                                    <input type="text" id="motherMaidenName" name="motherMaidenName" placeholder="Mother Maiden Name" required>
                                </div>

                                <!-- Previous and Next Buttons with Icons -->
                                <div class="button-container">
                                    <button class="prev-button" onclick="prevStep()">
                                        <ion-icon name="arrow-back-outline"></ion-icon> Previous
                                    </button>

                                    <button class="next-button" onclick="nextStep()">
                                        Next <ion-icon name="arrow-forward-outline"></ion-icon>
                                    </button>
                                </div>
                            </div>


                            <!-- Step 4: Chief Complaint -->
                            <div class="modal-step" id="step4" style="display: none;">
                                <h2>Appointment Information</h2>

                                <div class="progress-bar-container">
                                    <div class="progress-bar">
                                        <div class="progress-step completed" id="progress1">✔</div>
                                        <div class="progress-line completed"></div>
                                        <div class="progress-step completed" id="progress2">✔</div>
                                        <div class="progress-line completed"></div>
                                        <div class="progress-step completed" id="progress3">✔</div>
                                        <div class="progress-line"></div>
                                        <div class="progress-step" id="progress4">4</div>
                                    </div>
                                </div>
                                <!-- Choose Category and Date -->
                                <div class="left-side">
                                    <label for="category">Choose a Category</label>
                                    <select id="category" name="category" required>
                                        <!-- Add your category options here -->
                                        <option value="Category1">Category 1</option>
                                        <option value="Category2">Category 2</option>
                                        <option value="Category3">Category 3</option>
                                    </select>

                                </div>

                                <div class="right-side">

                                    <label for="appointmentDate">Choose Date</label>
                                    <input type="date" id="appointmentDate" name="appointmentDate" required>
                                </div>


                                <!-- Full Width Chief Complaint Text Area -->
                                <label for="chiefComplaint">Chief Complaint</label>
                                <textarea id="chiefComplaint" name="chiefComplaint" rows="4" placeholder="State here the problem or symptoms you are experiencing and you want to be consulted.(Unsay imong gipamati/ ganahan ipakonsulta sa imong lawas)" required></textarea>

                                <!-- Previous and Submit Buttons with Icons -->
                                <div class="button-container">
                                    <button class="prev-button" onclick="prevStep()">
                                        <ion-icon name="arrow-back-outline"></ion-icon> Previous
                                    </button>

                                    <button class="submit-button" onclick="openConfirmationModal()">
                                        Submit
                                    </button>
                                </div>
                            </div>
                        </div>

                </form>
            </div>

        </div>


    </div>
    </div>

    <!-- HTML for the Confirmation Modal -->
    <div id="confirmationModal" class="confirmation-modal" style="display: none;">

        <div class="confirmation-modal-content">

            <h2>Are you sure you want to submit this form?</h2>
            <p>You are about to submit the form. Please Note the you won't able to edit the form after submitting it. Do
                you want to proceed?</p>

            <div class="confirm-button-container">
                <button class="close-button" onclick="closeConfirmationModal()">Cancel</button>
                <button class="confirm-button" onclick="confirmSubmit()">Yes</button>
            </div>
        </div>
    </div>



    <div id="loader" class="loader"></div>
    <div id="successModal" class="success-modal">
        <div class="modal-content">

            <div style="text-align: center;">
                <img src="../../imgs/success.png" alt="Check Icon">
                <h2>Thank you for trusting Cebu Medical Care</h2>
                <p>Your appointment has been successfully created. Please arrive 10 minutes prior to your scheduled date
                    and time.</p>

                <div class="booking-details">
                    <h3>Queue Number</h3>
                    <p style="font-weight: bold;" id="queueNumber">A001</p>
                    <p style="margin-top: 10px;">Patient Name: <span id="patientName">John Doe</span></p>
                    <p>Appointment Date: <span id="appointmentDate">12/15/2023</span></p><br>

                    <p class="note">Note: Wear face mask and observe 1 meter distance. To check your status, go
                        to your My Appointments Tab.</p>
                </div>


            </div>
            <div style="text-align: center; margin-top: 20px;">
                <button class="cancel-button" onclick="closeSuccessModal()">Close</button>
                <button class="print-button" onclick="printSuccessModal()">Print</button>
            </div>
        </div>
    </div>



    <!-- Viewing Appointment Details Modal -->
    <div id="viewAppointmentDetailsModal" class="modal">
        <!-- Modal content -->
        <div class="modal-content">
            <span class="close" onclick="closeViewAppointmentModal()">&times;</span>
            <h2>Appointment Details</h2>
            <div id="viewAppointmentModalBody">
                <!-- Placeholder data -->
                <!-- <p><strong>Name:</strong> John Doe</p>
                <p><strong>Date of Birth:</strong> 01/01/1990</p>
                <p><strong>Cellphone Number:</strong> +1234567890</p>
                <p><strong>Queue No.:</strong> Q123</p>
                <p><strong>Category:</strong> Checkup</p>
                <p><strong>Appointment Date:</strong> 2023-12-01 10:00 AM</p>
                <p><strong>Chief Complaint:</strong> Placeholder chief complaint</p>
                <p><strong>Status:</strong> Scheduled</p> -->
            </div>
        </div>
    </div>





    <!-- Add Dependent Modal -->
    <div class="modal" id="addDependentModal">
        <div class="modal-content-dependent">
            <span class="close" onclick="closeAddDependentModal()">&times;</span>

            <!-- Form Content Here -->
            <form id="addDependentForm" method="post" action="../../php/add_dependents.php">
                <!-- Step 1: Patient Information -->
                <div class="modal-step">

                    <h2>Patient Information</h2>

                    <!-- Left Side -->
                    <div class="left-side">
                        <label for="firstName">First Name</label>
                        <input type="text" id="firstName" name="firstName" placeholder="First Name" required>

                        <label for="lastName">Last Name</label>
                        <input type="text" id="lastName" name="lastName" placeholder="Last Name" required>


                        <label for="middleName">Middle Name</label>
                        <input type="text" id="middleName" name="middleName" placeholder="Middle Name">

                        <label for="extensionName">Extension Name</label>
                        <select id="extensionName" name="extensionName">
                            <option value="Sr.">Sr.</option>
                            <option value="Jr.">Jr.</option>
                            <option value="N/A">N/A</option>
                        </select>

                        <label for="dob">Date of Birth</label>
                        <input type="date" id="dob" name="dob" value="<?php echo date('Y-m-d'); ?>" required>


                        <label for="civilStatus">Civil Status</label>
                        <select id="civilStatus" name="civilStatus" required>
                            <option value="Single">Single</option>
                            <option value="Married">Married</option>
                            <option value="Divorced">Divorced</option>
                            <option value="Widowed">Widowed</option>
                        </select>
                    </div>

                    <!-- Right Side -->
                    <div class="right-side">
                        <label for="sex">Sex</label>
                        <select id="sex" name="sex" required>
                            <option value="Female">Female</option>
                            <option value="Male">Male</option>
                        </select>

                        <label for="religion">Religion</label>
                        <input type="text" id="religion" name="religion" placeholder="Religion" required>

                        <label for="nationality">Nationality</label>
                        <input type="text" id="nationality" name="nationality" placeholder="Nationality" required>

                        <label for="occupation">Occupation</label>
                        <input type="text" id="occupation" name="occupation" placeholder="Occupation" required>

                        <label for="cellphoneNumber">Cellphone Number</label>
                        <input type="tel" id="cellphoneNumber" name="cellphoneNumber" placeholder="Cellphone Number" required>

                    </div>

                    <hr>

                    <!-- Step 2: Address Information -->
                    <div class="modal-step">
                        <h2>Address Information</h2>

                        <!-- Left Side -->
                        <div class="left-side">
                            <label for="houseLotNo">House/ Lot No.</label>
                            <input type="text" id="houseLotNo" name="houseLotNo" placeholder="House/ Lot No." required>

                            <label for="street">Street</label>
                            <input type="text" id="street" name="street" placeholder="Street" required>

                            <label for="province">Province</label>
                            <input type="text" id="province" name="province" placeholder="Province" required>
                        </div>

                        <!-- Right Side -->
                        <div class="right-side">
                            <label for="city">City</label>
                            <input type="text" id="city" name="city" placeholder="City" required>

                            <label for="barangay">Barangay</label>
                            <input type="text" id="barangay" name="barangay" placeholder="Barangay" required>

                            <label for="postalCode">Postal Code</label>
                            <input type="text" id="postalCode" name="postalCode" placeholder="Postal Code" required>
                        </div>

                        <hr>

                        <!-- Step 3: Family Background -->
                        <div class="modal-step">
                            <h2>Family Background</h2>
                            <!-- Left Side -->
                            <div class="left-side">
                                <label for="spouseName">Spouse Name</label>
                                <input type="text" id="spouseName" name="spouseName" placeholder="Spouse Name">

                                <label for="spouseAddress">Spouse Address</label>
                                <input type="text" id="spouseAddress" name="spouseAddress" placeholder="Spouse Address">
                            </div>

                            <!-- Right Side -->
                            <div class="right-side">
                                <label for="fathersName">Father's Name</label>
                                <input type="text" id="fathersName" name="fathersName" placeholder="Father's Name" required>

                                <label for="motherMaidenName">Mother Maiden Name</label>
                                <input type="text" id="motherMaidenName" name="motherMaidenName" placeholder="Mother Maiden Name" required>
                            </div>

                            <!-- Submit Button -->
                            <div class="button-container">
                                <button class="dependent-submit-button" type="submit">
                                    Add Dependent
                                </button>
                            </div>
            </form>
        </div>
    </div>




    <!-- =========== Scripts =========  -->
    <script src="../../js/main.js"></script>
    <script src="../../js/modal.js"></script>
    <script src="../../js/script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    </script>


</body>

</html>