class SubscriptionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :tea_id, :status
end
