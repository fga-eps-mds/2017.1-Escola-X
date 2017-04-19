require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

RSpec.describe UsersHelper, type: :helper do
let(:principal_inputs) { { name: "Michael Cera", phone:"61988885555",
                           address:"Rua Vida Casa 15,Taguatinga",
                           password: "12345678", gender:"M",
                           birth_date:"07/06/1988", permission:"Principal"} }

let(:alumn_inputs) { { name: "Michael Cera", phone:"61988885555",
                       address:"Rua Vida Casa 15,Taguatinga",
                       password: "12345678", gender:"M",
                       birth_date:"07/06/1988", permission:"Alumn"} }

let(:teacher_inputs) { { name: "Michael Cera", phone:"61988885555",
                        address:"Rua Vida Casa 15,Taguatinga",
                        password: "12345678", gender:"M",
                        birth_date:"07/06/1988", permission:"Teacher"} }

let(:parent_inputs) { { name: "Michael Cera", phone:"61988885555",
                       address:"Rua Vida Casa 15,Taguatinga",
                       password: "12345678", gender:"M",
                       birth_date:"07/06/1988", permission:"Parent"} }

  pending "add some examples to (or delete) #{__FILE__}"

  describe SessionsHelper do
    before(:each) do
      user = User.create(name: "Michael Cera", phone:"61988885555",address:"Rua Vida Casa 15,Taguatinga",password: "12345678", gender:"M",birth_date:"07/06/1988", permission:"Principal")
      cookies[:authorization_token] = user.authorization_token
    end

    describe "current user not nil" do
      it "valid current user" do
        expect(current_user).to_not be_nil
      end

      it "current user is logged in" do
        expect(logged_in?).to be true
      end

      it "current user is Principal" do
        user = User.create! principal_inputs
        cookies[:authorization_token] = user.authorization_token
        expect(is_principal?).to be true
      end

      it "current user is Alumn" do
        user = User.create! alumn_inputs
        cookies[:authorization_token] = user.authorization_token
        expect(is_alumn?).to be true
      end

      it "current user is teacher" do
        user = User.create! teacher_inputs
        cookies[:authorization_token] = user.authorization_token
        expect(is_teacher?).to be true
      end

      it "current user is parent" do
        user = User.create! parent_inputs
        cookies[:authorization_token] = user.authorization_token
        expect(is_parent?).to be true
      end
    end
  end
end
