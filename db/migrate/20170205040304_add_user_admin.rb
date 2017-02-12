class AddUserAdmin < ActiveRecord::Migration
  def change
    if User.find_by(email: 'admin@didmena.lt').nil?
    	User.create(email: 'admin@didmena.lt', fname: 'ADMIN', lname: 'ADMIN', password: 'didmena', password_confirmation: 'didmena', status: 'active',  apps_manager: true)
    end	
  end
end
