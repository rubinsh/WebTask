class TasksController < ApplicationController

  before_filter :authenticate, :only => [:edit, :new, :create]
  uses_tiny_mce :options => {
      :theme => 'advanced',
      :theme_advanced_toolbar_location => 'top',
      :theme_advanced_toolbar_align => 'left',
      :mode => 'textareas',
      :plugins => %w{ directionality },
      :theme_advanced_buttons1 => "bold,italic,underline,strikethrough,separator,justifyleft,justifycenter,justifyright,justifyfull,separator,fontselect,fontsizeselect",
      :theme_advanced_buttons2 => "bullist,numlist,sparator,undo,redo,separator,ltr,rtl,separator,forecolor,backcolor,separator,link,unlink",
      :theme_advanced_buttons3 => ""
  }

  # GET /tasks
  # GET /tasks.xml
  def index
    if (current_user)
      query_type = params[:type]
      case
        when query_type == "completed"
          @tasks = current_user.tasks.order('due_date ASC').where(:completed => true)
        when query_type == "not_completed"
          @tasks = current_user.tasks.order('due_date ASC').where(:completed => false)
        else
          @tasks = current_user.tasks.order('due_date ASC').all #order('completed ASC').order('due_date ASC')
      end
      @tasks = @tasks.find_all { |tsk| tsk.owned_by? current_user }
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.xml
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.xml
  def new
    @task = Task.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  def mark_complete
    @task = Task.find(params[:id])
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

  # POST /tasks
  # POST /tasks.xml
  def create
    @task = Task.new(params[:task])
    @task.users << current_user
    respond_to do |format|
      if @task.save
        format.html { redirect_to(tasks_path, :notice => 'Task was successfully created.') }
        format.xml  { render :xml => @task, :status => :created, :location => @task }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.xml
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to(tasks_path, :notice => 'Task was successfully updated.') }
        format.js
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.xml
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_path, :notice => 'Task successfully deleted.' }
      format.xml  { head :ok }
    end
  end
end
