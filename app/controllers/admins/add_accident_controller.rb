module Admins
  class AddAccidentController < BaseController

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

  end
end