module TripsHelper

  def in_trip?(user)
    TripUser.exists?(:user_id => user.id)
  end

  def current_trip(user)
    if TripUser.exists?(:user_id => user.id)
      return TripUser.where("user_id = ?", user.id).first.trip_id
    else
      return nil
    end
  end

  def trip_user_add(trip, user)
    TripUser.create!(user_id: user.id, trip_id: trip.id)
  end

  def trip_user_delete(user)
    trip_user = TripUser.where("user_id = ?", user.id).first
    trip_user.destroy unless trip_user.nil?
  end

  def in_trip_users(trip)

    in_trip_users_ids = [0]
    trip_users = TripUser.where("trip_id != ?", trip.id)
    trip_users = TripUser.all if trip.id.nil?

    unless trip_users.nil?
      trip_users.each { |trip_user|
        in_trip_users_ids << trip_user.user_id
      }
    end

    in_trip_users_ids

  end


end
