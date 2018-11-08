class FavoritesController < ApplicationController
  before_action :authenticate_user, only: [:index, :create]

  def index
    render json: current_user.beers
  end

  def create
    beer = Beer.find(params[:beer_id])
    current_user.beers << beer
    render status: :created
  end

end