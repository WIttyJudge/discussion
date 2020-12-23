module Api
  module V0
    class ApiController < ApplicationController
      skip_before_action :verify_authenticity_token

      rescue_from ActiveRecord::RecordNotFound, with: :error_not_found

      respond_to :json

      def error_unprocessable_entity(message)
        render json: { errors: { message: message } }, status: :unprocessable_entity
      end

      def error_not_found
        render json: { errors: { message: 'not found' } }, status: :not_found
      end
    end
  end
end
