jQuery(document).ready(function ($) {
    /*** responsive***/
    //alert('hallo');

    function resizeWindow(e) {
        var newWindowWidth = $(window).width();

        // If width width is below 600px, switch to the mobile stylesheet
        if (newWindowWidth < 576) {
            $('#top-nav').removeClass('fixedsticky');
        }
        if (newWindowWidth > 426) {

        }

    }
    $('.carousel').carousel();
    stickybits('.fixedsticky', {useStickyClasses: true});
    $(window).bind("resize", resizeWindow);
    
    $('.dropdown-header').on("click", function (e) {
        $(this).next('ul').toggleClass('show');
        e.stopPropagation();
        e.preventDefault();
    });
    $('[class*="sub-cat-"] > div').each(function(){
        if($(this).hasClass('d-flex')){
            console.log("Found");
           $(this).parent('div').addClass('sub-cat-large');
        }
    });
//    if($('[class*="sub-cat-"] > div').hasClass('d-flex')){
//        console.log("Found");
//        $(this).parent('div')
//                .css('border','1px solid red');
//                //.addClass('sub-cat-large');
//    }
});
