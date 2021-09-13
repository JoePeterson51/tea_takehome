require 'rails_helper'

RSpec.describe 'add subscription to user' do
  it 'can add a subscription to a users subscription' do
    user = User.create!(username: "Teaman500@teateatea.com", password_digest: "DrinkMoreTea")
    tea = Tea.create!(name: "Green")

    headers = {
      'Content-Type': "application/json",
      'Accept': "application/json"
    }

    body = {
      "user_id": "#{user.id}",
      "tea_id": "#{tea.id}"
    }

    post '/api/v1/subscriptions', headers: headers, params: body.to_json
    subscription = JSON.parse(response.body, symbolize_names: true)

    data = subscription[:data]

    expect(data[:id].to_i).to eq(Subscription.last.id)
    expect(data[:attributes][:user_id].to_i).to eq(user.id)
    expect(data[:attributes][:tea_id].to_i).to eq(tea.id)
    expect(data[:attributes][:status]).to eq("Active")

  end
end