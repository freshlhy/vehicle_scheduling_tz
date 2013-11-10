#encoding: utf-8
require 'date'
class DriverStatDatatable
  delegate :params, :h, :link_to, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: DriverStat.count,
        iTotalDisplayRecords: driver_stats.total_entries,
        aaData: data
    }
  end

  private

  def data
    driver_stats.map do |driver_stat|
      [
          h(driver_stat.driver.name),
          h(driver_stat.driver.gender),
          h(driver_stat.driver_age),
          h(driver_stat.trip_count),
          h(driver_stat.accident_count),
          h(driver_stat.driver.phone)
      ]
    end
  end

  def driver_stats
    @driver_stats ||= fetch_driver_stats
  end

  def fetch_driver_stats

    driver_stats = fetch_driver_stats_helper(sort_column, sort_direction)
    driver_stats = driver_stats.page(page).per_page(per_page)

    if params[:sSearch].present?
      driver_stats = driver_stats.where("
        users.name like :search or
        users.gender like :search or
        driver_age like :search or
        trip_count like :search or
        accident_count like :search or
        users.phone like :search", search: "%#{params[:sSearch]}%")
    end

    driver_stats

  end

  def fetch_driver_stats_helper(sort_column, sort_direction)

    #默认按归来时间排序
    driver_stats = DriverStat.includes(:driver).order("trip_count desc")

    case sort_column

      when "name", "gender", "phone" 
        driver_stats = DriverStat.includes(:driver).order("users.#{sort_column} #{sort_direction}")
      else
        driver_stats = DriverStat.includes(:driver).order("#{sort_column} #{sort_direction}")
    end

    driver_stats

  end


  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name gender driver_age trip_count accident_count phone]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
