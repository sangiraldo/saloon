require "rails_helper"

RSpec.describe Admin::ServicesController, type: :controller do

  before(:each) { create_logged_in_user }

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE destroy" do
    it "destroy a service" do
      service = create(:service)
      expect {
        delete :destroy, params: { id: service }
      }.to change(Service, :count).by(-1)
    end
  end
end
