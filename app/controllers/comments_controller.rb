class CommentsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "admin", only: :destroy

  def create
    get_article_by_id
    make_comment_from_params
    redirect_to article_path(@article)
  end

  def destroy 
    get_article_by_id
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
  def make_comment_from_params
    @comment = @article.comments.create(comment_params)
  end

  def get_article_by_id
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
