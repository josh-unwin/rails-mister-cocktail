class CocktailsController < ApplicationController
  def index
    if params[:search].nil?
      @title = "All Cocktails"
      @cocktails = Cocktail.all
    else
      @cocktail_name = params[:search][:name]
      @cocktails = Cocktail.where('name ILIKE ?', '%' + @cocktail_name + '%' )
      @title = "Results for \"#{@cocktail_name}\""
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
