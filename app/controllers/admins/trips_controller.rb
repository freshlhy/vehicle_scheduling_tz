#encoding: utf-8
module Admins
  class TripsController < BaseController
    # GET /trips
    # GET /trips.json
    def index
      respond_to do |format|
        format.html
        format.json { render json: TripsDatatable.new(view_context) }
      end
    end

    # GET /trips/1/edit
    def edit
      @trip = Trip.find(params[:id])
      @cars = Car.order("model").all
      @drivers = Driver.order("group_id").all
      @in_trip_users_ids = in_trip_users(@trip)
      if @trip.ing
        @cars = Car.where("current_trip = ? OR current_trip = ?", @trip.id, 0).order("model").all
        @drivers = Driver.where("id NOT IN (?)", @in_trip_users_ids).order("group_id").all
      end
      @drivership = @trip.drivership
      @selected_key = @trip.workers_ids.split(",")
    end

    # PUT /trips/1
    # PUT /trips/1.json
    def update

      @trip = Trip.find(params[:id])

      # 更新之前先重置统计
      stat(@trip, "del")

      car = @trip.car
      driver = @trip.driver
      if @trip.ing
        params[:driver_id] = driver.id.to_s
      end
      #车辆或司机被改动
      unless params[:car_id] == car.id.to_s and params[:driver_id] == driver.id.to_s
        if params[:car_id] == "" or params[:driver_id] == ""
          @trip.drivership_id = ""
        else
          #drivership是否存在 不存在就创建
          drivership = Drivership.where(:car_id => params[:car_id],
                                        :driver_id => params[:driver_id]).first_or_create
          @trip.drivership_id = drivership.id
          ##如果该出车还没结束 更新车辆和司机的出车状态
          if @trip.ing
            if params[:car_id] != car.id.to_s
              new_car = Car.find(params[:car_id])
              #冲突解决
              if new_car.current_trip > 0
                @trip.errors.add(:cars, "就在刚才，你选的车辆已被添加到新增出车记录（出车）了，概率很小哦~ 囧~~~ 选其它车吧。")
              else
                new_car.update_attribute(:current_trip, @trip.id)
                car.update_attribute(:current_trip, 0)
              end
            end
          end
        end
      end

      #出车人员改动
      if params[:workers_ids_] and params[:workers_ids_].size > 0
        #修改出车人员
        origin_workers_ids = @trip.workers_ids.split(',')
        param_workers_ids = params[:workers_ids_].clone
        @trip.workers_ids = param_workers_ids.join(',')
        #删除被删除的工作人员
        origin_workers_ids.each { |owi|
          if param_workers_ids.index(owi).nil?
            worker = Worker.find(owi)
            trip_user_delete(worker) if @trip.ing
            @trip.workers.delete(worker)
          else
            param_workers_ids.delete(owi)
          end
        }
        #增加被添加的工作人员
        param_workers_ids.each { |wi|
          worker = Worker.find(wi)
          @trip.workers << worker
          #冲突
          if @trip.ing
            if in_trip?(worker)
              @trip.workers.delete(worker)
              @trip.errors.add(:workers, "就在刚才，你选的工作人员" + worker.name + "被别人选了，概率很小哦~ 囧~~~ 选其它人吧。")
            else
              trip_user_add(@trip, worker)
            end
          end
        }
      end

      #其它改动
      @trip.destination_id = params[:destination_id]
      @trip.mileage = params[:mileage]
      @trip.departure_time = params[:departure_time]
      @trip.back_time = params[:back_time]
      @trip.note_id = params[:note_id]
      @trip.workers_names = @trip.generate_workers_names


      respond_to do |format|
        format.html do
          if params[:workers_ids_] and params[:workers_ids_].size > 0 and @trip.errors.empty? and @trip.save

            # 重新统计
            stat(@trip)

            flash[:success] = "修改已保存！"
            redirect_to edit_admins_trip_path(@trip)
          else

            # 重新统计原纪录
            stat(params[:id])

            @cars = Car.order("model").all
            @drivers = Driver.order("group_id").all
            if @trip.ing
              @cars = Car.where("current_trip = ? OR current_trip = ?", @trip.id, 0).order("model").all
              @drivers = Driver.where("current_trip = ? OR current_trip = ?", @trip.id, 0).order("group_id").all
            end
            @drivership = @trip.drivership
            @selected_key = @trip.workers_ids.split(",")
            @in_trip_users_ids = in_trip_users(@trip)
            @trip.errors.add(:workers, "工作人员不能为空") unless params[:workers_ids_] and params[:workers_ids_].size > 0

            render 'edit'
          end
        end
        format.js
      end
    end

    # DELETE /trips/1
    # DELETE /trips/1.json
    def destroy
      @trip = Trip.find(params[:id])

      stat(@trip, "del")

      if @trip.ing
        trip_user_delete(@trip.driver)
        @trip.car.update_attribute(:current_trip, 0)
        @trip.workers.each do |worker|
          trip_user_delete(worker)
        end
      end

      @trip.workers.clear

      @trip.destroy

      respond_to do |format|
        format.html do
          flash[:success] = "该出车记录已删除！"
          redirect_to admins_trips_path
        end
        format.json
      end
    end


  end
end
