module Admins
  class AccidentsController < BaseController

    def new

      @accident = Accident.new
      @cars = Car.order("model").all
      @drivers = Driver.order("name").all

      respond_to do |format|
        format.html 
      end

    end

    def create

      @accident = Accident.create(params[:accident])

      respond_to do |format|
        redirect_to new_admins_accident
      end

    end
  end
end