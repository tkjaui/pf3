require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before do
   
    @user = FactoryBot.create(:user)
    @service = FactoryBot.create(:service)
    sign_in @user
  end

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
    
    it "returns http success" do
      
      get :show, params:{id: @service.id}
      expect(response).to render_template :show
    end

    it "200レスポンスが帰ってきているか" do
      
      get :show, params:{id: @service.id}
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
