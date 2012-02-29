class NotesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @notes = Note.order("created_at DESC").all
    
    respond_to do |format|
      format.html
      format.json { render json: @notes.to_json(:include => [:notable, :user])}
    end
  end

  def create
    @note = Note.new(params[:note])
    @note.save
    render json: @note.to_json(include: :user)
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    
    render json: {head: 'ok'}
  end

  def recent
    @notes = Note.find(:all, :order => "updated_at desc", :limit => 5)
    
    respond_to do |format|
      format.html
      format.json { render json: @notes.to_json(:include => [:notable, :user])}
    end
  end

end