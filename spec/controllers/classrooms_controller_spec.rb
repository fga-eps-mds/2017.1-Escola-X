require 'rails_helper'

RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe ClassroomsController, type: :controller do

  let(:valid_inputs) { { name_classroom: "3G", shift_classroom: "matutino" } }

  let(:invalid_inputs) { { name_classroom: "", shift_classroom: "" } }

  def alumn
    alumn = Alumn.create!(name: "Michael Cera", phone:"61988885555",
                           address:"Rua Vida Casa 15,Taguatinga",
                           password: "12345678", gender:"M",
                           birth_date:"07/06/1988", registry:"123456",
                           shift:"matutino",parent_id:parent.id,
                           classroom_id: "1")
  end

  def alumn2
    alumn = Alumn.create!(name: "Michael Cera", phone:"61988885555",
                           address:"Rua Vida Casa 15,Taguatinga",
                           password: "12345678", gender:"M",
                           birth_date:"07/06/1988", registry:"654321",
                           shift:"matutino",parent_id:parent.id,
                           classroom_id: "1")
  end

  describe "GET new" do
    before(:each) do
      loggin_principal
    end

    it "assigns a new classroom as @classroom" do
      get :new, {}
      expect(assigns(:classroom)).to be_a_new(Classroom)
    end
  end

  describe "GET index" do
    before(:each) do
      loggin_principal
    end

    it "loads all of the classrooms into @classrooms" do
      classroom1, classroom2 = Classroom.create!(valid_inputs),
                               Classroom.create!(valid_inputs)
      get :index
      expect(assigns(:classrooms)).to match_array([classroom1, classroom2])
    end

    it "render index" do
      get :index, {}
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    before(:each) do
      loggin_principal
    end
    it "find @classroom with params" do
      classroom = Classroom.create!(valid_inputs)
      get :show, {:id => classroom.to_param, template: 'classrooms/:id'}
      expect(assigns(:classroom)).to be_a Classroom
    end
    it "render show" do
      classroom = Classroom.create!(valid_inputs)
      get :show, {:id => classroom.to_param, template: 'classrooms/:id'}
      expect(response).to render_template("show")
    end

  end

  describe "GET edit" do
    before(:each) do
      loggin_principal
    end
    it "assings the requested classroom as Classroom" do
      classroom = Classroom.create!(valid_inputs)
      get :edit, {:id => classroom.to_param}
      expect(assigns(:classroom)).to be_a Classroom
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

  describe "DELETE delete" do
    before(:each) do
      loggin_principal
    end
    it "does delete an Classroom" do
      classroom = Classroom.create!(valid_inputs)
      expect{
        delete :destroy, id: classroom
      }.to change(Classroom, :count).by(-1)
    end
  end

  describe "PUT update" do
    before(:each) do
      loggin_principal
    end

    describe "with valid params" do
      it "updates the requested classroom" do
        classroom = Classroom.create! valid_inputs
        # Assuming there are no other classrooms in the database, this
        # specifies that the classroom created on the previous line
        # receives the :update_attributes message with whatever params are
        put :update, {:id => classroom.to_param, :classroom =>  valid_inputs }
      end

      it "assigns the requested classroom as @classroom" do
        classroom = Classroom.create! valid_inputs
        put :update, {:id => classroom.to_param, :classroom => valid_inputs}
        expect(assigns(:classroom)).to eq(classroom)
      end

      it "redirects to the classroom" do
        classroom = Classroom.create! valid_inputs
        put :update, {:id => classroom.to_param, :classroom => valid_inputs}
        expect(response).to redirect_to classroom_path
      end
    end

    describe "with invalid params" do
      it "assigns the classroom as @classroom" do
        classroom = Classroom.create! valid_inputs
        # Trigger the behavior that occurs when invalid params are submitted
        #allow_any_instance_of(classroom).to receive(:save).and_return(false)
        put :update, {:id => classroom.to_param, :classroom => invalid_inputs }
        expect(assigns(:classroom)).to eq(classroom)
      end

      it "re-renders the 'edit' template" do
        classroom = Classroom.create! valid_inputs
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Classroom).to receive(:save).and_return(false)
        put :update, {:id => classroom.to_param, :classroom => invalid_inputs }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "GET add_alumns" do
    before(:each) do
      loggin_principal
    end

    it "find classroom by params" do
      classroom = Classroom.create!(valid_inputs)
      get :add_alumns, {:id => classroom.to_param }
      expect(assigns(:classroom)).to be_a Classroom
    end

    # it "find alumn by @classroom.alumn" do
    #   classroom = Classroom.create!(valid_inputs)
    #   alumn1 = alumn
    #   alumn2 = alumn2
    #   alumns = classroom.alumn
    #   get :add_alumns, {:id => classroom.to_param }
    #   expect(assigns(:alumns)).to match_array([alumn1, alumn2])
    # end

  end
end
