class CommentsController < ApplicationController
  def create
    get_article_by_id
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  private
  def get_article_by_id
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
