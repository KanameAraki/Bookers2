class RelationshipsController < ApplicationController

  def create
    followed_user = User.find(params[:user_id])
    follow = Relationship.new
    follow.followed_id = followed_user.id
    follow.follower_id = current_user.id
    follow.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    followed_user = User.find(params[:user_id])
    follow = Relationship.find_by(follower_id:current_user,followed_id:followed_user.id)
    follow.destroy
    redirect_back(fallback_location: root_path)
  end

end
