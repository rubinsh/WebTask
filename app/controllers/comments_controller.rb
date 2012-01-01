class CommentsController < TaskSystemController
  before_filter :authenticate_user!

  actions :create, :update, :destroy

  respond_to :js, :json, :xml

  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id
    @comment.task_id = params[:task_id]

    create!
  end

end
