class Model < ActiveRecord::Base

  validates :code, uniqueness: true
  # validates :code, uniqueness: { case_sensitive: false }
  validates :code, presence: true
  validates :code, length: { maximum: 10 }, on: :create
  validates :code, format: { with: /\A[A-Z0-9]{1,10}\Z/, message: "only allows uppercase letters and digits"}

  validates :title, uniqueness: { case_sensitive: false }
  validates :title, presence: true
  validates :title, length: { maximum: 100 }, on: :create

  # domain GENDER !!!
  # belongs_to :domain, inverse_of: :models
  belongs_to :domain, class_name: "Gender", foreign_key: "gender_id", inverse_of: :models
  validates :gender_id, presence: true

  # domain CATEGORY !!! Second time ???
  belongs_to :domain, class_name: "Category", foreign_key: "category_id", inverse_of: :models
  validates :category_id, presence: true

  # has_many :modelpictures, inverse_of: :model, dependent: :destroy

  has_many :products, inverse_of: :model, dependent: :destroy
  accepts_nested_attributes_for :products

  has_many :model_attachments
  accepts_nested_attributes_for :model_attachments

  before_validation :uppercase_fields

  def uppercase_fields
    code.upcase!
    title.upcase!
  end

end