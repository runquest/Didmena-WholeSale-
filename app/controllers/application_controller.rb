class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_locale

  helper_method :current_user
  helper_method :current_cart
  helper_method :find_colors
  helper_method :find_sizes

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

  def current_cart
    @cart = session[:cart]
  end

  def model_products(model_id)
    Product.where(model_id: model_id)
  end

  def find_colors(model_id)
    @model_colors = []
    model_products(model_id).each do |product|
      color_meaning = Domain.find(product.color_id).meaning
      @model_colors.push(color_meaning) unless @model_colors.include?(color_meaning)
    end
    return @model_colors
  end

  def find_sizes(model_id)
    @model_sizes = []
    model_products(model_id).each do |product|
      size_name = Domain.find(product.size_id).code_value
      @model_sizes.push(size_name) unless @model_sizes.include?(size_name)
    end
    return @model_sizes
  end


end
