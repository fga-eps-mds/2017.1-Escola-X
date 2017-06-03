require 'rails_helper'

RSpec.describe UsersController, type: :controller do


  describe "get index" do
    before(:each) do
      login_principal
    end

  it "assings all -> alunms = @alumns, parents = @parents, employee = @employee" do
    get :index
    expect(assigns(:alumns)).to match_array(Alumn.all)
    expect(assigns(:employees)).to match_array(Employee.all)
    expect(assigns(:parents)).to match_array(Parent.all)
  end
  end
end
