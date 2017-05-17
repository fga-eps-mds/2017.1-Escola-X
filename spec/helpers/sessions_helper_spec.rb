require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SessionsHelper. For example:
#
# describe SessionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SessionsHelper, type: :helper do
  let(:principal_inputs) { { name: "Michael Cera", phone:"61988885555",
                             address:"Rua Vida Casa 15,Taguatinga",
                             password: "12345678", gender:"M",
                             birth_date:"07/06/1988", registry:"123456",
                             employee_cpf:"06057577124",shift:"diurno"} }

  let(:alumn_inputs) { { name: "Michael Cera", phone:"61988885555",
                         address:"Rua Vida Casa 15,Taguatinga",
                         password: "12345678", gender:"M",
                         birth_date:"07/06/1988",registry:"123456",
                         shift:"matutino",parent_id:parent.id} }

  let(:teacher_inputs) { { name:"Victor Hugo",phone:"61983104981",
                         address:"QR 602 Conjunto 06 Casa 05",
                         registry:"654321",employee_cpf:"02951294174",
                         admission_date:"15/04/2012",shift:"Matutino",
                         gender:"Masculino",birth_date:"09/07/1995",
                         password:"12345678",admission_date:"14/04/2012"} }

  let(:parent_inputs) { { name:"Jaozin Silva",phone:"61989998888",
                         address:"Rua do pao casa 22, Asa sul",
                         password:"12345678", gender:"Masculino",
                         birth_date:"08/10/1989",parent_cpf:"06057577124"} }

  let(:secretary_inputs) { { employee_cpf: "06057577124", admission_date: "03/01/1996",
                       	 shift: "Matutino", name: "Jose Apolinario da Silva",
                			   address: "Rua Laranjeiras 456", phone: "60991907175",
                			   gender: "Masculino", birth_date: "02/02/2012",
                			   password: "12345678", permission:"Secretary", registry:"555444"} }

    pending "add some examples to (or delete) #{__FILE__}"

    describe SessionsHelper do

      describe "current user not nil" do
        it "valid current user" do
          login_principal
          expect(current_user).to_not be_nil
        end

        it "current user is logged in" do
          login_principal
          expect(logged_in?).to be true
        end

        it "current user is Principal" do
          user = Principal.create! principal_inputs
          cookies[:authorization_token] = user.authorization_token
          expect(is_principal?).to be true
        end

        it "current user is Alumn" do
          parent = Parent.create! parent_inputs
          user = Alumn.create! alumn_inputs
          cookies[:authorization_token] = user.authorization_token
          expect(is_alumn?).to be true
        end

        it "current user is parent" do
          user = Parent.create! parent_inputs
          cookies[:authorization_token] = user.authorization_token
          expect(is_parent?).to be true
        end

        it "current user is teacher" do
          teacher = Teacher.create! teacher_inputs
          cookies[:authorization_token] = teacher.authorization_token
          expect(is_teacher?).to be true
        end

        it "current user is not teacher" do
          user = Parent.create! parent_inputs
          cookies[:authorization_token] = user.authorization_token
          expect(is_teacher?).to be false
        end
        it "current user not logged_in" do
          expect{logged_in?}.to raise_error('Not logged in')
        end
        it "current user is not secretary" do
          teacher = Teacher.create! teacher_inputs
          cookies[:authorization_token] = teacher.authorization_token
          expect(is_secretary?).to be false
        end


    end
  end
end
