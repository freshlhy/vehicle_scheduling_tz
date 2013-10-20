#encoding: utf-8
module Admins
  class WorkersHistoryController < BaseController
    # GET /workers-history
    # GET /workers-history.json
    def index
      respond_to do |format|
        format.html
        format.json { render json: WorkersHistoryDatatable.new(view_context) }
      end
    end

    # GET /workers-history/1/edit
    def edit
      @trip = Trip.find(params[:id])
      @selected_key = @trip.workers_ids.split(",")
    end

    # PUT /workers-history/1
    # PUT /workers-history/1.json
    def update

      @trip = Trip.find(params[:id])

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
            @trip.workers.delete(worker)
          else
            workers_ids_.delete(owi)
          end
        }
        #增加被添加的工作人员
        workers_ids_.each { |wi|
          worker = Worker.find(wi)
          @trip.workers << worker
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
          if @trip.save
            flash[:success] = "修改已保存！"
            redirect_to '/admins/workers-history/'+@trip.id.to_s+'/edit'
          else
            @selected_key = @trip.workers_ids.split(",")
            render 'edit'
          end
        end
        format.js
      end

    end

    # DELETE /workers-history/1
    # DELETE /workers-history/1.json
    def destroy

      @trip = Trip.find(params[:id])

      @trip.workers.clear

      @trip.destroy

      respond_to do |format|
        format.html do
          flash[:success] = "该出差记录已删除！"
          redirect_to '/admins/workers-history'
        end
        format.json
      end

    end

  end
end
