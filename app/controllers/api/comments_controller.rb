class Api::CommentsController < ApplicationController
  # before_action :autheticate_user, only: [:create]

  def index 
    comments = Comment.where(article_id: params[:article_id])
    render json: comments, each_serializer: CommentsSerializer
  end

  def create 
    comment = current_user.comments.create(comment_params)
    if comment.persisted?
      render json: { comment: comment }, status: 201
    else
      render json: { message: 'something went wrong' }, status: 422
    end
  end

  def comment_params 
    params.require(:comment).permit(:content, :article_id)
  end
end