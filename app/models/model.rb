class Model < ActiveRecord::Base

    mount_uploader :image, AisteUploader

    has_many :products
    belongs_to :collection

end
