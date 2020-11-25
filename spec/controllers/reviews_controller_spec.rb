require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
    @service = FactoryBot.create(:service)
    @review = FactoryBot.create(:review)
  end

  # describe "#index" do
  #   context "as an authorized user" do
  #     it "returns http success" do
  #       sign_in @user
  #       get :index
  #       expect(response).to redirect_to "/services/1/reviews"
  #     end
  #   end
  # end

  describe "#create" do
    context "as an authoried user" do
      # 正常に作成できるか？
  #     it "adds a new review" do
  #       sign_in @user
  #       expect{
  #         post :create, params:{
  #           review:{
  #             content:"MyString",
  #             score:  1 
  #           }
  #         }
  #       }.to change(@service.reviews, :count).by(1)
  #     end
  #   end
  # end
end
