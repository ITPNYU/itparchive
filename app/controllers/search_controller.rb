class SearchController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    if(params[:q])
      @query = params[:q]
      @results = Search.new params[:q]
    end
  end
end
