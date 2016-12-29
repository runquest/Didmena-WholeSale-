class Gender < Domain
  validates :code_value, format: { with: /\A[FM]{1}\z/, message: "F or M"}
end