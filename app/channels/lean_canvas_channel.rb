class LeanCanvasChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    stream_from "lean_canvas_channel"
  end

  def unsubscribed
    stop_all_streams
  end
end
