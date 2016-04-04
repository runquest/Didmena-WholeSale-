class Purchase < ActiveRecord::Base

  belongs_to :order, inverse_of: :purchases
  validates :order, presence: true

  belongs_to :product, inverse_of: :purchases
  validates :product, presence: true

  validates :quantity, presence: true

end