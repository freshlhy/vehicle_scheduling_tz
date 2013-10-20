module Admins
  class GroupsController < BaseController
    # GET /groups
    # GET /groups.json
    def index
      respond_to do |format|
        format.html
        format.json { render json: GroupsDatatable.new(view_context) }
      end
    end

    def new
      @group = Group.new
    end

    def update
      @group = Group.find(params[:id])
      if @group.update_attributes(params[:group])
        respond_to do |format|
          format.html
          format.js
        end
      else
        render 'edit'
      end

    end

    def edit
      @group = Group.find(params[:id])
      respond_to do |format|
        format.html
        format.js
      end
    end


    def create

      @group = Group.create!(params[:group])

      respond_to do |format|
        format.html { redirect_to admins_groups_path }
        format.js
      end

    end

    def destroy

      @group = Group.find(params[:id])

      if @group.destroy
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
