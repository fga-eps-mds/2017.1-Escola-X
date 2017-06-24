module Helpers
  def login_principal
    user = Principal.create!(name: "Michael Cera", phone:"61988885555",
                            address:"Rua Vida Casa 15,Taguatinga",
                            password: "12345678", gender:"Masculino",
                            birth_date:"07/06/1988",registry:"834958",
                            employee_cpf:"06057577124")
    cookies[:authorization_token] = user.authorization_token
  end

  def login_secretary
    secretary = Secretary.create(name: "Secretario insano", phone:"61988885555",
                            address:"Rua Vida Casa 15,Taguatinga",
                            password: "12345678", gender:"Masculino",
                            birth_date:"07/06/1988",registry:"036528",
                            employee_cpf:"06057577124")
    cookies[:authorization_token] = secretary.authorization_token
  end

  def login_parent
    parent = Parent.create(name:"Jaozin Silva",phone:"61989998888",
                           address:"Rua do pao casa 22, Asa sul",
                           password:"12345678", gender:"Masculino",
                           birth_date:"08/10/1989",parent_cpf:"06057577124")
    cookies[:authorization_token] = parent.authorization_token
  end

  def login_alumn
    alumn = Alumn.create(name: "Michael Kyle", phone:"61988885555",
                           address:"Rua Vida Casa 15,Taguatinga",
                           password: "12345678", gender:"Masculino",
                           birth_date:"07/06/1988", registry:"707070",
                           parent_id: 5,
                           classroom_id: 1 , bar_code:"183942")
    cookies[:authorization_token] = alumn.authorization_token

  end

  def login_alumn
    alumn = Alumn.create(name: 'Paul Bleeker', address: 'rua do pao',
            phone: '6140028922', password: '12648678', birth_date: '10-10-1991',
            registry: '664523', gender:"Masculino",
            parent_id: 1  , bar_code:"444950")
    cookies[:authorization_token] = parent.authorization_token
  end

  def parent
    parent = Parent.create(name:"Jaozin Silva",phone:"61989998888",
                           address:"Rua do pao casa 22, Asa sul",
                           password:"12345678", gender:"Masculino",
                           birth_date:"08/10/1989",parent_cpf:"06057577124")
  end

  def alumn
    @alumn = Alumn.create(name: "Michael Cera", phone:"61988885555",
                           address:"Rua Vida Casa 15,Taguatinga",
                           password: "12345678", gender:"Masculino",
                           birth_date:"07/06/1988", registry:"985679",
                           parent_id:parent.id,
                           classroom_id:classroom.id , bar_code:"283940")
  end

  def employee
    employee = Principal.create(name: "Michael Cera", phone:"61988885555",
                            address:"Rua Vida Casa 15,Taguatinga",
                            password: "12345678", gender:"Masculino",
                            birth_date:"07/06/1988",registry:"049561",
                            employee_cpf:"06057577124")
  end

  def secretary
    secretary = Secretary.create(name: "Secretario insano", phone:"61988885555",
                            address:"Rua Vida Casa 15,Taguatinga",
                            password: "12345678", gender:"Masculino",
                            birth_date:"07/06/1988",registry:"036528",
                            employee_cpf:"06057577124")
  end

  def teacher
    @teacher = Teacher.create(name: "Teacher insano", phone:"61988885555",
                            address:"Rua Vida Casa 15,Taguatinga",
                            password: "12345678", gender:"Masculino",
                            birth_date:"07/06/1988",registry:"224569",
                            employee_cpf:"06057577124")
  end
  def teacher2
    @teacher = Teacher.create(name: "Teacher insano", phone:"61988885555",
                            address:"Rua Vida Casa 15,Taguatinga",
                            password: "12345678", gender:"Masculino",
                            birth_date:"07/06/1988",registry:"951357",
                            employee_cpf:"46247602391")
  end

  def classroom
    @classroom = Classroom.create(name_classroom: "3G",
                                 shift_classroom: "matutino")
    # ClassroomSubject.create!(classroom_id: classroom.id, subject_id: subject.id)
  end

end
