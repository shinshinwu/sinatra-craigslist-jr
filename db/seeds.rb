require 'faker'

10.times do
  Category.create(title: Faker::Commerce.department)
end

Category.all.each do |category|
  5.times do
    category.articles << Article.create(title: Faker::Commerce.product_name, price: Faker::Commerce.price, content: Faker::Lorem.sentence, location: Faker::Address.street_address, email: Faker::Internet.email)
  end
end
