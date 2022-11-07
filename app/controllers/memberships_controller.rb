class MembershipsController < ApplicationController
    def index
        membership = Membership.all
        render json: membership
    end
    
    def create
        membership = Membership.create!(membership_params)
        render json: membership
    end

    private

    def membership_params
        params.permit(:gym_id, :client_id, :charge)
    end
end
