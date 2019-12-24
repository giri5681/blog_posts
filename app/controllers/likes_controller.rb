class LikesController < ApplicationController
	before_action :find_post
  def create
    @post.likes.create(user_id: current_user.id)
    redirect_to post_path(@post)
  end
  private
  def find_post
    @post = Post.find_by(id: params[:post_id])
    if @post.nil?
    	flash[:alert] = 'Sorry, Record not found!'
    	redirect_to posts_path
    end
  end
end
