$(document).ready(function () {
        // Start work gallery
        $('#Grid').mixitup();
        });
        $('.gallery').each(function() { // the containers for all your galleries
            $(this).magnificPopup({
                delegate: 'a', // the selector for gallery item
                type: 'image',
                gallery: {
                  enabled:true
                }
            });
        });

$(document).ready(function() {
$('.carousel').carousel({
		  interval: 3500, // in milliseconds
		  pause: 'none' // set to 'true' to pause slider on mouse hover
		})
})