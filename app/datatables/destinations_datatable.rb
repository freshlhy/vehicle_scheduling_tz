#encoding: utf-8
class DestinationsDatatable
  delegate :params, :h, :link_to, :edit_admins_destination_path, :admins_destination_path, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: Destination.count,
        iTotalDisplayRecords: destinations.total_entries,
        aaData: data
    }
  end

  private

  def data
    destinations.map do |destination|
      {
          DT_RowId: destination.id, #行id
          name: h(destination.name),
      }
    end
  end

  def destinations
    @destinations ||= fetch_destinations
  end

  def fetch_destinations

    destinations = fetch_destinations_helper(sort_column, sort_direction)
    destinations = destinations.page(page).per_page(per_page)

    if params[:sSearch].present?
      destinations = destinations.where("name like :search", search: "%#{params[:sSearch]}%")
    end

    destinations

  end

  def fetch_destinations_helper(sort_column, sort_direction)

    #默认按名称排序
    destinations = Destination.order("name asc")

    if sort_column and sort_column.size
      destinations = Destination.order("#{sort_column} #{sort_direction}")
    end

    destinations

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
