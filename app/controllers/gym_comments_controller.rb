class GymCommentsController < ApplicationController
  def create
    @comment = GymComment.new(comment_params)
    if @comment.save
      redirect_to "/gym_information/#{@comment.gym_information_id}"
    else
      render "/gym_information/"
    end
  end

  private
  def comment_params
    params.require(:gym_comments).permit(:comment).merge(user_id: current_user.id, gym_information_id: params[:gym_information_id])
  end
end
