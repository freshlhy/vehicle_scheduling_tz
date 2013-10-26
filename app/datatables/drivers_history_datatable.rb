#encoding: utf-8
require 'date'
class DriversHistoryDatatable
  delegate :params, :h, :link_to, to: :@view

  def initialize(view)
    @view = view
    @date_range_start = Date.today.years_ago(1).at_beginning_of_year()
    @date_range_end = Date.today.years_ago(1).end_of_year()
    @query = "departure_time >= ? AND departure_time <= ?"
  end

  def as_json(options = {})
    {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: Trip.where(@query, @date_range_start, @date_range_end).count,
        iTotalDisplayRecords: trips.total_entries,
        aaData: data
    }
  end

  private

  def data
    trips.map do |trip|
      [
          h(trip.drivership.car.plate),
          h(trip.drivership.driver.name),
          h(trip.destination.name),
          h(trip.departure_time),
          h(trip.back_time),
          link_to('<i class="icon-edit"></i>'.html_safe, './drivers-history/'+trip.id.to_s+'/edit')+
              link_to('<i class="icon-remove"></i>'.html_safe, './drivers-history/'+trip.id.to_s,
                      :confirm => "删除这条出差记录将同时删除对应工作人员的记录，确定要删除吗？", :method => :delete)
      ]
    end
  end

  def trips
    @trips ||= fetch_trips
  end

  def fetch_trips

    trips = fetch_trips_helper(sort_column, sort_direction)
    trips = trips.page(page).per_page(per_page)

    if params[:sSearch].present?
      trips = trips.where("
            cars.plate like :search or
            users.name like :search or
            destinations.name like :search or
            departure_time like :search or
            back_time like :search
            ", search: "%#{params[:sSearch]}%")
    end

    trips

  end

  def fetch_trips_helper(sort_column, sort_direction)

    #默认按归来时间排序
    trips = Trip.includes(:destination, :drivership => [:car, :driver]).where(@query, @date_range_start, @date_range_end).order("back_time desc")

    case sort_column

      when "departure_time", "back_time"
        trips = Trip.includes(:destination, :drivership => [:car, :driver]).where(@query, @date_range_start, @date_range_end).order("#{sort_column} #{sort_direction}")
      when "plate"
        trips = Trip.includes(:destination, :drivership => [:car, :driver]).where(@query, @date_range_start, @date_range_end).order("cars.plate #{sort_direction}")
      when "destination"
        trips = Trip.includes(:destination, :drivership => [:car, :driver]).where(@query, @date_range_start, @date_range_end).order("destinations.name #{sort_direction}")  
      when "driver"
        trips = Trip.includes(:destination, :drivership => [:car, :driver]).where(@query, @date_range_start, @date_range_end).order("users.name #{sort_direction}")

    end

    trips

  end


  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[plate driver destination departure_time back_time]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
