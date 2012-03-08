class SearchController < ApplicationController
  
  def index
    if(params[:q])
      @query = params[:q]
      @results = Search.new params[:q]
    end
  end
end
