class CategorizationsController < InheritedResources::Base

  belongs_to :task #TODO: check if I really need this here
  belongs_to :category

  actions :create, :update, :delete

  respond_to :js, :json, :xml

  def create

    #prevent the record from being added twice
    #TODO: this should be done in the db level using uniq or primary key that is combination of category and task id's
    return unless Categorization.where(:task_id => params[:task_id], :category_id => params[:category_id]).empty?

    @categorization = Categorization.new()
    @categorization.category_id = params[:category_id]
    @categorization.task_id = params[:task_id]

    create!
  end

end
