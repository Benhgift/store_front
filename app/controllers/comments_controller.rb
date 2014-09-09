class CommentsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "admin", only: :destroy

  def create
    get_category_by_id
    make_comment_from_params
    redirect_to category_path(@category)
  end

  def destroy 
    get_category_by_id
    @comment = @category.comments.find(params[:id])
    @comment.destroy
    redirect_to category_path(@category)
  end

  private
  def make_comment_from_params
    @comment = @category.comments.create(comment_params)
  end

  def get_category_by_id
    @category = Category.find(params[:category_id])
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
