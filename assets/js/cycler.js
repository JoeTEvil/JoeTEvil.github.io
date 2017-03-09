function cycleBackgrounds() {
	var index = 0;

	$imageEls = $('.geekmatic'); // Get the images to be cycled.

	setInterval(function () {
		// Get the next index.  If at end, restart to the beginning.
		index = index + 1 < $imageEls.length ? index + 1 : 0;
		// Show the next image.
		$imageEls.eq(index).addClass('show');
		// Hide the previous image.
		$imageEls.eq(index - 1).removeClass('show');

	}, 30);
};

// Document Ready.
$(window).on('load', function(){
	cycleBackgrounds();
});