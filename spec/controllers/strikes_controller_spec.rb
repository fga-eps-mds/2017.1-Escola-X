require 'rails_helper'
require 'helper_module_spec'

RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe StrikesController, type: :controller do

  let(:valid_inputs) { { description_strike: "strike strike",
                         date_strike: "07/06/1988", alumn_id: alumn.id,
                         employee_id: employee.id } }

  let(:invalid_inputs) { { description_strike: "42",
                         date_strike: "", alumn_id: "", employee_id: "" } }

 describe "GET new" do
   before(:each) do
     login_principal
   end

   it "assigns a new strike as @strike" do
     get :new, params:{alumn_id:alumn.id}
     expect(assigns(:strike)).to be_a_new(Strike)
   end
 end

 # describe "GET index" do
 #   before(:each) do
 #     login_principal
 #   end
 #
 #   it "finds alumns by params and sets strikes" do
 #     strike1 = Strike.create! valid_inputs
 #     strike2 = Strike.create! valid_inputs
 #     strikes = alumn.strike
 #     get :index, {}
 #     expect(assigns(:strikes)).to match_array([strike1, strike2])
 #   end
 # end

 describe 'GET show' do
    before(:each) do
      login_principal
    end

    it 'should show strikes' do
      strike = Strike.create!(valid_inputs)
      get :show, { :id => strike.to_param, template: 'strikes/:id' }
      expect(response).to render_template :show
    end
  end

  describe "Post create" do
   before(:each) do
     login_principal
   end

   describe "with valid params" do
     it "Creates a new Strike" do
       expect{
         post :create, params: {strike: valid_inputs}
       }.to change(Strike, :count).by 1
     end

     it "assigns a new strike to Strikes" do
       post :create, params: {strike: valid_inputs}
       expect(assigns(:strike)).to be_a Strike
       expect(assigns(:strike)).to be_persisted
     end
   end

   describe "with invalid params" do
     it "does not create a new Strike" do
       expect{
         post :create, params: {strike: invalid_inputs}
       }.to change(Strike, :count).by 0
     end

     it "assigns a new strike but no save to Strikes" do
       post :create, params: {strike: invalid_inputs}
       expect(assigns(:strike)).not_to be_persisted
     end

     it "re-render the 'new' template" do
       post :create, params: {strike: invalid_inputs}
       expect(response).to render_template("new")
     end
   end
  end

  describe "DELETE delete" do
    before(:each) do
      login_principal
    end
    it "does delete an Strike" do
      strike = Strike.create!(valid_inputs)
      expect{
        delete :destroy, id: strike
      }.to change(Strike, :count).by(-1)
    end
  end

  describe "GET edit" do
    before(:each) do
      login_principal
    end
    it "assings the requested classroom as Classroom" do
      strike = Strike.create!(valid_inputs)
      get :edit, {:id => strike.to_param, :alumn_id => strike.alumn_id}
      expect(assigns(:strike)).to be_a Strike
    end
  end

  describe "POST update" do
    before(:each) do
      login_principal
    end
    describe "with valid params" do
      it "updates an strike" do
        strike = Strike.create! valid_inputs
        put :update, {id: strike.id, strike: valid_inputs}
        expect(assigns(:strike)).to be_a(Strike)
      end
      it "redirect to strike path" do
        strike = Strike.create! valid_inputs
        put :update, {id: strike.id, strike: valid_inputs}
        expect(response).to redirect_to strike_path
      end
    end
    describe "with invalid params" do
      it "updates an strike" do
        strike = Strike.create! valid_inputs
        put :update, {id: strike.id, strike: invalid_inputs}
        expect(assigns(:strike)).to eq(strike)
      end
      it "redirect to strike path" do
        strike = Strike.create! valid_inputs
        put :update, {id: strike.id, strike: invalid_inputs}
        expect(response).to render_template("edit")
      end
    end
  end




end
