class Gender < Domain
  validates :code_value, format: { with: /\A[WM]{1}\z/, message: "W or M"}
end