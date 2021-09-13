require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'validations' do
    it {should belong_to(:user)}
    it {should belong_to(:tea)}
  end
end
