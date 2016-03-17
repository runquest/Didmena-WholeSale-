class Product < ActiveRecord::Base

  # validates :code, uniqueness: { case_sensitive: false }		# supposed to be combination :code and :size
  validates :code, presence: true

  validates :title, presence: true
  validates :color, presence: true
  validates :size, presence: true
  validates :category, presence: true

  has_many :prices, inverse_of: :product, dependent: :destroy

  has_many :orderproducts, inverse_of: :product, dependent: :destroy

end
