class Collection < ActiveRecord::Base
    mount_uploader :image, AvatarUploader

    has_many :models

end
