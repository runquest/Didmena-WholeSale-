class ModelAttachment < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :model
end
