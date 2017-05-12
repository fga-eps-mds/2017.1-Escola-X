require 'rails_helper'


RSpec.describe SubjectsController, type: :controller do
  let(:valid_inputs) { { name_subject:"Filosofia", class_level:"2", teacher_id: teacher.id } }

  let(:invalid_inputs) { { name_subject:"A", class_level:"", teacher_id:-1 } }

  let(:updated_inputs) { { name_subject:"Filosofi", class_level:"3"}}


  describe "GET new" do
    before(:each) do
      login_principal
    end
    it "assigns a new subject to @subject" do
      get :new, {}
      expect(assigns(:subject)).to be_a_new(Subject)
    end
    it "render new template" do
      get :new,{}
      expect(response).to render_template("new")
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
      it "assigns a new subject to Subjects" do
        post :create, params: {subject: valid_inputs,
                               teacher_registry:teacher.registry}
        expect(assigns(:subject)).to be_a Subject
        expect(assigns(:subject)).to be_persisted
      end
      it "redirects to @subject " do
        post :create, params: {subject: valid_inputs, teacher_registry:teacher.registry}
        expect(response).to redirect_to subject_path(assigns(:subject))
      end
    end

    describe "with invalid params" do
      it "does not create a new subject with a valid teacher id" do
        expect{
          post :create, params: {subject: invalid_inputs,
                                teacher_registry:teacher.registry}
        }.to change(Subject,:count).by 0
      end
      it "does not create a new subject with a invalid teacher id" do
        expect{
          post :create, params: {subject: invalid_inputs}
        }.to change(Subject,:count).by 0
      end
      it "does not assign a new subject to Subjects with a valid teacher" do
        post :create, params: {subject: invalid_inputs,
                               teacher_registry:teacher.registry}
        expect(assigns(:subject)).not_to be_persisted
      end
      it "does not assign a new subject to Subjects with a invalid teacher" do
        post :create, params: {subject: invalid_inputs}
        expect(assigns(:subject)).not_to be_persisted
      end
      it "re-render the 'new' template with valid teacher" do
        post :create, params: {subject: invalid_inputs,
                              teacher_registry:teacher.registry}
        expect(response).to render_template("new")
      end
      it "re-render the 'new' template with invalid teacher" do
        post :create, params: {subject: invalid_inputs}
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET edit" do
    before(:each) do
      login_principal
    end
    it "assing a subject to @subject" do
      subject = Subject.create!(valid_inputs)
      get :edit, params:{id:subject.id}
      expect(assigns(:subject)).to be_a Subject
    end
    it "render edit template" do
      subject = Subject.create!(valid_inputs)
      get :edit, params:{id:subject.id}
      expect(response).to render_template("edit")
    end
  end

  describe "POST update" do
    before(:each) do
      login_principal
    end
    describe "with valid params" do
      it "put update" do
        subject = Subject.create!(valid_inputs)
        put :update, {id: subject.to_param, subject: updated_inputs,
                      teacher_registry:teacher.registry}
        subject.reload
      end
      it "redirects to @subject" do
        subject = Subject.create!(valid_inputs)
        put :update, {id: subject.to_param, subject: updated_inputs,
                      teacher_registry:teacher.registry}
        expect(response).to redirect_to subject_path(subject)
      end
    end
    describe "with invalid params" do
      it "does not update" do
        subject = Subject.create!(valid_inputs)
        allow_any_instance_of(Subject).to receive(:save).and_return(false)
        put :update, {id: subject.to_param, subject: invalid_inputs,
                      teacher_registry:teacher.registry}
        expect(assigns(:subject)).to eq(subject)
      end
      it "re-render edit template" do
        subject = Subject.create!(valid_inputs)
        allow_any_instance_of(Subject).to receive(:save).and_return(false)
        put :update, {id: subject.to_param, subject: invalid_inputs,
                      teacher_registry:teacher.registry}
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE destroy" do
    before(:each) do
      login_principal
    end
    it "deletes subject" do
      subject = Subject.create!(valid_inputs)
      expect{
        delete :destroy, {id:subject.to_param}
      }.to change(Subject, :count).by -1
    end
    it "redirects to subjects" do
      subject = Subject.create!(valid_inputs)
        delete :destroy, {id:subject.to_param}
        expect(response).to redirect_to subjects_path
    end
  end

  describe "GET index" do
    before(:each) do
      login_principal
    end
    it "assigns all subjects to @subjects" do
      subject = Subject.create!(valid_inputs)
      get :index, {}
      expect(assigns(:subjects)).to eq([subject])
    end
    it "render index template" do
      get :index, {}
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    before(:each) do
      login_principal
    end
    it "assigns a subject to @subject" do
      subject = Subject.create!(valid_inputs)
      get :show, {id: subject.to_param}
      expect(assigns(:subject)).to eq(subject)
    end
    it "render show template" do
      subject = Subject.create!(valid_inputs)
      get :show, {id: subject.to_param}
      expect(response).to render_template("show")
    end
  end




end
