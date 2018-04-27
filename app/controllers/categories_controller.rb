class CategoriesController < ApplicationController

http_basic_authenticate_with name: "Jungle", password: "book",
except: [:index]
  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end

end
