class DocumentationsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  # caches_action :index

  def index
    @documentations = Documentation.where(:thesis_id => nil)
  end

  def edit
    @documentation = Documentation.find(params[:id])
  end

  def update
    @documentation = Documentation.find(params[:id])
    @documentation.update_attributes({
      :physical_location => params[:physical_location],
      :has_images => params[:has_images],
      :integrity => params[:integrity]
    })

    if params[:read] == "true"
      if @documentation.reads.find(:first, :conditions => ["user_id = #{current_user.id}"]).nil?
        @documentation.reads << Read.new(:user_id => current_user.id)
      end
    else
      if r = @documentation.reads.find(:first, :conditions => ["user_id = #{current_user.id}"])
        r.destroy
      end
    end

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
