const slotter = document.getElementById('availableSlots');
const appt = document.getElementById('appointments');

slotter.style.display = "none";
appt.style.display = "block";

function slots(){
    slotter.style.display = "block";
    appt.style.display = "none";
    console.log('Script for slots is running!');  
}

function appointment(){
    slotter.style.display = "none";
    appt.style.display = "block";
    console.log('Script for appointment is running!');
}

const activatedNav = document.querySelectorAll('.navigation ul li');
    activatedNav.forEach(element => {
        element.addEventListener('click', ()=>{
            activatedNav.forEach(item => {
                item.style.background = "";
            });
            element.style.background = "var(--secondary)";
        });
    });