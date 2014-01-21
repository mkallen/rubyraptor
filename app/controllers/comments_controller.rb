class CommentsController < ApplicationController

  def create
	@post = Post.find(params[:post_id])
	#@comment = @post.comments.create(params[:comment].permit(:commenter, :body))
	#redirect_to post_path(@post)
  if @post.comments.create(params[:comment].permit(:commenter, :body))
    redirect_to post_path(@post)
  else
    render 'show'
  end

  end


  def destroy
	@post = Post.find(params[:post_id])
	@comment = @post.comments.find(params[:id])
	@comment.destroy
	redirect_to post_path(@post)
  end




end
