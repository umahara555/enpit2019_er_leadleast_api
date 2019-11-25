class LeanCanvasChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    stream_from "lean_canvas_channel_#{params[:product_id]}"
  end

  def unsubscribed
    stop_all_streams
  end
end
