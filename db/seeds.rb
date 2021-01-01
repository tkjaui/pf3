# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do |n|
  username = "example-#{n+1}"
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!(username: username,
              email: email,
              password: password)
end

users = User.order(:created_at).take(6)
50.times do
  company = "オントラック"
  device = "ノートPC"
  price = "10,000円〜29,999円"
  days = '6日〜10日'
  body = Faker::Lorem.sentence(word_count:5)
  problem = "機器が立ち上がらない"
  result = "成功"
  users.each {|user| user.services.create!(company:company,
                                          device:device,
                                          price:price,
                                          days:days,
                                          body:body,
                                          problem:problem,
                                          result:result ) }
end