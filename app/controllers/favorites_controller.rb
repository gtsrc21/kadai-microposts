class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    micropost = Micropost.find(params[:like_id])
    current_user.favorite(micropost)
    flash[:success] = 'Micropostをお気に入りにしました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    micropost = Micropost.find(params[:like_id])
    current_user.unfavorite(micropost)
    flash[:success] = 'Micropostをお気に入りから削除しました。'
    redirect_back(fallback_location: root_path)
  end
end
