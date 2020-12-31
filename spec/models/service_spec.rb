# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Service, type: :model do
  it 'company,device,problem,price,days ,result,body,image_idがある場合有効である' do
    expect(FactoryBot.create(:service)).to be_valid
  end

  it 'companyがない場合無効である' do
    expect(FactoryBot.build(:service, company: '')).to_not be_valid
  end

  it 'deviceがない場合無効である' do
    expect(FactoryBot.build(:service, device: '')).to_not be_valid
  end

  it 'problemがない場合無効である' do
    expect(FactoryBot.build(:service, problem: '')).to_not be_valid
  end

  it 'priceがない場合無効である' do
    expect(FactoryBot.build(:service, price: '')).to_not be_valid
  end

  it 'daysがない場合無効である' do
    expect(FactoryBot.build(:service, days: '')).to_not be_valid
  end

  it 'resultがない場合無効である' do
    expect(FactoryBot.build(:service, result: '')).to_not be_valid
  end

  it 'bodyがない場合無効である' do
    expect(FactoryBot.build(:service, body: '')).to_not be_valid
  end
end
