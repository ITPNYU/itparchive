class DocumentationsController < ApplicationController

  def index
    @documentations = Documentation.all
    
    respond_to do |format|
      format.html
    end
  end

end
