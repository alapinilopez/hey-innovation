$(document).ready(function() {
    // $("#reviews").hide();

    // $("#critica").change(function() {
    //     $("#reviews").hide();
    //     var value =  $("#ratings").val();
        
    //     if (value == "Todas") {
    //         $("#critica").show();
    //     } else {
    //         $("#critica[value]" = value).show();
    //     }
    // })

    $("#ratings").change(function() {
        
        var selectedRating = $(this).children("option:selected").val();
        if(selectedRating == "Todas") {
            $(".critica").show();
        } else {
            $(".critica").hide();
            $(".critica[value=" + selectedRating +"]").show();   
        }
    })
})