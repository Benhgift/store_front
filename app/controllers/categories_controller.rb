class CategoriesController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show]

  def new
    @category = Category.new
  end

  def destroy
    get_category_by_id
    @category.destroy

    redirect_to categories_path
  end

  def edit
    get_category_by_id
  end

  def update
    get_category_by_id

    if @category.update(category_params)
      redirect_to @category
    else
      render 'edit'
    end
  end

  def index
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category
    else
      render 'new'
    end
  end

  def show
    get_category_by_id
  end

  private
  def get_category_by_id
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :text)
  end
end
