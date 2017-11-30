require "rails_helper"

RSpec.describe Admin::UsersController, type: :controller do
  before(:each) { create_logged_in_user }

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE destroy" do
    it "destroy a user" do
      user = create(:user, email: "other@example.com")
      expect {
        delete :destroy, params: { id: user }
      }.to change(User, :count).by(-1)
    end
  end
end
