class RoomReservationValidator < ActiveModel::Validator
  def validate(reservation)
    reservation.errors[:start] << "date must be before end date" and return unless validate_start_date_before_end_date(reservation)
    reservation.errors[:already] << "reserved in given date range" unless validate_not_already_reserved_in_date_range(reservation)
  end

  def validate_start_date_before_end_date(reservation)
    reservation.start_date < reservation.end_date
  end

  def validate_not_already_reserved_in_date_range(reservation)
    RoomReservation.all.each do |r|
      if reservation.start_date.between?(r.start_date, r.end_date) || reservation.end_date.between?(r.start_date, r.end_date)
        return false
      end
    end

    return true
  end
end
