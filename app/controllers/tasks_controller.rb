class TasksController < InheritedResources::Base

  before_filter :authenticate_user!
  has_scope :completed, :only => :index
  respond_to :html, :xml, :json

  belongs_to :category, :optional => true

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

  #TODO: this should move to update method with params
  def mark_complete
    @task = TasksHelper.try_get_task(current_user, params[:id])

    if (@task.nil?)
      render :action => 'not_found'
    else
      @task.toggle_complete!
      respond_to do |format|
        if @task.save
          format.html { redirect_to(tasks_path, :notice => 'Task was marked as complete') }
          format.js
          format.xml { head :ok}
        else #todo: add format.js and ajax failure handling....
          format.html {redirect_to(tasks_path, :alert => "There was an error while updating the task")}
          format.xml { render :xml => @task.errors, status => :unprocessable_entity}
        end
      end
    end
  end

  def index
    @title = "Tasks - WebTask"
    index!
  end

  def new
    @title = "New Task - WebTask"
    new!
  end

  def edit
    @title = "Edit Task - WebTask"
    edit!
  end

  def create
    create! { tasks_path(:completed => 'f')}
  end

  def update
    update! { tasks_path }
  end

  protected
  def begin_of_association_chain
    current_user
  end

end

