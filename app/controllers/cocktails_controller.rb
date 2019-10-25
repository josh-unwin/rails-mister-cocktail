class CocktailsController < ApplicationController
  def index
    if params[:search].nil?
      @cocktails = Cocktail.all
    else
      @cocktails = Cocktail.where('name ILIKE ?', '%' + params[:search][:name] + '%' )
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def create
    cocktail = Cocktail.new(cocktail_params)
    if cocktail.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  def search
    @cocktail = Cocktail.where()
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:photo, :name)
  end

  def search_params
    params.require(:search).permit(:name)
  end
end
