module Helpers
  def login_principal
    user = Principal.create!(name: "Michael Cera", phone:"61988885555",
                            address:"Rua Vida Casa 15,Taguatinga",
                            password: "12345678", gender:"Masculino",
                            birth_date:"07/06/1988",registry:"834958",
                            employee_cpf:"06057577124",shift:"Diurno")
    cookies[:authorization_token] = user.authorization_token
  end
  def parent
    parent = Parent.create(name:"Jaozin Silva",phone:"61989998888",
                           address:"Rua do pao casa 22, Asa sul",
                           password:"12345678", gender:"Masculino",
                           birth_date:"08/10/1989",parent_cpf:"06057577124")
  end
  def alumn
    alumn = Alumn.create(name: "Michael Cera", phone:"61988885555",
                           address:"Rua Vida Casa 15,Taguatinga",
                           password: "12345678", gender:"Masculino",
                           birth_date:"07/06/1988", registry:"985679",
                           shift:"matutino",parent_id:parent.id,
                           classroom_id:classroom.id)
  end

  def employee
    employee = Principal.create(name: "Michael Cera", phone:"61988885555",
                            address:"Rua Vida Casa 15,Taguatinga",
                            password: "12345678", gender:"Masculino",
                            birth_date:"07/06/1988",registry:"049561",
                            employee_cpf:"06057577124",shift:"Vespertino")
  end

  def secretary
    secretary = Secretary.create(name: "Secretario insano", phone:"61988885555",
                            address:"Rua Vida Casa 15,Taguatinga",
                            password: "12345678", gender:"Masculino",
                            birth_date:"07/06/1988",registry:"036528",
                            employee_cpf:"06057577124",shift:"Matutino")
  end

  def teacher
    teacher = Teacher.create(name: "Teacher insano", phone:"61988885555",
                            address:"Rua Vida Casa 15,Taguatinga",
                            password: "12345678", gender:"Masculino",
                            birth_date:"07/06/1988",registry:"892146",
                            employee_cpf:"06057577124",shift:"matutino")
  end

  def classroom
    classroom = Classroom.create!(name_classroom: "3G",
                                 shift_classroom: "matutino")
  end
end
