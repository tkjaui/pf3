require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前、メールアドレス、パスワード、プロフィールがある場合、有効である" do
    expect(FactoryBot.create(:user)).to be_valid
  end

  it "名前がない場合、無効である" do
    expect(FactoryBot.build(:user, username:"")).to_not be_valid
  end

  it "メールアドレスがない場合、無効である" do
    expect(FactoryBot.build(:user, email:"")).to_not be_valid
  end

  it "パスワードがない場合、無効である" do
    expect(FactoryBot.build(:user, password:"")).to_not be_valid
  end

  it "プロフィールがない場合、無効である" do
    expect(FactoryBot.build(:user, profile:"")).to_not be_valid
  end

  it "メールアドレスが重複している場合、無効である" do
    user1 = FactoryBot.create(:user, username:"taro", email:"example@example.com")
    expect(FactoryBot.build(:user,username:"jiro", email:user1.email)).to_not be_valid
  end

  
end
