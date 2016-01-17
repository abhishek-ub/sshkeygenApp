var socket, host;
host = "ws://localhost:3002";

function connect () {
    try {
        socket = new WebSocket(host);
        
        console.log("socket state :" + socket.readyState);

        socket.onopen = function() {
            console.log("socket opened " + socket.readyState + "(open)");
        }

        socket.onclose = function() {
            console.log("socket closed " + socket.readyState + "(closed)");
        }

        socket.onmessage = function(msg) {
            console.log("got message from sock " + msg.data);
            $("#param").val(msg.data);
        }

    } catch (exception) {

        console.log("failed to create web socket");
    }
}

function send () {
    var text = $("#param").val();

    try {
        socket.send(text);
    } catch (exception) {
        //retry logic should go
        console.log("failed to send data");
    }
}

$(function () {
    // create socket connection
    connect();

    $("#data-form").on("submit", function (e) {
        e.preventDefault();
        send();
    });
});
