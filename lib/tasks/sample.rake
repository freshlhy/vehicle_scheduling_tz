#encoding: utf-8
require 'date'

def datapath filename
  File.expand_path(File.join(File.dirname(__FILE__), filename))
end

namespace :db do
  desc "Fill database with sample data"
  task sample: :environment do

    Admin.create!(name: "admin", password: "000000", password_confirmation: "000000")

    file = File.open(datapath("./workers.txt"), "r:UTF-8")
    groupname_holder = ""
    group = nil
    file.each_line do |line|
      (groupname, username) = line.split
      if not groupname.eql?(groupname_holder)
        group = Group.create!(name: groupname)
        groupname_holder = groupname
        puts groupname
      end
      puts username
      Worker.create!(name: username, password: "000000", password_confirmation:"000000", group_id: group.id)
    end

    file = File.open(datapath("./drivers.txt"), "r:UTF-8")
    file.each_line do |line|
      driver = Driver.new
      driverStat = DriverStat.new
      (driver.name, driver.gender, driver.licence_id, driver.since, driver.phone) = line.split
      driver.password = "000000"
      driver.password_confirmation = "000000"
      puts driver.name
      driver.save

      driverStat.driver_age = ((Date.today.mjd - driver.since.mjd)/365.0).round(1)
      driverStat.trip_count = 0
      driverStat.accident_count = 0
      driverStat.driver_id = driver.id
      driverStat.save
    end   

    file = File.open(datapath("./cars.txt"), "r:UTF-8")
    file.each_line do |line|
      car = Car.new
      (car.model, car.plate, car.load_limit, car.since) = line.split
      car.age = ((Date.today.mjd - car.since.mjd)/365.0).round(1)
      puts car.model_plate
      car.save
    end

    file = File.open(datapath("./parts.txt"), "r:UTF-8")
    file.each_line do |line|
      part = Part.new
      (part.name, part.model, part.rating_mileage, part.rating_life) = line.split
      puts part.name_model
      part.save
    end


    file = File.open(datapath("./destinations.txt"), "r:UTF-8")
    file.each_line do |line|
      destination = Destination.new
      destination.name = line
      puts destination.name
      destination.save
    end

    file = File.open(datapath("./notes.txt"), "r:UTF-8")
    file.each_line do |line|
      note = Note.new
      note.name = line
      puts note.name
      note.save
    end

    file = File.open(datapath("./accidents.txt"), "r:UTF-8")
    file.each_line do |line|
      accident = Accident.new
      (name, plate, accident.location, accident.a_date, 
        accident.responsible, accident.damage, accident.casualties) = line.split
      driver = Driver.find_by_name(name)
      car    = Car.find_by_plate(plate)
      accident.driver_id = driver.id
      accident.car_id    = car.id
      accident.save

      driverStat = driver.driver_stat
      driverStat.accident_count += 1
      driverStat.save

    end

    file = File.open(datapath("./plms.txt"), "r:UTF-8")
    file.each_line do |line|
      plm = Plm.new
      (plate, plm.plm_type, plm.value, plm.start, 
        plm.last, plm.nextd, plm.is_active) = line.split
      car = Car.find_by_plate(plate)
      plm.car_id = car.id
      plm.save

    end

    # 监督部件
    Part.all.each do |part|
      Supervise.create!(part_id: part.id, car_id: rand(1..5), 
        start:Date.new(2012,1,1) + 72*rand(), current_mileage: 0, current_life: 0, is_active: "启用")
      Supervise.create!(part_id: part.id, car_id: rand(5..7), 
        start:Date.new(2012,1,1) + 72*rand(), current_mileage: 0, current_life: 0, is_active: "启用")
      Supervise.create!(part_id: part.id, car_id: rand(7..11), 
        start:Date.new(2012,1,1) + 72*rand(), current_mileage: 0, current_life: 0, is_active: "启用")
      Supervise.create!(part_id: part.id, car_id: rand(11..14), 
        start:Date.new(2012,1,1) + 72*rand(), current_mileage: 0, current_life: 0, is_active: "暂停")
      Supervise.create!(part_id: part.id, car_id: rand(14..17), 
        start:Date.new(2012,1,1) + 72*rand(), current_mileage: 0, current_life: 0, is_active: "停用")
    end

    # 司机和车辆配对
    (1..500).each do |item|
      Drivership.create!(car_id: rand(1..17), driver_id: rand(113..131))
    end

    def driver_stat_proc(trip)
      driverStat = trip.driver.driver_stat
      driverStat.trip_count += 1 
      driverStat.save
    end

    def supervise_proc(trip)
      supervises = Supervise.active.where("car_id = ? AND start <= ?", trip.car.id, trip.departure_time)
      supervises.each do |supervise|
        supervise.current_mileage += trip.mileage
        supervise.current_life += trip.back_time.mjd - trip.departure_time.mjd

        supervise.mileage_status = supervise.current_mileage.to_s + "/" + supervise.part.rating_mileage.to_s
        supervise.mileage_status_value = (supervise.current_mileage / supervise.part.rating_mileage.to_f).round(3)

        supervise.life_status = supervise.current_life.to_s + "/" + supervise.part.rating_life.to_s
        supervise.life_status_value = (supervise.current_life / supervise.part.rating_life.to_f).round(3)

        supervise.save
      end
    end


    # 2012年历史出车数据
    (1..100).each do |i|
      dt = Date.new(2012,1,1) + (365*rand())
      bt = dt + rand(1..5)
      trip = Trip.create!(drivership_id: rand(1..500),
                    destination_id: rand(1..16),
                    mileage: rand(5..350),
                    departure_time: dt,
                    back_time: bt,
                    note_id: rand(1..5))
      driver_stat_proc(trip)
      supervise_proc(trip)

      (1..rand(2..5)).each do |k|
        Workership.create!(trip_id: i, worker_id: rand(2..112))
      end

    end

    # 2013年历史出车数据
    days = Date.today.mjd - Date.new(2013,1,1).mjd
    (1..100).each do |i|
      dt = Date.new(2013,1,1) + ((days -6)*rand())
      bt = dt + rand(1..5)
      trip = Trip.create!(drivership_id: rand(1..500),
                    destination_id: rand(1..16),
                    mileage: rand(5..350),
                    departure_time: dt,
                    back_time: bt,
                    note_id: rand(1..5))

      driver_stat_proc(trip)
      supervise_proc(trip)

      (1..rand(2..5)).each do |k|
        Workership.create!(trip_id: i+100, worker_id: rand(2..112))
      end

    end

    # 出车中
    days = Date.today.mjd - Date.new(2013,1,1).mjd
    (1..rand(10..12)).each do |i|
      dt = Date.new(2013,1,1) + ((days -6)*rand())
      bt = dt + rand(1..5)

      kdays = rand(0..5)   
      bt = Date.today + kdays
      dt = bt - rand(kdays..(kdays + 5))
      r_drivership_id = rand(1..500)

      trip = Trip.create!(drivership_id: r_drivership_id,
                    destination_id: rand(1..16),
                    mileage: rand(5..350),
                    departure_time: dt,
                    back_time: bt,
                    note_id: rand(1..5),
                    ing: true)

      # 200为历史出车数
      current_trip_id = i + 200

      drivership = Drivership.find(r_drivership_id)
      car = drivership.car
      driver = drivership.driver

      if TripUser.exists?(:user_id => driver.id)
        trip.destroy
        next
      end

      car.current_trip = current_trip_id
      car.save

      TripUser.create!(user_id:driver.id, trip_id: current_trip_id)

      (1..rand(3..5)).each do |k|
        r_worker_id = rand(2..112)
        workership = Workership.create!(trip_id: current_trip_id, worker_id: r_worker_id)
        if TripUser.exists?(:user_id => r_worker_id)
          workership.destroy
          next
        end
        TripUser.create!(user_id:r_worker_id, trip_id: current_trip_id)
      end

    end


    @trips = Trip.all
    @trips.each { |trip|
      workers_ids = []
      workers_names = []
      trip.workers.each { |worker|
        workers_ids.push(worker.id)
        workers_names.push(worker.name)
      }
      trip.workers_ids = workers_ids.join(",")
      trip.workers_names = workers_names.join("，")
      trip.save
    }

  end

end