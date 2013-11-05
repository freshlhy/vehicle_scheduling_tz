module Admins
  class AddSuperviseController < BaseController

    def new

      @supervise = Supervise.new
      @parts = Part.order("name").all
      @cars = Car.order("model").all

      respond_to do |format|
        format.html 
      end

    end

  end
end