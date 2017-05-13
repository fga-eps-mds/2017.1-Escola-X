# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Principal.create!(name: 'Francois Dillinger', address: 'rua do ovo', phone: '6133213030',
            password: '12345678', birth_date: '10-10-1990',registry: '123456',
            employee_cpf: '73117438262',gender:"Masculino",shift:"Diurno")

Employee.create(name: "Matheus Pimenta", address: "Rua do bicho", phone: "61991907175",
            permission: 'Secretary', password: "12345678", birth_date: "03-03-1996",
            registry: "123456", employee_cpf: "05423623170", shift: "matutino",
            gender: "Masculino", admission_date: "04-04-2004")

Employee.create(name: "Igor Araujo", address: "Rua do bicho", phone: "61991907175",
            permission: 'Secretary', password: "12345678", birth_date: "03-03-1996",
            registry: "123456", employee_cpf: "05423623170", shift: "matutino",
            gender: "Masculino", admission_date: "04-04-2004")

Parent.create(name: 'Nicholas OLeary', address: 'rua do mantega',
            phone: '6155501234', password: '12345678', birth_date: '10-10-1990',
            parent_cpf: '00968977162',gender:"Masculino")

Alumn.create(name: 'Paul Bleeker', address: 'rua do pao',
            phone: '6140028922', password: '12345678', birth_date: '10-10-1991',
            registry: '654321', shift: "matutino", gender:"Masculino",
            parent_id: Parent.last.id)

Parent.create!(name: 'George-Michael Bluth', address: 'rua do iorgut batravo',
            phone: '6155501234', password: '12345678', birth_date: '10-10-1990',
            parent_cpf: '22714122264',gender:"Masculino")

Alumn.create(name: 'Evan Junior', address: 'rua do mortandela',
            phone: '6140028922', password: '12345678', birth_date: '10-10-1991',
            registry: '333123', shift: "matutino",gender:"Masculino",
            parent_id: Parent.last.id)

Parent.create!(name: 'Scott Pilgrim', address: 'rua do apresuntada',
            phone: '6155501234', password: '12345678', birth_date: '10-10-1990',
            parent_cpf: '50175452989',gender:"Masculino")

Alumn.create(name: 'Nick Twisp', address: 'rua do suco tangue',gender:"Masculino",
            phone: '6140028922', password: '12345678', birth_date: '10-10-1991',
            registry: '555123', shift: "matutino", parent_id: Parent.last.id)

Parent.create!(name: 'Chuck Barris', address: 'rua do regueijão ibamté',gender:"Masculino",
            phone: '6155501234', password: '12345678', birth_date: '10-10-1990',
            parent_cpf: '76135936573')

Alumn.create(name: 'America Hoffman', address: 'rua do leite com tode',gender:"Masculino",
            phone: '6140028922', password: '12345678', birth_date: '10-10-1991',
            registry: '098765', shift: "matutino", parent_id: Parent.last.id)
