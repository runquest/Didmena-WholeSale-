class UpdateDomainValueRemoveCheck < ActiveRecord::Migration
  def change
      remove_check 'domains', name: 'domain_name_chk'
  end
end
