class Api::V1::UsersController < ApplicationController
  def create
    user = User.create!(username: params[:username], password: params[:password_digest])
    render json: UserSerializer.new(user), status: 201
  end
end