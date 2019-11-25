class SyncUserStoryMapJob < ActiveJob::Base
  def perform(product_id, data)
    ActionCable.server.broadcast("user_story_map_channel_#{product_id}", data)
  end
end
