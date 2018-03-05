class LikesController < ApplicationController

  def create
    Like.create(user: current_user, secret: Secret.find(params[:id]))
    redirect_to :back
  end

  def destroy
    Like.find_by(user_id: session[:user_id]).destroy
    redirect_to :back
  end

end
