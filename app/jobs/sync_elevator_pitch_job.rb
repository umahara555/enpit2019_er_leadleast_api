class SyncElevatorPitchJob < ActiveJob::Base
  def perform(product_id, data)
    ActionCable.server.broadcast("elevator_pitch_channel_#{product_id}", data)
  end
end
