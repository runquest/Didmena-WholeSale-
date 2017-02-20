class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_locale

  helper_method :current_user
  helper_method :current_user_discount
  helper_method :current_cart
  helper_method :model_colors
  helper_method :model_color_objects
  helper_method :product_object
  helper_method :find_sizes
  helper_method :all_sizes
  helper_method :get_quantity

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    {locale: I18n.locale}
  end

  protected

  def restrict_access
    if !current_user
      flash[:alert] = "You must log in."
      redirect_to new_session_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user_discount
    if current_user.company_id.nil?
      return
    end
    return Company.find(current_user.company_id).discount.to_f
  end

  def current_product(model_id, color_id, size_id)
    Product.where(model_id: @model.id, color_id: color.id, size_id: product_box.id)
  end

  def current_cart
    @cart = session[:cart]
  end

  def model_products(model_id)
    Product.where(model_id: model_id)
  end

  def model_colors(model_id)
    @model_colors = []
    model_products(model_id).each do |product|
      color_meaning = Domain.find(product.color_id).code_value
      @model_colors.push(color_meaning) unless @model_colors.include?(color_meaning)
    end
    return @model_colors
  end

  def model_color_objects(model_id)
    array_model_color_ids = (Product.where(model_id: model_id).map {|p| p.color_id}).uniq
    @color = []
    for id in array_model_color_ids
      @color.push(Color.find(id))
    end
    return  @color
  end

  def product_object(model_id, color_id, size_id)
    return Product.where(model_id: model_id, color_id: color_id, size_id: size_id).take
  end

  def get_quantity(product_id)
    if @cart.blank?
      return nil
    end

    if @cart.keys.include?(product_id.to_s)
      return @cart[product_id.to_s].to_i
    else
      return nil
    end
  end

  def find_colors_general(model_id)
    @model_colors_objects = []
    model_products(model_id).each do |product|
      color_object = Domain.find(product.color_id)
      @model_colors_objects.push(color_object) unless @model_colors_objects.include?(color_object)
    end
    return @model_colors_objects
  end

  def find_sizes(model_id)
    @model_sizes = []
    model_products(model_id).each do |product|
      size_name = Domain.find(product.size_id).code_value
      @model_sizes.push(size_name) unless @model_sizes.include?(size_name)
    end
    return @model_sizes
  end

  def all_sizes
    return Domain.where(domain_name: 'Size').order(:id).reverse
  end
end

