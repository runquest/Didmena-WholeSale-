class Company < ActiveRecord::Base

  validates :name, uniqueness: { case_sensitive: false }
  validates :name, presence: true

  validates :name, presence: true
  validates :country, presence: true
  validates :city, presence: true
  validates :street, presence: true
  validates :postal_code, presence: true

  validates :email, uniqueness: { case_sensitive: false }
  validates :email, presence: true

  has_many :representatives, inverse_of: :company, dependent: :destroy

  has_many :users, through :representatives

end
