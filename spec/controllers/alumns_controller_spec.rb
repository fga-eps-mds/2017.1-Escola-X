require 'rails_helper'

RSpec.describe AlumnsController, type: :controller do
  let(:valid_inputs) { { name: "Michael Cera", phone:"61988885555",
                         address:"Rua Vida Casa 15,Taguatinga",
                         password: "12345678", gender:"M",
                         birth_date:"07/06/1988", registry:"123456",
                         parent_id: 1, shift:"matutino"} }

  let(:invalid_inputs) { { name: "Ayu", phone:"25460", address:"Ali Casa 2",
                           password: "12345", gender:"adfsd",
                           birth_date:"50 abr",registry:"8",
                           parent_id: -1, shift:"matutino"} }


  def parent
    parent = Parent.create(name:"Jaozin Silva",phone:"61989998888",
                           address:"Rua do pao casa 22, Asa sul",
                           password:"12345678", gender:"Masculino",
                           birth_date:"08/10/1989",parent_cpf:"06057577124")
  end

  def loggin_principal
    user = Principal.create!(name: "Michael Cera", phone:"61988885555",
                            address:"Rua Vida Casa 15,Taguatinga",
                            password: "12345678", gender:"M",
                            birth_date:"07/06/1988",registry:"123456",
                            employee_cpf:"06057577124")
    cookies[:authorization_token] = user.authorization_token
  end
  describe "GET new" do
    before(:each) do
      loggin_principal
    end

    it "assigns a new alumn as @alumn" do
      get :new, params:{parent_id:parent.id}
      expect(assigns(:alumn)).to be_a_new(Alumn)
    end
  end

  describe "Post create" do
    before(:each) do
      loggin_principal
    end

    describe "with valid params" do
      it "Creates a new Alumn" do
        expect{
          post :create, params: {alumn: valid_inputs, parent_id: parent.id}
        }.to change(Alumn, :count).by 1
      end

      it "assigns a new alumn to @alumn" do
        post :create, params: {alumn: valid_inputs, parent_id: parent.id}
        expect(assigns(:alumn)).to be_a Alumn
        expect(assigns(:alumn)).to be_persisted
      end

      it "redirects to @alumn page" do
        post :create, params: {alumn: valid_inputs, parent_id: parent.id}
        expect(response).to redirect_to alumn_path(assigns(:alumn))
      end
    end

    describe "with invalid params" do
      it "does not create a new Alumn" do
        expect{
          post :create, params: {alumn: invalid_inputs, parent_id: parent.id}
        }.to change(Alumn, :count).by 0
      end

      it "assigns a new alumn but no save to @alumn" do
        post :create, params: {alumn: invalid_inputs, parent_id: parent.id}
        expect(assigns(:alumn)).not_to be_persisted
      end

      it "re-render the 'new' template" do
        post :create, params: {alumn: invalid_inputs, parent_id: parent.id}
        expect(response).to render_template("new")
      end
    end
  end

  describe "DELETE delete" do
    before(:each) do
      loggin_principal
    end
    it "does delete an Alumn" do
      alumn = Alumn.create!(name: "Michael Cera", phone:"61988885555",
                             address:"Rua Vida Casa 15,Taguatinga",
                             password: "12345678", gender:"M",
                             birth_date:"07/06/1988", registry:"123456",
                             shift:"matutino",parent_id:parent.id)
      expect{
        delete :destroy, id: alumn
      }.to change(Alumn, :count).by(-1)
    end
  end

end
