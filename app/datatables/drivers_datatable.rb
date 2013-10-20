#encoding: utf-8
class DriversDatatable
  delegate :params, :h, :link_to, :edit_admins_driver_path, :admins_driver_path, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: Driver.count,
        iTotalDisplayRecords: drivers.total_entries,
        aaData: data
    }
  end

  private

  def data
    drivers.map do |driver|
      {
          DT_RowId: driver.id, #行id
          name: h(driver.name),
          phone: h(driver.phone),
      }
    end
  end

  def drivers
    @drivers ||= fetch_drivers
  end

  def fetch_drivers

    drivers = fetch_drivers_helper(sort_column, sort_direction)
    drivers = drivers.page(page).per_page(per_page)

    if params[:sSearch].present?
      drivers = drivers.where("name like :search or phone like :search", search: "%#{params[:sSearch]}%")
    end

    drivers

  end

  def fetch_drivers_helper(sort_column, sort_direction)

    #默认按归来时间排序
    drivers = Driver.order("name asc")

    if sort_column and sort_column.size
      drivers = Driver.order("#{sort_column} #{sort_direction}")
    end

    drivers

  end


  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name phone]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
