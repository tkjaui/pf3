FactoryBot.define do
  factory :review do
    user { nil }
    service { nil }
    content { "MyString" }
    score { 1 }
  end
end
