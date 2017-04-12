# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Michael Cera', address: 'rua do ovo'. cpf: '123456789',
  registry: '123456', phone: '33213030', permission: 'Principal', password: '123456')

User.create(name: 'Michael Douglas', address: 'rua do ovo'. cpf: '40028922',
    registry: '40028922', phone: '33213030', permission: 'Alumn', password: '123456')

User.create(name: 'Michael Jackson', address: 'rua do ovo'. cpf: '666321',
      registry: '666321', phone: '33213030', permission: 'Parent', password: '123456')
