var header_images = $('.intro-header').data('images');
var header_list   = header_images.split(',');
var header_pos    = 0;
var header_path   = '/img/headers/';
var header_rotate_interval = 5000;

function setHeader(img) {
	$('.intro-header').css({'background-image': 'url('+header_path+img.trim()+')'});
}

$.fn.preload = function() {
    this.each(function(){
        $('<img/>')[0].src = header_path + this.trim();
    });
}

$(header_list).preload();

setInterval(function() {
	header_pos = (header_pos+1) % header_list.length;
	setHeader(header_list[header_pos].trim());
}, header_rotate_interval);