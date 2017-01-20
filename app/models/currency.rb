class Currency < Domain
  validates :code_value, format: { with: /\A[A-Z]{3}\z/, message: "only allows three uppercase letters"}
end