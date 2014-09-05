class ArticlesController < ApplicationController
  def new
  end

  def create
    @article = Article.new(article_params)
    puts "============================-"
    puts params
    puts article_params
    puts params[article_params]
    puts @article.inspect

    @article.save
    redirect_to @article
  end

  def show
    @article = Article.find(params[:id])
    puts "============================-"
    puts @article.inspect
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
