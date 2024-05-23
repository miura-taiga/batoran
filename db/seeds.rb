# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

# ユーザーを10人作成
10.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password',
  )

  # 各ユーザーに対して掲示板を3つ作成
  3.times do
    Board.create!(
      user_id: user.id,
      store_name: Faker::Company.name,
      product_name: Faker::Commerce.product_name,
      jan_code: Faker::Number.number(digits: 13),
      expiration_date: Faker::Date.forward(days: 365)
    )
  end
end
