class ProductsController < ApplicationController

  def index
    @products = Product.search(params[:search])
  end

  def show
   @product = Product.find(params[:id])     
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    
    if current_user == nil
      @product.save
      redirect_to product_path(@product)
    else
      @product.save
      redirect_to product_path(@product)
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_path
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  protected

  def product_params
    params.require(:product).permit(:code, :title, :color, :size, :category, :image, :comment)
  end

end