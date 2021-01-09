module Api
  module V0
    class ApiController < ApplicationController
      skip_before_action :verify_authenticity_token

      rescue_from ActiveRecord::RecordNotFound, with: :error_not_found

      rescue_from ActionController::ParameterMissing do
        error_unprocessable_entity('Parameters missing')
      end

      respond_to :json

      protected

      def error_unprocessable_entity(message)
        render json: { errors: { message: message } }, status: :unprocessable_entity
      end

      def error_not_found
        render json: { errors: { message: 'Not found' } }, status: :not_found
      end
    end
  end
end
