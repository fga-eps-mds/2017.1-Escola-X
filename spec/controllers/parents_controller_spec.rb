require 'rails_helper'
require 'helper_module_spec'

RSpec.configure do |c|
  c.include Helpers
end


RSpec.describe ParentsController, type: :controller do
  let(:valid_inputs) { { name: "Michael Cera", phone:"61988885555",
                         address:"Rua Vida Casa 15,Taguatinga",
                         password: "12345678", gender:"M",
                         birth_date:"07/06/1988", parent_cpf:"06057577124"} }

  let(:invalid_inputs) { { name: nil, phone:"25460", address:"Ali Casa 2",
                           password: "12345", gender:"adfsd",
                           birth_date:"50 abr",parent_cpf:"77777777"} }

  let(:invalid_inputs_password) { { name: "Michael Cera", phone:"61988885555",
                         address:"Rua Vida Casa 15,Taguatinga",
                         gender:"M",birth_date:"07/06/1988", parent_cpf:"06057577124",
                         password: "123"} }

  describe "GET new" do
    before(:each) do
      login_principal
    end

    it "assigns a new parent as @parent" do
      get :new
      expect(assigns(:parent)).to be_a_new(Parent)
    end

    it "renders the 'new' template" do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe "GET edit" do
    before(:each) do
      login_principal
    end

    it "assigns the requested parent as @parent" do
      parent = Parent.create!(valid_inputs)
      get :edit, params:{id:parent.to_param}
      expect(assigns(:parent)).to eq(parent)
    end

    it "renders the 'edit' template" do
      parent = Parent.create!(valid_inputs)
      get :edit, params:{id:parent.to_param}
      expect(response).to render_template('edit')
    end
  end

  describe "GET show" do
    before(:each) do
      login_principal
    end

    it "assigns the requested parent as @parent" do
      parent = Parent.create!(valid_inputs)
      get :show, params:{id:parent.to_param}
      expect(assigns(:parent)).to eq(parent)
    end

    it "renders the 'show' template" do
      parent = Parent.create!(valid_inputs)
      get :show, params:{id:parent.to_param}
      expect(response).to render_template('show')
    end
  end

  describe "GET index" do
    describe "with the right permission" do
      before(:each) do
        login_principal
      end

      it "assigns all parents to @parents" do
        get :index
        expect(assigns(:parents)).to match_array(Parent.all)
      end

      it "renders the 'index' template" do
        get :index
        expect(response).to render_template('index')
      end
    end
    describe "with the wrong permission" do
      before(:each) do
        login_parent
      end

      it "renders the 'error 500' template" do
        get :index
        
        expect(response).to redirect_to '/errors/error_500'

        
      end

    end

  end

  describe "POST create" do
    before(:each) do
      login_principal
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

  describe "PUT update" do
    before(:each) do
      login_principal
    end

    describe "with valid params" do
      it "assigns the requested parent as @parent" do
        parent = Parent.create! valid_inputs
        put :update,params:{id: parent.to_param, parent: valid_inputs}
        expect(assigns(:parent)).to eq(parent)
      end

      it "updates the requested parent" do
        parent = Parent.create! valid_inputs
        put :update, params:{id: parent.to_param, parent: valid_inputs }
        parent.reload
      end

      it "redirects to the parent" do
        paretn = Parent.create! valid_inputs
        put :update, params:{id: parent.to_param, parent: valid_inputs}
        expect(response).to redirect_to parent_path(assigns(:parent))
      end
    end

    describe "with invalid params" do
      it "assigns the parent as @parent" do
        parent = Parent.create! valid_inputs
        put :update, params:{id: parent.to_param, parent: invalid_inputs }
        expect(assigns(:parent)).to eq(parent)
      end

      it "does not update" do
        parent = Parent.create! valid_inputs
        put :update, params:{id: parent.to_param, parent: invalid_inputs}
        expect(assigns(:parent)).to eq(parent)
      end

      it "re-renders the 'edit' template" do
        parent = Parent.create! valid_inputs
        put :update, params:{id: parent.to_param, parent: invalid_inputs }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE delete" do
    before(:each) do
      login_principal
    end
    it "does delete an Parent" do
      parent = Parent.create! valid_inputs
      expect{
        delete :destroy, params:{id: parent}
      }.to change(Parent, :count).by(-1)
    end
  end

  describe "edit password" do
    before(:each) do
      login_principal
    end
    it "assings parent to @parent" do
      parent = Parent.create!(valid_inputs)
      get :edit_password_parent, params:{id: parent}
      expect(assigns(:user)).to eq(parent)
    end
    it "render edit_password template" do
      parent = Parent.create!(valid_inputs)
      get :edit_password_parent, params:{id: parent}
      expect(response).to render_template("../users/edit_password")
    end
  end

  describe "update_password_parent" do
    before(:each) do
      login_principal
    end
    it "assigns a parent to a user" do
      parent = Parent.create!(valid_inputs)
      get :update_password_parent, params:{id: parent.to_param, parent: valid_inputs}
      expect(assigns(:user)).to be_a(Parent)
    end
    it "redirects to parent" do
      parent = Parent.create!(valid_inputs)
      put :update_password_parent, params:{id: parent.to_param, parent: valid_inputs}
      expect(response).to redirect_to parent_path(assigns(:user))
    end

    describe "with invalid params" do
      it "assigns the parent as @user" do
        parent = Parent.create! valid_inputs
        put :update_password_parent, params:{id: parent.to_param, parent: invalid_inputs_password }
        expect(assigns(:user)).to eq(parent)
      end
    end
  end
end
