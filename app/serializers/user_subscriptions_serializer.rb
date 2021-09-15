class UserSubscriptionsSerializer
  include FastJsonapi::ObjectSerializer

  set_type :user_subscription
  attributes :user_id, :tea_id, :status
end
