class SyncUserStoryMapJob < ActiveJob::Base
  def perform(data)
    ActionCable.server.broadcast("user_story_map_channel", data)
  end
end
