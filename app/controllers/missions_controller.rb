class MissionsController < ApplicationController
    before_action :set_mission, only: [:show,:edit,:update,:destroy]

    def index
        @missions = Mission.all
    end

    def create
       @mission = Mission.create(mission_params)
       if @mission.valid?
        redirect_to scientist_path(@mission.scientist)
       else
        flash[:errors]= @mission.errors.full_messages
        redirect_to new_mission_path
       end
    end
    
    def new
        @mission= Mission.new
        @planets = Planet.all
        @scientists = Scientist.all
    end

    def edit
        @planets = Planet.all
        @scientists = Scientist.all
    end

    def show
    end

    def update
        if @mission.update(mission_params)
            redirect_to mission_path(@mission)
        else
            flash[:errors] = @mission.errors.full_messages
            redirect_to edit_mission_path
        end
    end

    def destroy
        @mission.destroy
        redirect_to missions_path
    end

private
    def mission_params
        params.require(:mission).permit(:name,:scientist_id,:planet_id)
    end

    def set_mission
        @mission = Mission.find(params[:id])
    end
end
