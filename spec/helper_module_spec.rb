module Helpers
  def login_principal
    user = Principal.create!(name: "Michael Cera", phone:"61988885555",
                            address:"Rua Vida Casa 15,Taguatinga",
                            password: "12345678", gender:"M",
                            birth_date:"07/06/1988",registry:"123456",
                            employee_cpf:"06057577124")
    cookies[:authorization_token] = user.authorization_token
  end
  def parent
    parent = Parent.create!(name:"Jaozin Silva",phone:"61989998888",
                           address:"Rua do pao casa 22, Asa sul",
                           password:"12345678", gender:"Masculino",
                           birth_date:"08/10/1989",parent_cpf:"06057577124")
  end
  def alumn
    alumn = Alumn.create!(name: "Michael Cera", phone:"61988885555",
                           address:"Rua Vida Casa 15,Taguatinga",
                           password: "12345678", gender:"M",
                           birth_date:"07/06/1988", registry:"123456",
                           shift:"matutino",parent_id:parent.id)
  end

  def employee
    employee = Principal.create!(name: "Michael Cera", phone:"61988885555",
                            address:"Rua Vida Casa 15,Taguatinga",
                            password: "12345678", gender:"M",
                            birth_date:"07/06/1988",registry:"123456",
                            employee_cpf:"06057577124")
  end

  def secretary
    secretary = Secretary.create!(name: "Secretario insano", phone:"61988885555",
                            address:"Rua Vida Casa 15,Taguatinga",
                            password: "12345678", gender:"M",
                            birth_date:"07/06/1988",registry:"852963",
                            employee_cpf:"06057577124")
  end

  def teacher
    teacher = Teacher.create!(name: "Teacher insano", phone:"61988885555",
                            address:"Rua Vida Casa 15,Taguatinga",
                            password: "12345678", gender:"M",
                            birth_date:"07/06/1988",registry:"789456",
                            employee_cpf:"06057577124",shift:"matutino")
  end
end
