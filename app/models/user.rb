class User < ActiveRecord::Base

  has_secure_password

  validates :email, uniqueness: { case_sensitive: false }
  validates :email, presence: true

  validates :fname, presence: true

  validates :lname, presence: true

  validates :password_digest, length: { in: 6..100 }, on: :create
  validates :password_digest, presence: true

  # Three roles are considered: ADMIN, BUYER, ANONYMOUS
  # It is suggested to mark roles as three characters string:
  # ADMIN - XOO, BUYER - OXO, ANONYMOUS - OOX
  # ADMIN and BUYER - XXO
  validates :role, presence: true

  has_many :representatives, inverse_of: :user, dependent: :destroy

  def full_name
    "#{fname} #{lname}"
  end

end
