class User < ActiveRecord::Base

  has_secure_password

  # validates :email, uniqueness: { case_sensitive: false }
  validates :email, presence: true
  validates :email, length: { in: 3..100 }, on: :create
  # validates :email, format: { with: /\A[A-Z]{1,31}\Z/, message: "only allows uppercase letters"}

  validates :fname, presence: true
  validates :fname, length: { in: 1..31 }, on: :create
  validates :fname, format: { with: /\A[A-Z]{1,31}\Z/, message: "only allows uppercase letters"}
  # validates :fname, format: { with: /\A[A-Za-z]{1,31}\Z/, message: "only allows letters"}

  validates :lname, presence: true
  validates :lname, length: { in: 1..31 }, on: :create
  validates :lname, format: { with: /\A[A-Z]{1,31}\Z/, message: "only allows uppercase letters"}

  # validates :password_digest, length: { in: 6..100 }, on: :create
  # validates :password_digest, presence: true
  # validates :password_digest, format: { with: /\A[A-Za-z0-9]{6,100}\Z/, message: "only allows letters, digits and special characters"}  # Add to format ~!@#$%^&*()_-=+, etc.

  validates :status, inclusion: { in: %w(active inactive flagged), message: "%{value} is not a valid user status value" }

  validates :phone, length: { maximum: 100 }
  # validates :phone, length: { maximum: 100 }, on: :create

  has_many :representatives, inverse_of: :user, dependent: :destroy

  has_many :companies, through: :representatives

  before_validation :uppercase_fields

  def uppercase_fields
    fname.upcase!
    lname.upcase!
  end

  def full_name
    "#{fname} #{lname}"
  end
end