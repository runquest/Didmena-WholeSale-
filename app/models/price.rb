class Price < ActiveRecord::Base

  belongs_to :product, inverse_of: :prices
  validates :product, presence: true

  validates :from, presence: true
  validates :price, presence: true
  validates :currency, presence: true

end
