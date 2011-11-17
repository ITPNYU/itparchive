class ThesesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]

  # GET /theses
  # GET /theses.json
  def index
    @theses = Thesis.all
    @people = Person.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @theses }
    end
  end

  # GET /theses/1
  # GET /theses/1.json
  def show
    @thesis = Thesis.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @thesis }
    end
  end

  # GET /theses/new
  # GET /theses/new.json
  def new
    @thesis = Thesis.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @thesis }
    end
  end

  # GET /theses/1/edit
  def edit
    @thesis = Thesis.find(params[:id])
  end

  # POST /theses
  # POST /theses.json
  def create
    params[:documentation][:paper] = params[:documentation][:paper].tempfile.readline if params[:documentation][:paper]
    @thesis = Thesis.new(params[:thesis]) #{:attribute => "value", :attribute2 => 1  }
    @thesis.documentations << Article.new(params[:documentation]) # params = {:thesis => {...}, :documentation => {:media => {...}}}
    @thesis.person = Person.new(params[:person])
    
    if params[:note]
      note = Note.new(params[:note])
      note.user = current_user
      @thesis.notes <<  note
    end

    respond_to do |format|
      if @thesis.save
        format.html { redirect_to @thesis, notice: 'Thesis was successfully created.' }
        format.json { render json: @thesis, status: :created, location: @thesis }
      else
        format.html { render action: "new" }
        format.json { render json: @thesis.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /theses/1
  # PUT /theses/1.json
  def update
    @thesis = Thesis.find(params[:id])

    respond_to do |format|
      if @thesis.update_attributes(params[:thesis])
        format.html { redirect_to @thesis, notice: 'Thesis was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @thesis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /theses/1
  # DELETE /theses/1.json
  def destroy
    @thesis = Thesis.find(params[:id])
    @thesis.destroy

    respond_to do |format|
      format.html { redirect_to theses_url }
      format.json { head :ok }
    end
  end
end
