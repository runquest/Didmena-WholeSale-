class Domain < ActiveRecord::Base

  validates :domain_name, presence: true
  validates :domain_name, length: { maximum: 20 }, on: :create
  validates :domain_name, inclusion: { in: %w(GENDER COLOR SIZE CATEGORY AGE_GROUP COUNTRY CURRENCY), message: "%{value} is not a valid domain name" }

  validates :code_value, presence: true
  # code_value uniqueness messes up with Male (M) and Medium (M) values;
  # validates :code_value, uniqueness: true
  validates :meaning, uniqueness: true
  validates :code_value, length: { maximum: 10 }, on: :create
  # validates :code_value, format: { with: /\A[A-Z0-9]+\z/, message: "only allows uppercase letters and digits"}
  validates :code_value, format: { with: /\A[A-Z0-9]{1,10}\Z/, message: "only allows uppercase letters and digits"}

  # has_many :companies, inverse_of :domain, dependent: :destroy
  has_many :companies, inverse_of: :domain

  has_many :models, class_name: "Model", foreign_key: "gender_id", inverse_of: :domain   # as a GENDER

  has_many :models, class_name: "Model", foreign_key: "category_id", inverse_of: :domain # as a GENDER

  has_many :products, class_name: "Product", foreign_key: "color_id", inverse_of: :domain       # as a COLOR

  has_many :products, class_name: "Product", foreign_key: "size_id", inverse_of: :domain       # as a SIZE

  # has_many :prices, class_name: "Price", foreign_key: "currency_id", inverse_of :domain       # as a CURRENCY
  # has_many :prices, inverse_of: :domain       # as a CURRENCY

  has_many :orders, inverse_of: :domain       # as a CURRENCY

  before_validation :uppercase_fields


  def uppercase_fields
    code_value.upcase!
    meaning.upcase!
  end
end
