require 'rails_helper'

RSpec.describe 'add subscription to user' do
  it 'can add a subscription to a users subscription' do
    user = User.create!(username: "Teaman500@teateatea.com", password_digest: "DrinkMoreTea")
    subscription = Subscription.create!(name: "Green")
    require 'pry'; binding.pry
  end
end