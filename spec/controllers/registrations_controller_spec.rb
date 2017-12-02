require "rails_helper"

RSpec.describe Users::RegistrationsController, type: :controller do

  let(:user) { create(:user) }
  before(:each) { sign_in(user) }

  before :each do
    request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe "USER create" do
    let(:valid_user) do
      {
        full_name: "Santiago Giraldo Mejia",
        email: 'santiago@gmail.com',
        password: "santiago123456",
        cellphone: "3014842255",
        address: "Calle 88",
        gender: "male",
      }
    end

    it "created a new user" do
      User.create(valid_user)
      user = User.last
      expect(user.full_name).to eq("Santiago Giraldo Mejia")
    end
  end

  describe "PUT update" do
    it "updates user information" do
      put :update, params: {id: user.id, user: {full_name: "Alberto"}}
      user.reload
      expect(user.full_name).to eq("Alberto")
      expect(response).to redirect_to edit_user_registration_path
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, params: {id: user.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT update_password" do
    it "updates user password information" do
      user.update({password: "123456", password_confirmation: "123456" })
      expect(user.password).to eq("123456")
    end
  end

end
