module Admins
  class SupervisesController < BaseController

    def index
      respond_to do |format|
        format.html
        format.json { render json: SupervisesDatatable.new(view_context) }
      end
    end

    def create

      if params[:car_ids] and params[:car_ids].size
        @supervise = Supervise.new(params[:supervise])
        @supervise.car_id = params[:car_ids].first.to_i
        #试存第一个
        if @supervise.save
          #若第一个成功则后续无问题
          car_ids = params[:car_ids]
          car_ids[1..(car_ids.length-1)].each do |car_id|
            @supervise = Supervise.new(params[:supervise])
            @supervise.car_id = car_id
            @supervise.save
          end
          flash[:success] = "车辆维护已添加!"
          redirect_to admins_supervises_path
        else
          @cars = Car.order("model").all
          @selected_key = params[:car_ids]
          render 'new'
        end
      else
        @supervise = Supervise.new(params[:supervise])
        @supervise.save
        @cars = Car.order("model").all
        render 'new'
      end

    end

    def edit
      @supervise = Supervise.find(params[:id])
      respond_to do |format|
        format.html 
      end
    end


    def update
      @supervise = Supervise.find(params[:id])
      if @supervise.update_attributes(params[:supervise])
        flash[:success] = "该维护记录已更新！"
        redirect_to '/admins/supervises'
      else
        render 'edit'
      end

    end

    def destroy
      @supervise = Supervise.find(params[:id])

      @supervise.destroy

      respond_to do |format|
        format.html do
          flash[:success] = "该事故记录已删除！"
          redirect_to admins_supervises_path
        end
        format.json
      end
    end
  end
end