# DOMAIN:
# GENDER: F - Female, M - Male

Gender.create(code_value: 'F', meaning: 'FEMALE')
Gender.create(code_value: 'M', meaning: 'MALE')

# COLOR:  R - Red, G - Green, B - Blue, Y - Yellow, etc.

# Domain.create(domain_name: 'COLOR', code_value: '33E', meaning: '33EEAA')
# Domain.create(domain_name: 'COLOR', code_value: 'FFE', meaning: 'FFEE11')
# Domain.create(domain_name: 'COLOR', code_value: 'DDD', meaning: 'DDDAAA')
# Domain.create(domain_name: 'COLOR', code_value: 'ADF', meaning: 'ADF112')

# Color.create(code_value: 'DDEEFF', meaning: 'Light blue')

# Color names taken from http://www.w3schools.com/colors/colors_names.asp
Color.create(code_value: '000000', meaning: 'black')
Color.create(code_value: '000080', meaning: 'navy')
Color.create(code_value: '0000FF', meaning: 'blue')
Color.create(code_value: '008000', meaning: 'green')
Color.create(code_value: '00FF00', meaning: 'lime')
Color.create(code_value: '800000', meaning: 'maroon')
Color.create(code_value: '808000', meaning: 'olive')
Color.create(code_value: '808080', meaning: 'grey')
Color.create(code_value: 'FF0000', meaning: 'red')
Color.create(code_value: 'FFFF00', meaning: 'yellow')
Color.create(code_value: 'FFFFFF', meaning: 'white')

# SIZE:   S - Small, M - Medium, L - Large, XL - Extra Large, XXL - Super Extra Large, etc.

Size.create(code_value: 'XS', meaning: 'EXTRA SMALL')
Size.create(code_value: 'S', meaning: 'SMALL')
Size.create(code_value: 'M', meaning: 'MEDIUM')
Size.create(code_value: 'L', meaning: 'LARGE')
Size.create(ode_value: 'XL', meaning: 'EXTRA LARGE')
# Size.create(code_value: 'XXL', meaning: 'Extra Extra Large')

# CATEGORY: JACKET - Jacket, COAT - Coat, etc.

# Domain.create(domain_name: 'CATEGORY', code_value: 'SPRING', meaning: 'SPRING')
Season.create(code_value: 'SPRING', meaning: 'SPRING')
# Domain.create(domain_name: 'CATEGORY', code_value: 'SUMMER', meaning: 'SUMMER')
Season.create(code_value: 'SUMMER', meaning: 'SUMMER')
# Domain.create(domain_name: 'CATEGORY', code_value: 'WINTER', meaning: 'WINTER')
Season.create(code_value: 'WINTER', meaning: 'WINTER')
Season.create(code_value: 'FALL', meaning: 'FALL')

# AGE_GROUP: ADULT - Adult, CHILD - Child, JUVENILE - Juvenile, etc.

Agegroup.create(code_value: 'ADULT', meaning: 'Adult')
Agegroup.create(code_value: 'CHILD', meaning: 'Child')
Agegroup.create(code_value: 'TEENAGER', meaning: 'Teenager')

# COUNTRY: CA - Canada, US - USA, LT - Lithuania, PL - Poland, RU - Russia, etc.

Country.create(code_value: 'CA', meaning: 'Canada')
Country.create(code_value: 'LT', meaning: 'Lithuania')
Country.create(code_value: 'PL', meaning: 'Poland')
Country.create(code_value: 'RU', meaning: 'Russia')
Country.create(code_value: 'LV', meaning: 'Latvia')

# CURRENCY:  # EUR, USD, CAD, PLZ, RUR, etc.

Currency.create(code_value: 'EUR', meaning: 'Euro')
Currency.create(code_value: 'USD', meaning: 'US Dollar')
Currency.create(code_value: 'PLZ', meaning: 'Zlot')
Currency.create(code_value: 'RUR', meaning: 'Ruble')
Currency.create(code_value: 'CAD', meaning: 'Canadian Dollar')


## USERS:
User.create(email: 'admin@didmena.lt', fname: 'ADMIN', lname: 'ADMIN', password: 'didmena', password_confirmation: 'didmena', status: 'active',  apps_manager: true)
User.create(email: 'aiste.ulozaite@gmail.com', fname: 'AISTE', lname: 'ULO', password: 'didmena', password_confirmation: 'didmena', status: 'active',  apps_manager: true)
User.create(email: 'edvinas@didmena.lt', fname: 'EDVINAS', lname: 'ULOZA', password: 'didmena', password_confirmation: 'didmena', status: 'active',  apps_manager: true)
User.create(email: 'uzsakovas@didmena.lt', fname: 'UZSAKOVAS', lname: 'KASNORS', password: 'didmena', password_confirmation: 'didmena', status: 'active',  apps_manager: false)
User.create(email: 'daug@didmena.lt', fname: 'DAUG', lname: 'KASNORS', password: 'didmena', password_confirmation: 'didmena', status: 'active',  apps_manager: false)
User.create(email: 'uzsakovas2@didmena.lt', fname: 'ANTRAS', lname: 'UZSAKOVAS', password: 'didmena', password_confirmation: 'didmena', status: 'inactive',  apps_manager: false)

## COMPANIES:
# Company.create(title: "Aiste inc.", email: "aiste@aiste.ca", status: "active", domain_id: 13, city: "Vilnius", street: "Konarskio", postal_code: "LT-0234", phone: "613 929 2222")
# Company.create(title: "Perku inc.", email: "perku@didmena.ca", status: "active", domain_id: 13, city: "Vilnius", street: "Konarskio", postal_code: "LT-0234", phone: "613 929 2222")
# Company.create(title: "Didmena inc.", email: "didmena@didmena.ca", status: "inactive", domain_id: 13, city: "Vilnius", street: "Konarskio", postal_code: "LT-0234", phone: "613 929 2222")

# ## REPRESENTATIVE:
# Representative.create(user_id: 1, company_id: 1)
# Representative.create(user_id: 2, company_id: 2)
# Representative.create(user_id: 3, company_id: 3)
# Representative.create(user_id: 4, company_id: 1)
# Representative.create(user_id: 5, company_id: 2)

# ## MODEL:

# Model.create(code: 'HELLO1', price: 25, title: 'Maikute 001', gender_id: 1, category_id: 8, note: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
# Model.create(code: 'HELLO2', price: 50, title: 'Maikute 002', gender_id: 2, category_id: 8, note: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.")
# Model.create(code: 'HELLO3', price: 100, title: 'Jacket 001', gender_id: 1, category_id: 7, note: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.")
# Model.create(code: 'HELLO4', price: 66, title: 'Jacket 002', gender_id: 2, category_id: 7, note: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.")
# Model.create(code: 'HELLO5', price: 45, title: 'Coat 001', gender_id: 1, category_id: 9, note: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.")
# Model.create(code: 'HELLO6', price: 3, title: 'Coat 002', gender_id: 2, category_id: 9, note: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.")

# ## PRODUCT

# Product.create(model_id: 1, color_id: 5, size_id: 7)
# Product.create(model_id: 1, color_id: 5, size_id: 8)
# Product.create(model_id: 1, color_id: 5, size_id: 9)

# Product.create(model_id: 2, color_id: 5, size_id: 7)
# Product.create(model_id: 2, color_id: 5, size_id: 9)
# Product.create(model_id: 2, color_id: 5, size_id: 8)
# Product.create(model_id: 2, color_id: 5, size_id: 10)
# Product.create(model_id: 2, color_id: 5, size_id: 11, note: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.")

# Product.create(model_id: 2, color_id: 3, size_id: 7, note: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.")
# Product.create(model_id: 2, color_id: 3, size_id: 9, note: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.")
# Product.create(model_id: 2, color_id: 3, size_id: 8, note: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.")
# Product.create(model_id: 2, color_id: 3, size_id: 10, note: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.")
# Product.create(model_id: 2, color_id: 3, size_id: 11, note: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.")

# Product.create(model_id: 4, color_id: 3, size_id: 8, note: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.")
# Product.create(model_id: 4, color_id: 3, size_id: 7, note: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.")
# Product.create(model_id: 4, color_id: 4, size_id: 9, note: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.")
# Product.create(model_id: 4, color_id: 4, size_id: 8, note: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.")
# Product.create(model_id: 4, color_id: 6, size_id: 11)

# ## PRICE

# Price.create(model_id: 1, from_date: "2012-04-25", price: 25.00, domain_id: 22)
# Price.create(model_id: 2, from_date: "2012-04-25", price: 55.00, domain_id: 22)
# Price.create(model_id: 3, from_date: "2012-04-25", price: 125.00, domain_id: 22)
# Price.create(model_id: 4, from_date: "2012-04-25", price: 225.00, domain_id: 22)
# Price.create(model_id: 5, from_date: "2012-04-25", price: 250.00, domain_id: 22)
# Price.create(model_id: 6, from_date: "2012-04-25", price: 50.00, domain_id: 22)
# Price.create(model_id: 7, from_date: "2012-04-25", price: 2.00, domain_id: 22)
# Price.create(model_id: 8, from_date: "2012-04-25", price: 25.00, domain_id: 22)
# Price.create(model_id: 9, from_date: "2012-04-25", price: 15.00, domain_id: 22)
# Price.create(model_id: 10, from_date: "2012-04-25", price: 45.00, domain_id: 22)
# Price.create(model_id: 11, from_date: "2012-04-25", price: 25.00, domain_id: 22)
# Price.create(model_id: 12, from_date: "2012-04-25", price: 25.00, domain_id: 22)
# ORDER

# Order.create(order_number: "123HOW", order_date: "2016-03-01", representative_id: 3, domain_id: 22)
# Order.create(order_number: "113HOW", order_date: Time.now, representative_id: 3, domain_id: 22)
# Order.create(order_number: "123ENSW", order_date: Time.now, representative_id: 2, domain_id: 22)


## ORDER PRODUCT











