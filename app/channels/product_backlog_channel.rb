class ProductBacklogChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    stream_from "product_backlog_channel"
  end

  def unsubscribed
    stop_all_streams
  end
end
