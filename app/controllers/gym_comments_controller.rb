class GymCommentsController < ApplicationController
  def create
    binding.pry
    comment = GymComment.create(comment_params)
    redirect_to gym_information_index_path
  end

  private
  def comment_params
    params.require(:gym_comment).permit(:comment).merge(user_id: current_user.id, gym_information_id: params[:gym_information_id])
  end
end
