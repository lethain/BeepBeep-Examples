var update = function() {
    $("#time").load("/home/time");
}
setInterval(update, 1000);