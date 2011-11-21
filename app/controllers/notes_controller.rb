class NotesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @notes = Notes.all
    
    respond_to do |format|
      format.html
      format.json { render json: @notes.to_json(:include => [:notable, :user])}
    end
  end

  def recent
    @notes = Note.find(:all, :order => "updated_at desc", :limit => 5)
    
    respond_to do |format|
      format.html
      format.json { render json: @notes.to_json(:include => [:notable, :user])}
    end
  end

end