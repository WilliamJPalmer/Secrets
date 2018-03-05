class UsersController < ApplicationController

  before_action :require_login, except: [:new, :create]

  def new
    render 'users/new/'
  end

  def show
    @user = User.find(params[:id])
    render 'users/show'
    @secrets = Secret.all
  end

  def edit


  end

  def create
    puts'<<<<<<<<<<<------------------<<<<<<'
    @user = User.create(user_params)

    if @user.valid?
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
  #   @user = User.new user_params
  #   if @user.save
  #     redirect_to "/"
  #     puts'going to the user show page'
  #   else
  #     flash[:errors] = @user.errors.full_messages
  #     redirect_to :back
    end
  end


  def destroy
    reset_session
    redirect_to '/'
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
