require 'rails_helper'

RSpec.describe SecretariesController, type: :controller do 
	let(:valid_inputs) { { employee_cpf: "53991850168", admision_date: "03/01/1996",
						   shift: "Matutino", name: "Jose Apolinario da Silva",
						   address: "Rua Laranjeiras 456", phone: "60991907175",
						   gender: "Masculino", birth_date: "02/02/2012",
						   password: "12345678"} }

	let(:invalid_inputs) { { employee_cpf: "53991850168", admision_date: "03/01/1996",
						   shift: "Matutino", name: "Jose Apolinario da Silva",
						   address: "Rua Laranjeiras 456", phone: "60991907175",
						   gender: "Masculino", birth_date: "02/02/2012"} }

end

  def secretary
    secretary = Secretary.create(name:"Jaozin Silva",phone:"61989998888",
                           address:"Rua do pao casa 22, Asa sul",
                           password:"12345678", gender:"Masculino",
                           birth_date:"08/10/1989",employee_cpf:"06057577124",
                           shift: "Matutino",admision_date: "03/01/1996")
  end

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

	  it "assigns a new user as @user" do
      	get :new, params:{secretary_id: secretary.id}
      	expect(assigns(:secretary)).to be_a_new(Secretary)
    end
end

  describe "DELETE delete" do
    before(:each) do
      loggin_principal
    end
    it "does delete an Secretary" do
      secretary = Secretary.create!(name:"Jaozin Silva",phone:"61989998888",
                           address:"Rua do pao casa 22, Asa sul",
                           password:"12345678", gender:"Masculino",
                           birth_date:"08/10/1989",employee_cpf:"06057577124",
                           shift: "Matutino",admision_date: "03/01/1996")
      expect{
        delete :destroy, id: secretary
      }.to change(Secretary, :count).by(-1)
    end
  end

    describe "Post create" do
    before(:each) do
      loggin_principal
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