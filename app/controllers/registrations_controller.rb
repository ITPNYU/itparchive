class RegistrationsController < Devise::RegistrationsController
  def new
    flash[:alert] = "We are not accepting new users"
    redirect_to :root
  end
  def create
    flash[:alert] = "We are not accepting new users"
    redirect_to :root
  end
end