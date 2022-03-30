function newWindow() {
    window.open("/hey-innovation/Formacion_Front/HTML-CSS-JS/holaMundo.html", "targetWindow", "height=320px, width=150px")
}

function validateEmail() {
    let email = document.getElementById("email").value;
    var emailRegex = new RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}');
        if (!(emailRegex.test(email))) {
            return document.getElementsByClassName("displayError").style.display = "block";
        }else {
            return true;
        }
}


function validatePwd()
let pwd = document.getElementById("pwd").value;
var pwdRegex = /^[A-Za-z]\w{4,}$(?=.*\d)/;

if(pwd.value.match(pwdRegex)) {
    alert("Contraseña aceptada")
}else {
    document.getElementsByClassName("displayError").style.display = "block";
}