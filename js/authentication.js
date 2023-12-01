var xhttp = new XMLHttpRequest();

// <============== SIGN IN ACCOUNT / LOG IN ================>
function signinSubmit(e){
    var url = "../php/signin_action.php";
    var data = $("#signinForm").serialize();
    var urlData = url+"?"+data;
    xhttp.open("GET", urlData, true);
    xhttp.send();
    xhttp.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            var res = JSON.parse(this.responseText);
            if(res["status"] == 200){
                $('#signinForm')[0].reset();                           
                window.location.replace('../public/dashboard.php');
            }else{
                document.getElementById('errorMsg').innerText = res.message;
            }
        }
    };
    e.preventDefault();
}


// <============== REGISTER ACCOUNT / SIGN UP ================>
function signupSubmit(e){
    var data = $("#signupForm").serialize();
    $.ajax({
        type : 'POST',
        url : '../php/signup_action.php',
        data : data,

        success : function(response) {
            var res = JSON.parse(response);
            if(res.message == 'Account created successfully.'   ){
                document.getElementById('errorMsg').style.color = 'green';
                document.getElementById('errorMsg').innerText = res.message;
            
            }else {
                document.getElementById('errorMsg').innerText = res.message;
            }
            if(res["status"] == 200){
                $('#signupForm')[0].reset();
            }
        }
        
    });
    e.preventDefault();
}


// <============== SIGNOUT ACCOUNT ================>
function signoutClick(e){
    var url = "../php/signout_action.php";
    xhttp.open("GET", url, true);
    xhttp.send();
    xhttp.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            var res = JSON.parse(this.responseText);
            if(res["status"] == 200){
                window.location.replace('../public/index.php');
            }
        }
    };
}


// <============== DISPLAY ALL LIST OF BOOKS IF LOADED ================>
// function fetchBooks() {
//     $.ajax({
//         url: "../php/list_allBooks_action.php",
//         method: "GET",
//         success: function(response) {
//             var books = JSON.parse(response);
//             $('#booksTable tbody').empty();
//             if (books.length > 0) {
//                 $.each(books, function(index, book) {
//                     $('#booksTable tbody').append(
//                         '<tr>' +
//                             '<td>' + book.book_code + '</td>' +
//                             '<td>' + book.title + '</td>' +
//                             '<td>' + book.author + '</td>' +
//                             '<td>' + book.genre + '</td>' +
//                         '</tr>'
//                     );
//                 });
//             } else {
//                 $('#booksTable tbody').append(
//                     '<tr>' +
//                         '<td></td>' +
//                         '<td></td>' +
//                         '<td></td>' +
//                         '<td></td>' +
//                         '<td colspan="5">No available books.</td>' +
//                     '</tr>'
//                 );
//             }
//         },
//     });
// }

// $(document).ready(function() {
//     fetchBooks();
// });


// <============== DISPLAY LIST OF BORROWED BOOKS IF LOAD ================>
// function fetchBorrowedBooks() {
//     $.ajax({
//         url: "../php/list_borrowed_books_action.php",
//         method: "GET",
//         success: function(response) {
//             var books = JSON.parse(response);
//             $('#borrowedBooksTable tbody').empty();
//             if (books.length > 0) {
//                 $.each(books, function(index, book) {
//                     $('#borrowedBooksTable tbody').append(
//                         '<tr>' +
//                             '<td>' + book.book_code + '</td>' +
//                             '<td>' + book.title + '</td>' +
//                             '<td>' + book.author + '</td>' +
//                             '<td>' + book.genre + '</td>' +
//                         '</tr>'
//                     );
//                 });
//             } else {
//                 $('#borrowedBooksTable tbody').append(
//                     '<tr>' +
//                         '<td></td>' +
//                         '<td></td>' +
//                         '<td></td>' +
//                         '<td></td>' +
//                         '<td colspan="5">No available books.</td>' +
//                     '</tr>'
//                 );
//             }
//         },
//         error: function() {
//             console.log("Error fetching books.");
//         }
//     });
// }
// document.addEventListener('DOMContentLoaded', function() {
//     fetchBorrowedBooks();
// });
// $(document).ready(function() {
//     fetchBorrowedBooks();
// });


// <============== DISPLAY ALL BOOKS ================>
// function allBooks() {
//     var xhttpAllBooks = new XMLHttpRequest();
//     var url = "../php/show_total_allBooks.php";
//     xhttpAllBooks.open("GET", url, true);
//     xhttpAllBooks.onreadystatechange = function() {
//         if (xhttpAllBooks.readyState == 4) {
//             if (xhttpAllBooks.status == 200) {
//                 var data = JSON.parse(xhttpAllBooks.responseText);
//                 var allBooks = data.total_allBooks;
//                 document.getElementById('totalAllBooks').innerText = allBooks;
//             } else {
//                 console.error("Error fetching data. Status code: " + xhttpAllBooks.status);
//             }
//         }
//     };
//     xhttpAllBooks.send();
// }
// $(document).ready(function(){
//     allBooks();
// });


// <============== SHOW TOTAL OF AVAILABLE BOOKS IF LOAD ================>
// function displayAvailableBooks() {
//     var xhttpAvailableBooks = new XMLHttpRequest();
//     var url = "../php/show_total_availableBooks.php";
//     xhttpAvailableBooks.open("GET", url, true);
//     xhttpAvailableBooks.onreadystatechange = function() {
//         if (xhttpAvailableBooks.readyState == 4) {
//             if (xhttpAvailableBooks.status == 200) {
//                 var data = JSON.parse(xhttpAvailableBooks.responseText);
//                 var availableBooks = data.total_availableBooks;
//                 document.getElementById('totalAvailableBooks').innerText = availableBooks;
//             } else {
//                 console.error("Error fetching data. Status code: " + xhttpAvailableBooks.status);
//             }
//         }
//     };
//     xhttpAvailableBooks.send();
// }
// $(document).ready(function(){
//     displayAvailableBooks();
// });


// // <============== SHOW TOTAL OF BORROWED BOOKS IF LOAD ================>
// function borrowedBooks() {
//     var xhttpBorrowedBooks = new XMLHttpRequest();
//     var url = "../php/show_total_borrowedBooks.php";
//     xhttpBorrowedBooks.open("GET", url, true);
//     xhttpBorrowedBooks.onreadystatechange = function() {
//         if (xhttpBorrowedBooks.readyState == 4) {
//             if (xhttpBorrowedBooks.status == 200) {
//                 var data = JSON.parse(xhttpBorrowedBooks.responseText);
//                 var borrowedBooksBooks = data.total_borrowedBooks;
//                 document.getElementById('totalBorrowedBooks').innerText = borrowedBooksBooks;
//             } else {
//                 console.error("Error fetching data. Status code: " + xhttpBorrowedBooks.status);
//             }
//         }
//     };
//     xhttpBorrowedBooks.send();
// }
// $(document).ready(function(){
//     borrowedBooks();
// });





// <============= SHOW PASSWORD INTO TEXT ================>
function togglePasswordVisibility(icon) {
const passwordInput = icon.previousElementSibling; // Get the previous sibling, which is the input element

    if (passwordInput.type === "password") {
        icon.className = "pass-toggle-btn fa fa-eye-slash";
        passwordInput.type = "text";
    } else {
        icon.className = "pass-toggle-btn fa fa-eye";
        passwordInput.type = "password";
    }
}


// <============== SHOW EYE IF THE FIELD IS NOT EMPTY ================>
function input() {
    const hidePass = document.getElementById('pass-toggle-btn');
    const pass = document.getElementById('password');

    if (pass !== null) {
        if (pass.value === '') {
            hidePass.style.display = 'none';
        } else {
            hidePass.style.display = 'block';
        }
    }

    const hidePasst = document.getElementById('pass-toggle-btn-two');
    const conPass = document.getElementById('confirm_password');

    if (conPass !== null) {
        if (conPass.value === '') {
            hidePasst.style.display = 'none';
        } else {
            hidePasst.style.display = 'block';
        }
    }
}
