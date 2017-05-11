require 'rails_helper'

RSpec.describe TeachersController, type: :controller do
	let(:valid_inputs) { { name:"Victor Hugo",phone:"61983104981",
                         address:"QR 602 Conjunto 06 Casa 05",
                         registry:"654321",employee_cpf:"02951294174",
                         admission_date:"15/04/2012",shift:"Matutino",
                         gender:"M",birth_date:"09/07/1995",
                         password:"12345678",admission_date:"14/04/2012"} }

  let(:invalid_inputs) { { name:"Nai",phone:"1234",
                           address:"QR 05",
                           registry:"12443",employee_cpf:"77777777",
                           admission_date:"15/04/1912",shift:"Diurno",
                           gender:"F",birth_date:"23 de maio de 1994",
                           password:"12348",admission_date:""} }


  def teacher
    teacher = Teacher.create(name:"Victor Hugo",phone:"61983104981",
                           	 address:"QR 602 Conjunto 06 Casa 05",
                           	 registry:"654321",employee_cpf:"02951294174",
                           	 admission_date:"15/04/2012",shift:"Matutino",
                           	 gender:"M",birth_date:"09/07/1995",
                             password:"12345678",admission_date:"14/04/2012")
  end

  def loggin_principal
    user = Principal.create!(name: "Michael Cera", phone:"61988885555",
                            address:"Rua Vida Casa 15,Taguatinga",
                            password: "12345678", gender:"M",
                            birth_date:"07/06/1988",registry:"123456",
                            employee_cpf:"06057577124")
    cookies[:authorization_token] = user.authorization_token
  end

  describe "GET new" do
    before(:each) do
      loggin_principal
    end

    it "assigns a new teacher as @teacher" do
      get :new, {}
      expect(assigns(:teacher)).to be_a_new(Teacher)
      end
    end

  describe "POST create" do
    before(:each) do
      loggin_principal
    end

    describe "with valid params" do
      it "Creates a new Teacher" do
        expect{
          post :create, params: {teacher: valid_inputs}
        }.to change(Teacher, :count).by 1
      end

      it "assigns a new teacher to @teacher" do
        post :create, params: {teacher: valid_inputs}
        expect(assigns(:teacher)).to be_a Teacher
        expect(assigns(:teacher)).to be_persisted
      end
    end

    describe "with invalid params" do
      it "does not create a new Teacher" do
        expect{
          post :create, params: {teacher: invalid_inputs}
        }.to change(Teacher, :count).by 0
      end

      it "assigns a new teacher but no save to @teacher" do
        post :create, params: {teacher: invalid_inputs}
        expect(assigns(:teacher)).not_to be_persisted
      end

      it "re-render the 'new' template" do
        post :create, params: {teacher: invalid_inputs}
        expect(response).to render_template("new")
      end
    end
  end

  describe "DELETE delete" do
    before(:each) do
      loggin_principal
    end
    it "does delete an Teacher" do
      teacher = Teacher.create! valid_inputs
      expect{
        delete :destroy, id: teacher
      }.to change(Teacher, :count).by(-1)
    end
  end
end
