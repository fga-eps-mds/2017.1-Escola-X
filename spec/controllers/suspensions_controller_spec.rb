require 'rails_helper'

RSpec.describe SuspensionsController, type: :controller do

let(:valid_inputs_alumn) { { name:"Victor Hugo",phone:"6133593994",
		  											 address:"QR 602 Conjunto 06 Casa 05",
		  											 password:"12345678",gender:"M",
		  											 birth_date:"09/07/1995", registry:"135795",
		  											 parent_id: 1,shift:"Matutino" , bar_code:"184956"} }

let(:invalid_inputs_alumn) { { name: "Ayu", phone:"25460", address:"Ali Casa 2",
			                           password: "12345", gender:"adfsd",
			                           birth_date:"50 abr",registry:"8",
			                           parent_id: -1, shift:"matutino", bar_code: "5"} }

let(:valid_inputs_suspension) { { title: "Trolando ao vivo", description: "Ao vivo",
																	quantity_days: 4,date_suspension:"15/04/1912",alumn_id:alumn.id,employee_id:employee.id}}

let(:invalid_inputs_suspension) {{ title: "", description: "",
																	 quantity_days:"",date_suspension:""}}

let(:updated_inputs) { { title: "Não vai da não", description: "Sério não vai da mesmo",
                                   quantity_days:"3",date_suspension:"12/05/2017"}}

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
  											 parent_id: 1,shift:"Matutino" , bar_code:"285930")
  end

  def suspension
  	suspension = Suspension.create(title: "Trolando ao vivo", description: "Ao vivo",
																	quantity_days: 4,date_suspension:"15/04/1912")
  end

  describe "GET new" do
    before(:each) do
      login_principal
    end

    it "assigns a new suspension as @suspension" do
      get :new, params:{alumn_id:alumn.id}
      expect(assigns(:suspension)).to be_a_new(Suspension)
    end

    it "render new template" do
      get :new, params:{alumn_id:alumn.id}
      expect(response).to render_template("new")
    end
  end

  describe "POST create" do
    before(:each) do
      login_principal
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
       expect(response).to redirect_to redirect_to alumn_suspension_path((assigns(:alumn)),(assigns(:suspension)))
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

      it "re-render the 'new' template" do
          post :create, params: {suspension: invalid_inputs_suspension}
          expect(response).to render_template("new")
      end
    end
  end

  describe "PATCH #update" do
    before(:each) do
      login_principal
    end

    describe "with valid params" do
      it "put update" do
        suspension = Suspension.create!(valid_inputs_suspension)
        put :update, params:{id: suspension.to_param, suspension: updated_inputs}
        suspension.reload
      end

      it "redirects to @suspension" do
        suspension = Suspension.create!(valid_inputs_suspension)
        put :update, params:{id: suspension.to_param, suspension: updated_inputs}
        expect(response).to redirect_to suspension_path(suspension)
      end
    end

    describe "with invalid params" do
      it "does not update" do
        suspension = Suspension.create!(valid_inputs_suspension)
        allow_any_instance_of(Suspension).to receive(:save).and_return(false)
        put :update, params:{id: suspension.to_param, suspension: invalid_inputs_suspension}
        expect(assigns(:suspension)).to eq(suspension)
      end

      it "re-render edit template" do
        suspension = Suspension.create!(valid_inputs_suspension)
        allow_any_instance_of(Suspension).to receive(:save).and_return(false)
        put :update, params:{id: suspension.to_param, suspension: invalid_inputs_suspension}
        expect(assigns(:suspension)).to eq(suspension)
        expect(response).to render_template('edit')
      end
    end
  end

  describe "GET edit" do
    before(:each) do
      login_principal
    end
    it "assing a suspension to @suspension" do
      suspension = Suspension.create!(valid_inputs_suspension)
      get :edit, params:{id:suspension.id,alumn:alumn.id}
      expect(assigns(:suspension)).to be_a Suspension
    end
    it "render edit template" do
      suspension = Suspension.create!(valid_inputs_suspension)
      get :edit, params:{id:suspension.id,alumn:alumn.id}
      expect(response).to render_template("edit")
    end
  end

  describe "GET index" do
    before(:each) do
      login_principal
    end
    it "assigns all suspensions to @suspensions" do
      alumn = Alumn.create!(valid_inputs_alumn)
      suspension = Suspension.create!(valid_inputs_suspension)
      suspension2 = Suspension.create!(valid_inputs_suspension)
      alumn.suspensions = suspension, suspension2
      get :index, params:{alumn_id:alumn.id}
      expect(assigns(:suspensions)).to match_array([suspension,suspension2])
    end
    it "render index template" do
      alumn = Alumn.create!(valid_inputs_alumn)
      get :index, params:{alumn_id:alumn.id}
      expect(response).to render_template("index")
    end
  end

	describe "POST delete" do
    before(:each) do
      login_principal
    end

    it "does delete an Suspension" do
      post :create, params: {suspension: valid_inputs_suspension,alumn_id:alumn.id}
      expect(Suspension.count).to eq(1)
      suspension = Suspension.find_by(title: "Trolando ao vivo")
      expect{
        delete :destroy, params:{id: suspension.id}
      }.to change(Suspension, :count).by(-1)
    end
  end

  describe "GET show" do
    before(:each) do
      login_principal
    end
    it "assigns a suspension to @suspension" do
      alumn = Alumn.create!(valid_inputs_alumn)
      suspension = Suspension.create!(valid_inputs_suspension)
      get :show, params:{id:suspension.id}
      expect(assigns(:suspension)).to eq(suspension)
    end
    it "render show template" do
      suspension = Suspension.create!(valid_inputs_suspension)
      get :show, params:{id:suspension.id}
      expect(response).to render_template("show")
    end
  end
end
