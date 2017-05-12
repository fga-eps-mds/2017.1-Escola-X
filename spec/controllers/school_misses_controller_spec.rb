require 'rails_helper'
require 'helper_module_spec'

RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe SchoolMissesController, type: :controller do
  let(:valid_inputs) { { date: DateTime.now,
                  alumn_id: 1} }
  let(:invalid_inputs) { { date: "Mattimito",
                    alumn_id: "665 - neighbor of da beast."} }


    describe "GET new" do
      before(:each) do
        loggin_principal
      end
      it "assigns a new SchoolMiss to @school_miss" do
        get :new, {}
        expect( assigns(:school_miss) ).to be_a_new SchoolMiss
      end
    end
    describe "POST create" do
      before(:each) do
        loggin_principal
        alumn = Alumn.create(name: "Michael Cera", phone:"61988885555",
                         address:"Rua Vida Casa 15,Taguatinga",
                         password: "12345678", gender:"M",
                         birth_date:"07/06/1988", registry:"123456",
                         parent_id: 1, shift:"matutino")
			  Alumn.current = alumn
      end
      describe "With valid params" do
        it "Creates a new school_miss" do
          expect {
            post :create, params: {school_miss: valid_inputs, alumn_id: Alumn.current.id}
          }.to change(SchoolMiss, :count).by 1
        end
        it "Assigns a new miss to @school_miss" do
            post :create, params: {school_miss: valid_inputs, alumn_id: Alumn.current.id}
            sm = assigns(:school_miss)
            expect(sm).to be_a SchoolMiss
            expect(sm).to be_persisted
        end
        it "redirects to @alumn.current page" do
          post :create, params: {school_miss: valid_inputs, alumn_id: Alumn.current.id}
          expect(response).to redirect_to alumn_path(Alumn.current)
        end
      end
    end
end
