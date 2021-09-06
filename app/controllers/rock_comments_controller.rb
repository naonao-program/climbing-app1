# frozen_string_literal: true

class RockCommentsController < ApplicationController
  def create
    comment = RockComment.create(comment_params)
    redirect_to "/rock_information/#{comment.rock_information.id}"
  end

  private

  def comment_params
    params.require(:rock_comment).permit(:comment).merge(user_id: current_user.id,
                                                         rock_information_id: params[:rock_information_id])
  end
end
