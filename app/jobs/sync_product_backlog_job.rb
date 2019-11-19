class SyncProductBacklogJob < ActiveJob::Base
  def perform(data)
    ActionCable.server.broadcast("product_backlog_channel", data)
  end
end
