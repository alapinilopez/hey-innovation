function messaging() {
    let bar = document.getElementById("messaging");
    if (bar.style.display == "none") {
        bar.style.display = "block";
    } else {
        bar.style.display = "none";
    }

    let panel = document.getElementById("messaging-panel");
    if (panel.style.display == "none") {
        panel.style.display = "block";
    } else {
        panel.style.display = "none";
    }

    document.getElementById("rotate").style.transform = "rotate(90deg)";
}

function john() {
    let row = document.getElementById("john-mail");
    if(row.style.display == "none") {
        row.style.display = "block";
    } else {
        row.style.display = "none";
    }
}

function calendar() {
    let panel = document.getElementById("reminders-calendar");
    if (panel.style.display == "none") {
        panel.style.display = "block";
    } else {
        panel.style.display = "none";
    }
}

function care() {
    let panel = document.getElementById("care");
    if (panel.style.display == "none") {
        panel.style.display = "block";
    } else {
        panel.style.display = "none";
    }
}

// KONAMI CODE
var pattern = ['ArrowUp', 'ArrowUp', 'ArrowDown', 'ArrowDown', 'ArrowLeft', 'ArrowRight', 'ArrowLeft', 'ArrowRight', 'b', 'a'];
var current = 0;
var keyHandler = function (event) {
    if (pattern.indexOf(event.key) < 0 || event.key !== pattern[current]) {
        current = 0;
        return;
    }
    current ++;

    if (pattern.length === current) {
        current = 0;
        window.open("https://www.youtube.com/watch?v=9nNevy8K618");
    }
}

// Listen for keydown events
document.addEventListener('keydown', keyHandler, false);