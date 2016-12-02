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
    @products = Product.where(model_id: @model.id)
    @model_attachments = @model.model_attachments.all
    @type = Domain.find(@model.gender_id).meaning
    @collection = Domain.find(@model.category_id).meaning
    @colors = Array.new;
    @sizes = Domain.where(domain_name: 'SIZE').order(:id).reverse

    @products.each do |prdct|
      if !@colors.include? prdct.color_id
        color_size = []
        @sizes.each do |size|
          p = Product.where(color_id: prdct.color_id).where(size_id: size.id).take
          if p.in_storage
            color_size.push(p)
          end
        end

        if color_size.any?
          @colors.push(prdct.color_id)
        end
      end
    end
  end
  
  # GET /models/new
  def new
    @model = Model.new
    @model_attachment = @model.model_attachments.build
  end

  # GET /models/1/edit
  def edit
    @model = Model.find(params[:id])
    @model_attachments = @model.model_attachments
    @sizes = Domain.where(domain_name: 'SIZE').order(:id).reverse

    if @model.products.any?
      @products = @model.products
      # @model_attachments = @model.model_attachments
    else
      @products = []
      # @model_attachments = []
    end

    if @model.model_attachments.any?
      @model_attachments = @model.model_attachments
    else
      @model_attachment = @model.model_attachments.build
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

    # to avoid error message on model creation
    # when clarified if client needs model code
    if !params[:model][:title].blank?
      code = params[:model][:title].delete(' ')[0..8]
      params[:model][:code] = code
    else
      code = Time.now.strftime("%Y%d%m%H%M%S")[0..8]
      params[:model][:code] = code
    end

    @model = Model.new(model_params)

    if @model.products.any?
      @products = @model.products
    else
      @products = []
    end

    if @model.save

      if !params[:model_attachments].nil?
        params[:model_attachments]['avatar'].each do |a|
          @model_attachment = @model.model_attachments.create(:avatar => a)
        end
      else
        @model_attachments = []
      end
      redirect_to action: "edit", id: @model.id
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /models/1
  # PATCH/PUT /models/1.json
  def update
    @model = Model.find(params[:id])
    @model.model_attachments(params[:model])
    
    if @model.products.empty? || !productsInStore(@model.products)
      flash[:notice] = "no products selected"
      redirect_to :back
    else
      if @model.update_attributes(model_params)
        if !params[:model_attachments].nil?
          params[:model_attachments]['avatar'].each do |a|
            @model_attachment = @model.model_attachments(params[:model]).create(:avatar => a)
          end
        end
        redirect_to action: "show", id: @model.id
      else
        render action: 'edit'
      end
    end
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
