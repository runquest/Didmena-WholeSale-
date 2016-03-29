## DOMAIN:
# GENDER: F - Female, M - Male

Domain.create(domain_name: 'GENDER', code_value: 'F', meaning: 'Female')
Domain.create(domain_name: 'GENDER', code_value: 'M', meaning: 'Male')

# COLOR:  R - Red, G - Green, B - Blue, Y - Yellow, etc.

Domain.create(domain_name: 'COLOR', code_value: 'R', meaning: 'Red')
Domain.create(domain_name: 'COLOR', code_value: 'G', meaning: 'Green')
Domain.create(domain_name: 'COLOR', code_value: 'B', meaning: 'Blue')
Domain.create(domain_name: 'COLOR', code_value: 'Y', meaning: 'Yellow')

# SIZE:   S - Small, M - Medium, L - Large, XL - Extra Large, XXL - Super Extra Large, etc.

Domain.create(domain_name: 'SIZE', code_value: 'S', meaning: 'Small')
Domain.create(domain_name: 'SIZE', code_value: 'M', meaning: 'Medium')
Domain.create(domain_name: 'SIZE', code_value: 'L', meaning: 'Large')
Domain.create(domain_name: 'SIZE', code_value: 'XL', meaning: 'Extra Large')
Domain.create(domain_name: 'SIZE', code_value: 'XXL', meaning: 'Super Extra Large')

# CATEGORY: JACKET - Jacket, COAT - Coat, etc.

Domain.create(domain_name: 'CATEGORY', code_value: 'JACKET', meaning: 'Jacket')
Domain.create(domain_name: 'CATEGORY', code_value: 'TSHIRT', meaning: 'T-Shirt')
Domain.create(domain_name: 'CATEGORY', code_value: 'COAT', meaning: 'Coat')

# AGE_GROUP: ADULT - Adult, CHILD - Child, JUVENILE - Juvenile, etc.

Domain.create(domain_name: 'AGE_GROUP', code_value: 'ADULT', meaning: 'Adult')
Domain.create(domain_name: 'AGE_GROUP', code_value: 'CHILD', meaning: 'Child')
Domain.create(domain_name: 'AGE_GROUP', code_value: 'JUVENILE', meaning: 'Juvenile')

# COUNTRY: CA - Canada, US - USA, LT - Lithuania, PL - Poland, RU - Russia, etc.

Domain.create(domain_name: 'COUNTRY', code_value: 'CA', meaning: 'Canada')
Domain.create(domain_name: 'COUNTRY', code_value: 'LT', meaning: 'Lithuania')
Domain.create(domain_name: 'COUNTRY', code_value: 'PL', meaning: 'Poland')
Domain.create(domain_name: 'COUNTRY', code_value: 'RU', meaning: 'Russia')

# CURRENCY:  # EUR, USD, CAD, PLZ, RUR, etc.

Domain.create(domain_name: 'CURRENCY', code_value: 'EUR', meaning: 'Euro')
Domain.create(domain_name: 'CURRENCY', code_value: 'USD', meaning: 'US Dollar')
Domain.create(domain_name: 'CURRENCY', code_value: 'PLZ', meaning: 'Zlot')
Domain.create(domain_name: 'CURRENCY', code_value: 'RUR', meaning: 'Ruble')


## USERS:
User.create(email: 'aiste@aiste.ca', fname: 'AISTE', lname: 'ULO', password: 'didmena', password_confirmation: 'didmena', status: 'active',  apps_manager: true)
User.create(email: 'edvinas@didmena.lt', fname: 'EDVINAS', lname: 'ULOZA', password: 'didmena', password_confirmation: 'didmena', status: 'active',  apps_manager: true)
User.create(email: 'uzsakovas@didmena.lt', fname: 'UZSAKOVAS', lname: 'KASNORS', password: 'didmena', password_confirmation: 'didmena', status: 'active',  apps_manager: false)
User.create(email: 'daug@didmena.lt', fname: 'DAUG', lname: 'KASNORS', password: 'didmena', password_confirmation: 'didmena', status: 'active',  apps_manager: false)
User.create(email: 'uzsakovas2@didmena.lt', fname: 'ANTRAS', lname: 'UZSAKOVAS', password: 'didmena', password_confirmation: 'didmena', status: 'inactive',  apps_manager: false)

## COMPANIES:
Company.create(title: "Aiste inc.", email: "aiste@aiste.ca", status: "active", domain_id: 13, city: "Vilnius", street: "Konarskio", postal_code: "LT-0234", phone: "613 929 2222")
Company.create(title: "Perku inc.", email: "perku@didmena.ca", status: "active", domain_id: 13, city: "Vilnius", street: "Konarskio", postal_code: "LT-0234", phone: "613 929 2222")
Company.create(title: "Didmena inc.", email: "didmena@didmena.ca", status: "inactive", domain_id: 13, city: "Vilnius", street: "Konarskio", postal_code: "LT-0234", phone: "613 929 2222")

## REPRESENTATIVE:
Representative.create(user_id: 1, company_id: 1)
Representative.create(user_id: 2, company_id: 2)
Representative.create(user_id: 3, company_id: 3)
Representative.create(user_id: 4, company_id: 1)
Representative.create(user_id: 5, company_id: 2)

## MODEL:

Model.create(code: 'HELLO1', title: 'Maikute 001', gender_id: 1, category_id: 8)
Model.create(code: 'HELLO2', title: 'Maikute 002', gender_id: 2, category_id: 8)
Model.create(code: 'HELLO3', title: 'Jacket 001', gender_id: 1, category_id: 7)
Model.create(code: 'HELLO4', title: 'Jacket 002', gender_id: 2, category_id: 7)
Model.create(code: 'HELLO5', title: 'Coat 001', gender_id: 1, category_id: 9)
Model.create(code: 'HELLO6', title: 'Coat 002', gender_id: 2, category_id: 9)

## PRODUCT

Product.create(model_id: 1, color_id: 1, size_id: 1)
Product.create(model_id: 1, color_id: 1, size_id: 2)
Product.create(model_id: 1, color_id: 1, size_id: 3)

Product.create(model_id: 2, color_id: 1, size_id: 1)
Product.create(model_id: 2, color_id: 1, size_id: 3)
Product.create(model_id: 2, color_id: 1, size_id: 2)
Product.create(model_id: 2, color_id: 1, size_id: 4)
Product.create(model_id: 2, color_id: 1, size_id: 5)

Product.create(model_id: 2, color_id: 3, size_id: 1)
Product.create(model_id: 2, color_id: 3, size_id: 3)
Product.create(model_id: 2, color_id: 3, size_id: 2)
Product.create(model_id: 2, color_id: 3, size_id: 4)
Product.create(model_id: 2, color_id: 3, size_id: 5)

Product.create(model_id: 4, color_id: 3, size_id: 2)
Product.create(model_id: 4, color_id: 3, size_id: 1)
Product.create(model_id: 4, color_id: 2, size_id: 4)
Product.create(model_id: 4, color_id: 2, size_id: 3)
Product.create(model_id: 4, color_id: 2, size_id: 5)

## PRICE

Price.create(product_id: 1, from_date: "2012-04-25", price: 25.00, domain_id: 22)
Price.create(product_id: 2, from_date: "2012-04-25", price: 55.00, domain_id: 22)
Price.create(product_id: 3, from_date: "2012-04-25", price: 125.00, domain_id: 22)
Price.create(product_id: 4, from_date: "2012-04-25", price: 225.00, domain_id: 22)
Price.create(product_id: 5, from_date: "2012-04-25", price: 250.00, domain_id: 22)
Price.create(product_id: 6, from_date: "2012-04-25", price: 50.00, domain_id: 22)
Price.create(product_id: 7, from_date: "2012-04-25", price: 2.00, domain_id: 22)
Price.create(product_id: 8, from_date: "2012-04-25", price: 25.00, domain_id: 22)
Price.create(product_id: 9, from_date: "2012-04-25", price: 15.00, domain_id: 22)
Price.create(product_id: 10, from_date: "2012-04-25", price: 45.00, domain_id: 22)
Price.create(product_id: 11, from_date: "2012-04-25", price: 25.00, domain_id: 22)
Price.create(product_id: 12, from_date: "2012-04-25", price: 25.00, domain_id: 22)

## ORDER

Order.create(order_number: "123HOW", order_date: "2016-03-01", representative_id: 3, domain_id: 22)
Order.create(order_number: "113HOW", order_date: Time.now, representative_id: 3, domain_id: 22)
Order.create(order_number: "123ENSW", order_date: Time.now, representative_id: 2, domain_id: 22)


## ORDER PRODUCT











