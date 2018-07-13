class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    # byebug
    user = User.find_by_credentials(params[:user][:email],
      params[:user][:password])


    if user
      login!(user)
      redirect_to user_url(user)
    else
      flash.now[:errors] = ["Incorrect username and/or password"]
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_user_url
  end
end
