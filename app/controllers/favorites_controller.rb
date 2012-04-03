class FavoritesController < ApplicationController
  before_filter :authenticate_user!
  cache_sweeper :favorite_sweeper

  def index
    @favorites = Favorite.all
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    
    respond_to do |format|
      format.html { redirect_to favorites_url }
      format.json { head :ok }
    end
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
