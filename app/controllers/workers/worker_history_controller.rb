module Workers
  class WorkerHistoryController < BaseController
    # GET /trips
    # GET /trips.json
    def index
      respond_to do |format|
        format.html
        format.json { render json: WorkerHistoryDatatable.new(view_context, current_user) }
      end
    end
  end
end
