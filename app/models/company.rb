class Company < ActiveRecord::Base

  validates :title, uniqueness: { case_sensitive: false }
  validates :title, presence: true
  validates :title, length: { maximum: 200 }, on: :create

  validates :email, uniqueness: { case_sensitive: false }
  validates :email, presence: true
  validates :email, length: { maximum: 100 }, on: :create

  validates :status, presence: true
  validates :status, length: { maximum: 20 }, on: :create
  validates :status, inclusion: { in: %w(active inactive flagged), message: "%{value} is not a valid company status value" }

  # domain COUNTRY !!!
  belongs_to :domain, inverse_of: :companies
  validates :domain, presence: true

  # belongs_to :user, inverse_of: :companies

  # validates :city, presence: true
  validates :city, length: { maximum: 30 }, on: :create

  # validates :street, presence: true
  validates :street, length: { maximum: 30 }, on: :create

  validates :postal_code, length: { maximum: 10 }, on: :create

  validates :phone, length: { maximum: 100 }, on: :create

  # has_many :representatives, inverse_of: :company, dependent: :destroy
  has_many :users, through: :representatives

end
