class Model < ActiveRecord::Base
    mount_uploader :image, ModelsimageUploader

    has_many :products
    belongs_to :collection

    has_and_belongs_to_many :colors


end
