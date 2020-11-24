FactoryBot.define do
  factory :service do
    
    company { "MyString" }
    device { "MyString" }
    problem { "MyString" }
    price { "MyString" }
    days { "MyString" }
    result { "MyString" }
    body { "MyText" }
    
    association :user
  end
end
