class PlanetsController < ApplicationController
  before_action :set_planet, only: [:show, :edit, :update, :destroy]

 
  def index
    @planets = Planet.all
  end

  
  def show
  end


  def new
    @planet = Planet.new
  end

  def edit
  end

 
  def create
    @planet = Planet.create(planet_params)
      if @planet.valid?
        redirect_to planet_path(@planet)
      else
        flash[:errors] = @planet.errors.full_messages
        redirect_to new_planet_path
      end 
  end

 
  def update
    if @planet.update(planet_params)
      redirect_to planet_path(@planet)
    else
      flash[:errors] = @planet.errors.full_messages
      redirect_to edit_planet_path
    end    
  end

  def destroy
    @planet.destroy
    redirect_to planets_path  
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_planet
      @planet = Planet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def planet_params
      params.require(:planet).permit(:name, :distance_from_earth, :nearest_star)
    end
end
