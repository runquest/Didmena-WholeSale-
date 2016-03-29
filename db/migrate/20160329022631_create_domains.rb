class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :domain_name, null: false, limit: 20
      t.string :code_value, null: false, limit: 10
      t.string :meaning, limit: 100
      t.string :special_case, limit: 10
      t.text :note

      t.check "domain_name IN ('GENDER', 'COLOR', 'SIZE', 'CATEGORY', 'AGE_GROUP', 'COUNTRY', 'CURRENCY')", name: 'domain_name_chk'
      # GENDER: F - Female, M - Male
      # COLOR:  R - Red, G - Green, B - Blue, Y - Yellow, etc.
      # SIZE:   S - Small, M - Medium, L - Large, XL - Extra Large, XXL - Super Extra Large, etc.
      # CATEGORY: JACKET - Jacket, COAT - Coat, etc.
      # AGE_GROUP: ADULT - Adult, CHILD - Child, JUVENILE - Juvenile, etc.
      # COUNTRY: CA - Canada, US - USA, LT - Lithuania, PL - Poland, RU - Russia, etc.
      # CURRENCY:  # EUR, USD, CAD, PLZ, RUR, etc.

    end
    add_index :domains, [:domain_name, :code_value], :unique => true, name: :ui_domains_name_value
  end
end
