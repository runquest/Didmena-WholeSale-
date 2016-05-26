class ModelAttachmentsController < ApplicationController
  before_action :set_model_attachment, only: [:show, :edit, :update, :destroy]

  # GET /model_attachments
  # GET /model_attachments.json
  def index
    @model_attachments = ModelAttachment.all
  end

  # GET /model_attachments/1
  # GET /model_attachments/1.json
  def show
  end

  # GET /model_attachments/new
  def new
    @model_attachment = ModelAttachment.new
  end

  # GET /model_attachments/1/edit
  def edit
  end

  # POST /model_attachments
  # POST /model_attachments.json
  def create
    @model_attachment = ModelAttachment.new(model_attachment_params)

    respond_to do |format|
      if @model_attachment.save
        format.html { redirect_to @model_attachment, notice: 'Model attachment was successfully created.' }
        format.json { render :show, status: :created, location: @model_attachment }
      else
        format.html { render :new }
        format.json { render json: @model_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /model_attachments/1
  # PATCH/PUT /model_attachments/1.json
  def update
    respond_to do |format|
      if @model_attachment.update(model_attachment_params)
        format.html { redirect_to @model_attachment, notice: 'Model attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @model_attachment }
      else
        format.html { render :edit }
        format.json { render json: @model_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /model_attachments/1
  # DELETE /model_attachments/1.json
  def destroy
    @model_attachment.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Model attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model_attachment
      @model_attachment = ModelAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def model_attachment_params
      params.require(:model_attachment).permit(:model_id, :avatar)
    end
end
