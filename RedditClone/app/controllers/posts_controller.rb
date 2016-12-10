class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post.post_subs.post_id = @post.subs.id
  end

  def edit
  end

  def update
  end

  def show
  end

  def post_params
    params.require(:post).permit(:url, :title, :content, :sub_ids)
  end
end
