class AddInitialDomainsValues < ActiveRecord::Migration
  def change

	# SIZE:   S - Small, M - Medium, L - Large, XL - Extra Large, XXL - Super Extra Large, etc.
  	if Size.find_by(code_value: 'XS').nil? && Size.find_by(meaning: 'EXTRA SMALL').nil?
		Size.create(code_value: 'XS', meaning: 'EXTRA SMALL')
 	end

  	if Size.find_by(code_value: 'S').nil? && Size.find_by(meaning: 'SMALL').nil?
		Size.create(code_value: 'S', meaning: 'SMALL')
 	end

  	if Size.find_by(code_value: 'M').nil? && Size.find_by(meaning: 'MEDIUM').nil?
		Size.create(code_value: 'M', meaning: 'MEDIUM')
 	end

  	if Size.find_by(code_value: 'L').nil? && Size.find_by(meaning: 'LARGE').nil?
		Size.create(code_value: 'L', meaning: 'LARGE')
 	end

  	if Size.find_by(code_value: 'XL').nil? && Size.find_by(meaning: 'EXTRA LARGE').nil?
		Size.create(code_value: 'XL', meaning: 'EXTRA LARGE')
 	end

	# Season
  	if Season.find_by(code_value: 'SPRING').nil? && Season.find_by(meaning: 'SPRING').nil?
		Season.create(code_value: 'SPRING', meaning: 'SPRING')
 	end

  	if Season.find_by(code_value: 'SUMMER').nil? && Season.find_by(meaning: 'SUMMER').nil?
		Season.create(code_value: 'SUMMER', meaning: 'SUMMER')
 	end

  	if Season.find_by(code_value: 'WINTER').nil? && Season.find_by(meaning: 'WINTER').nil?
		Season.create(code_value: 'WINTER', meaning: 'WINTER')
 	end

  	if Season.find_by(code_value: 'FALL').nil? && Season.find_by(meaning: 'FALL').nil?
		Season.create(code_value: 'FALL', meaning: 'FALL')
 	end


	# AGE_GROUP: ADULT - Adult, CHILD - Child, JUVENILE - Juvenile, etc.
  	if Agegroup.find_by(code_value: 'ADULT').nil? && Agegroup.find_by(meaning: 'Adult').nil?
		Agegroup.create(code_value: 'ADULT', meaning: 'Adult')
 	end

  	if Agegroup.find_by(code_value: 'CHILD').nil? && Agegroup.find_by(meaning: 'Child').nil?
		Agegroup.create(code_value: 'CHILD', meaning: 'Child')
 	end

  	if Agegroup.find_by(code_value: 'TEENAGER').nil? && Agegroup.find_by(meaning: 'Teenager').nil?
		Agegroup.create(code_value: 'TEENAGER', meaning: 'Teenager')
 	end

	# COUNTRY: CA - Canada, US - USA, LT - Lithuania, PL - Poland, RU - Russia, etc.
  	if Country.find_by(code_value: 'CA').nil? && Country.find_by(meaning: 'Canada').nil?
		Country.create(code_value: 'CA', meaning: 'Canada')
 	end

  	if Country.find_by(code_value: 'LT').nil? && Country.find_by(meaning: 'Lithuania').nil?
		Country.create(code_value: 'LT', meaning: 'Lithuania')
 	end

  	if Country.find_by(code_value: 'PL').nil? && Country.find_by(meaning: 'Poland').nil?
		Country.create(code_value: 'PL', meaning: 'Poland')
 	end

  	if Country.find_by(code_value: 'RU').nil? && Country.find_by(meaning: 'Russia').nil?
		Country.create(code_value: 'RU', meaning: 'Russia')
 	end

  	if Country.find_by(code_value: 'LV').nil? && Country.find_by(meaning: 'Latvia').nil?
		Country.create(code_value: 'LV', meaning: 'Latvia')
 	end

	# CURRENCY:  # EUR, USD, CAD, PLZ, RUR, etc.
  	if Currency.find_by(code_value: 'EUR').nil? && Currency.find_by(meaning: 'Euro').nil?
		Currency.create(code_value: 'EUR', meaning: 'Euro')
 	end

  	if Currency.find_by(code_value: 'USD').nil? && Currency.find_by(meaning: 'US Dollar').nil?
		Currency.create(code_value: 'USD', meaning: 'US Dollar')
 	end

  	if Currency.find_by(code_value: 'PLZ').nil? && Currency.find_by(meaning: 'Zlot').nil?
		Currency.create(code_value: 'PLZ', meaning: 'Zlot')
 	end

  	if Currency.find_by(code_value: 'RUR').nil? && Currency.find_by(meaning: 'Ruble').nil?
		Currency.create(code_value: 'RUR', meaning: 'Ruble')
 	end

  	if Currency.find_by(code_value: 'CAD').nil? && Currency.find_by(meaning: 'Canadian Dollar').nil?
		Currency.create(code_value: 'CAD', meaning: 'Canadian Dollar')
 	end

  end
end
