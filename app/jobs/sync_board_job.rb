class SyncBoardJob < ActiveJob::Base
  def perform(data)
    ActionCable.server.broadcast("board_channel", data)
  end
end
