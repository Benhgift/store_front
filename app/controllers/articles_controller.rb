class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show]

  def new
    @article = Article.new
  end

  def destroy
    get_article_by_id
    @article.destroy

    redirect_to articles_path
  end

  def edit
    get_article_by_id
  end

  def update
    get_article_by_id

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def index
    @articles = Article.all
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def show
    get_article_by_id
  end

  private
  def get_article_by_id
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
