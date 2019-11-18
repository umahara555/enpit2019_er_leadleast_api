class SyncLeanCanvasJob < ActiveJob::Base
  def perform(data)
    ActionCable.server.broadcast("lean_canvas_channel", data)
  end
end
