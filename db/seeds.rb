# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create(name: 'Michael Cera', address: 'rua do ovo'. cpf: '123456789',
#   registry: '123456', phone: '33213030', permission: 'Principal', password: '123456')
#
# User.create(name: 'Michael Douglas', address: 'rua do ovo'. cpf: '40028922',
#     registry: '40028922', phone: '33213030', permission: 'Alumn', password: '123456')
#
# User.create(name: 'Michael Jackson', address: 'rua do ovo'. cpf: '666321',
#       registry: '666321', phone: '33213030', permission: 'Parent', password: '123456')

# initial_population = [
#   ["Michael Cera","rua do ovo","123456789",123456,"33213030","Principal","123456"],
#   ["Michael Douglas","rua do zé","40028922",40028922,"33213030","Alumn","123456"],
#   ["Michael Jackson","rua do limoreiro","30303030",10101001,"33213030","Parent","123456"],
#   ["Solid Snake","hangar bay","101010010",98765432,"33003923","Principal","lalilulelo"]
# ]
#
# initial_population.each do |name, address, cpf, registry, phone, permission, password|
#   User.create( name: name, address: address, cpf: cpf, registry: registry,
#               phone: phone, permission: permission, password: password )
# end
User.create(name: 'Francois Dillinger', address: 'rua do ovo', phone: '6133213030',
             permission: 'Principal', password: '12345678', birth_date: '10-10-1990')
 Employee.create(registry: '123456', user_id: User.last.id)
