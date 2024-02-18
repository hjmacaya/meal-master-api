class Users::InBodiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @in_bodies = current_user.in_bodies
    render json: @in_bodies, status: :ok
  end
end
