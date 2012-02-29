class ReadsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @reads = Read.all
  end
  
  def create
    @read = Read.new({
      :user_id => current_user.id,
      :readable => Object.const_get(params[:readable_type]).find(params[:readable_id])
    })
    if @read.save
      render json: @read, status: :created
    end
  end

  def destroy
    @read = Read.find(params[:id])
    @read.destroy
    render json: { succes: 'ok' }
  end

end