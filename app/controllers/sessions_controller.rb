class SessionsController < ApplicationController
  def new
  end

  def login
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      puts'>>>>>>>>------------------------>'
      redirect_to "/users/#{@user.id}"
    else
      flash[:name] = ["Invalid Combination"]
      redirect_to "/"
    end
  end

  def destroy
      reset_session
      redirect_to '/'
  end

end
