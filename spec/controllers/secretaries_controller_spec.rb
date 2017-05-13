require 'rails_helper'

RSpec.describe SecretariesController, type: :controller do

	let(:valid_inputs) { { employee_cpf: "06057577124", admission_date: "03/01/1996",
						   shift: "Matutino", name: "Jose Apolinario da Silva",
						   address: "Rua Laranjeiras 456", phone: "60991907175",
						   gender: "Masculino", birth_date: "02/02/2012",
						   password: "12345678", permission:"Secretary", registry:"555444"} }

	let(:invalid_inputs) { { employee_cpf: "8", admission_date: "03/01/1996",
						   shift: "Matutino", name: "Jose Apolinario da Silva",
						   address: "Rua Laranjeiras 456", phone: "60991907175",
						   gender: "Masculino", birth_date: "02/02/2012",permission:" ", registry:"1"} }

  # def login_principal
  #   user = Principal.create(name: "Michael Cera", phone:"61988885555",
  #                           address:"Rua Vida Casa 15,Taguatinga",
  #                           password: "12345678", gender:"M",
  #                           birth_date:"07/06/1988",registry:"123456",
  #                           employee_cpf:"06057577124")
  #   cookies[:authorization_token] = user.authorization_token
  # end
 describe "GET new" do
	   before(:each) do
	     login_principal
	    end

	  it "assigns a new secreatry as @secretary" do
      	get :new, {}
      	expect(assigns(:secretary)).to be_a_new(Secretary)
    end
end

describe "PUT update" do
    before(:each) do
      login_principal
    end

    describe "with valid params" do
      it "updates the requested secretary" do
        secretary = Secretary.create! valid_inputs
        # Assuming there are no other secretarys in the database, this
        # specifies that the secretary created on the previous line
        # receives the :update_attributes message with whatever params are
        put :update, {:id => secretary.to_param, :secretary =>  valid_inputs }
      end

      it "assigns the requested secretary as @secretary" do
        secretary = Secretary.create! valid_inputs
        put :update, {:id => secretary.to_param, :secretary => valid_inputs}
        expect(assigns(:secretary)).to eq(secretary)
      end

      it "redirects to the secretary" do
        secretary = Secretary.create! valid_inputs
        put :update, {:id => secretary.to_param, :secretary => valid_inputs}
        expect(response).to redirect_to secretary_path
      end
    end

    describe "with invalid params" do
      it "assigns the secretary as @secretary" do
        secretary = Secretary.create! valid_inputs
        # Trigger the behavior that occurs when invalid params are submitted
        #allow_any_instance_of(secretary).to receive(:save).and_return(false)
        put :update, {:id => secretary.to_param, :secretary => invalid_inputs }
        expect(assigns(:secretary)).to eq(secretary)
      end

      it "re-renders the 'edit' template" do
        secretary = Secretary.create! valid_inputs
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Secretary).to receive(:save).and_return(false)
        put :update, {:id => secretary.to_param, :secretary => invalid_inputs }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "GET index" do
    before(:each) do
      login_principal
    end

    it "assigns all secretaries as @secretaries" do
      get :index
      response.should be_success
    end

    it "should search secretary" do
      secretary = Secretary.create!(valid_inputs)
      get :index, { :id => secretary.to_param, template: 'secretaries/:id' }
      expect(response).to render_template :index
    end

  end

  describe "GET edit" do
    before(:each) do
      login_principal
    end

    it "assigns the requested secretary as @secretary" do
      secretary = Secretary.create!(valid_inputs)
      get :edit, {:id => secretary.to_param}
      expect(assigns(:secretary)).to eq(secretary)
    end
  end

  describe 'GET show' do
    before(:each) do
      login_principal
    end

  it 'should show secretary' do
    secretary = Secretary.create! valid_inputs
    get :show, { :id => secretary.to_param, template: 'secretaries/:id' }
    expect(response).to render_template :show
  end
end

  describe "DELETE delete" do
    before(:each) do
      login_principal
    end
    it "does delete an Secretary" do
      secretary = Secretary.create!(valid_inputs)
      expect{
        delete :destroy, id: secretary
      }.to change(Secretary, :count).by(-1)
    end
  end

    describe "Post create" do
      before(:each) do
        login_principal
      end

      describe "with valid params" do
        it "Creates a new Secretary" do
          expect{
            post :create, params: {secretary: valid_inputs}
          }.to change(Secretary, :count).by 1
        end

        it "assigns a new secretary to @secretary" do
          post :create, params: {secretary: valid_inputs}
          expect(assigns(:secretary)).to be_a Secretary
          expect(assigns(:secretary)).to be_persisted
        end

        it "redirects to @secretary page" do
          post :create, params: {secretary: valid_inputs}
          expect(response).to redirect_to secretary_path(assigns(:secretary))
        end
      end

      describe "with invalid params" do
        before(:each) do
        end
        it "does not create a new Secretary" do
          expect{
            post :create, params: {secretary: invalid_inputs}
          }.to change(Secretary, :count).by 0
        end

        it "assigns a new secretary but no save to @secretary" do
          post :create, params: {secretary: invalid_inputs}
          expect(assigns(:secretary)).not_to be_persisted
        end

        it "re-render the 'new' template" do
          post :create, params: {secretary: invalid_inputs}
          expect(response).to render_template("new")
        end
      end
    end
  end
