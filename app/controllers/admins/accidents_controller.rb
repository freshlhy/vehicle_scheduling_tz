module Admins
  class AccidentsController < BaseController

    def index
      respond_to do |format|
        format.html
        format.json { render json: AccidentsDatatable.new(view_context) }
      end
    end

    def new

      @accident = Accident.new
      @cars = Car.order("model").all
      @drivers = Driver.order("name").all

      respond_to do |format|
        format.html 
      end

    end

    def create

      @accident = Accident.new(params[:accident])

      if @accident.save
        flash[:success] = "事故已添加！"
        redirect_to admins_accidents_path
      else
        @cars = Car.order("model").all
        @drivers = Driver.order("name").all
        render 'new'
      end

    end

    def edit
      @accident = Accident.find(params[:id])
      @cars = Car.order("model").all
      @drivers = Driver.order("name").all
      respond_to do |format|
        format.html 
      end
    end


    def update
      @accident = Accident.find(params[:id])
      if @accident.update_attributes(params[:accident])
        flash[:success] = "该事故记录已更新！"
        redirect_to '/admins/accidents'
      else
        @cars = Car.order("model").all
        @drivers = Driver.order("name").all
        render 'edit'
      end

    end

    def destroy
      @accident = Accident.find(params[:id])

      @accident.destroy

      respond_to do |format|
        format.html do
          flash[:success] = "该事故记录已删除！"
          redirect_to admins_accidents_path
        end
        format.json
      end
    end
  end
end