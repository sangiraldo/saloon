require 'rails_helper'

RSpec.describe EstablishmentsController, type: :controller do

  before(:each) { create_logged_in_user }

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
