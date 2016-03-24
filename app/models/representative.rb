class Representative < ActiveRecord::Base

  belongs_to :company, inverse_of: :representatives
  validates :company, presence: true

  belongs_to :user, inverse_of: :representatives
  validates :user, presence: true

  validates :contact_type, presence: true

  has_many :orders
end
