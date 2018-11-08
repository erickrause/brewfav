class FavoritesController < ApplicationController
  before_action :authenticate_user, only: [:index]

  def index
    render json: current_user.beers
  end

end