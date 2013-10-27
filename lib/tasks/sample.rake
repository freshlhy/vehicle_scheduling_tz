#encoding: utf-8
require 'date'

namespace :db do
  desc "Fill database with sample data"
  task sample: :environment do

    admin = Admin.create!(name:     "admin",
                         password: "000000",
                         password_confirmation:"000000")

    car1 = Car.create!(model: "风行",
                       plate:"赣M87711",
                       load_limit:7)
    car2 = Car.create!(model: "瑞风",
                       plate:"赣M71479",
                       load_limit:7)
    car3 = Car.create!(model: "全顺工程车",
                       plate:"赣AC0325",
                       load_limit:10)
    car4 = Car.create!(model: "全顺工程车",
                       plate:"赣AC1767",
                       load_limit:10)
    car5 = Car.create!(model: "瑞风",
                       plate:"赣A0T567",
                       load_limit:7)


    dest1 = Destination.create!(name:"南昌变")
    dest2 = Destination.create!(name:"梦山变")
    dest3 = Destination.create!(name:"永修变")
    dest4 = Destination.create!(name:"石钟山变")
    dest5 = Destination.create!(name:"抚州变")



    note1 = Note.create!(name:"消缺")
    note2 = Note.create!(name:"临检")
    note3 = Note.create!(name:"定检")


    group1 = Group.create!(name:"二次一班")
    group2 = Group.create!(name:"二次二班")
    group3 = Group.create!(name:"二次三班")
    group4 = Group.create!(name:"二次四班")


    #二次一班

    worker1 = Worker.create!(name:"戴斌",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group1.id)
    worker2 = Worker.create!(name:"陈武恝",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group1.id)
    worker3 = Worker.create!(name:"胡平",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group1.id)
    worker4 = Worker.create!(name:"帅玲玲",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group1.id)
    worker5 = Worker.create!(name:"吴骅",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group1.id)




    #检修司机一班

    driver1 = Driver.create!(name:     "余靓",
                             phone:    "663941",
                             password: "000000",
                             password_confirmation:"000000")
    driver2 = Driver.create!(name:     "唐振军",
                             phone:    "663984",
                             password: "000000",
                             password_confirmation:"000000")
    driver3 = Driver.create!(name:     "钱家意",
                             phone:    "665701",
                             password: "000000",
                             password_confirmation:"000000")
    driver4 = Driver.create!(name:     "程鹏",
                             phone:    "668799",
                             password: "000000",
                             password_confirmation:"000000")
    driver5 = Driver.create!(name:     "邹睿",
                             phone:    "668346",
                             password: "000000",
                             password_confirmation:"000000")


   


    (1..10).each do |item|
      Drivership.create!(car_id: rand(1..5), driver_id: rand(7..11))
    end


    (1..15).each do |i|
      dt = Date.new(2012,1,1) + (365*rand())
      bt = dt + rand(1..5)
      Trip.create!(drivership_id: rand(1..10),
                    destination_id: rand(1..5),
                    departure_time: dt,
                    back_time: bt,
                    note_id: rand(1..3))


      (1..5).each do |k|
        Workership.create!(trip_id: i, worker_id: rand(2..6))
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