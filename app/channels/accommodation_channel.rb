class AccommodationChannel < ApplicationCable::Channel
  def subscribed
    if params[:room] == "admin"
      stream_from "accommodation_#{params[:room]}"
    elsif params[:room] == "manager"
      stream_from "accommodation_#{params[:room]}#{current_user.id}"
    end
  end

  def unsubscribed
  end
end
