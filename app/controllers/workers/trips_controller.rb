#encoding: utf-8
module Workers
  class TripsController < BaseController
    def index
      respond_to do |format|
        format.html
        format.json { render json: WorkerTripsDatatable.new(view_context, current_user) }
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



    # PUT /trips/1
    # PUT /trips/1.json
    def update

      @trip = Trip.find(params[:id])

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
      @trip.departure_time = params[:departure_time]
      @trip.back_time = params[:back_time]
      @trip.note_id = params[:note_id]
      @trip.workers_names = @trip.generate_workers_names


      respond_to do |format|
        format.html do
          if params[:workers_ids_] and params[:workers_ids_].size > 0 and @trip.errors.empty? and @trip.save
            flash[:success] = "修改已保存！"
            redirect_to '/workers/trips/'+@trip.id.to_s+'/edit'
          else
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
  private
    def current_resource
      @current_resource ||= Trip.find(params[:id]) if params[:id]
    end
  end
end
