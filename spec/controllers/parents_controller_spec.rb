require 'rails_helper'

RSpec.describe ParentsController, type: :controller do
  let(:valid_inputs) { { name: "Michael Cera", phone:"61988885555",
                         address:"Rua Vida Casa 15,Taguatinga",
                         password: "12345678", gender:"M",
                         birth_date:"07/06/1988", parent_cpf:"06057577124",
                         permission:"Parent"} }

  let(:invalid_inputs) { { name: "Ayu", phone:"25460", address:"Ali Casa 2",
                           password: "12345", gender:"adfsd",
                           birth_date:"50 abr",parent_cpf:"77777777",
                           permission:" " } }


  def loggin_principal
    user = Principal.create(name: "Michael Cera", phone:"61988885555",
                            address:"Rua Vida Casa 15,Taguatinga",
                            password: "12345678", gender:"M",
                            birth_date:"07/06/1988",registry:"123456")
    cookies[:authorization_token] = user.authorization_token
  end
  describe "GET new" do
    before(:each) do
      loggin_principal
    end

    it "assigns a new parent as @parent" do
      get :new, {}
      expect(assigns(:parent)).to be_a_new(Parent)
      end
    end

  describe "POST create" do
    before(:each) do
      loggin_principal
    end

    describe "with valid params" do
      it "Creates a new Parent" do
        expect{
          post :create, params: {parent: valid_inputs}
        }.to change(Parent, :count).by 1
      end

      it "assigns a new parent to @parent" do
        post :create, params: {parent: valid_inputs}
        expect(assigns(:parent)).to be_a Parent
        expect(assigns(:parent)).to be_persisted
      end

      it "redirects to new alumn related with @parent" do
        post :create, params: {parent: valid_inputs}
        expect(response).to redirect_to new_parent_alumn_path(assigns(:parent))
      end
    end

    describe "with invalid params" do
      it "does not create a new Parent" do
        expect{
          post :create, params: {parent: invalid_inputs}
        }.to change(Parent, :count).by 0
      end

      it "assigns a new parent but no save to @parent" do
        post :create, params: {parent: invalid_inputs}
        expect(assigns(:parent)).not_to be_persisted
      end

      it "re-render the 'new' template" do
        post :create, params: {parent: invalid_inputs}
        expect(response).to render_template("new")
      end
    end
  end

  describe "DELETE delete" do
    before(:each) do
      loggin_principal
    end
    it "does delete an Parent" do
      parent = Parent.create! valid_inputs
      expect{
        delete :destroy, id: parent
      }.to change(Parent, :count).by(-1)
    end
  end
end
