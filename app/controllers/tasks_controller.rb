class TasksController < ApplicationController

  before_filter :authenticate_user!
  before_filter :check_that_task_belongs_to_user, :except => [:index,:new,:create]

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

  # GET /tasks
  # GET /tasks.xml
  def index
    query_type = params[:type]
    case
      when query_type == "completed"
        @tasks = current_user.tasks.where(:completed => true).order('due_date ASC')
      when query_type == "not_completed"
        @tasks = current_user.tasks.where(:completed => false).order('due_date ASC')
      else
        @tasks = current_user.tasks.order('due_date ASC') #order('completed ASC').order('due_date ASC')
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.xml
  def show
    @task = TasksHelper.try_get_task(current_user, params[:id])
    if (@task.nil?)
      render :action => 'not_found'
    else
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @task }
      end
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
    @task = TasksHelper.try_get_task(current_user, params[:id])
    render :action => 'not_found' if (@task.nil?)
  end

  def mark_complete
    @task = TasksHelper.try_get_task(current_user, params[:id])

    if (@task.nil?)
      render :action => 'not_found'
    else
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
    @task = TasksHelper.try_get_task(current_user, params[:id])

    if (@task.nil?)
      render :action => 'not_found'
    else
      @task.destroy
      respond_to do |format|
        format.html { redirect_to tasks_path, :notice => 'Task successfully deleted.' }
        format.xml  { head :ok }
      end
    end
  end
end
