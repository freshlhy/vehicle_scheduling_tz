#encoding: utf-8
module ApplicationHelper
  def full_title(page_title)
    base_title = "变电检修中心车辆管理系统"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def is_integer(str)
    true if Integer(str) rescue false
	end

  def stat(trip_id, type="add")
    trip = Trip.find(trip_id)
    driverStat = DriverStat.find_by_driver_id(trip.driver.id)
    if type.eql?("add")
      driverStat.trip_count = driverStat.trip_count + 1
    else
      driverStat.trip_count = driverStat.trip_count - 1
    end
    driverStat.save
    supervises = Supervise.active.where("car_id = ? AND start <= ?", trip.car.id, trip.departure_time)
    supervises.each do |s|
      if type.eql?("add")
        s.current_mileage = s.current_mileage + trip.mileage
        s.current_life    = s.current_life + trip.back_time.mjd - trip.departure_time.mjd + 1
      else
        s.current_mileage = s.current_mileage - trip.mileage
        s.current_life    = s.current_life - (trip.back_time.mjd - trip.departure_time.mjd + 1)
      end
      s.mileage_status  = s.current_mileage.to_s + "/" + s.part.rating_mileage.to_s
      s.mileage_status_value = (s.current_mileage / s.part.rating_mileage.to_f).round(3)

      s.life_status     = s.current_life.to_s + "/" + s.part.rating_life.to_s 
      s.life_status_value = (s.current_life / s.part.rating_life.to_f).round(3)

      s.save
    end
  end

  def accident_stat(accident_id, type="add")
      accident = Accident.find(accident_id)
      driverStat = accident.driver.driver_stat
      if type.eql?("add")
        driverStat.accident_count += 1
      else
        driverStat.accident_count -= 1
      end
      driverStat.save
  end
	
end
