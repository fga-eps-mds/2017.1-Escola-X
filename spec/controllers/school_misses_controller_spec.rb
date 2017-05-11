require 'rails_helper'
require 'helper_module_spec'

RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe SchoolMissesController, type: :controller do
  let(:valid_inputs) { { date: DateTime.now,
                  alumn_id: 2} }
  let(:invalid_inputs) { { date: "Mattimito",
                    alumn_id: "665 - neighbor of da beast."} }


    describe "GET new" do
      before(:each) do
        loggin_principal
      end
      it "assigns a new SchoolMiss to @miss" do
        get :new, {}
        expect( assigns(:miss) ).to be_a_new SchoolMiss
      end
    end
    describe "POST create" do
      before(:each) do
        loggin_principal
      end
      describe "With valid params" do
        it "Creates a new miss" do
          expect {
            post :create, params: {school_miss: valid_inputs, alumn_id: alumn.current.id}
          }.to change(SchoolMiss, :count).by 1
        end
      end
    end
end
