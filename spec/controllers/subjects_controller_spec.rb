require 'rails_helper'


RSpec.describe SubjectsController, type: :controller do
  let(:valid_inputs) { { name_subject:"Filosofia", class_level:"2º" } }

  let(:invalid_inputs) { { name_subject:"A", class_level:"", teacher_id:-1 } }


  describe "GET new" do
    before(:each) do
      login_principal
    end
    it "assigns a new subject to @subject" do
      get :new, {}
      expect(assigns(:subject)).to be_a_new(Subject)
    end
  end

  describe "POST create" do
    before(:each) do
      login_principal
    end
    describe "with valid params" do
      it "creates a new subject" do
        expect{
          post :create, params: {subject: valid_inputs,
                                 teacher_registry:teacher.registry}
        }.to change(Subject,:count).by 1
      end
    end
  end

end
