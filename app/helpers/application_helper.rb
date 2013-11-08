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
    if type == "add"
      driverStat.trip_count = driverStat.trip_count + 1
    else
      driverStat.trip_count = driverStat.trip_count - 1
    end
    driverStat.save
    supervises = Supervise.active.find_all_by_car_id(trip.car.id)
    supervises.each do |s|
      if type == "add"
        s.current_mileage = s.current_mileage + trip.mileage
        s.current_life    = s.current_life + trip.back_time.mjd - trip.departure_time.mjd + 1
      else
        s.current_mileage = s.current_mileage - trip.mileage
        s.current_life    = s.current_life - (trip.back_time.mjd - trip.departure_time.mjd + 1)
      end
      s.mileage_status  = s.current_mileage.to_s + "/" + s.part.rating_mileage.to_s
      s.life_status     = s.current_life.to_s + "/" + s.part.rating_life 
      s.save
    end
  end
	
end
