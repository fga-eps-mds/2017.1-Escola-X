require 'rails_helper'
require 'helper_module_spec'

RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe SessionsController, type: :controller do

  let(:alumn_inputs) { { name: "Michael Cera", phone:"61988885555",
                         address:"Rua Vida Casa 15,Taguatinga",
                         password: "12345678", gender:"M",
                         birth_date:"07/06/1988", registry:"12345",
                         parent_id: parent.id, shift:"matutino",classroom_id:1 , bar_code:"114439"} }

  let(:parent_inputs) { { name: "Michael Cera", phone:"61988885555",
                        address:"Rua Vida Casa 15,Taguatinga",
                        password: "12345678", gender:"M",
                        birth_date:"07/06/1988", parent_cpf:"06057577124"} }

  let(:employee_inputs) { { employee_cpf: "06057577124", admission_date: "03/01/1996",
                         shift: "Matutino", name: "Jose Apolinario da Silva",
                         address: "Rua Laranjeiras 456", phone: "60991907175",
                         gender: "Masculino", birth_date: "02/02/2012",
                         password: "12345678", permission:"Secretary", registry:"555444"} }

  describe "POST Create" do
    describe "login as alumn " do
      it "assigns alumn to @user" do
        alumn = Alumn.create! alumn_inputs
        post :create, params:{login: alumn.registry, password:alumn.password}
        expect(assigns(:user)).to eq(alumn)
      end

      it "assigns alumn token to cookie" do
        alumn = Alumn.create! alumn_inputs
        post :create, params:{login: alumn.registry, password:alumn.password}
        expect(cookies[:authorization_token]).to eq(alumn.authorization_token)
      end

      it "redirects to alumn path" do
        alumn = Alumn.create! alumn_inputs
        post :create, params:{login: alumn.registry, password:alumn.password}
        expect(response).to redirect_to alumn_path(assigns(:user))
      end
    end

    describe "login as parent" do
      it "assigns parent to @user" do
        parent = Parent.create! parent_inputs
        post :create, params:{login: parent.parent_cpf, password:parent.password}
        expect(assigns(:user)).to eq(parent)
      end

      it "assings parent token to cookie" do
        parent = Parent.create! parent_inputs
        post :create, params:{login: parent.parent_cpf, password:parent.password}
        expect(cookies[:authorization_token]).to eq(parent.authorization_token)
      end

      it "redirects to parents alumns path" do
        parent = Parent.create! parent_inputs
        post :create, params:{login: parent.parent_cpf, password:parent.password}
        expect(response).to redirect_to parent_alumns_path(assigns(:user))
      end
    end

    describe "login as employee" do
      it "assigns employee to @user" do
        employee = Employee.create! employee_inputs
        post :create, params:{login: employee.registry, password:employee.password}
        expect(assigns(:user)).to eq(employee)
      end

      it "assings employee token to cookie" do
        employee = Employee.create! employee_inputs
        post :create, params:{login: employee.registry, password:employee.password}
        expect(cookies[:authorization_token]).to eq(employee.authorization_token)
      end
    end

    describe "does not login" do
      it "does not assings user token to cookie" do
        employee = Employee.create! employee_inputs
        post :create, params:{login: employee.registry, password:""}
        expect(cookies[:authorization_token]).to eq(nil)
      end
      it "redirects to root url" do
        employee = Employee.create! employee_inputs
        post :create, params:{login: employee.registry, password:""}
        expect(response).to redirect_to root_url
        expect(:notice).to be_present
      end
    end
  end

  describe "DELETE destroy" do
    before(:each) do
      login_principal
    end

    it "clear the browser cookie" do
      get :destroy
      expect(cookies[:authorization_token]).to eq(nil)
    end

    it "redirects to root url" do
      get :destroy
      expect(response).to redirect_to root_url
    end
  end
end
