class SearchController < ApplicationController
  
  def index
    if(params[:q])
      @query = params[:q]
      @results = Documentation.search(:paper => params[:q])
    end
  end
end
