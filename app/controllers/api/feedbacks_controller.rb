module Api
  class FeedbacksController < ApplicationController
    protect_from_forgery with: :null_session
    def create
      render json: { message: 'Thanks for your valuable feedback to help improve our product' }, status: :ok
    end
  end
end
