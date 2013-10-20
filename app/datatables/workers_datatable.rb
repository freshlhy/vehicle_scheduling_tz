#encoding: utf-8
class WorkersDatatable
  delegate :params, :h, :link_to, :edit_admins_worker_path, :admins_worker_path, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: Worker.count,
        iTotalDisplayRecords: workers.total_entries,
        aaData: data
    }
  end

  private

  def data
    workers.map do |worker|
      {
          DT_RowId: worker.id, #行id
          name: h(worker.name),
          group: h(worker.group.name),
      }
    end
  end

  def workers
    @workers ||= fetch_workers
  end

  def fetch_workers

    workers = fetch_workers_helper(sort_column, sort_direction)
    workers = workers.page(page).per_page(per_page)

    if params[:sSearch].present?
      workers = workers.includes(:group).where("users.name like :search or groups.name like :search", search: "%#{params[:sSearch]}%")
    end

    workers

  end

  def fetch_workers_helper(sort_column, sort_direction)

    #默认按姓名排序
    workers = Worker.order("name asc")

    case sort_column

      when "name"
        workers = Worker.order("#{sort_column} #{sort_direction}")
      when "group"
        workers = Worker.joins("LEFT OUTER JOIN #{sort_column}s ON #{sort_column}s.id =
                users.#{sort_column}_id").order("#{sort_column}s.name #{sort_direction}")
    end

    workers

  end


  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name group]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end