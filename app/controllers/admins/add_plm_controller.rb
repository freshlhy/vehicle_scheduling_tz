module Admins
  class AddPlmController < BaseController

    def new

      @plm = Plm.new
      @cars = Car.order("model").all

      respond_to do |format|
        format.html 
      end

    end

  end
end