class Country < Domain
  validates :code_value, format: { with: /\A[A-Z]{2}\z/, message: "only allows two uppercase letters"}
end