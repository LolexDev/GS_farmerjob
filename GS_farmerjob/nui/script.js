window.addEventListener('message', function (event) {
    let action = event.data.action;
    if (action == "showCounter") {
        $(".counter span").text(0);
        $(".counter").fadeIn(250);
    } else if (action == "hideCounter") {
        $(".counter").fadeOut(250);
    } else if (action == "updateCounter") {
        $(".counter span").text(event.data.value.toString());
    }
});