module Admins
  class DriversController < BaseController

    def index
      # 更新驾龄
      DriverStat.all.each do |ds|
        if not ds.driver.since.nil?
          ds.driver_age = ((Date.today.mjd - ds.driver.since.mjd)/365.0).round(1)
          ds.save
        end
      end 
      respond_to do |format|
        format.html
        format.json { render json: DriversDatatable.new(view_context) }
      end
    end

    def new
      @driver = Driver.new
    end

    def update

      @driver = Driver.find(params[:id])

      if params[:reset] and params[:reset] == 'on'
        @driver.update_attributes(params[:driver])
      else
        @driver.update_attribute(:name, params[:driver][:name])
        @driver.update_attribute(:gender, params[:driver][:gender])
        @driver.update_attribute(:licence_id, params[:driver][:licence_id])
        @driver.update_attribute(:since, params[:driver][:since])
        @driver.update_attribute(:phone, params[:driver][:phone])
      end

      if @driver.errors.present?
        render 'edit'
      else
        respond_to do |format|
          format.html
          format.js
        end
      end

    end

    def edit
      @driver = Driver.find(params[:id])
      respond_to do |format|
        format.html
        format.js
      end
    end


    def create

      @driver = Driver.create!(params[:driver])

      respond_to do |format|
        format.html { redirect_to admins_drivers_path }
        format.js
      end

    end

    def destroy

      @driver = Driver.find(params[:id])

      if @driver.destroy
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
