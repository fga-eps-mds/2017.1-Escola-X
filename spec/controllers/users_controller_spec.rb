require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:valid_inputs) { { name: "Hollerith", cpf: 12345678910,
                         password: "123456", rg: 123456789 } }

  let(:invalid_inputs) { { name: "Ayu", cpf: 1234567891,
                           password: "12345", rg: 123 } }

  let(:valid_session) {{}}


  describe "Creates a new user" do
    it "assigns a new user to @user" do
      get :new, params: {}, session: valid_session
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "Post create" do
    describe "with valid params" do
      it "Creates a new User" do
        expect{
          post :create, params: {:user => valid_inputs}
        }.to change(User, :count).by 1
      end

      it "assigns a new user to @user" do
        post :create, params: {:user => valid_inputs}
        expect(assigns(:user)).to be_a User
        expect(assigns(:user)).to be_persisted
      end

      it "" do

      end
    end
  end
end
