$(document).ready(function(){

    // script to type text in header
    var text = 'Ask a question...  Get an answer...  Go have fun...';

    // text is split up to letters
    $.each(text.split(''), function (i, letter) {

        // add 100*i ms delay to each letter 
        setTimeout(function () {

            // add the letter to the container
            $('.about h4').html($('.about h4').html() + letter);

        }, 100 * i);
    });

    $("#images > img:first-child").hide().delay(4000).fadeIn(4000);
    $("#images > img:nth-child(2)").hide().delay(4000).fadeIn(5000);
    $("#images > img:nth-child(3)").hide().delay(4000).fadeIn(6000);

});
