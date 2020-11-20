FactoryBot.define do
  factory :service do
    user_id { 1 }
    company { "MyString" }
    device { "MyString" }
    problem { "MyString" }
    price { "MyString" }
    days { "MyString" }
    result { "MyString" }
    body { "MyText" }
    image_id { "MyString" }
  end
end
