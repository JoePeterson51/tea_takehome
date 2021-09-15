require 'rails_helper'

RSpec.describe 'user subscriptions' do
  it 'can return all the users subscriptions even if theyre cancelled' do
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

    get "/api/v1/users/#{user.id}/subscriptions"
    subscription = JSON.parse(response.body, symbolize_names: true)

    data = subscription[:data]

    expect(data.count).to eq(3)
    expect(data[0][:id].to_i).to eq(subscription1.id)
    expect(data[0][:attributes][:status]).to eq(subscription1.status)
    expect(data[0][:attributes][:user_id].to_i).to eq(user.id)
    expect(data[1][:id].to_i).to eq(subscription2.id)
    expect(data[1][:attributes][:status]).to eq(subscription2.status)
    expect(data[1][:attributes][:user_id].to_i).to eq(user.id)
    expect(data[2][:id].to_i).to eq(subscription3.id)
    expect(data[2][:attributes][:status]).to eq(subscription3.status)
    expect(data[2][:attributes][:user_id].to_i).to eq(user.id)
  end
end