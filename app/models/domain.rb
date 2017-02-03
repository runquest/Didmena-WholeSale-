class Domain < ActiveRecord::Base

  # self.inheritance_column = :domain_name
  self.inheritance_column = nil

  validates :domain_name, presence: true
  validates :domain_name, length: { maximum: 20 }, on: :create
  validates :domain_name, inclusion: { in: %w(Color Size Season Agegroup Country Currency Gender), message: "%{value} is not a valid domain name" }

  validates :code_value, presence: true
  # code_value uniqueness messes up with Male (M) and Medium (M) values;
  # validates :code_value, uniqueness: true
  validates :meaning, uniqueness: true
  validates :code_value, length: { maximum: 10 }, on: :create
  # validates :code_value, format: { with: /\A[A-Z0-9]+\z/, message: "only allows uppercase letters and digits"}
  validates :code_value, format: { with: /\A[A-Z0-9]{1,10}\z/, message: "only allows uppercase letters and digits"}

  # has_many :companies, inverse_of :domain, dependent: :destroy
  has_many :companies, inverse_of: :domain

  has_many :models, class_name: "Model", foreign_key: "gender_id", inverse_of: :domain   # as a Gender

  has_many :models, class_name: "Model", foreign_key: "season_id", inverse_of: :domain # as a Season

  has_many :products, class_name: "Product", foreign_key: "color_id", inverse_of: :domain       # as a Color

  has_many :products, class_name: "Product", foreign_key: "size_id", inverse_of: :domain       # as a Size

  # has_many :prices, class_name: "Price", foreign_key: "currency_id", inverse_of :domain       # as a CURRENCY
  # has_many :prices, inverse_of: :domain       # as a CURRENCY

  has_many :orders, inverse_of: :domain       # as a Currency

  # before_validation :uppercase_fields


  def uppercase_fields
    code_value.upcase!
    meaning.upcase!
  end
end
