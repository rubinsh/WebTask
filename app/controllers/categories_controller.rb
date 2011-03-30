class CategoriesController < InheritedResources::Base
  before_filter :authenticate_user!

  actions :show, :create, :new

  def show
    @tasks = Category.find(params[:id]).tasks
    show! { tasks_url }
  end

  def create
    @category = Category.new()
    @category.name = params[:name]
    @category.user_id = current_user.id
    @category.color = "#d9d9d9" #assign default color
    create! do |format|
      format.html { redirect_to tasks_url}
      format.js
    end
  end

  protected
  def begin_of_association_chain
    current_user
  end

end
