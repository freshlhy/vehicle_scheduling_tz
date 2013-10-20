#encoding: utf-8
class IndexPageController < ApplicationController

  def index

    cars = Car.all
    drivers = Driver.all

    @available_cars = []
    @cars_in_use = []
    @available_drivers = []

    cars.each { |car|
      #该车已出差
      if car.current_trip > 0
        @trip = Trip.find(car.current_trip)

        @cars_in_use << {
            car: car,
            driver: @trip.driver.name,
            destination: @trip.destination.name,
            departure_time: @trip.departure_time,
            back_time: @trip.back_time,
            note: @trip.note.name,
            workers_names: @trip.workers_names
        }
      else
        #该车最近一次由谁驾驶？
        drivership = Drivership.where("car_id=?", car.id).order('created_at desc').first
        if drivership.nil?
          @available_cars << {
              car: car,
              driver: nil
          }
        else
          @available_cars << {
              car: car,
              driver: Driver.find(drivership.driver_id)
          }
        end
      end
    }

    drivers.each { |driver|

      if TripUser.where(:user_id => driver.id).exists?
        next
      end

      latest_drivership = Drivership.where("driver_id=?", driver.id).order('created_at desc').first


      if latest_drivership.nil?

        @available_drivers << {
            name: driver.name,
            phone: driver.phone,
            latest_trip_time: nil,
            latest_trip_destination: nil
        }

      else
        latest_trip = Trip.where("drivership_id=?", latest_drivership.id).order('created_at desc').first
        if latest_trip.nil?

          @available_drivers << {
              name: driver.name,
              phone: driver.phone,
              latest_trip_time: nil,
              latest_trip_destination: nil
          }

        else

          @available_drivers << {
              name: driver.name,
              phone: driver.phone,
              latest_trip_time: latest_trip.back_time,
              latest_trip_destination: latest_trip.destination.name
          }

        end
      end

    }
  end
end
