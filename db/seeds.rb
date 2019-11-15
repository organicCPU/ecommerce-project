# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# AdminUser.destroy_all
Product.destroy_all
Page.destroy_all
Product.destroy_all
Category.destroy_all
Supplier.destroy_all

# Pages
Page.create(
  name: 'About Us',
  content: 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
  show_in_navbar: true,
  permalink: 'about'
)

Page.create(
  name: 'Contact Us',
  content: 'please don\'t',
  show_in_navbar: true,
  permalink: 'contact'
)

# Suppliers

10.times do
  Supplier.create(
    name: Faker::Company.name,
    description: Faker::Company.bs
  )
end

# Categories
4.times do
  category = Category.create(
    name: Faker::Commerce.unique.department,
    description: nil
  )

  # Products
  25.times do
    product = category.products.build(
      name: Faker::Commerce.product_name,
      description: nil,
      price: Faker::Commerce.price,
      supplier: Supplier.order('RANDOM()').first
    )
    product.save
  end
end

# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
