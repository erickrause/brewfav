class BeersController < ApplicationController
  before_action :get_beers, only: [:index]
  before_action :filter_beers, only: [:index]
  before_action :sort_new, only: [:index]
  before_action :limit, only: [:index]

  def index
    render json: @beers.all
  end

  private
  def filter_beers
    name_filter = params[:name]
    @beers = @beers.name_filter(name_filter) if name_filter
  end

  def sort_new
    sort_new = params[:new]
    @beers = @beers.sort_new if sort_new
  end

  def limit
    limit_count = params[:limit].to_i
    @beers = @beers.limit(limit_count) if limit_count >0
  end

  def get_beers
    @beers = Beer
  end
end
