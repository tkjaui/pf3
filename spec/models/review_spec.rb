require 'rails_helper'

RSpec.describe Review, type: :model do
  it "content,scoreがある場合有効である" do
    expect(FactoryBot.create(:review)).to be_valid
  end

  it "scoreがない場合無効である" do
    expect(FactoryBot.build(:review, score:"")).to_not be_valid
  end
end


