class DocumentationsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  # caches_action :index

  def index
    @documentations = Documentation.where(:id => [1, 2, 3, 4, 5, 6, 9, 10, 11, 12, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 25, 26, 27, 28, 30, 31, 32, 289, 326, 339, 531, 591, 609, 776])
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
        format.all { render json: @documentation }
      else
        format.html { render action: "edit" }
        format.json { render json: @documentation.errors, status: :unprocessable_entity }
      end
    end
  end

end
