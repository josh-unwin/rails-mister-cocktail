class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
  end

  def new
    @cocktail = Cocktail.new
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(TO DO)
  end
end
