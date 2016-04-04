class Product < ActiveRecord::Base

  belongs_to :model, inverse_of: :products
  validates :model, presence: true

  # domain COLOR !!!
  belongs_to :domain, class_name: "Color", foreign_key: "color_id", inverse_of: :products
  validates :color_id, presence: true

  # domain SIZE !!!
  belongs_to :domain, class_name: "Size", foreign_key: "size_id", inverse_of: :products
  validates :size_id, presence: true

  has_many :purchases, inverse_of: :product, dependent: :destroy

  has_many :orders, through: :purchases
end