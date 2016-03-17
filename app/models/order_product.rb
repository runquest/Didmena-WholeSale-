class OrderProduct < ActiveRecord::Base


  belongs_to :order, inverse_of: :orderproducts
  validates :order, presence: true


  belongs_to :product, inverse_of: :orderproducts
  validates :product, presence: true

  validates :quantity, presence: true

end
