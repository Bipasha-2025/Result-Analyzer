module Api
  module V1
    class ResultsController < ApplicationController
      # MSM will post JSON -> disable CSRF for API endpoint
      protect_from_forgery with: :null_session

      def create
        submitted_at = parse_timestamp(params[:timestamp])
        result = Result.new(
          student_name: params[:student_name],
          subject: params[:subject],
          marks: params[:marks],
          submitted_at: submitted_at
        )

        if result.save
          render json: { id: result.id }, status: :created
        else
          render json: { errors: result.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def parse_timestamp(ts)
        return Time.zone.parse(ts) if ts.present?
        Time.current
      rescue ArgumentError
        Time.current
      end
    end
  end
end
