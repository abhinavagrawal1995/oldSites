var img, canvas;
$('#coloredimage').load(function() {
    img = document.getElementById('coloredimage');
    canvas = document.createElement('canvas');
    canvas.width = img.width;
    canvas.height = img.height;
    canvas.getContext('2d').drawImage(img, 0, 0, img.width, img.height);
}).attr('src', 'ajax/team/colored.png');

var members;
$.getJSON('ajax/team/data/team.json', function(data) {
    members = data;
});

var currentColor;
$(document).on('mousemove', '.coloredimage', function(event) {
    var x = event.offsetX;
    var y = event.offsetY;

    var pixelData = canvas.getContext('2d').getImageData(x - 1, y - 1, 1, 1).data;

    var found = false;
    if (currentColor != hexcode(pixelData)) {
        for (var i in members.data) {
            var member = members.data[i];
            if (member.color == hexcode(pixelData)) {
                changeDetails(member);
                currentColor = hexcode(pixelData);
            }
        }
    }
});
$(document).on('click', '.coloredimage', function(event) {
    var x = event.offsetX;
    var y = event.offsetY;

    var pixelData = canvas.getContext('2d').getImageData(x - 1, y - 1, 1, 1).data;

    var found = false;
    if (currentColor != hexcode(pixelData)) {
        for (var i in members.data) {
            var member = members.data[i];
            if (member.color == hexcode(pixelData)) {
                changeDetails(member);
                currentColor = hexcode(pixelData);
            }
        }
    }
});

var changeDetails = function(member) {
    $('.member-name').html(member.name || "");
    $('.member-post').html(member.title || "");
};

var hexcode = function(pixelData) {
    var r = ("00" + pixelData[0].toString(16)).slice(-2);
    var g = ("00" + pixelData[1].toString(16)).slice(-2);
    var b = ("00" + pixelData[2].toString(16)).slice(-2);
    return "" + r + g + b;
};

var compareColor = function(hex1, hex2) {
    var diff = 0;
    for (var i = 1; i < 6; i+=2) {
        diff = Math.abs(hex1.charCodeAt(i) - hex2.charCodeAt(i));
        if(diff>2) {
            return false;
        }
    }
    return true;
};
