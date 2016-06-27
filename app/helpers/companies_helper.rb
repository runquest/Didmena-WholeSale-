module CompaniesHelper

  def find_user(company_order)
    User.find(company_order.contact)
  end

end
