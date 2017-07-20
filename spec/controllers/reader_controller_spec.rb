require 'rails_helper'
require 'helper_module_spec'


RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe ReaderController, type: :controller do

 	let(:alumn_inputs) { { name: "Michael Cera", phone:"61988885555",
                         address:"Rua Vida Casa 15,Taguatinga",
                         password: "12345678", gender:"M",
                         birth_date:"07/06/1988", registry:"12345",
                         parent_id: parent.id, bar_code:"135697"} }


 	describe "index" do

 		describe "with wrong permissions" do
 			before(:each) do
        	login_alumn
      		end

      		it "redirects to errors 500 page" do
      			alumn = Alumn.create!(alumn_inputs)
		        get :index
		        expect(response).to redirect_to("/errors/error_500")
      		end
 		end
 	end

end
