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
}

function calendar() {
    let panel = document.getElementById("calendar");
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

// CAMBIAR IMAGEN SEGUN EL MEDIA QUERY
function mobileImage(mobileSize) {
    let messageBar = document.getElementById("messaging");
    let messagePanel = document.getElementById("messaging-panel");
    
    if (mobileSize.matches) {
        messageBar.src = "Responsive/images/Barra_Messaging_Smartphone.png"
        messagePanel.src = "Responsive/images/messaging_panel_smartphone.png"
    } else {
        messagePanel.src = "/Responsive/images/Mensajes.png"
    }

    var mobileSize = window.matchMedia("(max-width: 640px)");
    care(mobileSize);
    mobileSize.addListener(care);
}