module ApplicationHelper

  def find_row_product(model_id, color_id, size_id)
    Product.where(model_id: model_id, color_id:  color_id, size_id: size_id).take
  end
  # Displays object errors
  def form_errors_for(object=nil)
    render('shared/form_errors', object: object) unless object.blank?
  end
  
end
