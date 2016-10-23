class SuperpowersController < ApplicationController
  before_action :get_superpower, only: [:show, :edit, :update, :destroy]
  before_action :get_team_superhero, only: [:index, :show]

  def index
    @superpowers = Superpower.search(params[:search])
  end

  def new 
    @superpower = Superpower.new
  end

  def create
    @superpower = Superpower.new(superpower_params)
    if @superpower.save
      flash[:success] = 'New Superpower Created!'
      redirect_to @superpower
    else
      flash[:error] = @superpower.errors.full_messages.join(' ')
      render :new
    end
  end

  def show
    @superheroes = @superpower.superheroes
  end

  def edit
  end

  def update
    if @superpower.update(superpower_params)
      flash[:success] = 'Superpower Updated'
      redirect_to @superpower
    else
      flash[:error] = @superpower.errors.full_messages.join(' ')
      render :edit
    end
  end

  def destroy
    @superpower.destroy
    redirect_to superpowers_path
  end

  def clear
    explode
  end

  private

  def superpower_params
    params.require(:superpower).permit(:name,:description)
  end

  def get_superpower
    @superpower = Superpower.find_by_id(params[:id])
  end

  private

  def get_team_superhero
    current_hero = session[:current_hero]
    @superhero = Superhero.find_by_id(current_hero['id'])
    team_id = current_hero['team_id']
    @team = Team.find_by_id(team_id)
  end

end
