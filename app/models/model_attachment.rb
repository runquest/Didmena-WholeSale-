class ModelAttachment < ActiveRecord::Base
  extend CarrierWave::Mount
  extend CarrierWaveDirect::Mount
  
  mount_uploader :avatar, AvatarUploader

  belongs_to :model
end
