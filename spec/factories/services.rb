FactoryBot.define do
  factory :service, class:Service do
    company { "MyString" }
    device { "MyString" }
    problem { "MyString" }
    price { "MyString" }
    days { "MyString" }
    result { "MyString" }
    body { "MyText" }
    association :user
  end

  factory :another_service, class:Service do
    company { "1MyString" }
    device { "1MyString" }
    problem { "1MyString" }
    price { "1MyString" }
    days { "1MyString" }
    result { "1MyString" }
    body { "1MyText" }
    association :user
  end
end
