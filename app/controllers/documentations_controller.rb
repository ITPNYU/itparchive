class DocumentationsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]

  def index
    @documentations = Documentation.where(:thesis_id => nil)
  end

  def edit
    @documentation = Documentation.find(params[:id])
  end

  def update
    puts params.inspect
    @documentation = Documentation.find(params[:id])
    @documentation.update_attributes({
      :physical_location => params[:physical_location],
      :read => params[:read],
      :has_images => params[:has_images],
      :integrity => params[:integrity]
    })
    @documentation.integrity = params[:integrity]
    if (params[:flag] == "true")
      @documentation.flag = true
    else
      @documentation.flag = false
    end
    @documentation.thesis = Thesis.new(params[:thesis])
    @documentation.thesis.person = Person.new(params[:person])

    respond_to do |format|
      if @documentation.save
        format.html { redirect_to "/documentations", notice: 'Thesis was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @documentation.errors, status: :unprocessable_entity }
      end
    end
  end

end
