module Admins
  class WorkersController < BaseController

    def index
      respond_to do |format|
        format.html
        format.json { render json: WorkersDatatable.new(view_context) }
      end
    end

    def new
      @worker = Worker.new
    end

    def update

      @worker = Worker.find(params[:id])

      if params[:reset] and params[:reset] == 'on'
        @worker.update_attributes(params[:worker])
      else
        @worker.update_attribute(:name, params[:worker][:name])
        @worker.update_attribute(:group_id, params[:worker][:group_id])
      end

      if @worker.errors.present?
        render 'edit'
      else
        respond_to do |format|
          format.html
          format.js
        end
      end

    end

    def edit
      @worker = Worker.find(params[:id])
      @group = @worker.group
      respond_to do |format|
        format.html
        format.js
      end
    end


    def create

      @worker = Worker.create!(params[:worker])

      respond_to do |format|
        format.html { redirect_to admins_workers_path }
        format.js
      end

    end

    def destroy

      @worker = Worker.find(params[:id])

      if @worker.destroy
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
