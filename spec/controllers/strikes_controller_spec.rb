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

   it "assigns a new strike as @stirke" do
     get :new, params:{alumn_id:alumn.id}
     expect(assigns(:strike)).to be_a_new(Strike)
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

     it "redirects to @strike page" do
       post :create, params: {strike: valid_inputs}
       expect(response).to redirect_to strike_path(assigns(:strike))
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
end
