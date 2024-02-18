class InBodiesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :authenticate_nutritionist!

  def index
    @in_bodies = InBody.all
    render json: {
      status: {
        code: 200,
        message: 'Successfully fetched in_bodies.'
      },
      data: @in_bodies
    }
  end

  def nutritionist_index
    @in_bodies = InBody.where(nutritionist_id: params[:nutritionist_id])
  end
end
