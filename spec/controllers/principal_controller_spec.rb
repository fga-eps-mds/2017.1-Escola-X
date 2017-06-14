require 'rails_helper'
require 'helper_module_spec'

RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe PrincipalController, type: :controller do
  let(:valid_inputs) { { name: "Michael Cera", phone:"61988885555",
                         password: "12345678", gender:"M",
                         birth_date:"07/06/1970", shift: "diurno",
                         admission_date: "08/09/2007",
                         address: "samambaia Norte", employee_cpf: "26184391208",
                         registry:"123456",} }

  let(:invalid_inputs) { { name: "Michael Cera", phone:"61988885555",
                         password: "12345678", gender:"M",
                         birth_date:"07/06/1970", shift: "",
                         admission_date: "08/09/2007",
                         address: "samambaia Norte", employee_cpf: "",
                         registry:"1234",} }


  describe 'GET show' do
    describe "with right permissions" do
      before(:each) do
        login_principal
      end

      it 'assigns the requested principal to @principal' do
        principal = Principal.create! valid_inputs
        get :show, params:{id: principal.id}
        expect(assigns(:principal)).to eq(principal)
      end

      it 'render the show template' do
        principal = Principal.create! valid_inputs
        get :show, params:{id: principal.id}
        expect(response).to render_template('show')
      end
    end
  end

  describe 'GET edit' do
    describe "with right permissions" do
      before(:each) do
        login_principal
      end

      it 'assigns the requested principal to @principal' do
        principal = Principal.create! valid_inputs
        get :edit, params:{id: principal.id}
        expect(assigns(:principal)).to eq(principal)
      end

      it 'render the edit template' do
        principal = Principal.create! valid_inputs
        get :edit, params:{id: principal.id}
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'PUT update' do
    before(:each) do
      login_principal
    end

    describe 'with valid inputs' do
      it 'assigns the requested principal to @principal' do
        principal = Principal.create! valid_inputs
        put :update, params:{id: principal.id, principal: valid_inputs}
        expect(assigns(:principal)).to eq(principal)
      end

      it 'updates the requested principal' do
        principal = Principal.create! valid_inputs
        put :update, params:{id: principal.id, principal: valid_inputs}
        principal.reload
      end

      it 'redirects to the principal' do
        principal = Principal.create! valid_inputs
        put :update, params:{id: principal.id, principal: valid_inputs}
        expect(response).to redirect_to principal_path(assigns(:principal))
      end
    end

    describe 'with invalid inputs' do
      it 'assigns the requested principal to @principal' do
        principal = Principal.create! valid_inputs
        put :update, params:{id: principal.id, principal: invalid_inputs}
        expect(assigns(:principal)).to eq(principal)
      end

      it 'does not update' do
        principal = Principal.create! valid_inputs
        put :update, params:{id: principal.id, principal: invalid_inputs}
        principal.reload
      end
    end
  end
end
