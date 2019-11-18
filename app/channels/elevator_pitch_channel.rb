class ElevatorPitchChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    stream_from "elevator_pitch_channel"
  end

  def unsubscribed
    stop_all_streams
  end
end
