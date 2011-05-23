class TaskSystemController < InheritedResources::Base
  # layout "task_system"

  #TODO: it's bad that this code is in the controller
  uses_tiny_mce :options => {
      :theme => 'advanced',
      :theme_advanced_toolbar_location => 'top',
      :theme_advanced_toolbar_align => 'left',
      :mode => 'textareas',
      :plugins => %w{ directionality },
      :theme_advanced_buttons1 => "bold,italic,underline,strikethrough,separator,justifyleft,justifycenter,justifyright,justifyfull,separator,fontselect,fontsizeselect",
      :theme_advanced_buttons2 => "bullist,numlist,sparator,undo,redo,separator,ltr,rtl,separator,forecolor,backcolor,separator,link,unlink",
      :theme_advanced_buttons3 => "",
      :width => "600",
      :readonly => false
  }

end