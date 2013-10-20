#encoding: utf-8
module Drivers
  class TripsController < BaseController

    def index
      respond_to do |format|
        format.html
        format.json { render json: DriverTripsDatatable.new(view_context, current_user) }
      end
    end

    # GET /trips/new
    # GET /trips/new.json
    def new

      @trip = Trip.new


      @cars = Car.where("current_trip = ?", 0).order("model").all
      @drivership = @trip.drivership

      @selected_key = ""

      @in_trip_users_ids = in_trip_users(@trip)

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @trip }
      end

    end

    # GET /trips/1/edit
    def edit
      @trip = Trip.find(params[:id])
      @cars = Car.order("model").all
      @drivers = Driver.order("group_id").all
      if @trip.ing
        @cars = Car.where("current_trip = ? OR current_trip = ?", @trip.id, 0).order("model").all
        @drivers = Driver.where("current_trip = ? OR current_trip = ?", @trip.id, 0).order("group_id").all
      end
      @drivership = @trip.drivership
      @selected_key = @trip.workers_ids.split(",")
      @in_trip_users_ids = in_trip_users(@trip)
    end


    def create

      @trip = Trip.new

      driver = current_user

      if params[:car_id] and params[:car_id].size

        drivership = Drivership.where(:car_id => params[:car_id],
                                      :driver_id => driver.id).first_or_create
        @trip.drivership_id = drivership.id

      end

      if params[:workers_ids_] and params[:workers_ids_].size
        workers_ids_ = params[:workers_ids_]
        @trip.workers_ids = workers_ids_.join(',')
      end

      @trip.destination_id = params[:destination_id]
      @trip.departure_time = params[:departure_time]
      @trip.back_time = params[:back_time]
      @trip.note_id = params[:note_id]
      @trip.ing = true

      #冲突解决
      @trip.errors.add(:cars, "就在刚才，你选的车辆已被添加到新增出差记录（出差）了，概率很小哦~ 囧~~~ 选其它车吧。") if @trip.car.current_trip > 0
      workers_ids_.each { |wi|
        worker = Worker.find(wi)
        @trip.errors.add(:workers, "就在刚才，你选的工作人员" + worker.name + "被别人选了，概率很小哦~ 囧~~~ 选其它人吧。") if in_trip?(worker)

      }

      respond_to do |format|
        format.html do
          if params[:workers_ids_] and params[:workers_ids_].size and @trip.errors.empty? and @trip.save

            #此处解决Trip.new之后未保存没有生成id产生的问题

            @trip.car.update_attribute(:current_trip, @trip.id)
            trip_user_add(@trip, current_user)
            workers_ids_.each { |wi|
              worker = Worker.find(wi)
              @trip.workers << worker
              trip_user_add(@trip, worker)
            }
            @trip.workers_names = @trip.generate_workers_names
            @trip.save

            sign_in(current_user)
            redirect_to '/drivers/tour'

          else

            @cars = Car.where("current_trip = ?", 0).order("model").all
            @drivership = @trip.drivership
            @selected_key = @trip.workers_ids.split(",") if @trip.workers_ids
            @in_trip_users_ids = in_trip_users(@trip)
            @trip.errors.add(:workers, "工作人员不能为空") unless params[:workers_ids_] and params[:workers_ids_].size

            sign_in(current_user)
            render 'new'

          end
        end
        format.js
      end

    end

    # PUT /trips/1
    # PUT /trips/1.json
    def update

      @trip = Trip.find(params[:id])
      car = @trip.car
      driver = current_user

      #车辆被改动
      unless params[:car_id] == car.id.to_s
        if params[:car_id] == ""
          @trip.drivership_id = ""
        else
          #drivership是否存在 不存在就创建
          drivership = Drivership.where(:car_id => params[:car_id],
                                        :driver_id => driver.id).first_or_create
          @trip.drivership_id = drivership.id
          ##如果该出差还没结束 更新车辆和司机的出差状态
          if @trip.ing
            if params[:car_id] != car.id.to_s
              new_car = Car.find(params[:car_id])
              #冲突解决
              if new_car.current_trip > 0
                @trip.errors.add(:cars, "就在刚才，你选的车辆已被添加到新增出差记录（出差）了，概率很小哦~ 囧~~~ 选其它车吧。")
              else
                new_car.update_attribute(:current_trip, @trip.id)
                car.update_attribute(:current_trip, 0)
              end
            end
          end
        end
      end

      #出差人员改动
      if params[:workers_ids_] and params[:workers_ids_].size
        #修改出差人员
        origin_workers_ids = @trip.workers_ids.split(',')
        workers_ids_ = params[:workers_ids_]
        @trip.workers_ids = workers_ids_.join(',')
        #删除被删除的工作人员
        origin_workers_ids.each { |owi|
          if workers_ids_.index(owi).nil?
            worker = Worker.find(owi)
            trip_user_delete(worker) if @trip.ing
            @trip.workers.delete(worker)
          else
            workers_ids_.delete(owi)
          end
        }
        #增加被添加的工作人员
        workers_ids_.each { |wi|
          worker = Worker.find(wi)
          @trip.workers << worker
          #冲突解决
          if @trip.ing
            if in_trip?(worker)
              @trip.workers.delete(worker)
              @trip.errors.add(:workers, "就在刚才，你选的工作人员被别人选了，概率很小哦~ 囧~~~ 选其它人吧。")
            else
              trip_user_add(@trip, worker)
            end
          end

        }
      end

      #其它改动
      @trip.destination_id = params[:destination_id]
      @trip.departure_time = params[:departure_time]
      @trip.back_time = params[:back_time]
      @trip.note_id = params[:note_id]
      @trip.workers_names = @trip.generate_workers_names


      respond_to do |format|
        format.html do
          if params[:workers_ids_] and params[:workers_ids_].size and @trip.errors.empty? and @trip.save
            flash[:success] = "修改已保存！"
            redirect_to '/drivers/trips/'+@trip.id.to_s+'/edit'
          else
            @cars = Car.order("model").all
            if @trip.ing
              @cars = Car.where("current_trip = ? OR current_trip = ?", @trip.id, 0).order("model").all
            end
            @drivership = @trip.drivership
            @selected_key = @trip.workers_ids.split(",")
            @trip.errors.add(:workers, "工作人员不能为空") unless params[:workers_ids_] and params[:workers_ids_].size

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
      ing = @trip.ing
      if ing
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
          flash[:success] = "该出差记录已删除！"
          sign_in(current_user)
          if ing
            redirect_to '/drivers/start'
          else
            redirect_to '/drivers/trips'
          end
        end
        format.json
      end
    end

    private

    def current_resource
      @current_resource ||= Trip.find(params[:id]) if params[:id]
    end

  end

end
