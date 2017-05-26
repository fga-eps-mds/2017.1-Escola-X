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
                         parent_id: 1, shift:"matutino",classroom_id:classroom.id} }

  let(:invalid_inputs) { { name: "Ayu", phone:"25460", address:"Ali Casa 2",
                           password: "12345", gender:"adfsd",
                           birth_date:"50 abr",registry:"8",
                           parent_id: -1, shift:"matutino"} }

 let(:subject_inputs) { { name_subject:"Filosofia", class_level:"2", teacher_id: teacher.id } }
 let(:classroom_inputs) { { name_classroom: "3G", shift_classroom: "matutino" } }

  describe "GET new" do
    before(:each) do
      login_principal
    end

    it "assigns a new alumn as @alumn" do
      get :new, params:{parent_id:parent.id}
      expect(assigns(:alumn)).to be_a_new(Alumn)
    end
  end

  describe "GET edit" do
    before(:each) do
      login_principal
    end

    it "assigns the requested alumn as @alumn" do
      alumn = Alumn.create! valid_inputs
      get :edit, {:id => alumn.to_param}
      expect(assigns(:alumn)).to eq(alumn)
    end
  end

  describe 'GET show' do
    before(:each) do
      login_principal
    end

  it 'should show alumn' do
    @alumn = Alumn.create! valid_inputs
    get :show, { :id => alumn.to_param, template: 'alumns/:id' }
    expect(response).to render_template :show
  end
end

  describe "PUT update" do
    before(:each) do
      login_principal
    end

    describe "with valid params" do
      it "updates the requested alumn" do
        alumn = Alumn.create! valid_inputs
        # Assuming there are no other alumns in the database, this
        # specifies that the alumn created on the previous line
        # receives the :update_attributes message with whatever params are
        put :update, {:id => alumn.to_param, :alumn =>  valid_inputs }
      end

      it "assigns the requested alumn as @alumn" do
        alumn = Alumn.create! valid_inputs
        put :update, {:id => alumn.to_param, :alumn => valid_inputs}
        expect(assigns(:alumn)).to eq(alumn)
      end

      it "redirects to the alumn" do
        alumn = Alumn.create! valid_inputs
        put :update, {:id => alumn.to_param, :alumn => valid_inputs}
        expect(response).to redirect_to alumn_path
      end
    end

    describe "with invalid params" do
      it "assigns the alumn as @alumn" do
        alumn = Alumn.create! valid_inputs
        # Trigger the behavior that occurs when invalid params are submitted
        #allow_any_instance_of(alumn).to receive(:save).and_return(false)
        put :update, {:id => alumn.to_param, :alumn => invalid_inputs }
        expect(assigns(:alumn)).to eq(alumn)
      end

      it "re-renders the 'edit' template" do
        alumn = Alumn.create! valid_inputs
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Alumn).to receive(:save).and_return(false)
        put :update, {:id => alumn.to_param, :alumn => invalid_inputs }
        expect(response).to render_template("edit")
      end
    end
  end


  describe "GET index" do
    before(:each) do
      login_principal
    end

    it "assigns all alumns as @alumns" do
      get :index
      response.should be_success
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
