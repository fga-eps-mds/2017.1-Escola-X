# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ClassroomGrade.create(name_classroom_grade: "1° Fundamental")
ClassroomGrade.create(name_classroom_grade: "2° Fundamental")
ClassroomGrade.create(name_classroom_grade: "3° Fundamental")
ClassroomGrade.create(name_classroom_grade: "4° Fundamental")
ClassroomGrade.create(name_classroom_grade: "5° Fundamental")
ClassroomGrade.create(name_classroom_grade: "6° Fundamental")
ClassroomGrade.create(name_classroom_grade: "7° Fundamental")
ClassroomGrade.create(name_classroom_grade: "8° Fundamental")
ClassroomGrade.create(name_classroom_grade: "9° Fundamental")
ClassroomGrade.create(name_classroom_grade: "1° Médio")
ClassroomGrade.create(name_classroom_grade: "2° Médio")
ClassroomGrade.create(name_classroom_grade: "3° Médio")
ClassroomGrade.create(name_classroom_grade: "Supletivo")

Shift.create(name_shift: "Matutino")
Shift.create(name_shift: "Vespertino")
Shift.create(name_shift: "Noturno")
Shift.create(name_shift: "Diurno")

Secretary.create(permission: 'Secretary', registry: '456456', employee_cpf: '44662111676',
                 name: "Tia Hillary", address: "Beco dos Desiludidos", gender: "Feminino",
                 shift: 'Matutino', password_digest: '12345678', birth_date: '03-03-2000',
                 admission_date: '03-03-2001', phone: '06133713601')

Principal.create(name: 'Francois Dillinger', address: 'rua do ovo', phone: '6133213030',
                password: '12345678', birth_date: '10-10-1990', admission_date: '10-05-2000',
                gender:"Masculino", registry: '123456',
                employee_cpf: '73117438262',shift:"Diurno")


Teacher.create(name: 'McLovin', address: 'rua do ovo', phone: '6133213030',
            permission: 'Teacher', password: '12345678', birth_date: '10-10-1990',
            registry: '123457', employee_cpf: '02277449180', admission_date: "11-04-1912")

Teacher.create(name: 'Mclovin', address: 'rua do ovo', phone: '6133213030',
                password: '12345678', birth_date: '10-10-1990', gender:"Masculino",
                registry: '666333', employee_cpf: '02277449180',shift:"Diurno",
                admission_date: "11-04-1912")

Teacher.create(name: 'Sydney Ward', address: 'rua do ovo', phone: '6133213030',
                password: '12345678', birth_date: '10-10-1990', gender:"Masculino",
                registry: '369874', employee_cpf: '71257748220',shift:"Diurno",
                admission_date: "11-04-1912")

Teacher.create(name: 'Alex Lemon', address: 'rua do ovo', phone: '6133213030',
                password: '12345678', birth_date: '10-10-1990', gender:"Masculino",
                registry: '363636', employee_cpf: '76992438468',shift:"Diurno",
                admission_date: "11-04-1912")

Classroom.create(name_classroom: "G", shift_classroom: "Matutino",classroom_grade_id: ClassroomGrade.last.id, shift_id: Shift.last.id)

Subject.create(name_subject:"Filosofia", class_level:"2",teacher_id:Teacher.last.id)

Parent.create(name: 'Nicholas OLeary', address: 'rua do mantega',
            phone: '6155501234', password: '12345678', birth_date: '10-10-1990',
            parent_cpf: '00968977162',gender:'Masculino')

Alumn.create(name: 'Paul Bleeker', address: 'rua do pao',
            phone: '6140028922', password: '12345678', birth_date: '10-10-1991',
            registry: '654321', shift: "matutino", gender:"Masculino",
            parent_id: Parent.last.id,classroom_id: Classroom.last.id,
            bar_code: "123456")

Parent.create!(name: 'George-Michael Bluth', address: 'rua do iorgut batravo',
            phone: '6155501234', password: '12345678', birth_date: '10-10-1990',
            parent_cpf: '22714122264',gender:"Masculino")

Alumn.create(name: 'Evan Junior', address: 'rua do mortandela',
            phone: '6140028922', password: '12345678', birth_date: '10-10-1991',
            registry: '333123', shift: "matutino",gender:"Masculino",
            parent_id: Parent.last.id,classroom_id: Classroom.last.id , bar_code:"485769")

Parent.create!(name: 'Scott Pilgrim', address: 'rua do apresuntada',
            phone: '6155501234', password: '12345678', birth_date: '10-10-1990',
            parent_cpf: '50175452989',gender:"Masculino")

Alumn.create(name: 'Nick Twisp', address: 'rua do suco tangue',gender:"Masculino",
            phone: '6140028922', password: '12345678', birth_date: '10-10-1991',
            registry: '555123', shift: "matutino", parent_id: Parent.last.id,
            classroom_id: Classroom.last.id , bar_code:"449586")

Parent.create!(name: 'Chuck Barris', address: 'rua do regueijão ibamté',gender:"Masculino",
            phone: '6155501234', password: '12345678', birth_date: '10-10-1990',
            parent_cpf: '76135936573')

Alumn.create(name: 'America Hoffman', address: 'rua do leite com tode',gender:"Masculino",
            phone: '6140028922', password: '12345678', birth_date: '10-10-1991',
            registry: '098765', shift: "matutino", parent_id: Parent.last.id,
            classroom_id: Classroom.last.id , bar_code:"222496")

ClassroomSubject.create(classroom_id:Classroom.last.id, subject_id:Subject.last.id)

Notification.create(title: "Super Festa Julina em Junho",
                    notification_text: "Na festa vai ter quadrilha, pipoca, quentão e muito cural.",
                    employee_id: Employee.last.id,
                    notification_date: '10-10-1990',
                    notification_hour: "10:10",
                    motive: "Não precisa de motivo pra beber quentão.")

Strike.create(description_strike: "Afogou o peixe dourado do coleguinha.",
              date_strike: "25-12-2015",
              alumn_id: Alumn.last.id,
              employee_id: Employee.last.id)
