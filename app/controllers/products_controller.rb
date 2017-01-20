class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit

  end

  # POST /products
  # POST /products.json
  def create
    product_params = {'model_id' => params[:model], 'color_id' => params[:color], 'size_id' => params[:size], 'in_storage' => params[:in_storage]}
    @product = Product.new(product_params)
    if @product.save
      logger.info "product saved"
    else
      logger.info "failed to save product"
    end
    respond_to do |format|
      @model = Model.find(@product.model_id)
      format.html { redirect_to @model, notice: 'Model was successfully created.' }
      format.json { render :show, status: :created, location: @model }
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update(product)
    if product.update(product_params)
      logger.info "product updated"
      redirect_to :back
    else
      logger.info "failed to update"
    end
  end

  def update_product
    product = Product.where(model_id: params[:model]).where(color_id: params[:color]).where(size_id: params[:size]).take
    update(product)
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    redirect_to :back
    return
  end

  def delete_item
  end

  def remove
    color_id = Domain.where(meaning: params[:color]).first.id
    size_id = Domain.where(code_value: params[:size].upcase).first.id
    product_id = Product.where(model_id: params[:model]).where(color_id: color_id).where(size_id: size_id).take.id
    return
  end

  def delete_products
    products_array = Product.where(model_id: params[:model], color_id: params[:color])
    ordered_products_ids = (Purchase.all.map { |purchase| purchase.product_id }).uniq
    can_delete = false
    products_array.each do |p|
      if !ordered_products_ids.include?(p.id)
        can_delete = true
      end
    end
    if can_delete
      products_array.each do |p|
        p.destroy
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:model_id, :color_id, :size_id, :in_storage)
    end
end
