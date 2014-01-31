class CommentsController < ApplicationController

  http_basic_authenticate_with name: "uid", password: "uid", only: [:destroy]

  #def new
  #  @comment = Comment.new
  #end

  def create
	@post = Post.find(params[:post_id])
	#@comment = @post.comments.create(params[:comment].permit(:commenter, :body))
	#redirect_to post_path(@post)
  @comment = @post.comments.build(params[:comment].permit(:commenter, :body))
  if @comment.save
    redirect_to post_path(@post)
  else
    render "posts/show"
  end

  end


  def destroy
	@post = Post.find(params[:post_id])
	@comment = @post.comments.find(params[:id])
	@comment.destroy
	redirect_to post_path(@post)
  end




end
