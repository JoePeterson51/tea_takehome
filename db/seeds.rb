# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create!(username: "Teaman500@teateatea.com", password_digest: "DrinkMoreTea")
user2 = User.create!(username: "Teaman500@teateatea.com2", password_digest: "DrinkMoreTea2")
tea1 = Tea.create!(name: "Green")
tea2 = Tea.create!(name: "Black")
tea3 = Tea.create!(name: "Chai")
subscription1 = Subscription.create!(user_id: user.id, tea_id: tea1.id, status: "Active")
subscription2 = Subscription.create!(user_id: user.id, tea_id: tea2.id, status: "Cancelled")
subscription3 = Subscription.create!(user_id: user.id, tea_id: tea3.id, status: "Active")
subscription4 = Subscription.create!(user_id: user2.id, tea_id: tea3.id, status: "Active")
subscription5 = Subscription.create!(user_id: user2.id, tea_id: tea1.id, status: "Active")
