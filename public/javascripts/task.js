function updateCounter(incrementOrDecrement) {
  currentValue = parseInt($('.task-active-counter').html());
  if (incrementOrDecrement === 'increment') {
    $('.task-active-counter').html(currentValue + 1);
  } else {
    $('.task-active-counter').html(currentValue - 1);
  }
}

$('.task-name').click(function() {
  var $_this = $(this);
	$.ajax({
    context: $(this),
		method: "PUT",
		url: "/tasks/" + $(this).attr('data-value'),
		data: { completed_at: $.now() }
	})
		.done(function() {
      var $taskItem = $(this).parent('.task-item');

      if ($taskItem.hasClass('completed')) {
        $taskItem.removeClass('completed');
        updateCounter('increment');
      } else {
        $taskItem.addClass('completed');
        updateCounter('decrement');
      }
		});
});