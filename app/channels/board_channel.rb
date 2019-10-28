class BoardChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    stream_from "board_channel"
  end

  def unsubscribed
    stop_all_streams
  end
end
