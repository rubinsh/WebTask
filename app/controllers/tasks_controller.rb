class TasksController < TaskSystemController

  before_filter :authenticate_user!
  has_scope :completed, :only => :index
  respond_to :html, :xml, :json
  respond_to :js, :only => :create

  belongs_to :category, :optional => true

  def index
    index! {
      @open_tasks = @tasks.where(:completed=>false)
      @completed_tasks = @tasks.where(:completed=>true)
    }
  end

  def create
    create! { tasks_path(:completed => false)}
  end

  def update
    update! { tasks_path }
  end

  #TODO: this should move to update method with params
  def toggle_complete
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

  protected
  def begin_of_association_chain
    current_user
  end

end

