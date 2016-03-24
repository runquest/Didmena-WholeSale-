# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user_admin_1 = User.create(email: 'aiste@aiste.ca', fname: 'Aiste', lname: 'Ulo', password: 'didmena', password_confirmation: 'didmena', role: 'admin')
user_buyer_1 = User.create(email: 'a@u.ca', fname: 'A', lname: 'U', password: 'didmena', password_confirmation: 'didmena', role: 'buyer')
user_buyer_2 = User.create(email: 'didmena@didmena.ca', fname: 'Didmena', lname: 'Didmena', password: 'didmena', password_confirmation: 'didmena', role: 'buyer')
user_buyer_3 = User.create(email: 'test@didmena.ca', fname: 'Test', lname: 'Didmena', password: 'didmena', password_confirmation: 'didmena', role: 'buyer')

company_1 = Company.create(name: 'Didmena LT', country: 'Lithuania', city: 'Vilnius', street: 'Paupio 41', postal_code: 'LT-0145', email: 'didmena@didmenalt.lt')
company_2 = Company.create(name: 'Canada Didmena', country: 'Canada', city: 'Ottawa', street: '1928 Nelson', postal_code: 'V6G 1N2', email: 'test@didmenaca.ca')

representative_1 = Representative.create(company_id: company_1.id, user_id: user_buyer_1.id, contact_type: 'contact')
representative_2 = Representative.create(company_id: company_1.id, user_id: user_buyer_2.id, contact_type: 'ordering')
representative_3 = Representative.create(company_id: company_2.id, user_id: user_buyer_3.id, contact_type: 'both')

type_1 = Type.create(name: 'female')
type_2 = Type.create(name: 'male')

collection_1 = Collection.create(name: 'Winter', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur molestie at tellus ut vehicula. Pellentesque ac quam a ex efficitur tristique. Phasellus a nibh in magna porta tempus vel eget magna. Nulla eros odio, euismod id tempus sed, ultricies at arcu. Maecenas eros diam, mattis id dictum nec, dapibus in nisi. Curabitur in erat id quam iaculis pretium. Nam ex ex, eleifend nec quam ac, condimentum fermentum nulla. Integer non purus dui. Cras convallis eget nunc eu egestas. In tempus ullamcorper diam ac mattis.')
collection_2 = Collection.create(name: 'Summer', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur molestie at tellus ut vehicula. Pellentesque ac quam a ex efficitur tristique. Phasellus a nibh in magna porta tempus vel eget magna. Nulla eros odio, euismod id tempus sed, ultricies at arcu. Maecenas eros diam, mattis id dictum nec, dapibus in nisi. Curabitur in erat id quam iaculis pretium. Nam ex ex, eleifend nec quam ac, condimentum fermentum nulla. Integer non purus dui. Cras convallis eget nunc eu egestas. In tempus ullamcorper diam ac mattis.')
collection_3 = Collection.create(name: 'Spring', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur molestie at tellus ut vehicula. Pellentesque ac quam a ex efficitur tristique. Phasellus a nibh in magna porta tempus vel eget magna. Nulla eros odio, euismod id tempus sed, ultricies at arcu. Maecenas eros diam, mattis id dictum nec, dapibus in nisi. Curabitur in erat id quam iaculis pretium. Nam ex ex, eleifend nec quam ac, condimentum fermentum nulla. Integer non purus dui. Cras convallis eget nunc eu egestas. In tempus ullamcorper diam ac mattis.')

red = Color.create(name: 'red')
yellow = Color.create(name: 'yellow')
blue = Color.create(name: 'blue')
green = Color.create(name: 'green')
pink = Color.create(name: 'pink')

xs = Size.create(name: 'XS')
s = Size.create(name: 'S')
m = Size.create(name: 'M')
l = Size.create(name: 'L')
xl = Size.create(name: 'XL')
xxl = Size.create(name: 'XXL')

model_1 = Model.create(code: 'XDR12', collection_id: collection_1.id, type_id: type_1.id, price: 50.00, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur molestie at tellus ut vehicula. Pellentesque ac quam a ex efficitur tristique. Phasellus a nibh in magna porta tempus vel eget magna. Nulla eros odio, euismod id tempus sed, ultricies at arcu. Maecenas eros diam, mattis id dictum nec, dapibus in nisi. Curabitur in erat id quam iaculis pretium. Nam ex ex, eleifend nec quam ac, condimentum fermentum nulla. Integer non purus dui. Cras convallis eget nunc eu egestas. In tempus ullamcorper diam ac mattis.')
model_2 = Model.create(code: 'XDA2', collection_id: collection_2.id, type_id: type_1.id,  price: 10.00, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur molestie at tellus ut vehicula. Pellentesque ac quam a ex efficitur tristique. Phasellus a nibh in magna porta tempus vel eget magna. Nulla eros odio, euismod id tempus sed, ultricies at arcu. Maecenas eros diam, mattis id dictum nec, dapibus in nisi. Curabitur in erat id quam iaculis pretium. Nam ex ex, eleifend nec quam ac, condimentum fermentum nulla. Integer non purus dui. Cras convallis eget nunc eu egestas. In tempus ullamcorper diam ac mattis.')
model_3 = Model.create(code: 'XDQ25', collection_id: collection_2.id, type_id: type_2.id, price: 30.00, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur molestie at tellus ut vehicula. Pellentesque ac quam a ex efficitur tristique. Phasellus a nibh in magna porta tempus vel eget magna. Nulla eros odio, euismod id tempus sed, ultricies at arcu. Maecenas eros diam, mattis id dictum nec, dapibus in nisi. Curabitur in erat id quam iaculis pretium. Nam ex ex, eleifend nec quam ac, condimentum fermentum nulla. Integer non purus dui. Cras convallis eget nunc eu egestas. In tempus ullamcorper diam ac mattis.')

model_4 = Model.create(code: 'XDQ25', collection_id: collection_3.id, type_id: type_2.id, price: 30.00, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur molestie at tellus ut vehicula. Pellentesque ac quam a ex efficitur tristique. Phasellus a nibh in magna porta tempus vel eget magna. Nulla eros odio, euismod id tempus sed, ultricies at arcu. Maecenas eros diam, mattis id dictum nec, dapibus in nisi. Curabitur in erat id quam iaculis pretium. Nam ex ex, eleifend nec quam ac, condimentum fermentum nulla. Integer non purus dui. Cras convallis eget nunc eu egestas. In tempus ullamcorper diam ac mattis.')
model_5 = Model.create(code: 'XDQ25', collection_id: collection_3.id, type_id: type_2.id, price: 30.00, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur molestie at tellus ut vehicula. Pellentesque ac quam a ex efficitur tristique. Phasellus a nibh in magna porta tempus vel eget magna. Nulla eros odio, euismod id tempus sed, ultricies at arcu. Maecenas eros diam, mattis id dictum nec, dapibus in nisi. Curabitur in erat id quam iaculis pretium. Nam ex ex, eleifend nec quam ac, condimentum fermentum nulla. Integer non purus dui. Cras convallis eget nunc eu egestas. In tempus ullamcorper diam ac mattis.')
model_6 = Model.create(code: 'XDQ25', collection_id: collection_3.id, type_id: type_2.id, price: 30.00, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur molestie at tellus ut vehicula. Pellentesque ac quam a ex efficitur tristique. Phasellus a nibh in magna porta tempus vel eget magna. Nulla eros odio, euismod id tempus sed, ultricies at arcu. Maecenas eros diam, mattis id dictum nec, dapibus in nisi. Curabitur in erat id quam iaculis pretium. Nam ex ex, eleifend nec quam ac, condimentum fermentum nulla. Integer non purus dui. Cras convallis eget nunc eu egestas. In tempus ullamcorper diam ac mattis.')


model_1.colors << [red, yellow]
model_2.colors << [blue, pink, red, yellow]
model_3.colors << [green, pink, yellow]
model_4.colors << [green]
model_5.colors << [pink, blue, yellow]
model_6.colors << [pink, yellow]


red.sizes << [xs, s, m, l, xl, xxl]
yellow.sizes << [xs, s, m, l, xl, xxl]
blue.sizes << [xs, s, m, l, xl, xxl]
green.sizes << [xs, s, m, l, xl, xxl]
pink.sizes << [xs, s, m, l, xl, xxl]

