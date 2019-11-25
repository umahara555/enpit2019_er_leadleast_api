class SyncProductBacklogJob < ActiveJob::Base
  def perform(product_id, data)
    ActionCable.server.broadcast("product_backlog_channel_#{product_id}", data)
  end
end
