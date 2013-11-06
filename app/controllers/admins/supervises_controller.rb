#encoding: utf-8
require 'date'

module Admins
  class SupervisesController < BaseController

    def index
      respond_to do |format|
        format.html
        format.json { render json: SupervisesDatatable.new(view_context) }
      end
    end

    def create
      
      if params[:part_ids] and params[:part_ids].size and params[:car_ids] and params[:car_ids].size

        part_ids = params[:part_ids]
        car_ids  = params[:car_ids]

        part_ids[0..(part_ids.length-1)].each do |part_id|
          car_ids[0..(car_ids.length-1)].each do |car_id|
            @supervise = Supervise.new(params[:supervise])
            @supervise.part_id   = part_id
            @supervise.car_id    = car_id 
            @supervise.is_active = "启用"
            @supervise.save
          end
        end
        flash[:success] = "监督部件已添加!"
        redirect_to admins_supervises_path
      else
        @supervise = Supervise.new
        @supervise.errors.add(:part, "监督部件和所属车辆不能为空")
        @selected_parts = params[:part_ids]
        @selected_cars  = params[:car_ids]
        @parts = Part.order("name").all
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

      if is_integer(params[:supervise][:current_mileage])
        params[:supervise][:mileage_status] = params[:supervise][:current_mileage].to_s + "/" + @supervise.part.rating_mileage.to_s
        params[:supervise][:mileage_status_value] = Integer(params[:supervise][:current_mileage]) / @supervise.part.rating_mileage
      end

      if is_integer(params[:supervise][:current_life])
        params[:supervise][:life_status] = params[:supervise][:current_life].to_s + "/" + @supervise.part.rating_life.to_s
        params[:supervise][:life_status_value] = Integer(params[:supervise][:current_life]) / @supervise.part.rating_life
      end

      if @supervise.update_attributes(params[:supervise]) 
        flash[:success] = "该监督记录已更新！"
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
          flash[:success] = "该监督记录已删除！"
          redirect_to admins_supervises_path
        end
        format.json
      end
    end
  end
end