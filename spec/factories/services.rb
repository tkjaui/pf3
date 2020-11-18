FactoryBot.define do
  factory :service do
    user_id { 1 }
    company { "MyString" }
    device { "MyString" }
    problem { "MyString" }
    price { 1 }
    days { 1 }
    result { "MyString" }
    body { "MyText" }
    image_id { "MyString" }
  end
end
