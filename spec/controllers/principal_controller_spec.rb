require 'rails_helper'

RSpec.describe PrincipalController, type: :controller do

  describe "GET #resources" do
    it "returns http success" do
      get :resources
      expect(response).to have_http_status(:success)
    end
  end

end
