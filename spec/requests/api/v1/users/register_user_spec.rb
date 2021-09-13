require 'rails_helper'

RSpec.describe 'User register' do
  it 'can register a user' do
    headers = {
      'Content-Type': "application/json",
      'Accept': "application/json"
    }

    body = {
      "username": "test@test.com",
      "password_digest": "password"
    }

    post '/api/v1/users', headers: headers, params: body.to_json
    user = JSON.parse(response.body, symbolize_names: true)

    expect(user[:data][:attributes][:username]).to eq("test@test.com")
  end
end