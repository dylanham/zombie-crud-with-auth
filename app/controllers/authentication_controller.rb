class AuthenticationController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:notice] = "something happened"
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Thank you for logging out!"
    redirect_to root_path
  end

end
