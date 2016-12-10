class SessionController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:name], params[:user][:password])
    if @user
      login!
      redirect_to subs_url
    else
      flash[:errors] = ["Incorrect Log in information"]
      render :new
    end
  end

  def destroy
    logout!
    render :new
  end
end
