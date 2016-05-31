class ModelsController < ApplicationController
  before_action :set_model, only: [:show, :edit, :update, :destroy]
  
  # GET /models
  # GET /models.json
  def index
    @models = Model.all
  end

  # GET /models/1
  # GET /models/1.json
  def show
    @products = Product.where(model_id: @model.id)
    @model_attachments = @model.model_attachments.all
  end

  # GET /models/new
  def new
    @model = Model.new
    @model_attachment = @model.model_attachments.build
  end

  # GET /models/1/edit
  def edit
    @model = Model.find(params[:id])
    if @model.products.any?
      @products = @model.products
    else
      @products = []
    end
    

    @colors = Array.new;

    @products.each do |prdct|
      if !@colors.include? prdct.color_id
        @colors.push(prdct.color_id)
      end
    end
  end

  # GET /models/1/add_products
  def add_products
    @model = Model.find(params[:id])
  end

  # POST /models
  # POST /models.json
  def create
    @model = Model.new(model_params)

    if @model.products.any?
      @products = @model.products
    else
      @products = []
    end

    # respond_to do |format|
      if @model.save
        params[:model_attachments]['avatar'].each do |a|
          @model_attachment = @model.model_attachments.create(:avatar => a)
        end
        redirect_to action: "edit", id: @model.id
        # format.html {redirect_to action: 'add_products', id: @model.id
      else
        render action: 'new'
      end
    # end
  end

  # PATCH/PUT /models/1
  # PATCH/PUT /models/1.json
  def update
    respond_to do |format|
      if @model.update(model_params)
        format.html { redirect_to @model, notice: 'Model was successfully updated.' }
        format.json { render :show, status: :ok, location: @model }
      else
        format.html { render :edit }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /models/1
  # DELETE /models/1.json
  def destroy
    @model.destroy
    respond_to do |format|
      format.html { redirect_to models_url, notice: 'Model was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def size
    render :partial => 'size_to_color'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model
      @model = Model.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def model_params
      params.require(:model).permit(:code, :title, :gender_id, :category_id, :price, :note)
    end

    def purchase_params
      params.require(:purchase).permit(:order_id, :product_id, :quantity, :note, model_attachments_attributes: [:id, :model_id, :avatar])
    end
end
