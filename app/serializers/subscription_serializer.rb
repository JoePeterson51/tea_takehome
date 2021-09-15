class SubscriptionSerializer
  include FastJsonapi::ObjectSerializer

  set_type :subscription
  attributes :user_id, :tea_id, :status
end
