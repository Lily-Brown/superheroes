class SuperheroesController < ApplicationController
  before_action :get_team
  before_action :get_superhero, only: [:show, :edit, :update, :destroy]

  def index
    @superheroes = @team.superheroes
  end

  def new
    @superhero = @team.superheroes.build
  end

  def create
    @superhero = @team.superheroes.new(superhero_params)
    if @superhero.save
      flash[:success] = 'Superhero Created'
      redirect_to team_superhero_path(@team,@superhero)
    else
      flash[:error] = @superhero.errors.full_messages.join(' ')
      render :new
    end
  end

  def show
    @superpowers = @superhero.superpowers
    session[:current_hero] = @superhero
  end

  def edit 
  end

  def update
    if @superhero.update(superhero_params)
      flash[:success] = 'Superhero Updated'
      redirect_to team_superhero_path
    else
      flash[:error] = @superhero.errors.full_messages.join(' ')
      render :edit
    end
  end

  def destroy
    @superhero.destroy
    redirect_to team_path(@team) 
  end

  private

  def superhero_params
    params.require(:superhero).permit(:name,:true_identity,:image_url)
  end

  def get_team
    @team = Team.find_by_id(params[:team_id])
  end

  def get_superhero
    @superhero = Superhero.find_by_id(params[:id]) 
  end

end
