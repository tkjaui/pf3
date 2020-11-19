require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "index" do
    it "returns http success" do
      get :index
      expect(response).to render_template :index
    end

    it "200レスポンスが帰ってきているか" do
      get :index
      expect(response).to have_http_status "200"
    end
  end

  describe "show" do
    before do
      @user = User.new(
        username: "naoki",
        email: "naoki@gmail.com",
        password: "123456",
        profile: "hello!"
      )
    end
    it "returns http success" do
      get :show, params:{id: @user.id}
      expect(response).to render_template :show
    end

    it "200レスポンスが帰ってきているか" do
      get :show, params:{id: @user.id}
      expect(response).to have_http_status "200"
    end
  end

  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
