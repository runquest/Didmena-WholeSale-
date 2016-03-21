class Model < ActiveRecord::Base

    has_many :products
    belongs_to :collection

    mount_uploader :image, ModelsimageUploader

end
