class FavoritesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @favorites = Favorite.all
  end

  def create
    @favorite = Favorite.new({
      :user_id => current_user.id,
      :favoritable => Object.const_get(params[:favoritable_type]).find(params[:favoritable_id]),
    })
    if @favorite.save
      render json: @favorite, status: :created
    end
  end
end
