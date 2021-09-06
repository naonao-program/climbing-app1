# frozen_string_literal: true

class GymCommentsChannel < ApplicationCable::Channel
  def subscribed
    stream_form 'gym_comments_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
