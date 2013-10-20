module Admins
  class NotesController < BaseController
    # GET /notes
    # GET /notes.json
    def index
      respond_to do |format|
        format.html
        format.json { render json: NotesDatatable.new(view_context) }
      end
    end

    def new
      @note = Note.new
    end

    def update
      @note = Note.find(params[:id])
      if @note.update_attributes(params[:note])
        respond_to do |format|
          format.html
          format.js
        end
      else
        render 'edit'
      end

    end

    def edit
      @note = Note.find(params[:id])
      respond_to do |format|
        format.html
        format.js
      end
    end


    def create

      @note = Note.create!(params[:note])

      respond_to do |format|
        format.html { redirect_to admins_notes_path }
        format.js
      end

    end

    def destroy

      @note = Note.find(params[:id])

      if @note.destroy
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
