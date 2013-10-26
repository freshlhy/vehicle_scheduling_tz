#encoding: utf-8
require 'date'
class TripsDatatable
  delegate :params, :h, :link_to, :edit_admins_trip_path, :admins_trip_path, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: Trip.where("departure_time >= ?", Date.today.at_beginning_of_year()).count,
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
          h(trip.workers_names),
          h(trip.destination.name),
          h(trip.departure_time),
          h(trip.back_time),
          h(trip.note.name),
          link_to('<i class="icon-edit"></i>'.html_safe, edit_admins_trip_path(trip))+
              link_to('<i class="icon-remove"></i>'.html_safe, admins_trip_path(trip),
                      :confirm => "确定要删除这条出车记录吗？", :method => :delete)
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
        workers_names like :search or
        destinations.name like :search or
        departure_time like :search or
        back_time like :search or
        notes.name like :search", search: "%#{params[:sSearch]}%")
    end

    trips

  end

  def fetch_trips_helper(sort_column, sort_direction)

    #默认按归来时间排序
    trips = Trip.includes(:destination, :note, :drivership => [:car, :driver]).where("departure_time > ?", Date.today.at_beginning_of_year()).order("back_time desc")

    case sort_column

      when "departure_time", "back_time"
        trips = Trip.includes(:destination, :note, :drivership => [:car, :driver]).where("departure_time > ?", Date.today.at_beginning_of_year()).order("#{sort_column} #{sort_direction}")
      when "note", "destination"
        trips = Trip.includes(:destination, :note, :drivership => [:car, :driver]).where("departure_time > ?", Date.today.at_beginning_of_year()).order("#{sort_column}s.name #{sort_direction}")
      when "plate"
        trips = Trip.includes(:destination, :note, :drivership => [:car, :driver]).where("departure_time > ?", Date.today.at_beginning_of_year()).order("cars.plate #{sort_direction}")
      when "driver"
        trips = Trip.includes(:destination, :note, :drivership => [:car, :driver]).where("departure_time > ?", Date.today.at_beginning_of_year()).order("users.name #{sort_direction}")

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
    columns = %w[plate driver workers destination departure_time back_time note]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
