class SuperheroSuperpowersController < ApplicationController
  before_action :get_team_superhero

  def create
    # @team = Team.find_by_id(params[:team_id])
    # @superhero = Superhero.find_by_id(params[:superhero_id])
    @superpower = Superpower.find_by_id(params[:format])
    @superhero.superpowers << @superpower
    redirect_to team_superhero_path(@team,@superhero)
  end

  def destroy
    @superpower = Superpower.find_by_id(params[:id])
    @superhero.superpowers.delete(@superpower)
    redirect_to team_superhero_path(@team,@superhero)
  end

  private

  def get_team_superhero
    @team = Team.find_by_id(params[:team_id])
    @superhero = Superhero.find_by_id(params[:superhero_id])
  end
end
