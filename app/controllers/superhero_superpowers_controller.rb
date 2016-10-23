class SuperheroSuperpowersController < ApplicationController
  before_action :get_team_superhero

  def create
    @superpower = Superpower.find_by_id(params[:format])
    if !@superhero.superpowers.exists?(@superpower)
      @superhero.superpowers << @superpower
      flash[:success] = 'Power Added!'
      redirect_to team_superhero_path(@team,@superhero)
    else
      flash[:error] = 'Superhero already has this power.'
      redirect_to superpowers_path
    end
  end

  def destroy
    @superpower = Superpower.find_by_id(params[:id])
    @superhero.superpowers.delete(@superpower)
    flash[:success] = 'Power Removed!'
    redirect_to team_superhero_path(@team,@superhero)
  end

  private

  def get_team_superhero
    @team = Team.find_by_id(params[:team_id])
    @superhero = Superhero.find_by_id(params[:superhero_id])
  end
end
