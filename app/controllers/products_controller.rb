class ProductsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "admin", only: :destroy

  def create
    get_category_by_id
    make_product_from_params
    redirect_to category_path(@category)
  end

  def destroy 
    get_category_by_id
    @product = @category.products.find(params[:id])
    @product.destroy
    redirect_to category_path(@category)
  end

  private
  def make_product_from_params
    @product = @category.products.create(product_params)
  end

  def get_category_by_id
    @category = Category.find(params[:category_id])
  end

  def product_params
    params.require(:product).permit(:developer, :body)
  end
end
