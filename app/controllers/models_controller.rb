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
    @purchase = Order.find(2).purchases.new
    @model_attachments = @model.model_attachments.all

  end

  # GET /models/new
  def new
    @model = Model.new
    @model_attachment = @model.model_attachments.build
    @product = @model.products.build
  end

  # GET /models/1/edit
  def edit
  end

  # POST /models
  # POST /models.json
  def create
    @model = Model.new(model_params)

    # respond_to do |format|
    #   if @model.save
    #     format.html { redirect_to @model, notice: 'Model was successfully created.' }
    #     format.json { render :show, status: :created, location: @model }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @model.errors, status: :unprocessable_entity }
    #   end
    # end

    respond_to do |format|
      if @model.save
          params[:model_attachments]['avatar'].each do |a|
            @model_attachment = @model.model_attachments.create(:avatar => a)
          end
          binding.pry
          params[:model][:products][:color_id].each do |c|
            if !Domain.all.where(domain_name: "SIZE").blank?
              Domain.all.where(domain_name: "SIZE").each do |s|
                binding.pry
                @product = @model.products.create(:color_id => c, :size_id => s.id, :model_id => @model.id)
              end
            end
          end

          format.html {redirect_to @model, notice: "Model was created successfully." }
      else
          format.html {render action: 'new'}
      end
    end
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
