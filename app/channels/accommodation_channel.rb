class AccommodationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "accommodation_channel"
  end

  def unsubscribed
  end
end
