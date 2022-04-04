$(document).ready(function() {
    
    $("#critica").change(function() {
        $("#critica").hide();
        var value =  $("#ratings").val();
        
        if (value == "Todas") {
            $("#critica").show();
        } else {
            $("#critica[value]" = value).show();
        }
    })
})