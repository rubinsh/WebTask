// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
    $("#task_due_date").datepicker({ dateFormat: 'yy-mm-dd' });
    //"option", "altFormat", 'yy-mm-dd'


});

// $(function() {
// 	var mobileSite = "http://192.168.1.137:3001/customers/2/sites/3"
// 	if (document.referrer == mobileSite) return;
// 	var uagent = navigator.userAgent.toLowerCase();
// 	if (uagent.search("mobile") > -1 || uagent.search("webos") > -1) {
// 		window.location = mobileSite;
// 	};	
// });
// 


$(function() {
    $( "#sortable" ).sortable();
    $( "#sortable" ).disableSelection();
});

//$(function() {
//    $("#filters_accordion").accordion({ collapsible: true, header: 'h3', fillSpace: true });
//    $("#categories_accordion").accordion({ collapsible: true, header: 'h3', fillSpace: true });
//});

$(function() {
    $('#task-list td#task-completed-checkbox').live('click',(function(event)
    {
        var $target = $(event.target);
        var taskId = $target.attr("id");
        var theTask = $('#mark_complete_link_' + taskId);
        $.post(theTask.attr('value'), theTask.serialize(), null, "script");
        return false;
    }));
});

$(function() {
    // Assign a click handler that grabs the URL
    // from the first cell and redirects the user.
    $('#task-list td#task-content').live('click',(function ()
    {
        location.href = $(this).find('#task_link').attr('href');
    }));
});

$(function() {
    // Assign a click handler that grabs the URL
    // from the first cell and redirects the user.
    $('#category_list td#category_name').live('click',(function ()
    {
        location.href = $(this).find('#category_link').attr('href');
    }));
});

$(function() {
//    $( "button, input:submit, a", ".sidebar_panel"  ).button();
    $( "button, input:submit, a", "#menu_bar"  ).button();
    $( "button, input:submit, a", "#call_button"  ).button();
//		$( "a", ".demo" ).click(function() { return false; });
});


//Add draggable feature:
//Define a setup method for the draggable config so I can reuse it for dynamic elements
$(function() {
    jQuery.fn.draggableSetup = function draggableSetup() {
//        this.each(function() {
//            $(".task_drag")
        this.draggable(
        {
            cursor: "move",
            helper: function(event){

                return $('<div><ul class="button_list"></ul></div>')
                        .find('ul').append($(event.target).closest('li').clone()).end().appendTo('body');
            }
        });
//        });
        return this;
    }
});

//Apply the draggable config for all table rows
$(function() {
    $("td.task_drag").draggableSetup();
});


//Add droppable feature:
//Define a setup method for the draggable config so I can reuse it for dynamic elements
$(function() {

    jQuery.fn.droppableSetup = function droppableSetup() {
//        this.each(function() {
        this.droppable(
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
        });
//        });
        return this;
    }
});

//Apply the droppable to all divs with the category class
$(function () {
    $("div.category").droppableSetup();
});


