class SuperheroesController < ApplicationController

  def index
    @superheroes = Superhero.all
  end

  def new
    @team = Team.find_by_id(params[:team_id])
    @superhero = @team.superheroes.build
  end

  def create
    @team = Team.find_by_id(params[:team_id])
    @superhero = @team.superheroes.create(superhero_params)
    if @superhero.save
      flash[:success] = 'Superhero Created'
      redirect_to @superhero
    else
      flash[:error] = @superhero.errors.full_messages.join(' ')
      render :new
    end
  end

  def show
    @team = Team.find_by_id(params[:team_id])
    @superhero = Superhero.find_by_id(params[:id])  
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def superhero_params
    params.require(:superhero).permit(:name,:true_identity)
  end

end
