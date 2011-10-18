class DocumentationsController < ApplicationController

  def index
    @documentations = Documentation.where(:thesis_id => nil)
    
    respond_to do |format|
      format.html
    end
  end

end
