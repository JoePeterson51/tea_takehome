require 'rails_helper'

RSpec.describe Tea, type: :model do
  describe 'validations' do
    it {should have_many(:subscriptions)}
  end
end