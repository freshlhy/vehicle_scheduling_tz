#encoding: utf-8
class NotesDatatable
  delegate :params, :h, :link_to, :edit_admins_note_path, :admins_note_path, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: Note.count,
        iTotalDisplayRecords: notes.total_entries,
        aaData: data
    }
  end

  private

  def data
    notes.map do |note|
      {
          DT_RowId: note.id, #行id
          name: h(note.name),
      }
    end
  end

  def notes
    @notes ||= fetch_notes
  end

  def fetch_notes

    notes = fetch_notes_helper(sort_column, sort_direction)
    notes = notes.page(page).per_page(per_page)

    if params[:sSearch].present?
      notes = notes.where("name like :search", search: "%#{params[:sSearch]}%")
    end

    notes

  end

  def fetch_notes_helper(sort_column, sort_direction)

    #默认按名称排序
    notes = Note.order("name asc")

    if sort_column and sort_column.size
      notes = Note.order("#{sort_column} #{sort_direction}")
    end

    notes

  end


  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
