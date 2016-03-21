class Collection < ActiveRecord::Base

    has_many :models
    mount_uploader :image, CollectionsimageUploader

end
