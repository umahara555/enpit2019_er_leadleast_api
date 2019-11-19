class SyncElevatorPitchJob < ActiveJob::Base
  def perform(data)
    ActionCable.server.broadcast("elevator_pitch_channel", data)
  end
end
