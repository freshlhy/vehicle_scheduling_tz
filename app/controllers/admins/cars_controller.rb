#encoding: utf-8
require 'date'

module Admins
  class CarsController < BaseController
    # GET /cars
    # GET /cars.json
    def index
      Car.all.each do |c|
        if not c.since.nil?
          c.age = ((Date.today.mjd - c.since.mjd)/365.0).round(1)
          c.save
        end
      end 
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
