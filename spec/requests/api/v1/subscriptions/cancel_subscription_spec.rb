require 'rails_helper'

RSpec.describe 'cancel subscription' do
  it 'can cancel a users subscription' do
    user = User.create!(username: "Teaman500@teateatea.com", password_digest: "DrinkMoreTea")
    tea1 = Tea.create!(name: "Green")
    tea2 = Tea.create!(name: "Black")
    tea3 = Tea.create!(name: "Chai")
    subscription1 = Subscription.create!(user_id: user.id, tea_id: tea1.id, status: "Active")
    subscription2 = Subscription.create!(user_id: user.id, tea_id: tea2.id, status: "Active")
    subscription3 = Subscription.create!(user_id: user.id, tea_id: tea3.id, status: "Active")

    expect(subscription2.status).to eq("Active")
    expect(Subscription.where(status: "Active").count).to eq(3)

    patch "/api/v1/subscriptions/#{subscription2.id}"
    subscription = JSON.parse(response.body, symbolize_names: true)

    data = subscription[:data]

    expect(user.subscriptions.count).to eq(3)
    expect(data[:attributes][:user_id].to_i).to eq(user.id)
    expect(data[:attributes][:tea_id].to_i).to eq(tea2.id)
    expect(data[:attributes][:status]).to eq("Cancelled")
    expect(Subscription.where(status: "Active").count).to eq(2)
    expect(Subscription.where(status: "Cancelled").count).to eq(1)
  end
end