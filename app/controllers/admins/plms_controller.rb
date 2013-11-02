module Admins
  class PlmsController < BaseController

    def index
      respond_to do |format|
        format.html
        format.json { render json: PlmsDatatable.new(view_context) }
      end
    end

    def create

      if params[:cars_ids] and params[:cars_ids].size
        @plm = Plm.new(params[:plm])
        @plm.car_id = params[:cars_ids].first.to_i
        #试存第一个
        if @plm.save
          #若第一个成功则后续无问题
          cars_ids = params[:cars_ids]
          cars_ids[1..(cars_ids.length-1)].each do |car_id|
            @plm = Plm.new(params[:plm])
            @plm.car_id = car_id
            @plm.save
          end
          flash[:success] = "车辆维护已添加!"
          redirect_to admins_plms_path
        else
          @cars = Car.order("model").all
          @selected_key = params[:cars_ids]
          render 'new'
        end
      else
        @plm = Plm.new(params[:plm])
        @plm.save
        @cars = Car.order("model").all
        render 'new'
      end

    end

    def edit
      @plm = Plm.find(params[:id])
      respond_to do |format|
        format.html 
      end
    end


    def update
      @plm = Plm.find(params[:id])
      if @plm.update_attributes(params[:plm])
        flash[:success] = "该维护记录已更新！"
        redirect_to '/admins/plms'
      else
        render 'edit'
      end

    end

    def destroy
      @plm = Plm.find(params[:id])

      @plm.destroy

      respond_to do |format|
        format.html do
          flash[:success] = "该事故记录已删除！"
          redirect_to admins_plms_path
        end
        format.json
      end
    end
  end
end