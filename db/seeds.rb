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
 User.create(name: 'Nicholas OLeary', address: 'rua do mantega', phone: '6155501234',
              permission: 'Parent', password: '12345678', birth_date: '10-10-1990')
 Parent.create(parent_cpf: '00968977162', user_id: User.last.id)

 User.create(name: 'Paul Bleeker', address: 'rua do pao', phone: '6140028922',
              permission: 'Alumn', password: '12345678', birth_date: '10-10-1991')
  Alumn.create(registry: '654321', shift: "matutino", user_id: User.last.id)

  User.create(name: 'George-Michael Bluth', address: 'rua do iorgut batravo', phone: '6155501234',
               permission: 'Parent', password: '12345678', birth_date: '10-10-1990')
  Parent.create(parent_cpf: '22714122264', user_id: User.last.id)

  User.create(name: 'Evan', address: 'rua do mortandela', phone: '6140028922',
               permission: 'Alumn', password: '12345678', birth_date: '10-10-1991')
   Alumn.create(registry: '333123', shift: "matutino", user_id: User.last.id)

   User.create(name: 'Scott Pilgrim', address: 'rua do apresuntada', phone: '6155501234',
                permission: 'Parent', password: '12345678', birth_date: '10-10-1990')
   Parent.create(parent_cpf: '50175452989', user_id: User.last.id)

   User.create(name: 'Nick Twisp', address: 'rua do suco tangue', phone: '6140028922',
                permission: 'Alumn', password: '12345678', birth_date: '10-10-1991')
    Alumn.create(registry: '555123', shift: "matutino", user_id: User.last.id)

    User.create(name: 'Chuck Barris', address: 'rua do regueijão ibamté', phone: '6155501234',
                 permission: 'Parent', password: '12345678', birth_date: '10-10-1990')
    Parent.create(parent_cpf: '76135936573', user_id: User.last.id)

    User.create(name: 'America Hoffman', address: 'rua do leite com tode', phone: '6140028922',
                 permission: 'Alumn', password: '12345678', birth_date: '10-10-1991')
     Alumn.create(registry: '098765', shift: "matutino", user_id: User.last.id)
