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

  end
end