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
    @products = params[:_json]
    @products.each do |item|
      # if color doesn't exist we need to add it
      if Domain.where(meaning: item[:color]).empty?
        color_value = item[:color][0..2]
        Domain.create(domain_name: 'COLOR', code_value: color_value, meaning: item[:color])
      end

      color_id = Domain.where(meaning: item[:color]).first.id
      size_id = Domain.where(domain_name: 'SIZE').where(code_value: item[:size].upcase).first.id
      model_id = item[:model]
      product_params = {'model_id' => item[:model], 'color_id' => color_id, 'size_id' => size_id}

      @product = Product.new(product_params)

      if @product.save
        logger.info "product saved"
      else
        logger.info "failed to save product"
      end
    end

    respond_to do |format|
      @model = Model.find(@product.model_id)
      format.html { redirect_to @model, notice: 'User was successfully created.' }
      format.json { render :show, status: :created, location: @model }
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    if @product.update(product_params)
      logger.info "product updated"
      redirect_to :back
    else
      logger.info "failed to update"
    end
  end

  def update_product
    @color_id = Domain.where(meaning: params[:color]).take.id
    @size_id = Domain.where(domain_name: 'SIZE').where(code_value: params[:size]).take.id
    @model_id = params[:model]
    @in_storage = params[:in_storage]
    @product_id = Product.where(model_id: @model_id).where(color_id: @color_id).where(size_id: @size_id).take.id
    @product = Product.find(@product_id)
    update()
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
