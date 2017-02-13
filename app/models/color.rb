class Color < Domain
  validates :code_value, format: { with: /\A\h{6}\z/, message: "only six digits or from A to F"}
end