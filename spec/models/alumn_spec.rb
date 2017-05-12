require 'rails_helper'

RSpec.describe Alumn, type: :model do
    let(:valid_inputs) { { name: "Michael Cera", phone:"61988885555",
                         address:"Rua Vida Casa 15,Taguatinga",
                         password: "12345678", gender:"M",
                         birth_date:"07/06/1988", registry:"12345",
                         parent_id: 1, shift:"matutino"} }

  let(:invalid_inputs) { { name: "Ayu", phone:"25460", address:"Ali Casa 2",
                           password: "12345", gender:"adfsd",
                           birth_date:"50 abr",registry:"8",
                           parent_id: -1, shift:"matutino"} }


it "Can be Instantiated"
	Alumn.new.should be_an_instance_of(Alumn)
end