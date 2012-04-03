class FavoriteSweeper < ActionController::Caching::Sweeper
  # Keep an eye on the Thesis model
  observe Favorite
  
  def after_create(favorite)
    expire_cache_for(favorite)
  end

  def after_destroy(favorite)
    expire_cache_for(favorite)
  end
  
  private
  
  def expire_cache_for(favorite)
    # Expire the index since some of its content has changed.
    expire_action(:controller => 'theses', :action => 'index')
    # Expire the corresponding fragment
    expire_fragment(favorite.favoritable)
  end
end
