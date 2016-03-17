class Order < ActiveRecord::Base

  # belongs_to :representative, inverse_of: :orders	# for :agent_id and :contact_id
  # validates :representative, presence: true

  belongs_to :agent_id, :class_name => 'Representative', :foreign_key => 'fk_orders_on_agent_id'

  belongs_to :contact_id, :class_name => 'Representative', :foreign_key => 'fk_orders_on_contact_id'

  validates :order_number, uniqueness: { case_sensitive: false }
  validates :order_number, presence: true

  validates :order_date, presence: true
  validates :agent_id, presence: true
  validates :contact_id, presence: true

  has_many :orderproducts, inverse_of: :order, dependent: :destroy

end
