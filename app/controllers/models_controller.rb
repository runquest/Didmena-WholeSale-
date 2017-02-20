class ModelsController < ApplicationController
  before_action :set_model, only: [:show, :edit, :update, :destroy]
  
  # GET /models
  # GET /models.json
  def index
    @models = Model.all.order(:priority)
  end

  # GET /models/1
  # GET /models/1.json
  def show
    @products = model_products(@model.id)
    @model_attachments = @model.model_attachments.all
    @type = Domain.find(@model.gender_id).meaning
    @collection = Domain.find(@model.category_id).meaning
    @colors = model_colors(@model.id)
  end
    
  # GET /models/new
  def new
    @model = Model.new
  end

  # GET /models/1/edit
  def edit
    @model = Model.find(params[:id])
    @model_attachments = @model.model_attachments
    @sizes = Size.all.order(:id).reverse
    @model_attachments = @model.model_attachments.all
    @type = Domain.find(@model.gender_id).meaning
    @collection = Domain.find(@model.category_id).meaning
    @colors = model_color_objects(@model.id)
 
    if @model.products.any?
      @products = @model.products
    else
      @products = []
    end
    if @model.model_attachments.any?
      @model_attachments = @model.model_attachments
    else
      @model_attachment = @model.model_attachments.build
    end
    
    # @colors = Array.new;

    # @products.each do |prdct|
    #   if !@colors.include? prdct.color_id
    #     @colors.push(prdct.color_id)
    #   end
    # end
  end

  # GET /models/1/add_products
  def add_products
    @model = Model.find(params[:id])
  end

  # POST /models
  # POST /models.json
  def create
    if !params[:model][:title].blank?
      params[:model][:title] = params[:model][:title].upcase
      code = params[:model][:title].delete(' ')[0..8]
      params[:model][:code] = code
    else
      code = Time.now.strftime("%Y%d%m%H%M%S")[0..8]
      params[:model][:code] = code
    end

    @model = Model.new(model_params)
    if @model.save
      redirect_to edit_model_path(@model)
    else
      render :new
    end
  end

  # PATCH/PUT /models/1
  # PATCH/PUT /models/1.json
  def update
    if !params[:model].nil?
      @model.update_attributes(model_params)
    end

    if !params[:model_attachments].nil?
      maintain_model_attachments
    end

    flash[:notice] = "Saved!"
    redirect_to edit_model_path(@model)
  end

  def productsInStore(products)
    inStorage = false
    products.each do |product|
      if product.in_storage === true
        inStorage = true
        break
      end
    end
    return inStorage
  end

  # DELETE /models/1
  # DELETE /models/1.json
  def destroy
    @model.destroy
    respond_to do |format|
      format.html { redirect_to models_url, notice: 'Model was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def size
    render :partial => 'size_to_color'
  end

  def maintain_model_attachments
    params[:model_attachments]['avatar'].each do |a|
      @model_attachment = @model.model_attachments(params[:model]).create(:avatar => a)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model
      @model = Model.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def model_params
      params.require(:model).permit(:code, :title, :gender_id, :category_id, :price, :priority, :note)
    end

    def purchase_params
      params.require(:purchase).permit(:order_id, :product_id, :quantity, :note, model_attachments_attributes: [:id, :model_id, :avatar])
    end
end
