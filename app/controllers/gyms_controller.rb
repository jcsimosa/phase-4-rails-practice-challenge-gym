class GymsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found
    def show 
        gym = Gym.find(params[:id])
        render json:gym, status: :ok
    end

    def destroy
        gym = Gym.find(params[:id])
        gym.destroy 
        head :no_content
    end

    private 

    def not_found(exception)
        render json: {errors: "#{exception.model} not found"}, status: :not_found
    end
end
