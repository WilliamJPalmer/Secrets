class SecretsController < ApplicationController

  def index
    @secrets = Secret.all
    @user = User.find(session[:user_id])
    @likes = Like.all
  end

  def create
    puts'^^^^^^^^^^^^^^^^^^^____________________'
    @secrets = Secret.create(secret:params[:secret],user: current_user)
    # secret = Secret.new secret_params
    redirect_to :back
  end

  def destroy
    @secret = Secret.find(params[:id])
    @secret.destroy

    redirect_to :back
  end

end
