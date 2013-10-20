module Admins
  class DestinationsController < BaseController
    # GET /destinations
    # GET /destinations.json
    def index
      respond_to do |format|
        format.html
        format.json { render json: DestinationsDatatable.new(view_context) }
      end
    end

    def new
      @destination = Destination.new
    end

    def update
      @destination = Destination.find(params[:id])
      if @destination.update_attributes(params[:destination])
        respond_to do |format|
          format.html
          format.js
        end
      else
        render 'edit'
      end

    end

    def edit
      @destination = Destination.find(params[:id])
      respond_to do |format|
        format.html
        format.js
      end
    end


    def create

      @destination = Destination.create!(params[:destination])

      respond_to do |format|
        format.html { redirect_to admins_destinations_path }
        format.js
      end

    end

    def destroy

      @destination = Destination.find(params[:id])

      if @destination.destroy
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
