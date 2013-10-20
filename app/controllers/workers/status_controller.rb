#encoding: utf-8
module Workers
  class StatusController < BaseController

    before_filter :user_in_trip, only: :update

    def start
      redirect_to '/workers/tour' if in_trip?(current_user)
    end

    def tour

      redirect_to '/workers/start' unless in_trip?(current_user)

      @trip = Trip.find(current_trip(current_user))

      @cars = Car.where("current_trip = ? OR current_trip = ?", @trip.id, 0).order("model").all
      @drivers = Driver.where("current_trip = ? OR current_trip = ?", @trip.id, 0).order("group_id").all
      @drivership = @trip.drivership
      @selected_key = @trip.workers_ids.split(",")
      @in_trip_users_ids = in_trip_users(@trip)

    end

    # PUT /trips/1
    # PUT /trips/1.json
    def update

      @trip = Trip.find(current_trip(current_user))

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
            trip_user_delete(worker)
            @trip.workers.delete(worker)
          else
            workers_ids_.delete(owi)
          end
        }
        #增加被添加的工作人员
        workers_ids_.each { |wi|
          worker = Worker.find(wi)
          @trip.workers << worker
          #冲突
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
            #submit为保存修改
            flash[:success] = "修改已保存！"
            sign_in(current_user)
            redirect_to '/workers/tour'
          else
            @cars = Car.where("current_trip = ? OR current_trip = ?", @trip.id, 0).order("model").all
            @drivers = Driver.where("current_trip = ? OR current_trip = ?", @trip.id, 0).order("group_id").all
            @drivership = @trip.drivership
            @selected_key = @trip.workers_ids.split(",")
            @in_trip_users_ids = in_trip_users(@trip)
            @trip.errors.add(:workers, "工作人员不能为空") unless params[:workers_ids_] and params[:workers_ids_].size

            sign_in(current_user)
            render '/workers/status/tour'
          end
        end
        format.js
      end
    end

    private

    def user_in_trip
      flash[:success] = "您的状态已被司机或管理员修改！"
      redirect_to(user_root) unless in_trip?(current_user)
    end

  end

end
