class CommentsController < ApplicationController
	load_and_authorize_resource
	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.new(comment_params)
		@comment.user = current_user
		@post.comments << @comment
		@comment.save
		redirect_to @post
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to @post
	end

	private

	def comment_params
		params.requiere(:comment).permit(:content)
	end

end
