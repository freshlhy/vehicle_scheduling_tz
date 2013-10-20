module Admins
  class CarsController < BaseController
    # GET /cars
    # GET /cars.json
    def index
      respond_to do |format|
        format.html
        format.json { render json: CarsDatatable.new(view_context) }
      end
    end

    def new
      @car = Car.new
    end

    def update
      @car = Car.find(params[:id])
      if @car.update_attributes(params[:car])
        respond_to do |format|
          format.html
          format.js
        end
      else
        render 'edit'
      end

    end

    def edit
      @car = Car.find(params[:id])
      respond_to do |format|
        format.html
        format.js
      end
    end


    def create

      @car = Car.create!(params[:car])

      respond_to do |format|
        format.html { redirect_to admins_cars_path }
        format.js
      end

    end

    def destroy

      @car = Car.find(params[:id])

      if @car.destroy
        respond_to do |format|
          format.html
          format.js
        end
      else
        redirect_to :back
      end

    end


  end
end
