class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to current_user
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      log_in(user)
      redirect_to user
    else
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
