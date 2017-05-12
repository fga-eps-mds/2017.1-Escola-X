require 'rails_helper'

RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe ClassroomsController, type: :controller do

  let(:valid_inputs) { { name_classroom: "3G", shift_classroom: "matutino" } }

  let(:invalid_inputs) { { name_classroom: "", shift_classroom: "" } }

  describe "GET new" do
    before(:each) do
      loggin_principal
    end

    it "assigns a new classroom as @classroom" do
      get :new, {}
      expect(assigns(:classroom)).to be_a_new(Classroom)
    end
  end

  describe "POST create" do
    before(:each) do
      loggin_principal
    end

    describe "with valid params" do
      it "Creates a new Classroom" do
        expect{
          post :create, params: {classroom: valid_inputs}
        }.to change(Classroom, :count).by 1
      end

      it "assigns a new classroom to Classrooms" do
        post :create, params: {classroom: valid_inputs}
        expect(assigns(:classroom)).to be_a Classroom
        expect(assigns(:classroom)).to be_persisted
      end

      it "redirects to @classroom page" do
        post :create, params: {classroom: valid_inputs}
        expect(response).to redirect_to classroom_path(assigns(:classroom))
      end
    end

    describe "with invalid params" do
      it "does not create a new Classroom" do
        expect{
          post :create, params: {classroom: invalid_inputs}
        }.to change(Classroom, :count).by 0
      end

      it "assigns a new classroom but no save to Classrooms" do
        post :create, params: {classroom: invalid_inputs}
        expect(assigns(:classroom)).not_to be_persisted
      end

      it "re-render the 'new' template" do
        post :create, params: {classroom: invalid_inputs}
        expect(response).to render_template("new")
      end
    end
  end

end
