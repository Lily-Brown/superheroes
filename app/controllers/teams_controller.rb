class TeamsController < ApplicationController
  before_action :get_team, only: [:show, :edit, :update, :destroy]

  def index
    @teams = Team.all
  end

  def new 
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      flash[:success] = 'New Team Created!'
      redirect_to @team
    else
      flash[:error] = @team.errors.full_messages.join(' ')
      render :new
    end
  end

  def show
    @superheroes = @team.superheroes
  end

  def edit
  end

  def update
    if @team.update(team_params)
      flash[:success] = 'Team Updated'
      redirect_to @team
    else
      flash[:error] = @team.errors.full_messages.join(' ')
      render :edit
    end
  end

  def destroy
    @team.destroy
    redirect_to teams_path
  end

  private

  def team_params
    params.require(:team).permit(:name,:publisher)
  end

  def get_team
    @team = Team.find_by_id(params[:id])
  end

end
