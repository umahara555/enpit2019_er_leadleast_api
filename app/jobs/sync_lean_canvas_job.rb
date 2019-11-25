class SyncLeanCanvasJob < ActiveJob::Base
  def perform(product_id, data)
    ActionCable.server.broadcast("lean_canvas_channel_#{product_id}", data)
  end
end
