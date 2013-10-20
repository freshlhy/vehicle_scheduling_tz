#encoding: utf-8
require 'date'
class WorkersHistoryDatatable
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
          h(trip.workers_names),
          h(trip.destination.name),
          h(trip.departure_time),
          h(trip.back_time),
          h(trip.note.name),
          link_to('<i class="icon-edit"></i>'.html_safe, './workers-history/'+trip.id.to_s+'/edit')+
              link_to('<i class="icon-remove"></i>'.html_safe, './workers-history/'+trip.id.to_s,
                      :confirm => "删除这条出差记录将同时删除对应司机的记录，确定要删除吗？", :method => :delete)
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


      trips = trips.includes(:destination, :note).where("
            workers_names like :search or
            notes.name like :search or
            destinations.name like :search", search: "%#{params[:sSearch]}%")

    end

    trips
  end

  def fetch_trips_helper(sort_column, sort_direction)

    #默认按归来时间排序
    trips = Trip.where(@query, @date_range_start, @date_range_end).order("back_time desc")

    case sort_column

      when "departure_time", "back_time"
        trips = Trip.where(@query, @date_range_start, @date_range_end).order("#{sort_column} #{sort_direction}")
      when "note", "destination"
        trips = Trip.joins("LEFT OUTER JOIN #{sort_column}s ON #{sort_column}s.id =
                trips.#{sort_column}_id").where(@query, @date_range_start, @date_range_end).order("#{sort_column}s.name #{sort_direction}")
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
    columns = %w[workers destination departure_time back_time note]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
