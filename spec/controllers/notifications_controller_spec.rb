require 'rails_helper'

RSpec.describe NotificationsController, type: :controller do
  let(:valid_inputs) { { title: "Ausencia de prosso",
                         notification_text: "vai ter aula nao mlkada",
                         notification_date: "01/03/1995"} }

  let(:invalid_inputs) { { title: "prosso vai",
                           notification_text: "rodaro",
                           notification_date: "10/03/1993"} }

  describe "Post create" do
    before(:each) do
      notification = Notification.create(title: "Ausencia de prosso",
                                         notification_text: "vai ter aula nao mlkada",
                                         notification_date: "01/03/1995")

      user = User.create(name: "Michael Cera", phone:"61988885555",
                         address:"Rua Vida Casa 15,Taguatinga",
                         password: "12345678", gender:"M",
                         birth_date:"07/06/1988", permission:"Principal")

      cookies[:authorization_token] = user.authorization_token
    end

    describe "with valid params" do
      it "Creates a new Notification" do
        expect {
          post :create, params: {:notification => valid_inputs}
        }.to change(Notification, :count).by 1
      end

      it "assigns a new notification to @notification" do
        post :create, params: {:notification => valid_inputs}
        expect(assigns(:notification)).to be_a Notification
        expect(assigns(:notification)).to be_persisted
      end

      it "redirects to @notification page" do
        post :create, params: {:notification => valid_inputs}
        expect(response).to redirect_to notification_path(assigns(:notification))
      end
    end

    describe "with invalid params" do
      it "does not create a new Notification" do
        expect {
          post :create, params: {:notification => invalid_inputs}
        }.to change(Notification, :count).by 0
      end

      it "assigns a new notification but no save to @notification" do
        post :create, params: {:notification => invalid_inputs}
        expect(assigns(:notification)).not_to be_persisted
      end
    end
  end
end
