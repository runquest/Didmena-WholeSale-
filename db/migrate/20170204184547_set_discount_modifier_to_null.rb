class SetDiscountModifierToNull < ActiveRecord::Migration
  def change
  	change_column_null :companies, :discount, true
  end
end
