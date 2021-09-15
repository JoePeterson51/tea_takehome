class Api::V1::Users::UserSubscriptionsController < ApplicationController
  def index
    user = User.find(params[:id])
    subscriptions = user.subscriptions
    render json: UserSubscriptionsSerializer.new(subscriptions), status: 201
  end
end