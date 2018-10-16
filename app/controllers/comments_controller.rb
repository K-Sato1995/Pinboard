class CommentsController < ApplicationController

  def create
    @comment = Comment.create(text: comment_params[:text], pin_id: comment_params[:pin_id], user_id: current_user.id)
    redirect_to "/pins/#{@comment.pin.id}"
  end

  private

  def comment_params
    params.permit(:text, :pin_id,:user_id)
  end
end
