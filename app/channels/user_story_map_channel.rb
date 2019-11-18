class UserStoryMapChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    stream_from "user_story_map_channel"
  end

  def unsubscribed
    stop_all_streams
  end
end
