// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
    $("#task_due_date").datepicker({ dateFormat: 'yy-mm-dd' });
    //"option", "altFormat", 'yy-mm-dd'


});

$(function() {
    $( "#sortable" ).sortable();
    $( "#sortable" ).disableSelection();
});

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
    // Assign a click handler that grabs the URL
    // from the first cell and redirects the user.
    $('#category_list td#category_name').click(function ()
    {
        location.href = $(this).find('#category_link').attr('href');
    });
});

$(function() {
//    $( "button, input:submit, a", ".sidebar_panel"  ).button();
    $( "button, input:submit, a", "#menu_bar"  ).button();
    $( "button, input:submit, a", "#call_button"  ).button();
//		$( "a", ".demo" ).click(function() { return false; });
});

//add drag and drop for tasks into categories functionality
$(function() {
$( "td.task_drag" ).draggable(
    {
        cursor: "move",
        helper: function(event){

            return $('<div><ul class="button_list"></ul></div>')
                    .find('ul').append($(event.target).closest('li').clone()).end().appendTo('body');
        }
    })
});

$(function() {
$("div.category").droppable(
    {
        hoverClass: "ui-state-hover",
        tolerance: 'pointer',
        drop: function( event, ui ) {
            var $target = $(event.target);
            var categoryId = $target.attr("id");
            var lastIndex = categoryId.lastIndexOf("_");
            var theCategoryId = categoryId.substring(lastIndex + 1, categoryId.length);
            var theTaskId = ui.draggable.closest('li').attr("id");
//            alert("item dropped to: " + theCategoryId + " the item id is: " + theTaskId);

            //TODO: fix this to be a route or a value from the dom - not this by hand url bullshit...
            $.post('/tasks/' + theTaskId + '/categorizations', {category_id: theCategoryId} , null, "script");
        }
    })
});
