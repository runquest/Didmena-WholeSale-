class Price < ActiveRecord::Base

  belongs_to :product, inverse_of: :prices
  validates :product, presence: true

  validates :from_date, presence: true
  validates :price, presence: true      # price > 0 !!!

  # domain CURRENCY !!!
  belongs_to :domain, inverse_of: :prices
  validates :domain, presence: true

end