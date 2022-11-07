class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound with, render_not_found_response
    
    def index
        clients = Client.all
        render json: clients
    end

    def show
        clients = Client.find(params[:id])
        render json: clients
    end
    
    private

    def render_not_found_response(e)
        # render json: { error: e.record.errors.full_messages }, status: :not_found
        render json: e, status: :not_found
    end
end
