class Orderproduct < ActiveRecord::Base


  belongs_to :order, inverse_of: :orderproducts
  validates :order, presence: true


  belongs_to :model, inverse_of: :orderproducts
  validates :model, presence: true

  validates :quantity, presence: true

end
