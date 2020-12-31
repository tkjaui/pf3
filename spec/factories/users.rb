# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: User do
    username { 'tarou' }
    sequence(:email) { |n| "example#{n}@example.com" }
    password { 'password' }
  end

  factory :another_user, class: User do
    username { 'tarouu' }
    sequence(:email) { |n| "examplee#{n}@example.com" }
    password { 'passwordd' }
  end
end
