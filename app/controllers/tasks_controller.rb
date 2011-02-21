class TasksController < ApplicationController

  before_filter :authenticate, :only => [:edit, :new, :create]

  # GET /tasks
  # GET /tasks.xml
  def index
    query_type = params[:type]
    case
      when query_type == "completed"
        @tasks = Task.order('due_date ASC').where(:completed => true)
      when query_type == "not_completed"
        @tasks = Task.order('due_date ASC').where(:completed => false)
      else
        @tasks = Task.order('due_date ASC').all #order('completed ASC').order('due_date ASC')
    end
    @tasks = @tasks.find_all { |tsk| tsk.owned_by? current_user }
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
      else
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
