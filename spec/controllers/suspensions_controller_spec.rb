require 'rails_helper'

RSpec.describe SuspensionsController, type: :controller do

let(:valid_inputs_alumn) { { name:"Victor Hugo",phone:"6133593994",
		  											 address:"QR 602 Conjunto 06 Casa 05",
		  											 password:"12345678",gender:"M",
		  											 birth_date:"09/07/1995", registry:"135795",
		  											 parent_id: 1,shift:"Matutino"} }

let(:invalid_inputs_alumn) { { name: "Ayu", phone:"25460", address:"Ali Casa 2",
			                           password: "12345", gender:"adfsd",
			                           birth_date:"50 abr",registry:"8",
			                           parent_id: -1, shift:"matutino"} }

let(:valid_inputs_suspension) { { title: "Trolando ao vivo", description: "Ao vivo",
																	quantity_days: 4,date_suspension:"15/04/1912"}}

let(:invalid_inputs_suspension) {{ title: "", description: "",
																	 quantity_days:"",date_suspension:""}}

	def loggin_principal
	  user = Principal.create!(name: "Michael Cera", phone:"61988885555",
	                          address:"Rua Vida Casa 15,Taguatinga",
	                          password: "12345678", gender:"M",
	                          birth_date:"07/06/1988",registry:"123456",
	                          employee_cpf:"06057577124")
	  cookies[:authorization_token] = user.authorization_token
  end

  def parent
    parent = Parent.create(name:"Jaozin Silva",phone:"61989998888",
                           address:"Rua do pao casa 22, Asa sul",
                           password:"12345678", gender:"Masculino",
                           birth_date:"08/10/1989",parent_cpf:"06057577124")
  end

  def alumn
  	alumn = Alumn.create(name:"Victor Hugo",phone:"6133593994",
  											 address:"QR 602 Conjunto 06 Casa 05",
  											 password:"12345678",gender:"M",
  											 birth_date:"09/07/1995", registry:"135795",
  											 parent_id: 1,shift:"Matutino")
  end

  def suspension
  	suspension = Suspension.create(title: "Trolando ao vivo", description: "Ao vivo",
																	quantity_days: 4,date_suspension:"15/04/1912")
  end

  describe "GET new" do
    before(:each) do
      loggin_principal
    end

    it "assigns a new suspension as @suspension" do
      get :new, params:{alumn_id:alumn.id}
      expect(assigns(:suspension)).to be_a_new(Suspension)
    end
  end

  describe "POST create" do
    before(:each) do
      loggin_principal
    end

    describe "with valid params" do
      it "Creates a new Suspension" do
        expect{
          post :create, params: {suspension: valid_inputs_suspension,alumn_id:alumn.id}
        }.to change(Suspension, :count).by 1
      end

      it "assigns a new suspension to @suspension" do
        post :create, params: {suspension: valid_inputs_suspension,alumn_id:alumn.id}
        expect(assigns(:suspension)).to be_a Suspension
        expect(assigns(:alumn)).to be_a Alumn
        expect(assigns(:suspension)).to be_persisted
        expect(assigns(:alumn)).to be_persisted
      end

      it "redirects to @suspension page" do
       post :create, params: {suspension: valid_inputs_suspension,alumn_id:alumn.id}
       expect(response).to redirect_to suspension_path(assigns(:suspension))
     end
    end

    describe "with invalid params" do
      it "Does not create a Suspension" do
        expect{
          post :create, params: {suspension: invalid_inputs_suspension,alumn_id:alumn.id}
        }.to change(Suspension, :count).by 0
      end

      it "assigns a new suspension but no save to @suspension" do
        post :create, params: {suspension: invalid_inputs_suspension,alumn_id:alumn.id}
        expect(assigns(:suspension)).to be_a Suspension
        expect(assigns(:suspension)).not_to be_persisted
      end
    end
  end

  describe "PATCH #update" do
    before(:each) do
      loggin_principal
    end

    describe "update suspension" do
      it "updates the suspension and redirects" do
        post :create, params: {suspension: valid_inputs_suspension,alumn_id:alumn.id}
        expect(Suspension.count).to eq(1)
        suspension = Suspension.find_by(title: "Trolando ao vivo")
        expect{
          edit :update, id: suspension.id, suspension: {name: "Jiraya"}
        }
        expect(response).to redirect_to suspension_path(assigns(:suspension))
      end
    end
  end

	describe "POST delete" do
    before(:each) do
      loggin_principal
    end

    it "does delete an Suspension" do
      post :create, params: {suspension: valid_inputs_suspension,alumn_id:alumn.id}
      expect(Suspension.count).to eq(1)
      suspension = Suspension.find_by(title: "Trolando ao vivo")
      expect{
        delete :destroy, id: suspension.id
      }.to change(Suspension, :count).by(-1)
    end
  end
end
