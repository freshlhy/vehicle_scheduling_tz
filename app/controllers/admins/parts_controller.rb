module Admins
  class PartsController < BaseController
    def index
      respond_to do |format|
        format.html
        format.json { render json: PartsDatatable.new(view_context) }
      end
    end

    def new
      @part = Part.new
    end

    def update
      @part = Part.find(params[:id])
      if @part.update_attributes(params[:part])
        respond_to do |format|
          format.html
          format.js
        end
      else
        render 'edit'
      end

    end

    def edit
      @part = Part.find(params[:id])
      respond_to do |format|
        format.html
        format.js
      end
    end


    def create

      @part = Part.create!(params[:part])

      respond_to do |format|
        format.html { redirect_to admins_parts_path }
        format.js
      end

    end

    def destroy

      @part = Part.find(params[:id])

      if @part.destroy
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
