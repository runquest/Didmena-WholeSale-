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
    # binding.pry

    @products = params[:_json]
    # @model = Model.find(item[])

    @products.each do |item| 
      # binding.pry
      color_id = Domain.where(meaning: item[:color]).first.id
            # binding.pry

      size_id = Domain.where(code_value: item[:size].upcase).first.id

      model_id = item[:model]
            # binding.pry

      product_params = {'model_id' => item[:model], 'color_id' => color_id, 'size_id' => size_id}
      # binding.pry


      @product = Product.new(product_params)
      if @product.save
        # binding.pry
        # logger.info "created " + item
    #     binding.pry
    #     format.html {redirect_to model_url(@model), notice: 'Created.' }
    #     # format.html { redirect_to action: 's', id: @model.id }
    #     # format.html { redirect_to @product, notice: 'Product was successfully created.' }
    #     format.json { render :show, status: :created, location: @product }
      else
        # binding.pry
        # logger.info "failed " + item
    #     format.html { render :new }
    #     format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end

    respond_to do |format|
      binding.pry
      @model = Model.find(@product.model_id)
      binding.pry
      format.html {redirect_to model_url(@model), notice: 'Created.' }
    end


    # @product = Product.new(product_params)

    # # binding.pry

    # respond_to do |format|
    #   if @product.save
    #     binding.pry
    #     format.html {redirect_to model_url(@model), notice: 'Created.' }
    #     # format.html { redirect_to action: 's', id: @model.id }
    #     # format.html { redirect_to @product, notice: 'Product was successfully created.' }
    #     format.json { render :show, status: :created, location: @product }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @product.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # def save

  #   color_id = Domain.where(meaning: params[:color]).first.id
  #   size_id = Domain.where(code_value: params[:size].upcase).first.id
  #   product_params = {'model_id' => params[:model], 'color_id' => color_id, 'size_id' => size_id}
  #   @product = Product.new(product_params)

  #   # binding.pry

  #   respond_to do |format|
  #     if @product.save
  #       binding.pry
  #       format.html {redirect_to model_url(@model), notice: 'Created.' }
  #       # format.html { redirect_to action: 's', id: @model.id }
  #       # format.html { redirect_to @product, notice: 'Product was successfully created.' }
  #       format.json { render :show, status: :created, location: @product }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @product.errors, status: :unprocessable_entity }
  #     end
  #   end

  # end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    # binding.pry
    @product.destroy
    # respond_to do |format|
    #   format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
    redirect_to :back
    return
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
      params.require(:product).permit(:model_id, :color_id, :size_id)
    end
end
