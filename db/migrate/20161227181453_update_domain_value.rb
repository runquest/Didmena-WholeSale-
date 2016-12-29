class UpdateDomainValue < ActiveRecord::Migration
  def change
      # t.check "domain_name IN ('GENDER', 'COLOR', 'SIZE', 'CATEGORY', 'AGE_GROUP', 'COUNTRY', 'CURRENCY')", name: 'domain_name_chk'
      remove_check 'domains', name: 'domain_name_chk'

      Domain.connection.execute("Update domains set domain_name='Gender' where domain_name='GENDER'")
      Domain.connection.execute("Update domains set domain_name='Color' where domain_name='COLOR'")
      Domain.connection.execute("Update domains set domain_name='Size' where domain_name='SIZE'")
      Domain.connection.execute("Update domains set domain_name='Season' where domain_name='CATEGORY'")
      Domain.connection.execute("Update domains set domain_name='Agegroup' where domain_name='AGE_GROUP'")
      Domain.connection.execute("Update domains set domain_name='Country' where domain_name='COUNTRY'")
      Domain.connection.execute("Update domains set domain_name='Currency' where domain_name='CURRENCY'")

      add_check 'domains', "domain_name IN ('Gender', 'Color', 'Size', 'Season', 'Agegroup', 'Country', 'Currency')", name: 'domain_name_chk'
  end
end