require 'rails_helper'
require 'helper_module_spec'

RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe AlumnsController, type: :controller do
  let(:valid_inputs) { { name: "Michael Cera", phone:"61988885555",
                         address:"Rua Vida Casa 15,Taguatinga",
                         password: "12345678", gender:"M",
                         birth_date:"07/06/1988", registry:"12345",
                         parent_id: 1,classroom_id:classroom.id , bar_code:"123456"} }

  let(:invalid_inputs) { { name: "Ayu", phone:"25460", address:"Ali Casa 2",
                           password: "12345", gender:"adfsd",
                           birth_date:"50 abr",registry:"8",
                           parent_id: -1} }

 let(:subject_inputs) { { name_subject:"Filosofia", class_level:"2", teacher_id: teacher.id } }
 let(:classroom_inputs) { { name_classroom: "3G", shift_classroom: "matutino" } }

  describe "GET new" do

    describe "with right permission" do
      before(:each) do
        login_principal
      end

      it "assigns a new alumn as @alumn" do
        get :new, params:{parent_id:parent.id}
        expect(assigns(:alumn)).to be_a_new(Alumn)
      end

      it "render the new template" do
        get :new, params:{parent_id:parent.id}
        expect(response).to render_template('new')
      end
    end

    describe "with wrong permission" do
      before(:each) do
        login_parent
      end

      it "render the error template" do
        get :new, params:{parent:parent}
        expect(response).to redirect_to '/errors/error_500'

      end
    end
  end

  describe "GET edit" do

    describe "with right permissions" do
      before(:each) do
        login_principal
      end

      it "assigns the requested alumn as @alumn" do
        alumn = Alumn.create! valid_inputs
        get :edit, params:{id: alumn.to_param}
        expect(assigns(:alumn)).to eq(alumn)
      end

      it "render the edit template" do
        alumn = Alumn.create! valid_inputs
        get :edit, params:{id: alumn.to_param}
        expect(response).to render_template('edit')
      end
    end

    describe "with wrong permissions" do
      before(:each) do
        login_parent
      end

      it "redirects to errors page" do
        alumn = Alumn.create! valid_inputs
        get :edit, params:{id: alumn.to_param}
        expect(response).to redirect_to('/errors/error_500')
      end
    end
  end

  describe 'GET show' do
    describe "with right permissions" do
      before(:each) do
        login_principal
      end

      it 'assigns the requested alumn to @alumn' do
        alumn = Alumn.create! valid_inputs
        get :show, params:{ id: alumn.to_param}
        expect(assigns(:alumn)).to eq(alumn)
      end

      it "render the show template" do
        alumn = Alumn.create! valid_inputs
        get :show, params:{ id: alumn.to_param}
        expect(response).to render_template('show')
      end
    end
    describe "with wrong permissions" do
      before(:each) do
        login_alumn
      end


      it "redirect to error_500 page" do

        get :show, params:{ id: 13}

        expect(response).to redirect_to('/errors/error_500')
      end
    end
  end # end of describe GET SHOW

  describe "PUT update" do
    before(:each) do
      login_principal
    end

    describe "with valid params" do

      it "assigns the requested alumn as @alumn" do
        alumn = Alumn.create! valid_inputs
        put :update, params:{id: alumn.to_param, alumn: valid_inputs}
        expect(assigns(:alumn)).to eq(alumn)
      end

      it "updates the requested alumn" do
        alumn = Alumn.create! valid_inputs
        put :update, params:{id: alumn.to_param, alumn: valid_inputs }
        alumn.reload
      end

      it "redirects to the alumn" do
        alumn = Alumn.create! valid_inputs
        put :update, params:{id: alumn.to_param, alumn: valid_inputs}
        expect(response).to redirect_to alumn_path(assigns(:alumn))
      end
    end

    describe "with invalid params" do
      it "assigns the alumn as @alumn" do
        alumn = Alumn.create! valid_inputs
        put :update, params:{id: alumn.to_param, alumn: invalid_inputs }
        expect(assigns(:alumn)).to eq(alumn)
      end

      it "does not update" do
        alumn = Alumn.create! valid_inputs
        put :update, params:{id: alumn.to_param, alumn: invalid_inputs}
        expect(assigns(:alumn)).to eq(alumn)
      end

      it "re-renders the 'edit' template" do
        alumn = Alumn.create! valid_inputs
        # allow_any_instance_of(Alumn).to receive(:save).and_return(false)
        put :update, params:{id: alumn.to_param, alumn: invalid_inputs }
        expect(response).to render_template("edit")
      end
    end

    describe "with wrong permissions" do
      before (:each) do
        login_parent
      end

      it "redirects to error_500 page" do
        alumn = Alumn.create! valid_inputs
        put :update, params:{id: alumn.to_param, alumn: valid_inputs}
        expect(response).to redirect_to ('/errors/error_500')
      end
    end
  end

  describe "GET index" do
    describe "login as parent" do
      before(:each) do
        login_parent
      end

      it "assigns all parents alumns as @alumns" do
        get :index, {}
        expect(assigns(:alumns)).to match((assigns(:current_user)).alumns)
      end

      it "renders the 'index' template" do
        get :index, {}
        expect(response).to render_template('index')
      end
    end
    describe "login as employee" do
      before(:each) do
        login_principal
      end

      it "assigns all alumns to @alumns" do
        get :index, {}
        expect(assigns(:alumns)).to match_array(Alumn.all)
      end

      describe "search alumns" do
        describe "with valid params" do
          it "assings to @alumn the searched alumn by name" do
            alumn = Alumn.create!(valid_inputs)
            get :index, params:{search: alumn.name}
            expect(assigns(:alumns)).to match_array(alumn)
          end

          it "assings to @alumn the searched alumn by registry" do
            alumn = Alumn.create!(valid_inputs)
            get :index, params:{search: alumn.registry}
            expect(assigns(:alumns)).to match_array(alumn)
          end
        end

        describe "with invalid params" do
          it "shows all alumns with blank search params" do
            alumn = Alumn.create!(valid_inputs)
            get :index, params:{search: ""}
            expect(assigns(:alumns)).to match_array(Alumn.all)
            expect(flash[:feedback_warning]).to be_present
          end
          it "does not find alumns with no matching params" do
            alumn = Alumn.create!(valid_inputs)
            get :index, params:{search: "jai3j0"}
            expect(assigns(:alumns)).to match_array(nil)
            expect(flash[:feedback]).to be_present
          end
        end
      end
    end

  end

  describe "Post create" do
    before(:each) do
      subject = Subject.create! subject_inputs
      classub= ClassroomSubject.create!(classroom_id: classroom.id, subject_id: subject.id)
      login_principal
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
        login_principal
      end
      it "does delete an Alumn" do
        alumn = Alumn.create!(valid_inputs)
        expect{
          delete :destroy, params:{id: alumn}
        }.to change(Alumn, :count).by(-1)
      end
  end

  describe "edit password" do
    describe "with right permissions" do
      before(:each) do
        login_principal
      end
      it "assings alumn to @alumn" do
        alumn = Alumn.create!(valid_inputs)
        get :edit_password_alumn, params:{id: alumn}
        expect(assigns(:user)).to eq(alumn)
      end
      it "render edit_password template" do
        alumn = Alumn.create!(valid_inputs)
        get :edit_password_alumn, params:{id: alumn}
        expect(response).to render_template("../users/edit_password")
      end
    end

    describe "with wrong permissions" do
      before (:each) do
        login_parent
      end

      it "redirect_to error_500 page" do
        alumn = Alumn.create!(valid_inputs)
        get :edit_password_alumn, params:{id: alumn}
        expect(response).to redirect_to("/errors/error_500")
      end
    end

  end

  describe "GET report as principal" do
    before(:each) do
      alumn = Alumn.create!(valid_inputs)
    end
    it "redirects to alumns report as principal" do
      login_principal
      get :report, params:{id: alumn.id}
      expect(response).to render_template("alumns/report")
    end
    it "redirects to current_user if it is not related" do
      login_alumn
      get :report, params:{id: alumn.id}
      expect(response).not_to render_template("alumns/report")
    end
  end
end
