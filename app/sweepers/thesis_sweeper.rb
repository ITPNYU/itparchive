class ThesisSweeper < ActionController::Caching::Sweeper
  # Keep an eye on the Thesis model
  observe Thesis
  
  def after_create(thesis)
    expire_cache_for(thesis)
  end
  
  def after_update(thesis)
    expire_cache_for(thesis)
  end

  def after_destroy(thesis)
    expire_cache_for(thesis)
  end
  
  private
  
  def expire_cache_for(thesis)
    # Expire the index since some of its content has changed.
    expire_action(:controller => 'theses', :action => 'index')
    # Expire theses#show for this thesis
    expire_action(:controller => 'theses', :action => 'show', :id => thesis.id)
    # Expire the corresponding fragment
    expire_fragment(thesis)
  end
end