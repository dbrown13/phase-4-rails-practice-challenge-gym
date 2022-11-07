class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound with, render_not_found_response

    def index
        gyms = Gym.all
        render json: gyms
    end

    def show
        gyms = Gym.find(params[:id])
        render json: gyms
    end

    def destroy
        gyms = Gym.find(params[:id])
        gyms.destroy
        head :no_content
    end

    private

    def render_not_found_response(e)
        # render json: { error: e.record.errors.full_messages }, status: :not_found
        render json: e, status: :not_found
    end
end
