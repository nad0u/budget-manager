$(document).ready(function(){
    //disable console log
    console.log = function(){};

    $('a.chart-type').on('click', function(e){
        e.preventDefault();
        $('a.chart-type').removeClass('active');
        $(this).addClass('active');
        window.location = $(this).attr('href');
    });
});
