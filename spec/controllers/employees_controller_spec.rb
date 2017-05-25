require 'rails_helper'
require 'helper_module_spec'

RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe EmployeesController, type: :controller do

  let(:valid_inputs) { { name:"Victor Hugo",phone:"61983104981",
                         address:"QR 602 Conjunto 06 Casa 05",
                         registry:"654321",employee_cpf:"02951294174",
                         admission_date:"15/04/2012",shift:"Matutino",
                         gender:"Masculino",birth_date:"09/07/1995",
                         password:"12345678"} }
  let(:alumn_inputs) { { name: "Michael Cera", phone:"61988885555",
                         address:"Rua Vida Casa 15,Taguatinga",
                         password: "12345678", gender:"M",
                         birth_date:"07/06/1988", registry:"12345",
                         parent_id: parent.id, shift:"matutino"} }

  describe "edit password" do
    before(:each) do
      login_principal
    end
    it "assings employee to @employee" do
      employee = Employee.create!(valid_inputs)
      get :edit_password_employee, params:{id: employee}
      expect(assigns(:user)).to eq(employee)
    end
    it "render edit_password template" do
      employee = Employee.create!(valid_inputs)
      get :edit_password_employee, params:{id: employee}
      expect(response).to render_template("../users/edit_password")
    end
  end

  describe "edit password" do
    before(:each) do
      login_principal
    end
    it "assings employee to @employee" do
      employee = Employee.create!(valid_inputs)
      get :edit_password_employee, params:{id: employee}
      expect(assigns(:user)).to eq(employee)
    end
    it "render edit_password template" do
      employee = Employee.create!(valid_inputs)
      get :edit_password_employee, params:{id: employee}
      expect(response).to render_template("../users/edit_password")
    end
  end

  describe "GET index" do
    before(:each) do
      login_principal
    end
    it "assigns all employees to @employees" do
      get :index
      expect(assigns(:employees)).to match_array(Employee.all)
    end
  end
end
