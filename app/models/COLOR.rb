class COLOR < Domain
  validates :code_value, format: { with: /\A[A-F0-9]{6}\Z/, message: "only six digits or from A to F"}
end