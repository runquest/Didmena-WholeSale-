class ModelPicture < ActiveRecord::Base
  mount_uploader :modelsimage, ModelsimageUploader
  belongs_to :model

end
