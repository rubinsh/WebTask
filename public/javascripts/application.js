// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
    $("#task_due_date").datepicker({ dateFormat: 'yy-mm-dd' });
    //"option", "altFormat", 'yy-mm-dd'


});

$(function() {
    $( "#accordion" ).accordion();
});

$(function() {
    // Assign a click handler that grabs the URL
    // from the first cell and redirects the user.
    $('#task-table tr').click(function ()
    {
        location.href = $(this).find('#task_link').attr('href');
    });
});
