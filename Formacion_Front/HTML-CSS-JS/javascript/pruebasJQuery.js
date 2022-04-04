$(document).ready(function(){
    $("#hello").on("click", function(){
        // Nueva ventana
        window.open("https://www.marca.com/futbol.html","holaMundo","height=790", "width=500px");
    })

    $("#email").focusout(function() {
        var VAL = this.value;
        var email = new RegExp(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/);

        if(email.test(VAL)) {
            return true;
        } else {
            return alert("Introduzca un email válido");
        }
    });

    $("#password").focusout(function () {
        var VAL = this.value;
        var pwd = new RegExp(/^((?=.*\d).{4,})$/);

        if(pwd.test(VAL)) {
            return true;
        }else {
            return alert("Introduzca una contraseña válida");
        }
    })

    $("img")
    .mouseover(function() {
        $(this).attr("src", "https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Unofficial_JavaScript_logo_2.svg/640px-Unofficial_JavaScript_logo_2.svg.png");
    })
    .mouseout(function() {
        $(this).attr("src", "https://programarfacil.com/wp-content/uploads/2015/08/jQurery.png");
    })


    $("#checks").on("click", function (){
        var boxes = $("input[type=checkbox]:checked");
        let boxesValue = "";
        
        for (var i = 0; i < boxes.length; i++) {
            boxesValue += boxes[i].value + "\n";
        }
        if (boxesValue.length != 0) {
                return alert(boxesValue);
            } else {
                return alert("Seleccione alguna casilla");
            }
    });

    $("#radio").on("click", function () {
        var radio = $("input[type=radio]:checked");

        if (radio.val() == undefined) {
            alert("Seleccione una opción");
        } else {
            alert(radio.val());
        }
      })

    $("select.optionA").change(function () {
        var value = $(this).children("option:selected");
        var optionB = $("select.optionB");
        optionB.append(value);
    });


});