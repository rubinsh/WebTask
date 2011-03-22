// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
    $("#task_due_date").datepicker({ dateFormat: 'yy-mm-dd' });
    //"option", "altFormat", 'yy-mm-dd'


});

//$(function() {
//		$( "#sortable" ).sortable();
//		$( "#sortable" ).disableSelection();
//	});

//$(function() {
//    $("#filters_accordion").accordion({ collapsible: true, header: 'h3', fillSpace: true });
//    $("#categories_accordion").accordion({ collapsible: true, header: 'h3', fillSpace: true });
//});

$(function() {
    $('#task-list td#task-completed-checkbox').click(function(event)
    {
        var $target = $(event.target);
        var taskId = $target.attr("id");
        var theTask = $('#mark_complete_link_' + taskId);
        $.post(theTask.attr('value'), theTask.serialize(), null, "script");
        return false;
    });
});

$(function() {
    // Assign a click handler that grabs the URL
    // from the first cell and redirects the user.
    $('#task-list td#task-content').click(function ()
    {
        location.href = $(this).find('#task_link').attr('href');
    });
});

$(function() {
//    $( "button, input:submit, a", ".sidebar_panel"  ).button();
    $( "button, input:submit, a", "#menu_bar"  ).button();
    $( "button, input:submit, a", "#call_button"  ).button();
//		$( "a", ".demo" ).click(function() { return false; });
});
