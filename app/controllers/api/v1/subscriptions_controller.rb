class Api::V1::SubscriptionsController < ApplicationController
  def create
    subscription = Subscription.create!(user_id: params[:user_id], tea_id: params[:tea_id], status: "Active")
    render json: SubscriptionSerializer.new(subscription), status: 201
  end
end