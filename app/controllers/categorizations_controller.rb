class CategorizationsController < TaskSystemController

  belongs_to :task #TODO: check if I really need this here

  actions :create, :update, :delete, :index

  respond_to :js, :json, :xml, :html

  def create
    #prevent the record from being added twice
    if  (Categorization.where(:task_id => params[:task_id], :category_id => params[:category_id]).any?)
      flash[:alert] = "The task already belongs to that category"
      return
    end

    @categorization = Categorization.new()
    @categorization.category_id = params[:category_id]
    @categorization.task_id = params[:task_id]

    create!
  end

end
